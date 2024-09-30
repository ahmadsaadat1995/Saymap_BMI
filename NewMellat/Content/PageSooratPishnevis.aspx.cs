using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.IO;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageSooratPishnevis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ثبت پیش نویس";


            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }



            if (Request.QueryString["type"] == "1")
            {
                Label7.Visible = false;
                txtSoorathesab.Visible = false;
            }

            if (!IsPostBack)
            {
                for (int i = 1; i < 32; i++)
                {
                    drpDay.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                }

                for (int i = 1; i < 13; i++)
                {
                    drpMonth.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                }

                PersianCalendar pc = new PersianCalendar();
                int intYear = pc.GetYear(DateTime.Now);
                int intMonth = pc.GetMonth(DateTime.Now);
                int intDay = pc.GetDayOfMonth(DateTime.Now);

                for (int i = intYear - 10; i <= intYear; i++)
                {
                    drpYear.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                }


                drpYear.Value = intYear;
                drpMonth.Value = intMonth;
                drpDay.Value = intDay;
            }


            int intId = Convert.ToInt32(Request.QueryString["id"]);
            var info = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
            lbTitle.Text = info.OnvanTahvili;
            lbPrice.Text = info.Price +" ریال" ;


            // کنترل نوع پروژه
            if (info.GharardadType == "مقطوع")
            {
                txtNafar.Visible = false;
                Label8.Visible = false;
            }

        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            tbSooratPishNevi pish = new tbSooratPishNevi();

            int intId = Convert.ToInt32(Request.QueryString["id"]);
            int intType = Convert.ToInt32(Request.QueryString["type"]);
            pish.pishAct = 1;
            pish.pishDore = txtDore.Text.TrimEnd();
            pish.pishHours = txtNafar.Text;
            pish.pishPrice = txtPrice.Text;
            pish.pishPricePlus = txtPricePlus.Text;
            pish.pishProject = intId;
            pish.pishSooratHesab = txtSoorathesab.Text;
            pish.pishType = intType;
            pish.pishIsNazer = false;
            pish.pishIsSabt = false;
            db.tbSooratPishNevis.Add(pish);
            db.SaveChanges();

            var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intId);
            soorat.step1 = true;
            db.SaveChanges();

            int intPishId = pish.pishId;




            if (!string.IsNullOrEmpty(txtShenase.Text))
            {
                sourcePaper.InsertParameters["paDate"].DefaultValue =
                    Persia.Calendar.ConvertToGregorian(int.Parse(drpYear.Value.ToString()), int.Parse(drpMonth.Value.ToString()),
                        int.Parse(drpDay.Value.ToString())).ToShortDateString();

                sourcePaper.InsertParameters["paProject"].DefaultValue = intPishId.ToString();
                sourcePaper.Insert();
            }



            foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;

                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = intPishId;

                newFile.fiType = 1001;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }

            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");

            DataBind();
            ASPxButton1.Enabled = false;
        }
    }
}