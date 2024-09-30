using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageGharardadCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar pCal = new PersianCalendar();
                int year = pCal.GetYear(DateTime.Now);
                for (int i = 1385; i <= year; i++)
                {
                    ASPxComboBox1.Items.Add(new ListEditItem(i.ToString().Remove(0, 2), i.ToString().Remove(0, 2)));
                }

                ASPxComboBox2.SelectedIndex = 0;



                int intId = Convert.ToInt32(Request.QueryString["id"]);


                var info = db.tbGharardads.FirstOrDefault(n => n.ghId == intId);
                try
                {
                    txtG.Text = info.ghCode.Split('-')[1];
                    ASPxComboBox1.Value = info.ghCode.Split('-')[0];
                }
                catch { }

            }
        }

        NewMellatEntities db = new NewMellatEntities();



        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int intThId = Convert.ToInt32(Request.QueryString["thId"]);
            int intId = Convert.ToInt32(Request.QueryString["id"]);

            var tarh = db.tbTarhPishnehadis.SingleOrDefault(n => n.thId == intThId);

            tarh.gPricePosh = txtPoshPrice.Text;
            tarh.gPriceTolid = txtTolidPrice.Text;
            if (!string.IsNullOrEmpty(ASPxTextBoxSecurity.Text))
                tarh.PriceSecurity = Convert.ToDecimal(ASPxTextBoxSecurity.Text);
            tarh.gType = ASPxComboBox2.Value.ToString();


            if (!string.IsNullOrEmpty(txtG.Text))
            {
                var info = db.tbGharardads.FirstOrDefault(n => n.ghId == intId);
                info.ghCode = ASPxComboBox1.Value + "-" + txtG.Text;
            }

            db.SaveChanges();
            Label1.Text = "تغییرات با موفقیت به ثبت رسید";
        }
    }
}