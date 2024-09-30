using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageHeyatNezaratMosavab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                for (int i = 0; i <= 100; i++)
                {
                    drpYear2.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpYear3.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                }


                for (int i = 0; i <= 30; i++)
                {
                    drpMonth2.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                    drpMonth3.Items.Add(new ListEditItem(i.ToString(), i.ToString()));

                }
                PersianCalendar1.Date = DateTime.Now;

                drpMonth2.SelectedIndex = 0;
                drpYear2.SelectedIndex = 0;

                drpMonth3.SelectedIndex = 0;
                drpYear3.SelectedIndex = 0;
            }




        }


        protected void drpMonth2_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear2.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth2.Value);
            sb.Append(" روز ");
            Label23.Text = sb.ToString();
        }

        protected void drpYear2_SelectedIndexChanged(object sender, EventArgs e)
        {

            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear2.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth2.Value);
            sb.Append(" روز ");
            Label23.Text = sb.ToString();

        }

        protected void drpMonth3_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear3.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth3.Value);
            sb.Append(" روز ");
            Label24.Text = sb.ToString();
        }

        protected void drpYear3_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(drpYear3.Value);
            sb.Append(" ماه و ");
            sb.Append(drpMonth3.Value);
            sb.Append(" روز ");
            Label24.Text = sb.ToString();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            sourceNezaratMosavab.InsertParameters["hmDateTolid"].DefaultValue = drpYear2.Value + "," + drpMonth2.Value;
            sourceNezaratMosavab.InsertParameters["hmDatePosh"].DefaultValue = drpYear3.Value + "," + drpMonth3.Value;
            int intId = Convert.ToInt32(Request.QueryString["id"]);
            var heyat = db.tbHeyatNezarats.SingleOrDefault(n => n.heId == intId);

            var tarh = db.tbTarhPishnehadis.SingleOrDefault(n => n.thId == heyat.ProposalId);
            if (tarh != null)
                tarh.NezaratMosavab = true;

            sourceNezaratMosavab.InsertParameters["hmMainProjectId"].DefaultValue = heyat.heProject.Value.ToString();

            sourceNezaratMosavab.Insert();

            //-------- نامه ها با نوع 60 ثبت می شود


            // ثبت در جدول قرارداد
            //tbGharardad gharardad = new tbGharardad();
            //gharardad.ghAct = 1;
            //gharardad.ghBody = "";
            //gharardad.ProposalId = heyat.ProposalId;
            //gharardad.ghProject = heyat.heProject;
            //db.tbGharardads.Add(gharardad);

            heyat.heAct = -1;

            db.SaveChanges();

            sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePaper.Insert();

            ASPxGridView1.DataBind();

            RadNotification1.Show("طرح پیشنهادی جدید با موفقیت به ثبت رسید");

        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Label29.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(10)).Simple;
        }

        protected void sourceNezaratMosavab_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@hmId"].Value;
            HiddenField1.Value = intId.ToString();
        }







    }
}