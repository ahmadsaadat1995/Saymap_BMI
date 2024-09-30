using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageSooratNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourcePishnevis.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ثبت صورتحساب";

            if (!IsPostBack)
            {
                dv1.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView3_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "est")
            {
                ASPxRoundPanel2.Visible = true;

                dv1.Style.Add(HtmlTextWriterStyle.Display, "block");

                int pishId = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var pish = db.tbSooratPishNevis.SingleOrDefault(n => n.pishId == pishId);
                var project = db.tbSooratHesabs.FirstOrDefault(n => n.id == pish.pishProject);

                int intCompany = Convert.ToInt32(project.CompanyName);
                try
                {
                    lbCompany.Text = db.prInformations.FirstOrDefault(n => n.infId == intCompany).infTitle;
                }
                catch { }
                lbProjectName.Text = project.ProjectName;
                lbGharardad.Text = project.ProjectGharardad;
                lbGharardadType.Text = project.GharardadType;



                //lbNazer1.Text = project.Nazer1;
                //lbNazer2.Text = project.Nazer2;


                int nazer1 = Convert.ToInt32(project.Nazer1);
                int nazer2 = Convert.ToInt32(project.Nazer2);


                try
                {
                    lbNazer1.Text = db.prInformations.FirstOrDefault(n => n.infId == nazer1).infTitle;
                }
                catch { }

                try
                {
                    lbNazer2.Text = db.prInformations.FirstOrDefault(n => n.infId == nazer2).infTitle;
                }
                catch { }





                lbOnvan.Text = project.OnvanTahvili;

                try
                {
                    lbPishPrice.Text = CommonClass.NumberWithGroup(Convert.ToInt64(pish.pishPrice));

                }
                catch (Exception)
                {


                }


                try
                {
                    lbPriceArzesh.Text = CommonClass.NumberWithGroup(Convert.ToInt64(pish.pishPricePlus));
                }
                catch
                {

                }
                lbDore.Text = pish.pishDore;

                HiddenField1.Value = pishId.ToString();

                var infoTolid =
                        db.tbSooratHesabs.FirstOrDefault(
                            n => n.ProjectGharardad == project.ProjectGharardad && n.Gharardad.Contains("تولید"));

                var infoPosh =
                       db.tbSooratHesabs.FirstOrDefault(
                           n => n.ProjectGharardad == project.ProjectGharardad && n.Gharardad.Contains("پشتیبانی"));

                try
                {
                    lbStartTolid.Text = infoTolid.GharardadStart;

                    lbEndTolid.Text = infoTolid.GharardadEnd;
                }
                catch { }


                try
                {
                    lbStartPosh.Text = infoPosh.GharardadStart;
                    lbEndPosh.Text = infoPosh.GharardadEnd;
                }
                catch { }



                // اطلاعات پاسخ های ناظر

                try
                {
                    var info = db.tbProjectPapers.FirstOrDefault(n => n.paType == 1003 && n.paAct == 1 &&
                                                                      n.paProject == pish.pishProject);
                    ln1.Text = info.paShenase;
                    lnD1.Text = Persia.Calendar.ConvertToPersian(info.paDate.Value).Simple;
                }
                catch
                {

                }


                try
                {

                    var info2 = db.tbProjectPapers.FirstOrDefault(n => n.paType == 1004 && n.paAct == 1 && n.paProject == pish.pishProject);
                    ln2.Text = info2.paShenase;
                    lnD2.Text = Persia.Calendar.ConvertToPersian(info2.paDate.Value).Simple;
                }
                catch
                {

                }

                ASPxGridView3.Visible = false;
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int pishId = Convert.ToInt32(HiddenField1.Value);


            var info = db.tbSooratPishNevis.SingleOrDefault(n => n.pishId == pishId);
            info.pishSooratHesab = txtSoorat1.Text;

            try
            {
                info.pishFinalPrice = Convert.ToInt64(txtFinalPrice.Text);
            }
            catch { }


            try
            {
                info.pishPriceArzeshAfzoode = Convert.ToInt64(txtPriceEhtesab.Text);

            }
            catch
            {


            }

            info.pishIsSabt = true;

            db.SaveChanges();
            lbresult.Text = "تغییرات با موفقیت به ثبت رسید";
            lbresult.ForeColor = Color.Green;
            ASPxButton1.Enabled = false;
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            DataBind();
        }
    }
}