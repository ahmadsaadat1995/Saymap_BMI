using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PagePg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "paDate")
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label2") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
            }
            catch { }




            try
            {
                if (e.DataColumn.VisibleIndex == 5)
                {
                    HyperLink hp =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;

                    HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;
                    int intId = Convert.ToInt32(hf.Value);
                    var info = db.tbPaperProjects.SingleOrDefault(n => n.paId == intId);

                    string fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + Path.GetExtension(info.paFilename);
                    FileStream file = new FileStream(Server.MapPath(@"~\content\images\documents\" + fileName), FileMode.CreateNew, FileAccess.ReadWrite, FileShare.ReadWrite);

                    file.Write(info.paFile, 0, info.paFile.Length);
                    file.Flush();
                    file.Close();

                    hp.NavigateUrl = @"~\content\images\documents\" + fileName;


                }
            }
            catch { }

        }
    }
}