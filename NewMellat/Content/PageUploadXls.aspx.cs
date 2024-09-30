using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;

namespace NewMellat.Content
{
    public partial class PageUploadXls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "به روز رسانی ";
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            NewMellatEntities db = new NewMellatEntities();

            string s = "";
            if (FileUpload1.HasFile)
            {

              //  try
                {
                    OleDbConnection openDb = new OleDbConnection();
                    OleDbCommand cmd = new OleDbCommand();
                    string strName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + ".xlsx";
                    FileUpload1.SaveAs(Server.MapPath(@"~\content\tmp\" + strName));
                    openDb.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath(@"~\content\tmp\" + strName) + ";Extended Properties='Excel 8.0;HDR=YES;'";

                    cmd.Connection = openDb;
                    cmd.CommandText = "select * from [Sheet1$]";

                    openDb.Open();
                    OleDbDataReader read = cmd.ExecuteReader();
                    while (read.Read())
                    {
                        var code = read[0].ToString();
                        s = code;

                        int status = Convert.ToInt32(read[1]);
                        int ejra = -1;
                        try
                        {
                            ejra = Convert.ToInt32(read[2]);
                        }
                        catch
                        {
                            ejra = -1;
                        }
                        float percentComplete = -1;
                        try
                        {
                            percentComplete = Convert.ToSingle(read[3]);
                        }
                        catch
                        {
                            ejra = -1;
                        }
                        // به روز رسانی 
                        var info = db.tbProjects.FirstOrDefault(n => n.prFinalCode == code);

                        info.prProjectStatus = db.prInformations.FirstOrDefault(n => n.infId == status).infTitle;

                        if (ejra != -1)
                        {
                            info.prSt2 = db.prInformations.FirstOrDefault(n => n.infId == ejra).infTitle;
                        }
                        else
                        {
                            info.prSt2 = string.Empty;

                        }
                        if (ejra != -1)
                        {
                            info.PercentComplete = percentComplete;
                        }

                        db.SaveChanges();

                    }

                    read.Close();
                    openDb.Close();

                    lbResult.Text = "اطلاعات با موفقیت به روز شد";
                    lbResult.ForeColor = System.Drawing.Color.Green;
                }
             //   catch (Exception ex)
            //    {
             //       //  lbResult.Text = ex.Message;
            // //       lbResult.Text = "سندی انتخابی را کنترل نمایید";
             //       lbResult.ForeColor = System.Drawing.Color.Red;
            //    }
            }
            else
            {
                lbResult.Text = "سندی انتخاب نشده است";
                lbResult.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}