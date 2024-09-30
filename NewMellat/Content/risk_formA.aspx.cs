using DataAccessLayer;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class risk_formA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "فرم ثبت درخواست بررسی ریسک";


            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            if (!IsPostBack)
            { Panel2.Visible = false; }
        }


        NewMellatEntities db = new NewMellatEntities();
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(RadTextBox1.Text) || !string.IsNullOrEmpty(RadTextBox2.Text))
            {
                SqlConnection openDb = new SqlConnection();
                SqlCommand cmd = new SqlCommand();
                openDb.ConnectionString =
                    System.Configuration.ConfigurationManager.ConnectionStrings["NewMellatConnectionString1"]
                        .ConnectionString;
                cmd.Connection = openDb;
                cmd.CommandText = string.Format(@"select * 
                                FROM tbProjects Left Outer Join (sELECT * fROM tbGharardad  Where tbGharardad.IsElhaghie = 0 OR tbGharardad.IsElhaghie is null) tbGharardad On  tbGharardad.ghProject = tbProjects.prId 
                                where (( tbGharardad.ghAct =1 and (tbGharardad.IsElhaghie = 0 OR tbGharardad.IsElhaghie is null)) OR tbGharardad.ghAct is null) 
                                    AND prId not in (select projectId from risk_form1)
								 and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = '{0}')  )) 
		                    OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = '{0}') ))) 
                            AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = '{0}') ))", Page.User.Identity.Name);



                if (!string.IsNullOrEmpty(RadTextBox1.Text))
                {
                    cmd.CommandText += string.Format(@" and prTitle like N'%{0}%'", RadTextBox1.Text);

                }


                if (!string.IsNullOrEmpty(RadTextBox2.Text))
                {
                    cmd.CommandText += string.Format(@" and ghCode like N'%{0}%'", RadTextBox2.Text);

                }


                openDb.Open();
                ASPxGridView4.DataSource = cmd.ExecuteReader();
                ASPxGridView4.DataBind();
                openDb.Close();

            }

        }
        protected void ASPxGridView4_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "dt")
            {

                Panel2.Visible = true;
                chb1.Checked = false;
                chb2.Checked = false;
                chb3.Checked = false;
                chb4.Checked = false;
                letterShenase.Text = "";
                letterNo.Text = "";
                letterDate.Text = "";

                string prId = e.CommandArgs.CommandArgument.ToString();
                hdf1.Value = prId;
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "prTitle", "ghCode", "prVahed", "TechnicalSuvisor", "prPeymankar"};
                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                lbTitle.Text = fields[0].ToString();
                lbContractNo.Text = fields[1].ToString();
                try
                {
                    int vahed = int.Parse(fields[2].ToString());
                    lbVahed.Text = db.prInformations.Where(a => a.infId == vahed).FirstOrDefault().infTitle;
                }
                catch (Exception ex)
                {
                }
               try
                {
                    int nazer = int.Parse(fields[3].ToString());
                    lbNazer.Text = db.prInformations.Where(a => a.infId == nazer).FirstOrDefault().infTitle;
                }
               catch (Exception ex)
               {
               }
               try
               {
                   int company = int.Parse(fields[4].ToString());
                   lbCompany.Text = db.prInformations.Where(a => a.infId == company).FirstOrDefault().infTitle;
               }
               catch (Exception ex)
               {
               }
               // lbCompany.Text = fields[4].ToString();
            }
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            DataAccessBase da = new DataAccessBase();
            string status=hdf2.Value.Length>1?"8":"1";
            int insertedId = Convert.ToInt32(da.ScalarTxt(@"INSERT INTO [dbo].[risk_form1] ([projectId],[chb1],[chb2],[chb3],[chb4],[status],[docNotEnter])
            VALUES (" + hdf1.Value + ",'" + chb1.Checked + "','" + chb2.Checked + "','" +chb3.Checked + "','" +chb4.Checked + "',"+status+",N'"+hdf2.Value+"');SELECT SCOPE_IDENTITY();"));

            //add files

            foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;
                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = int.Parse(hdf1.Value);
                newFile.fiTitle = "پروفایل حفاظتی";
                newFile.fiType = 21;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }
            foreach (Telerik.Web.UI.UploadedFile file in RadUpload2.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;
                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = int.Parse(hdf1.Value);
                newFile.fiTitle =  "شناسنامه توصیفی";
                newFile.fiType = 21;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }
            foreach (Telerik.Web.UI.UploadedFile file in RadUpload3.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;
                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = int.Parse(hdf1.Value);
                newFile.fiTitle = "لیست دارایی ها";
                newFile.fiType = 21;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }
            foreach (Telerik.Web.UI.UploadedFile file in RadUpload4.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;
                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = int.Parse(hdf1.Value);
                newFile.fiTitle = "ارزش گذاری اولیه";
                newFile.fiType = 21;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }
            foreach (Telerik.Web.UI.UploadedFile file in letterFile.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;
                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = int.Parse(hdf1.Value);
                newFile.fiTitle =  letterNo.Text+"-"+letterShenase.Text;
                newFile.fiType = 22;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }

            //add letter
           
            da.NonQueryTxt(@"INSERT INTO [dbo].[tbProjectPaper] ([paShenase],[paNumber],[paDate],[paProject],[paAct],[paType])
                VALUES ('" + letterShenase.Text + "','" + letterNo.Text + "','" + letterDate.Text + "'," + hdf1.Value + ",1,201)");

            Response.Write("<script>alert('درخواست با موفقیت ثبت شد . ')</script>");
            Response.Redirect("http://172.22.65.16:1983/content/risk_formG.aspx");

        }
    }
}