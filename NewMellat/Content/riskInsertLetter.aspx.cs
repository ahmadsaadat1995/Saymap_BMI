using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class riskInsertLetter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                letterDate.Date = DateTime.Now;
            }
        }
        DataAccessBase da = new DataAccessBase();
        NewMellatEntities db = new NewMellatEntities();
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string projectId = Request.QueryString["project"].ToString();
            string type = Request.QueryString["type"].ToString();
            foreach (Telerik.Web.UI.UploadedFile file in letterFile.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;
                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = int.Parse(projectId);
                newFile.fiTitle = letterNo.Text + "-" + letterShenase.Text;
                newFile.fiType = 21 + int.Parse(type);
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }

            //add letter

            da.NonQueryTxt(@"INSERT INTO [dbo].[tbProjectPaper] ([paShenase],[paNumber],[paDate],[paProject],[paAct],[paType])
                VALUES ('" + letterShenase.Text + "','" + letterNo.Text + "','" + letterDate.Text + "'," + projectId + ",1,20" + type + ")");
            if (type == "8")
                type = "1";
            da.NonQueryTxt(@"UPDATE [dbo].[risk_form1] set [status]=" + type + " where projectId=" + projectId);
            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");

         //   Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}