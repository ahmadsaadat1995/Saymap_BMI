using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class pageBody : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                int intId = Convert.ToInt32(Request.QueryString["id"]);
                var project = db.tbProjects.SingleOrDefault(n => n.prId == intId);
                ASPxMemo1.Text = project.prBody;
            }
            
        }

        NewMellatEntities db=new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int intId = Convert.ToInt32(Request.QueryString["id"]);
            var project = db.tbProjects.SingleOrDefault(n => n.prId == intId);
            project.prBody = ASPxMemo1.Text;
            db.SaveChanges();
            Label1.Text = "اطلاعات با موفقیت به ثبت رسید";
        }
    }
}