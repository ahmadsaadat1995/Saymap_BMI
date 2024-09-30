using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageEd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                ASPxTextBox txt = (ASPxTextBox)row.FindControl("ASPxTextBox1");
                ASPxTextBox txt2 = (ASPxTextBox)row.FindControl("ASPxTextBox2");
                ASPxComboBox drp1 = (ASPxComboBox)row.FindControl("ASPxComboBox1");
                ASPxComboBox drp2 = (ASPxComboBox)row.FindControl("ASPxComboBox3");
                ASPxComboBox drp3 = (ASPxComboBox)row.FindControl("ASPxComboBox5");
                ASPxComboBox drp4 = (ASPxComboBox)row.FindControl("ASPxComboBox2");


                string strCode = Request.QueryString["code"];
                var info = db.tbSooratHesabs.Where(n => n.ProjectGharardad == strCode);
                foreach (var item in info)
                {
                    int id = Convert.ToInt32(item.id);
                    var details = db.tbSooratHesabs.SingleOrDefault(n => n.id == id);
                    details.ProjectGharardad = txt2.Text;

                    try
                    {
                        details.CompanyName = drp3.Value.ToString();

                    }
                    catch { }


                    try
                    {
                        details.Nazer1 = drp1.Value.ToString();
                    }
                    catch { }


                    try
                    {
                        if (drp2.Value.ToString() == "0")
                            details.Nazer2 = null;
                        else 
                            details.Nazer2 = drp2.Value.ToString();
                    }
                    catch { }

                    try
                    {
                        details.GharardadType = drp4.Value.ToString();
                    }
                    catch { }



                    details.ProjectName = txt.Text;
                }
                db.SaveChanges();


            }
            Label6.Text = "تغییرات با موفقیت به ثبت رسید";
            GridView1.DataBind();

        }
    }
}