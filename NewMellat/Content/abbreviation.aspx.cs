using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class abbreviation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "حروف اختصاری";
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            sourcePages.Insert();
        }
    }
}