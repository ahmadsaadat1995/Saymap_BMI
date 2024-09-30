using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageDt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void ASPxGridView1_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                ASPxGridView1.Visible = true;
                Label1.Visible = false;

            }
            else
            {
                ASPxGridView1.Visible = false;

            }
        }

        protected void ASPxGridView2_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                ASPxGridView2.Visible = true;
                Label1.Visible = false;

            }
            else
            {
                ASPxGridView2.Visible = false;

            }
        }

        protected void ASPxGridView3_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                ASPxGridView3.Visible = true;
                Label1.Visible = false;
            }
            else
            {
                ASPxGridView3.Visible = false;

            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.VisibleIndex == 12)
                {
                    HyperLink hp =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;

                    HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;
                    int intId = Convert.ToInt32(hf.Value);
                    var info = db.tbIndex1.SingleOrDefault(n => n.inId == intId);

                    string fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + Path.GetExtension(info.inFileName);
                    FileStream file = new FileStream(Server.MapPath(@"~\content\images\documents\" + fileName), FileMode.CreateNew, FileAccess.ReadWrite, FileShare.ReadWrite);

                    file.Write(info.inFile, 0, info.inFile.Length);
                    file.Flush();
                    file.Close();

                    hp.NavigateUrl = @"~\content\images\documents\" + fileName;


                }
            }
            catch { }

        }
    }
}