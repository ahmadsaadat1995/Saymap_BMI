using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageDiagram2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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







                try
                {
                    Label lb = (Label)row.FindControl("Label7");
                    lb.Text =CommonClass.NumberWithGroup(long.Parse(lb.Text));
                }
                catch { }
            }

            int intCount = GridView1.Rows.Count;
            if (intCount > 0)
            {
                img1.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView2.Rows)
            {

                Label lb = (Label)row.FindControl("Label6");
                Label lb2 = (Label)row.FindControl("Label7");


                try
                {
                    int intId1 = int.Parse(lb.Text);
                    lb.Text = db.prInformations.SingleOrDefault(n => n.infId == intId1).infTitle;

                }
                catch
                {

                }


                try
                {

                    int intId2 = int.Parse(lb2.Text);
                    lb2.Text = db.prInformations.SingleOrDefault(n => n.infId == intId2).infTitle;
                }
                catch { }




                try
                {
                    Label lb9 = (Label)row.FindControl("Label9");
                    lb9.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb9.Text)).Simple;
                }
                catch { }

                Label lb8 = (Label)row.FindControl("Label8");
                lb8.Text = Persia.Number.ConvertToPersian(lb8.Text);


            }

            int intCount = GridView2.Rows.Count;
            if (intCount > 0)
            {
                img2.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        protected void GridView4_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView4.Rows)
            {
                Label lb = (Label)row.FindControl("Label7");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }

            int intCount = GridView4.Rows.Count;
            if (intCount > 0)
            {
                img4.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        protected void GridView5_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView5.Rows)
            {
                Label lb = (Label)row.FindControl("Label50");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }

            int intCount = GridView5.Rows.Count;
            if (intCount > 0)
            {
                img5.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }


        }

        protected void GridView6_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView6.Rows)
            {
                Label lb = (Label)row.FindControl("Label58");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }

            int intCount = GridView6.Rows.Count;
            if (intCount > 0)
            {
                img6.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        protected void GridView7_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView7.Rows)
            {
                Label lb = (Label)row.FindControl("Label58");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }

            int intCount = GridView7.Rows.Count;
            if (intCount > 0)
            {
                img7.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        protected void GridView3_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView3.Rows)
            {
                try
                {
                    Label lb = (Label)row.FindControl("Label30");
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }

                Label lb2 = (Label)row.FindControl("Label28");
                lb2.Text = Persia.Number.ConvertToPersian(lb2.Text);


            }

            int intCount = GridView3.Rows.Count;
            if (intCount > 0)
            {
                img3.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }

        }

        protected void GridView8_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView8.Rows)
            {
                Label lb = (Label)row.FindControl("Label73");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }

            int intCount = GridView8.Rows.Count;
            if (intCount > 0)
            {
                img8.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        protected void GridView11_DataBound(object sender, EventArgs e)
        {
            int intCount = GridView11.Rows.Count;
            if (intCount > 0)
            {
                img9.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
            foreach (GridViewRow row in GridView11.Rows)
            {
                try
                {
                    Label lb = (Label) row.FindControl("Label86");
                    lb.Text = CommonClass.NumberWithGroup(long.Parse(lb.Text));
                }
                catch
                {
                }
            }

        }

        protected void GridView9_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView9.Rows)
            {
                Label lb = (Label)row.FindControl("Label77");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }

            int intCount = GridView9.Rows.Count;
            if (intCount > 0)
            {
                img10.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }

        protected void GridView10_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView10.Rows)
            {
                Label lb = (Label)row.FindControl("Label81");

                try
                {
                    lb.Text = Persia.Calendar.ConvertToPersian(DateTime.Parse(lb.Text)).Simple;
                }
                catch { }
            }

            int intCount = GridView10.Rows.Count;
            if (intCount > 0)
            {
                img11.ImageUrl = @"~\content\images\icons\Button-Blank-Green-icon24.png";
            }
        }
    }
}