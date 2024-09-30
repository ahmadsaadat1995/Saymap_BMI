using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;

namespace NewMellat.Content
{
    public partial class PageSooratInsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ثبت";


            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
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


                if (!string.IsNullOrEmpty(RadTextBox1.Text) && !string.IsNullOrEmpty(RadTextBox2.Text))
                {
                    cmd.CommandText =
                        "select * from vwSooratHesab where ProjectName like '%' + @ProjectName + '%' or ProjectGharardad like '%' + @ProjectGharardad + '%'";

                    cmd.Parameters.AddWithValue("@ProjectName", RadTextBox1.Text);
                    cmd.Parameters.AddWithValue("@ProjectGharardad", RadTextBox2.Text);
                }


                if (!string.IsNullOrEmpty(RadTextBox1.Text) && string.IsNullOrEmpty(RadTextBox2.Text))
                {
                    cmd.CommandText =
                        "select * from vwSooratHesab where ProjectName like '%' + @ProjectName + '%'";

                    cmd.Parameters.AddWithValue("@ProjectName", RadTextBox1.Text);

                }



                if (string.IsNullOrEmpty(RadTextBox1.Text) && !string.IsNullOrEmpty(RadTextBox2.Text))
                {
                    cmd.CommandText =
                        "select * from vwSooratHesab where ProjectGharardad like '%' + @ProjectGharardad + '%'";

                    cmd.Parameters.AddWithValue("@ProjectGharardad", RadTextBox2.Text);
                }

