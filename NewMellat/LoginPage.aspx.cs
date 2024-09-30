using System;
using System.DirectoryServices;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NewMellat
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Login"]))
                {
                    return;
                }
                //if (string.IsNullOrEmpty(Request.QueryString["Ticket"]))
                //{
                //    Response.Redirect("https://login.bankmellat.ir/ExternalServices/Sso/login/Login.aspx?ReturnUrl=http://" + Request.Url.Host + ":" + Request.Url.Port + "/LoginPage.aspx");
                //    return;
                //}
                SsoService.SsoClientWebService service = new SsoService.SsoClientWebService();
                string str = service.GetUsernameByTicket("pmparsU960509", "sIem3#93*_2s!as", Request.QueryString["Ticket"]);
                  SsoMapUser map = db.SsoMapUsers.Where(us => us.SsoLogin == str).FirstOrDefault();
                if (map != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(map.Loginname, false);
                }
                else
                {
                    Response.Redirect(@"~\content\PageDenied.aspx");
                }
                
            }
            catch(Exception ex)
            {
                Response.Redirect("https://login.bankmellat.ir/ExternalServices/Sso/login/Login.aspx?ReturnUrl=http://" + Request.Url.Host + ":" + Request.Url.Port + "/LoginPage.aspx");
            }

        }


        NewMellatEntities db=new NewMellatEntities();
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string strUser = txtUserName.Text;
            string str = SecurityClass.EncryptText(strUser);
            var info = db.tbAdmins.Where(n => n.adPersonCode == str);



               // کنترل امنیت
            if (info.Count() > 0)
            {

                //if (Membership.ValidateUser(txtUserName.Text, txtPass.Text))
                {
                   FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
                 }
                //else
                {
                    Label1.Text = "اطلاعات کاربری اشتباه می باشد";
                }
            }
            else
            {
                Label1.Text = "دسترسی شما به سامانه امکان پذیر نمی باشد";
            }


        }
    }
}