using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class pageFinalize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                int intId = Convert.ToInt32(Request.QueryString["id"]);
                var project = db.ProjectFinalizes.SingleOrDefault(n => n.ProjectId == intId);
                if (project != null)
                {
                    CheckBoxIsUsing.Checked = project.IsUsing;
                    TextBoxCount.Text = project.UserCount.ToString();
                    ASPxMemo1.Text = project.Desciption;
                }
            }
            
        }

        NewMellatEntities db=new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int intId = Convert.ToInt32(Request.QueryString["id"]);
            bool isNew = false;
            var project = db.ProjectFinalizes.SingleOrDefault(n => n.ProjectId == intId);

            if (project == null)
            {
                project = new ProjectFinalize();
                isNew = true;
            }


            project.IsUsing = CheckBoxIsUsing.Checked;
            project.UserCount = Convert.ToInt32(TextBoxCount.Text);
            project.Desciption = ASPxMemo1.Text;
            project.ProjectId = intId;

            if (isNew)
                db.ProjectFinalizes.Add(project);

            db.SaveChanges();
            Label1.Text = "اطلاعات با موفقیت به ثبت رسید";
        }
    }
}