                cmd.CommandText += string.Format(@"   
        and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = '{0}')  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = '{0}') ))) 
        AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = '{0}') )) ", Page.User.Identity.Name);
                openDb.Open();
                ASPxGridView4.DataSource = cmd.ExecuteReader();
                ASPxGridView4.DataBind();
                openDb.Close();


                ASPxRoundPanel1.Visible = false;
                ASPxRoundPanel2.Visible = false;
                ASPxRoundPanel3.Visible = false;
                ASPxRoundPanel4.Visible = false;
                ASPxRoundPanel5.Visible = false;
            }

        }

        protected void ASPxGridView4_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == " Delll")
            {

                //if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                //{
                string code = e.CommandArgs.CommandArgument.ToString();
                var info =
                    db.tbSooratHesabs.Where(
                        n => n.ProjectGharardad == code);


                foreach (var item in info)
                {
                    var details = db.tbSooratHesabs.SingleOrDefault(n => n.id == item.id);
                    db.tbSooratHesabs.Remove(details);
                }

                db.SaveChanges();
                ASPxGridView4.DataBind();
                //}
            }


            if (e.CommandArgs.CommandName == "dt")
            {

                ASPxRoundPanel1.Visible = true;
                ASPxRoundPanel2.Visible = true;
                ASPxRoundPanel3.Visible = true;
                ASPxRoundPanel4.Visible = true;
                ASPxRoundPanel5.Visible = true;

                string code = e.CommandArgs.CommandArgument.ToString();
                var info =
                    db.tbSooratHesabs.FirstOrDefault(
                        n => n.ProjectGharardad == code);



                HyperLink2.NavigateUrl = @"~\content\PageSooratedit.aspx?id=" + code + "&n1=" + info.Nazer1 + "&n2=" + info.Nazer2 + "&com=" + info.CompanyName + "&gh=" + info.GharardadType+"&pr="+info.prId;
                
                lbTolidStart.Text = "";
                lbTolidEnd.Text = "";
                    

                lbPoshStart.Text = "";
                lbPoshEnd.Text = "";
                try
                {
                    var infoTolid =
                        db.tbSooratHesabs.FirstOrDefault(
                            n => n.ProjectGharardad == code && n.Gharardad.Contains("تولید"));




                    lbTolidStart.Text = infoTolid.GharardadStart;
                    lbTolidEnd.Text = infoTolid.GharardadEnd;
                  

                }
                catch { }


                try
                {
                    var infoPosh =
                        db.tbSooratHesabs.FirstOrDefault(
                            n => n.ProjectGharardad == code && n.Gharardad.Contains("پشتیبانی"));

                    
                    lbPoshStart.Text = infoPosh.GharardadStart;
                    lbPoshEnd.Text = infoPosh.GharardadEnd;
                }
                catch { }



                //load info
                var info1 =
                    db.tbSooratHesabs.Where(n => n.ProjectGharardad == code && n.Gharardad.Contains("تولید"))
                        .Select(n => n)
                        .ToList();


                ASPxGridView1.DataSource = info1;
                ASPxGridView1.DataBind();


                var info2 =
                 db.tbSooratHesabs.Where(n => n.ProjectGharardad == code && n.Gharardad.Contains("پشتیبانی"))
                     .Select(n => n)
                     .ToList();



                ASPxGridView2.DataSource = info2;
                ASPxGridView2.DataBind();




                var info3 =
             db.tbSooratHesabs.Where(n => n.ProjectGharardad == code && n.Gharardad.Contains("الحاقیه"))
                 .Select(n => n)
                 .ToList();



                ASPxGridView3.DataSource = info3;
                ASPxGridView3.DataBind();

                var info4 =
            db.tbSooratHesabs.Where(n => n.ProjectGharardad == code && n.Gharardad.Contains("استرداد"))
                .Select(n => n)
                .ToList();



                ASPxGridView5.DataSource = info4;
                ASPxGridView5.DataBind();
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 1)
            {
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lb") as Label;

                try
                {
                    lb.Text = (e.VisibleIndex + 1).ToString();
                }
                catch { }
            }


            if (e.DataColumn.VisibleIndex == 5)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;
                int intid = Convert.ToInt32(hp.ToolTip);
                var pishnevis = db.tbSooratPishNevis.Where(n => n.pishProject == intid);
                if (pishnevis.Any())
                {
                    hp.Visible = false;
                }
            }
        }

        protected void ASPxGridView2_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 1)
            {
                Label lb = ASPxGridView2.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lb") as Label;
                try
                {
                    lb.Text = (e.VisibleIndex + 1).ToString();
                }
                catch { }
            }

            if (e.DataColumn.VisibleIndex == 5)
            {
                try
                {
                    HyperLink hp =
                        ASPxGridView2.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as
                            HyperLink;
                    int intid = Convert.ToInt32(hp.ToolTip);
                    var pishnevis = db.tbSooratPishNevis.Where(n => n.pishProject == intid);
                    if (pishnevis.Any())
                    {
                        hp.Visible = false;
                    }
                }
                catch { }
            }
        }

        protected void ASPxGridView3_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 1)
            {
                Label lb = ASPxGridView3.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lb") as Label;
                try
                {
                    lb.Text = (e.VisibleIndex + 1).ToString();
                }
                catch { }
            }


            if (e.DataColumn.VisibleIndex == 6)
            {
                try
                {
                    HyperLink hp =
                        ASPxGridView3.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as
                            HyperLink;
                    int intid = Convert.ToInt32(hp.ToolTip);
                    var pishnevis = db.tbSooratPishNevis.Where(n => n.pishProject == intid);
                    if (pishnevis.Any())
                    {
                        hp.Visible = false;
                    }
                }
                catch { }
            }
        }
        protected void ASPxGridView5_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.VisibleIndex == 1)
            {
                Label lb = ASPxGridView5.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lb") as Label;
                try
                {
                    lb.Text = (e.VisibleIndex + 1).ToString();
                }
                catch { }
            }


            if (e.DataColumn.VisibleIndex == 6)
            {
                try
                {
                    HyperLink hp =
                        ASPxGridView5.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as
                            HyperLink;
                    int intid = Convert.ToInt32(hp.ToolTip);
                    var pishnevis = db.tbSooratPishNevis.Where(n => n.pishProject == intid);
                    if (pishnevis.Any())
                    {
                        hp.Visible = false;
                    }
                }
                catch { }
            }
        }
        protected void ASPxGridView1_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                e.Text = CommonClass.NumberWithGroup(Convert.ToInt64(e.Text));
            }
            catch { }
        }

        protected void ASPxGridView2_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            try
            {
                e.Text = CommonClass.NumberWithGroup(Convert.ToInt64(e.Text));
            }
            catch { }
        }

        protected void ASPxGridView4_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {

        }

        protected void ASPxGridView4_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

                // DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                //if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                //{
                //  e.Visible = false;
                //}
            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                // DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                //if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                //{
                //  e.Visible = false;
                //}
            }

        }

        protected void ASPxGridView4_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 9)
            {

                ImageButton img = ASPxGridView4.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "ImageButton4") as ImageButton;

                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    img.Visible = false;
                }
                else
                {
                    img.Visible = true;
                }
            }





            if (e.DataColumn.VisibleIndex == 8)
            {
                HyperLink hp = ASPxGridView4.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink3") as HyperLink;

                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    hp.Visible = false;
                }
                else
                {
                    hp.Visible = true;
                }
            }
        }

      

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "ch")
            {
                int id = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var info1 = db.tbSooratHesabs.SingleOrDefault(n => n.id == id);
                info1.srCheck = true;
                db.SaveChanges();
              
            }
        }

        protected void ASPxGridView2_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "ch")
            {
                int id = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var info1 = db.tbSooratHesabs.SingleOrDefault(n => n.id == id);
                info1.srCheck = true;
                db.SaveChanges();
            }
        }

        protected void ASPxGridView3_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "ch")
            {
                int id = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var info1 = db.tbSooratHesabs.SingleOrDefault(n => n.id == id);
                info1.srCheck = true;
                db.SaveChanges();
            }
        }
        protected void ASPxGridView5_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "ch")
            {
                int id = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var info1 = db.tbSooratHesabs.SingleOrDefault(n => n.id == id);
                info1.srCheck = true;
                db.SaveChanges();
            }
        }
    }
}