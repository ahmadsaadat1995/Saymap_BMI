using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageDiagram : System.Web.UI.Page
    {
        int lastState = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                lastState = Convert.ToInt32(HiddenFieldLastState.Value);
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                try
                {
                    Label lb = (Label)row.FindControl("Label9");
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }

                Label lb2 = (Label)row.FindControl("Label8");
                lb2.Text = Persia.Number.ConvertToPersian(lb2.Text);
            }

            int intCount = GridView1.Rows.Count;
            if (intCount > 0)
            {
                img1.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        protected void GridView3_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView3.Rows)
            {
                Label lb1 = (Label)row.FindControl("Label28");
                Label lb2 = (Label)row.FindControl("Label34");
                Label lb3 = (Label)row.FindControl("Label30");
                Label lb4 = (Label)row.FindControl("Label32");


                try
                {
                    lb3.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb3.Text)).Simple;
                }
                catch { }

                try
                {
                    lb4.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb4.Text)).Simple;
                }
                catch { }
                try
                {
                    int int1 = Convert.ToInt32(lb1.Text);

                    lb1.Text = db.prInformations.SingleOrDefault(n => n.infId == int1).infTitle;

                }
                catch (Exception)
                {
                }


                try
                {
                    int intId = Convert.ToInt32(Request.QueryString["id"]);
                    var vahed = db.tbProjects.SingleOrDefault(n => n.prId == intId).prVahed;
                    lb2.Text = db.prInformations.SingleOrDefault(n => n.infId == vahed).infTitle;

                }
                catch (Exception)
                {
                }

            }

            int intCount = GridView3.Rows.Count;
            if (intCount > 0)
            {
                img3.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 3)
                {
                    lastState = 3;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }


        }

        NewMellatEntities db = new NewMellatEntities();

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView2.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label20");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }


            int intCount = GridView2.Rows.Count;
            if (intCount > 0)
            {
                img2.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 2)
                {
                    lastState = 2;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }


        }

        protected void GridView4_DataBound(object sender, EventArgs e)
        {
            int intCount = GridView4.Rows.Count;
            if (intCount > 0)
            {
                img4.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 4)
                {
                    lastState = 4;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }
        }

        protected void GridView5_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView5.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label50");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }

            int intCount = GridView5.Rows.Count;
            if (intCount > 0)
            {
                img5.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 5)
                {
                    lastState = 5;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }

        }

        protected void GridView6_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView6.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label58");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }

            int intCount = GridView6.Rows.Count;
            if (intCount > 0)
            {
                img6.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 6)
                {
                    lastState = 6;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }

        }
        protected void GridView16_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView16.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label119");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }

            int intCount = GridView16.Rows.Count;
            if (intCount > 0)
            {
                img14.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                
            }

        }
        protected void GridView15_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView15.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label114");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }

            int intCount = GridView15.Rows.Count;
            if (intCount > 0)
            {
                img13.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";

            }

        }
        protected void GridView7_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView7.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label66");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }

            int intCount = GridView7.Rows.Count;
            if (intCount > 0)
            {
                
                img7.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 7)
                {
                    lastState = 7;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }
        }

        protected void GridView8_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView8.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label74");
                    if (lb1.Text == "1")
                    {
                        lb1.Text = "مصوب";
                    }
                    else if (lb1.Text == "2")
                    {
                        lb1.Text = "رد";
                    }
                    else if (lb1.Text == "3")
                    {
                        lb1.Text = "توقف";
                    }
                }
                catch
                {

                }
            }

            int intCount = GridView8.Rows.Count;
            if (intCount > 0)
            {
                img8.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 8)
                {
                    lastState = 8;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }
        }

        protected void GridView9_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView9.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label82");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }
            int intCount = GridView9.Rows.Count;
            if (intCount > 0)
            {
                img9.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 10)
                {
                    lastState = 10;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }

        }

        protected void GridView12_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView12.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label102");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }

            int intCount = GridView12.Rows.Count;
            if (intCount > 0)
            {
                img10.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 11)
                {
                    lastState = 11;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }
        }

        protected void GridView11_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView11.Rows)
            {


            }

            int intCount = GridView11.Rows.Count;
            if (intCount > 0)
            {
                img11.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 12)
                {
                    lastState = 12;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }
        }
        protected void GridView14_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView14.Rows)
            {

                try
                {
                    Label lb1 = (Label)row.FindControl("Label109");
                    lb1.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb1.Text)).Simple;

                }
                catch
                {

                }
            }

            int intCount = GridView11.Rows.Count;
            if (intCount > 0)
            {
                img12.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
                if (lastState < 9)
                {
                    lastState = 9;
                    HiddenFieldLastState.Value = lastState.ToString();
                }
            }
        }

        protected void img2_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 2)
                return;
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;
            
            Source2.Update();
            lastState = 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img3_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 3)
                return;
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            source3.Update();
            lastState =lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img4_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 4)
                return;

            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            Source4.Update();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img8_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 8)
                return;
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            s8.Delete();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img7_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 7)
                return;

            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            s7.Update();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img6_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 6)
                return;
             if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            Source6.Update();
            Source6.Delete();
            Source6.Insert();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        
        }

        protected void img5_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 5)
                return;

            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            Source5.Update();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img12_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 9)
                return;
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            Source11.Delete();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img9_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 10)
                return;
            
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            Source7.Update();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }


        protected void img10_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 11)
                return;

            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            Source8.Update();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }

        protected void img11_Click(object sender, ImageClickEventArgs e)
        {
            if (lastState != 12)
                return;

            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
                return;

            Source9.Update();
            lastState = lastState - 1;
            HiddenFieldLastState.Value = lastState.ToString();
        }
    }
}