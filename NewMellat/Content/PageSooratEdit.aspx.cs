using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageSooratEdit : System.Web.UI.Page
    {

        NewMellatEntities db = new NewMellatEntities();


        protected void Page_Load(object sender, EventArgs e)
        {
            string strId = Request.QueryString["id"];

            var info = db.tbSooratHesabs.FirstOrDefault(n => n.ProjectGharardad == strId);
            SqlDataSource1.InsertParameters["ProjectName"].DefaultValue = info.ProjectName;

          
            

        }

        protected void ASPxGridView1_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridViewEditFormEventArgs e)
        {

        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

        }

        protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {

        }

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {

        }

        protected void ASPxGridView1_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            long l = 0;
            e.Errors.Clear();
            e.RowError = "";
            if (!long.TryParse((e.NewValues[3] ?? "0").ToString(), out l))
            {
                e.RowError = "مبلغ را عدد وارد کنید";
            }

        }
    }
}