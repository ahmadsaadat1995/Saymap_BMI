using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Internal;

namespace NewMellat.Content
{
    public partial class PageCommission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

            //if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 2))
            //{
            //    //  ASPxButton1.Enabled = false;

            //}
            sourceHeyatNezarat.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceNezarat.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "طرح در کمیسیون معاملات";


            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
                PersianCalendar2.Date = DateTime.Now;

            }
        }


        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {



            if (e.DataColumn.VisibleIndex == 7)
            {
                // کنترل وضعیت صورتجلسه
                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;

                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink4") as HyperLink;

                int intId = Convert.ToInt32(hf.Value);




                hp.NavigateUrl = "~/content/PageCommissionMosavab.aspx?id=" + intId;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));







            }




        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            foreach (string s in tokenVahed.Value.ToString().Split(','))
            {
                int thId ;
                if(!int.TryParse(s,out thId))
                    thId = Convert.ToInt32(tokenVahed.Items.Cast<ListEditItem>().Where(itm => itm.Text.Trim() == s.Trim()).FirstOrDefault().Value);
                var tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thId == thId);
                int projectId = tarh.thProject.Value;
                Commission c = new Commission();
                c.Act = 1;
                c.IsElhaghie = tarh.thIsElhaghie.Value;
                c.JalaseDate = PersianCalendar2.Date;
                c.JalaseNumber = txtJalaseNumber.Text;
                c.ProjectId = projectId;
                c.ProposalId = thId;

                db.Commissions.Add(c);
                db.SaveChanges();

                HiddenField2.Value = c.ID.ToString();
                

                // ثبت نامه
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
                    newFile.fiParent = Convert.ToInt32(HiddenField2.Value);
                    //   newFile.fiTitle = txtTitle.Text;
                    newFile.fiType = 1101;
                    db.tbFiles.Add(newFile);
                    db.SaveChanges();
                }


                //به روز رسانی analyz در پروژه


                db.SaveChanges();
                //-------------------------

            }

            ASPxGridView1.DataBind();
            tokenVahed.DataBind();



            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");
        }

        protected void sourceHeyatNezarat_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@ID"].Value;
            HiddenField2.Value = intId.ToString();
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }
            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }
    }
}