using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageElhaghNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Label panel = (Label)this.Master.FindControl("lbHeader");
                panel.Text = "ثبت الحاقیه";

                dv1.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv2.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv3.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv4.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv5.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv6.Style.Add(HtmlTextWriterStyle.Display, "none");

                pc22.Date = DateTime.Now;
                pc33.Date = DateTime.Now;
                pc44.Date = DateTime.Now;
                pc6.Date = DateTime.Now;
                pc66.Date = DateTime.Now;
                pc3.Date = DateTime.Now;
                pc4.Date = DateTime.Now;
                pc2.Date = DateTime.Now;
                pc222.Date = DateTime.Now;
                pc2222.Date = DateTime.Now;



                // کنترل امنیت
                if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                {
                    Response.Redirect(@"~\content\PageDenied.aspx");
                }

                sourceProjects0.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
                SqlDataSource1.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            }
        }


        NewMellatEntities db = new NewMellatEntities();



        protected void drpProjects_SelectedIndexChanged(object sender, EventArgs e)
        {


            string code = drpProjects.Value.ToString();


            try
            {
                //load info

                Int64 int1 = 0;
                Int64 int2 = 0;
                var info1 =
                    db.tbSooratHesabs.Where(n => n.ProjectGharardad == code && n.Gharardad.Contains("تولید"));
                foreach (var item in info1)
                {
                    //try
                    //{
                    int1 = int1 + Convert.ToInt64(item.Price);
                    //}
                    //catch { }
                }

                lbPriceTolid.Text = CommonClass.NumberWithGroup(long.Parse(int1.ToString()));



                var info2 =
                 db.tbSooratHesabs.Where(n => n.ProjectGharardad == code && n.Gharardad.Contains("پشتیبانی"))
                     .Select(n => n);

                foreach (var item in info2)
                {
                    try
                    {
                        int2 = int2 + Convert.ToInt64(item.Price);
                    }
                    catch { }
                }

                lbPricePosh.Text = CommonClass.NumberWithGroup(long.Parse(int2.ToString()));


            }
            catch { }




            try
            {



                code = drpProjects.Value.ToString();
                lbGharardad.Text = code;
            }
            catch
            {

                lbGharardad.Text = "";

            }
            try
            {
                var infoTolid =
                    db.tbSooratHesabs.FirstOrDefault(
                        n => n.ProjectGharardad == code && n.Gharardad.Contains("تولید"));




                lbTolidStart.Text = infoTolid.GharardadStart;
                lbTolidEnd.Text = infoTolid.GharardadEnd;



            }
            catch
            {

                lbTolidStart.Text = "";
                lbTolidEnd.Text = "";

            }


            try
            {
                var infoPosh =
                    db.tbSooratHesabs.FirstOrDefault(
                        n => n.ProjectGharardad == code && n.Gharardad.Contains("پشتیبانی"));

                lbPoshStart.Text = infoPosh.GharardadStart;
                lbPoshEnd.Text = infoPosh.GharardadEnd;
            }
            catch
            {

                lbPoshStart.Text = "";
                lbPoshEnd.Text = "";

            }


            try
            {
                var info =
                  db.tbSooratHesabs.FirstOrDefault(
                      n => n.ProjectGharardad == code);

                int intCompany = Convert.ToInt32(info.CompanyName);

                lbCompany.Text = db.prInformations.SingleOrDefault(n => n.infId == intCompany).infTitle;

            }
            catch
            {
                lbCompany.Text = "";
            }


            try
            {
                var info =
                  db.tbSooratHesabs.FirstOrDefault(
                      n => n.ProjectGharardad == code);

                int intNazer1 = Convert.ToInt32(info.Nazer1);



                lbNazer.Text = db.prInformations.SingleOrDefault(n => n.infId == intNazer1).infTitle;

            }
            catch
            {
                lbNazer.Text = "";
            }


            try
            {
                var info =
                  db.tbSooratHesabs.FirstOrDefault(
                      n => n.ProjectGharardad == code);

                int intNazer2 = Convert.ToInt32(info.Nazer2);



                lbNazer.Text += ", " + db.prInformations.SingleOrDefault(n => n.infId == intNazer2).infTitle;

            }
            catch
            {

            }


        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ASPxComboBox1.SelectedIndex == 0)
            {
                dv1.Style.Add(HtmlTextWriterStyle.Display, "block");
                dv2.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv3.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv4.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv5.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv6.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            else if (ASPxComboBox1.SelectedIndex == 1 || ASPxComboBox1.SelectedIndex == 8)
            {
                dv1.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv2.Style.Add(HtmlTextWriterStyle.Display, "block");
                dv3.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv4.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv5.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv6.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            else if (ASPxComboBox1.SelectedIndex == 2)
            {
                dv1.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv2.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv3.Style.Add(HtmlTextWriterStyle.Display, "block");
                dv4.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv5.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv6.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            else if (ASPxComboBox1.SelectedIndex == 3)
            {
                dv1.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv2.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv3.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv4.Style.Add(HtmlTextWriterStyle.Display, "block");
                dv5.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv6.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            else if (ASPxComboBox1.SelectedIndex == 4)
            {
                dv1.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv2.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv3.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv4.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv5.Style.Add(HtmlTextWriterStyle.Display, "block");
                dv6.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            else if (ASPxComboBox1.SelectedIndex == 5)
            {
                dv1.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv2.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv3.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv4.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv5.Style.Add(HtmlTextWriterStyle.Display, "none");
                dv6.Style.Add(HtmlTextWriterStyle.Display, "block");
            }


        }


        int elId = 0;
        private void sourceElhaghie_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            elId = Convert.ToInt32(e.Command.Parameters["@elId"].Value);
        }
        int thId = 0;
        void sourceTarh_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            thId = Convert.ToInt32(e.Command.Parameters["@thId"].Value);
        }
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            // ثبت طرح پیشنهادی جدید

            thId = 0;
            elId = 0;

            string ghCode = drpProjects.Value.ToString();
            var prId = db.tbGharardads.FirstOrDefault(n => n.ghCode == ghCode).ghProject.Value;
            var tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thProject == prId);

            ASPxButton1.Enabled = false;
            ASPxButton2.Visible = true;


            sourceElhaghie.InsertParameters["elProject"].DefaultValue = prId.ToString();
            sourceElhaghie.InsertParameters["elType"].DefaultValue = ASPxComboBox1.Text;

            if (ASPxComboBox1.SelectedIndex == 0)
            {
                sourceElhaghie.InsertParameters["elBody"].DefaultValue = txtBody1.Text;
                //sourceElhaghie.InsertParameters["elDate1"].DefaultValue =;
                //sourceElhaghie.InsertParameters["elDate2"].DefaultValue =;
                sourceElhaghie.InsertParameters["elPrice"].DefaultValue = txtPrice1.Text;
                sourceElhaghie.InsertParameters["elPrice2"].DefaultValue = txtPrice12.Text;




            }
            else if (ASPxComboBox1.SelectedIndex == 1 || ASPxComboBox1.SelectedIndex == 8)
            {
                sourceElhaghie.InsertParameters["elBody"].DefaultValue = txtBody2.Text;

                if (CheckBox1.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate1"].DefaultValue = pc2.Date.ToShortDateString();
                }


                if (CheckBox2.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate2"].DefaultValue = pc22.Date.ToShortDateString();
                }
                sourceElhaghie.InsertParameters["elPrice"].DefaultValue = txtPrice2.Text;
                sourceElhaghie.InsertParameters["elPrice2"].DefaultValue = txtPrice22.Text;

                sourceElhaghie.InsertParameters["elBody2"].DefaultValue = txtBody22.Text;


                if (CheckBox3.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate3"].DefaultValue = pc222.Date.ToShortDateString();
                }



                if (CheckBox4.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate4"].DefaultValue = pc2222.Date.ToShortDateString();
                }


            }
            else if (ASPxComboBox1.SelectedIndex == 2 )
            {
                sourceElhaghie.InsertParameters["elBody"].DefaultValue = txtBody33.Text;

                if (CheckBox5.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate1"].DefaultValue = pc3.Date.ToShortDateString();
                }


                if (CheckBox6.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate2"].DefaultValue = pc33.Date.ToShortDateString(); ;
                }

            }
            else if (ASPxComboBox1.SelectedIndex == 3)
            {
                sourceElhaghie.InsertParameters["elBody"].DefaultValue = txtBody4.Text;

                if (CheckBox7.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate1"].DefaultValue = pc4.Date.ToShortDateString();
                }


                if (CheckBox8.Checked)
                {
                    sourceElhaghie.InsertParameters["elDate2"].DefaultValue = pc44.Date.ToShortDateString(); ;
                }

            }
            else if (ASPxComboBox1.SelectedIndex == 4)
            {
                sourceElhaghie.InsertParameters["elBody"].DefaultValue = txtBody51.Text;
                // sourceElhaghie.InsertParameters["elDate1"].DefaultValue = pc5.Date.ToShortDateString();
                // sourceElhaghie.InsertParameters["elDate2"].DefaultValue =;
                sourceElhaghie.InsertParameters["elPrice"].DefaultValue = txtPrice51.Text;
                sourceElhaghie.InsertParameters["elPrice2"].DefaultValue = txtPrice521.Text;

            }
            else if (ASPxComboBox1.SelectedIndex == 5)
            {
                //  sourceElhaghie.InsertParameters["elBody"].DefaultValue = txtBody6.Text;
                sourceElhaghie.InsertParameters["elDate1"].DefaultValue = pc6.Date.ToShortDateString();
                sourceElhaghie.InsertParameters["elDate2"].DefaultValue = pc66.Date.ToShortDateString();
                //   sourceElhaghie.InsertParameters["elPrice"].DefaultValue = txtPrice6.Text;

            }

            sourceElhaghie.Inserted += sourceElhaghie_Inserted;
            sourceElhaghie.Insert();
            //var a = sourceElhaghie.InsertParameters["elId"].DefaultValue ;

            sourceTarh.Inserted += sourceTarh_Inserted;
            sourceTarh.InsertParameters["thProject"].DefaultValue = prId.ToString();
            try
            {
                sourceTarh.InsertParameters["thYear"].DefaultValue = tarh.thYear.Value.ToString();
            }
            catch { }

            try
            {
                sourceTarh.InsertParameters["thHajmTolid"].DefaultValue = tarh.thHajmTolid;
            }
            catch { }

            try
            {
                sourceTarh.InsertParameters["thHajmPosh"].DefaultValue = tarh.thHajmPosh;
            }
            catch { }

            try
            {
                sourceTarh.InsertParameters["thPriceTolid"].DefaultValue = tarh.thPriceTolid.Value.ToString();
            }
            catch { }

            try
            {
                sourceTarh.InsertParameters["thPricePosh"].DefaultValue = tarh.thPricePosh.Value.ToString();
            }
            catch { }


            try
            {
                sourceTarh.InsertParameters["thModatTolid"].DefaultValue = tarh.thModatTolid;
            }
            catch { }

            try
            {
                sourceTarh.InsertParameters["thModatPosh"].DefaultValue = tarh.thModatPosh;
            }
            catch { }


            try
            {
                sourceTarh.InsertParameters["thMekanizmPosh"].DefaultValue = tarh.thMekanizmPosh.Value.ToString();
            }
            catch { }


            try
            {
                sourceTarh.InsertParameters["thMekanizmtolid"].DefaultValue = tarh.thMekanizmtolid.Value.ToString();
            }
            catch { }
            if (elId > 0)
                sourceTarh.InsertParameters["ElhaghieId"].DefaultValue = elId.ToString();
            sourceTarh.Insert();

            sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePaper.InsertParameters["paProject"].DefaultValue = thId.ToString();
            sourcePaper.Insert();


            // به روز رسانی پروژه

            var projectInfo = db.tbProjects.SingleOrDefault(n => n.prId == prId);
            projectInfo.irIsAnalyz = 0;
            db.SaveChanges();

            Response.Redirect(@"~\content\PageElhaghNew.aspx");
        }

        



        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~\content\PageElhaghNew.aspx");
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //{

            //    DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
            //    if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
            //    {
            //        e.Visible = false;
            //    }
            //}


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }

        protected void ASPxGridView1_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
        }

        protected void ASPxGridView1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int elId = Convert.ToInt32(e.Keys[0]);


            // استخراج پروژه
            var elhagh = db.tbElhaghies.SingleOrDefault(n => n.elId == elId).elProject;
            var tarh = db.tbTarhPishnehadis.Where(n => n.thIsElhaghie == true && n.thProject == elhagh);

            foreach (var inf in tarh)
            {
                inf.thAct = 0;

            }

            //  db.tbTarhPishnehadis.Remove(tarh);
            db.SaveChanges();

        }
    }
}