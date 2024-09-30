using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageKhobregan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 2))
            {
                ASPxButton1.Enabled = false;

            }
            sourceProjects2.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceKhobregan.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "طرح در جلسه کارگروه توسعه فرآیندهای جاری";

            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
                PersianCalendar2.Date = DateTime.Now;

            }
        }


        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            foreach (string s in ASPxListBox1.SelectedValues)
            {
                sourceKhobregan.InsertParameters["khProject"].DefaultValue = s;
                sourceKhobregan.InsertParameters["khJalaseDate"].DefaultValue =
                    PersianCalendar2.Date.ToShortDateString();
                sourceKhobregan.Insert();

                sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
                sourcePaper.Insert();





                foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
                {

                    tbFile newFile = new tbFile();
                    newFile.fiAct = 1;

                    byte[] fileData = new byte[file.InputStream.Length];
                    file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                    newFile.fiData = fileData;



                    newFile.fiDate = DateTime.Now;
                    newFile.fiExt = Path.GetFileName(file.FileName);
                    newFile.fiParent = Convert.ToInt32(HiddenField1.Value);
                    newFile.fiType = 3;
                    db.tbFiles.Add(newFile);
                    db.SaveChanges();
                }


                //به روز رسانی status در پروژه
                int intId = Convert.ToInt32(s);
                var project = db.tbProjects.SingleOrDefault(n => n.prId == intId);
                project.prStatus = 1;
                db.SaveChanges();
                //-------------------------
            }

            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");

            ASPxListBox1.DataBind();
            ASPxGridView1.DataBind();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 8)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 5)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink5") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }



            if (e.DataColumn.VisibleIndex == 4)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink4") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc4({0}); return false;", strItembody[1]));
            }




            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink6") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 9)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc5({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 14)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink7") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", "loadDoc6(); return false;");
            }



            if (e.DataColumn.FieldName == "khJalaseDate")
            {
                try
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
                catch { }
            }




        }

        protected void sourceKhobregan_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@khId"].Value;
            HiddenField1.Value = intId.ToString();


        }

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "bk")
            {
                int khId = Convert.ToInt32(e.CommandArgs.CommandArgument);

                var khobregan = db.tbKhbregans.SingleOrDefault(n => n.khId == khId);



                //به روز رسانی status در پروژه

                var project = db.tbProjects.SingleOrDefault(n => n.prId == khobregan.khProject);
                project.prStatus = 0;
                db.SaveChanges();

                //حذف خبرگان
                db.tbKhbregans.Remove(khobregan);
                db.SaveChanges();



                DataBind();

            }
        }
    }
}