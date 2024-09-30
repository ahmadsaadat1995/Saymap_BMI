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
using System.Text.RegularExpressions;

namespace NewMellat.Content
{
    public partial class PageHeyatNezarat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourceHeyatNezarat.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceNezarat.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 2))
            {
                //  ASPxButton1.Enabled = false;

            }

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "طرح در جلسه کمیسیون نظارت";


            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
                PersianCalendar2.Date = DateTime.Now;

            }
        }


        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 10)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc5({0}); return false;", strItembody[1]));

            }


            if (e.DataColumn.FieldName == "heJalaseDate")
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label14") as Label;

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch (Exception)
                {

                }
            }


            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink7") as HyperLink;
                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 14)
            {
                HiddenField hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField3") as HiddenField;
                Label lb6 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label6") as Label;
                Label lb7 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label7") as Label;



                var prId = Convert.ToInt32(hp.Value);
                var info = db.tbTarhPishnehadis.OrderByDescending(n => n.thId).FirstOrDefault(n => n.thProject == prId).thIsElhaghie;




                if (info.ToString().ToLower() == "true")
                {
                    lb6.Visible = true;
                    lb7.Visible = false;
                }
                else
                {
                    lb6.Visible = false;
                    lb7.Visible = true;
                }

            }


            if (e.DataColumn.VisibleIndex == 7)
            {
                // کنترل وضعیت صورتجلسه
                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;

                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink4") as HyperLink;

                int intId = Convert.ToInt32(hf.Value);

                var info1 = db.tbShenaseNumbers.Where(n => n.shHeyat == intId && n.shStatus == 1);
                var info2 = db.tbShenaseNumbers.Where(n => n.shHeyat == intId && n.shStatus == 2);
                var info3 = db.tbShenaseNumbers.Where(n => n.shHeyat == intId && n.shStatus == 3);



                if (info1.Count() > 0)
                {
                    hp.NavigateUrl = "~/content/PageHeyatNezaratMosavab.aspx?id=" + intId;
                    string[] strItembody = hp.NavigateUrl.Split('=');
                    hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));

                }


                if (info2.Count() > 0)
                {
                    hp.NavigateUrl = "~/content/Pagepages.aspx?Project=" + intId;
                    string[] strItembody = hp.NavigateUrl.Split('=');
                    hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));
                }


                if (info3.Count() > 0)
                {
                    hp.NavigateUrl = "~/content/Pagepages.aspx?Project=" + intId;
                    string[] strItembody = hp.NavigateUrl.Split('=');
                    hp.Attributes.Add("onclick", string.Format("loadDoc4({0}); return false;", strItembody[1]));
                }


            }




        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string[] split = Request["ContentPlaceHolder1_tokenVahed_TKV"].Split('"');
            if(split.Length <2)
            {

                return;
            }
            string value = split[1];
            foreach (string s in value.Split(','))
            {
                int thId = 0;
                tbTarhPishnehadi tarh = null;
                int projectId = 0;
                tbProject project;
                if (int.TryParse(s, out thId))
                {
                    tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thId == thId);
                    projectId = tarh.thProject.Value;
                }
                else
                {
                    project = db.tbProjects.FirstOrDefault(n => n.prTitle.Contains(s) && n.prAct == 1);
                    
                    if (project == null)
                        continue;
                    projectId = project.prId;

                    tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thProject == projectId && n.thAct ==1);
                    if (tarh == null)
                        continue;
                    thId = tarh.thId;
                    
                }
                sourceHeyatNezarat.InsertParameters["ProposalId"].DefaultValue = thId.ToString();
                sourceHeyatNezarat.InsertParameters["heProject"].DefaultValue = projectId.ToString();

                sourceHeyatNezarat.InsertParameters["heJalaseDate"].DefaultValue =
                    PersianCalendar2.Date.ToShortDateString();


                //int prId = Convert.ToInt32(tokenVahed.Value);

                sourceHeyatNezarat.InsertParameters["heIsElhaghie"].DefaultValue = tarh.thIsElhaghie.Value.ToString();




                sourceHeyatNezarat.Insert();

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



                    newFile.fiDate = DateTime.Now; newFile.fiExt = Path.GetFileName(file.FileName);
                    newFile.fiParent = Convert.ToInt32(HiddenField2.Value);
                    //   newFile.fiTitle = txtTitle.Text;
                    newFile.fiType = 1001;
                    db.tbFiles.Add(newFile);
                    db.SaveChanges();
                }


                //به روز رسانی analyz در پروژه
               
                project = db.tbProjects.SingleOrDefault(n => n.prId == projectId);
                project.irIsAnalyz = 1;
                project.prIsEstelamMohtavayi = 1;
                //project.prTemp = 1;
                db.SaveChanges();
                //-------------------------

            }

            ASPxGridView1.DataBind();
            tokenVahed.DataBind();



            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");
        }

        protected void sourceHeyatNezarat_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@heId"].Value;
            HiddenField2.Value = intId.ToString();
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

               // DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }
            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
               // DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }
    }
}