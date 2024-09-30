using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat
{
    public partial class PageUserSso : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Text = Request["UserName"];
            if (!IsPostBack)
            {
                NewMellatEntities db = new NewMellatEntities();
                var item = (from a in db.SsoMapUsers where a.Loginname == Label4.Text select a).FirstOrDefault();
                if (item != null)
                {
                    textBoxSso.Text = item.SsoLogin;

                }
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxSso.Text))
            {
                return;
            }
            NewMellatEntities db = new NewMellatEntities();
            var item = (from a in db.SsoMapUsers where a.Loginname == Label4.Text select a).FirstOrDefault();
            if (item != null)
            {
                item.SsoLogin = textBoxSso.Text;


            }
            else
            {
                db.SsoMapUsers.Add(new SsoMapUser { Loginname = Label4.Text, SsoLogin = textBoxSso.Text });

            }
            db.SaveChanges();

            var useDep = (from a in db.tbUserDepartments where a.userName == Label4.Text select a).FirstOrDefault();
            if (useDep != null)
                useDep.departId = int.Parse(cmbDepartment.SelectedItem.Value.ToString());
            else
            {
                db.Database.ExecuteSqlCommand(@"SET IDENTITY_INSERT [dbo].[tbUserDepartment] ON");
                db.tbUserDepartments.Add(new tbUserDepartment { userName = Label4.Text, departId = int.Parse(cmbDepartment.SelectedItem.Value.ToString()) });

              
            }
            db.SaveChanges();
            db.Database.ExecuteSqlCommand(@"SET IDENTITY_INSERT [dbo].[tbUserDepartment] OFF");
           // db.SaveChanges();




            Label1.Text = "تغییرات با موفقیت به ثبت رسید";


        }
    }
}