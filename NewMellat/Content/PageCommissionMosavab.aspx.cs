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
    public partial class PageCommiossionMosavab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                //for (int i = 0; i <= 100; i++)
                //{
                //    drpYear2.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                //    drpYear3.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                //}


                //for (int i = 0; i <= 30; i++)
                //{
                //    drpMonth2.Items.Add(new ListEditItem(i.ToString(), i.ToString()));
                //    drpMonth3.Items.Add(new ListEditItem(i.ToString(), i.ToString()));

                //}
                //PersianCalendar1.Date = DateTime.Now;

                //drpMonth2.SelectedIndex = 0;
                //drpYear2.SelectedIndex = 0;

                //drpMonth3.SelectedIndex = 0;
                //drpYear3.SelectedIndex = 0;
            }




        }


        protected void drpMonth2_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            //sb.Append(drpYear2.Value);
            //sb.Append(" ماه و ");
            //sb.Append(drpMonth2.Value);
            //sb.Append(" روز ");
            //Label23.Text = sb.ToString();
        }

        protected void drpYear2_SelectedIndexChanged(object sender, EventArgs e)
        {

            StringBuilder sb = new StringBuilder();

            //sb.Append(drpYear2.Value);
            //sb.Append(" ماه و ");
            //sb.Append(drpMonth2.Value);
            //sb.Append(" روز ");
            //Label23.Text = sb.ToString();

        }

        protected void drpMonth3_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            //sb.Append(drpYear3.Value);
            //sb.Append(" ماه و ");
            //sb.Append(drpMonth3.Value);
            //sb.Append(" روز ");
            //Label24.Text = sb.ToString();
        }

        protected void drpYear3_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            //sb.Append(drpYear3.Value);
            //sb.Append(" ماه و ");
            //sb.Append(drpMonth3.Value);
            //sb.Append(" روز ");
            //Label24.Text = sb.ToString();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            int intId = Convert.ToInt32(Request.QueryString["id"]);

            var commission = db.Commissions.SingleOrDefault(n => n.ID == intId);
            //commission.DurationTolid = drpYear2.Value + "," + drpMonth2.Value;
            //commission.DurationPosh = drpYear3.Value + "," + drpMonth3.Value;

            //commission.PriceTolid = string.IsNullOrEmpty(txtPriceTolid.Text) ? 0 : Convert.ToInt32(txtPriceTolid.Text);
            //commission.PricePosh = string.IsNullOrEmpty(txtPricePosh.Text) ? 0 : Convert.ToInt32(txtPricePosh.Text);

            //commission.GharardadType = Convert.ToInt32(drpGharardad.Value);
            //commission.GharardadType = Convert.ToInt32(drpVahed.Value);
          
            //-------- نامه ها با نوع 60 ثبت می شود


            // ثبت در جدول قرارداد
            tbGharardad gharardad = new tbGharardad();
            gharardad.ghAct = 1;
            gharardad.ghBody = "";
            gharardad.ProposalId = commission.ProposalId;
            gharardad.IsElhaghie = db.tbTarhPishnehadis.SingleOrDefault(n => n.thId == commission.ProposalId).thIsElhaghie;
            gharardad.ghProject = commission.ProjectId;
            
            db.tbGharardads.Add(gharardad);

            commission.Act = -1;
            commission.Vaziat = "تایید";
            db.SaveChanges();
            
            sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePaper.Insert();

            

            RadNotification1.Show("نتیجه کمیسیون با موفقیت ثبت گردید");

        }
        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            int intId = Convert.ToInt32(Request.QueryString["id"]);
            var commission = db.Commissions.SingleOrDefault(n => n.ID == intId);

            commission.Vaziat = "رد";
            db.SaveChanges();
            sourcePaper.InsertParameters["paDate"].DefaultValue = PersianCalendar1.Date.ToShortDateString();
            sourcePaper.Insert();



            RadNotification1.Show("نتیجه کمیسیون با موفقیت ثبت گردید");
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