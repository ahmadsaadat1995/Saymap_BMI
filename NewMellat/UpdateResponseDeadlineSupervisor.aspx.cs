using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat
{
    public partial class UpdateResponseDeadlineSupervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void SaveNewPaper(object sender, EventArgs e)
        {
            sourcePages.InsertParameters["MohlatDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();

            sourcePages.Insert();


            if (Request.QueryString["type"] == "1005")
            {
                // ارسال به شرکت
                int intPish = Convert.ToInt32(Request.QueryString["project"]);

                int intId = db.tbSooratPishNevis.SingleOrDefault(n => n.pishId == intPish).pishProject.Value;
                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step4 = true;
                db.SaveChanges();

            }






            if (Request.QueryString["type"] == "1006" || Request.QueryString["type"] == "1007")
            {

                // بازگشت به لیست صدور استعلام جهت استعلام مجدد
                int intId = Convert.ToInt32(Request.QueryString["project"]);


                var info = db.tbSooratPishNevis.FirstOrDefault(n => n.pishId == intId);
                info.pishIsNazer = false;
                db.SaveChanges();

            }



            if (Request.QueryString["type"] == "1006")
            {
                // استعلام مجدد
                int intPish = Convert.ToInt32(Request.QueryString["project"]);

                int intId = db.tbSooratPishNevis.SingleOrDefault(n => n.pishId == intPish).pishProject.Value;


                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);


                soorat.step1 = true;
                soorat.step2 = false;
                soorat.step3 = false;
                soorat.step4 = false;
                soorat.step5 = false;


                db.SaveChanges();

            }

            if (Request.QueryString["type"] == "1007")
            {
                // ارسال به شرکت
                int intPish = Convert.ToInt32(Request.QueryString["project"]);

                int intId = db.tbSooratPishNevis.SingleOrDefault(n => n.pishId == intPish).pishProject.Value;
                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step6 = true;
                db.SaveChanges();
            }



            if (Request.QueryString["type"] == "1008")
            {
                // ارسال به مالی
                int intId = Convert.ToInt32(Request.QueryString["project"]);

                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step10 = true;
                db.SaveChanges();
            }



            if (Request.QueryString["type"] == "1009")
            {
                // ارسال به تعیین تکلیف عودتی ها
                int intId = Convert.ToInt32(Request.QueryString["project"]);

                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step8 = true;
                db.SaveChanges();
            }

            if (Request.QueryString["type"] == "1014")
            {
                // ارسال به مالی
                int intId = Convert.ToInt32(Request.QueryString["project"]);

                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step10 = true;
                db.SaveChanges();
            }


            if (Request.QueryString["type"] == "1015")
            {
                // لیست پرداخت
                int intId = Convert.ToInt32(Request.QueryString["project"]);

                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step13 = true;
                db.SaveChanges();
            }


            if (Request.QueryString["type"] == "1016")
            {
                // لیست پرداخت
                int intId = Convert.ToInt32(Request.QueryString["project"]);

                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step11 = true;
                db.SaveChanges();
            }



            if (Request.QueryString["type"] == "1020")
            {
                // لیست پرداخت
                int intId = Convert.ToInt32(Request.QueryString["project"]);

                var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
                soorat.step12 = true;
                db.SaveChanges();
            }


            if (FileUpload1.HasFile)
            {
                tbFile newFile = new tbFile();
                newFile.fiAct = 1;
                newFile.fiData = FileUpload1.FileBytes;
                newFile.fiDate = PersianCalendar1.Date;
                newFile.fiExt = Path.GetFileName(FileUpload1.FileName);
                newFile.fiParent = Convert.ToInt32(HiddenField3.Value);
                newFile.fiTitle = Request.QueryString["project"];
                newFile.fiType = Convert.ToInt32(Request.QueryString["type"]);
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 5)
            {
                try
                {
                    HyperLink hp = ASPxGridView2.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;

                    HiddenField hf = ASPxGridView2.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField3") as HiddenField;

                    int intId = Convert.ToInt32(hf.Value);

                    var fileinfo = db.tbFiles.FirstOrDefault(n => n.fiAct == 1 && n.fiParent == intId);

                    if (fileinfo != null)
                    {
                        hp.Visible = true;

                        FileStream fs = new FileStream(Server.MapPath(@"~\Content\images\Documents\" + fileinfo.fiId + fileinfo.fiExt), FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite);

                        fs.Write(fileinfo.fiData, 0, fileinfo.fiData.Length);
                        fs.Flush();
                        fs.Close();

                        hp.NavigateUrl = @"~\Content\images\Documents\" + fileinfo.fiId + fileinfo.fiExt;
                    }
                }
                catch (Exception)
                {


                }

            }
        }

        protected void sourcePages_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@paId"].Value;
            HiddenField3.Value = intId.ToString();
        }
         
    }
}