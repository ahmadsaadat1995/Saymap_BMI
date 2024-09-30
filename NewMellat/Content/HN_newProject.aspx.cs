using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using DocumentFormat.OpenXml.Packaging;

namespace NewMellat.Content
{
    public partial class HN_newProject : System.Web.UI.Page
    {
         class hnprDetails
        {
           public string prDetail;
           public string prRequire;
           public bool Raghib;
           public bool Chera1;
           public bool Chera2;
           public bool Chera3;
           public bool Chera4;
           public bool Hamposh;
           public string Hamposh1;
           public string Hamposh2;
           public string Hamposh3;
           public string Time;
           public string Noavary;
           public string Cost;
           public string Canal;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = Page.User.Identity.Name;
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, "pagenewproject.aspx"))//Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }


            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ثبت درخواست جدید";

            vahedDS.SelectParameters["prCode"].DefaultValue = userName;
            // sourceVahed2.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            peymankarDS.SelectParameters["prCode"].DefaultValue = userName;
            HF_CurrentUser.Value = userName;

        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            NewMellatEntities db = new NewMellatEntities();

            DataAccessBase da = new DataAccessBase();
            //   string rStart=riskStart.Text==""?"null":"'"+riskStart.Text+"'";
            //   string rEnd = riskEnd.Text == "" ? "null" : "'" + riskEnd.Text + "'";
            string CommitteeLetterDate = letterDate1.Text == "" ? "null" : "'" + letterDate1.Text + "'";
            //riskAgainst,riskTitle,riskStart,riskEnd,riskDesc
            //+ haveRisk.SelectedValue + ",N'" + riskTitle.Text + "'," 
            //            + rStart + "," + rEnd + ",N'" + riskDesc.Text + "',"
            int insertedId = Convert.ToInt32(da.ScalarTxt(@"INSERT INTO tbProjects (prTitle, prAct, prRegDate, prRegUser, prVahed,
              prProjectType, prSanadType, prOlaviat, prPeymankar, prStatus, prMainBody,TechnicalSuvisor,ServiceId,
              prReqType,prevContractNo,CommitteeLetterNo,CommitteeLetterDate,projectTeam,
              ApprovedDoc,prGoal,prDetails,prBenefit,prProjectStatus,prApprove,prRequire,stratgyGoal,projectRisk,matrix) 
             VALUES (N'" + prTitle.Text + "',1,'" + DateTime.Now + "','" + Page.User.Identity.Name + "'," + vahed.SelectedValue
                         + "," + prType.SelectedValue + "," + sanadType.SelectedValue + "," + olaviat.SelectedValue + ","
                         + peymankar.SelectedValue + ",0,N'" + prDetail.Text + "'," + nazer.SelectedValue + ",N'"
                         + ServiceCatalog.SelectedValue + "'," + reqType.SelectedValue + ",N'"
                         + prevContractNo.Text + "',N'" + letterShenase1.Text + "'," + CommitteeLetterDate + ",N'"
                         + hfTeam.Value + "',N'" + hfDoc.Value + "',N'" + prGoal.Text + "',N'" + hfDetails.Value
                         + "',N'" + hfBenefit.Value + "',N'در حال اجرا',N'" + hf_app.Value + "',N'"
                         + prRequire.Text + "'," + stratgyGoal.SelectedValue + ",N'" + HF_Risk.Value + "',N'" + hfMatrix.Value + "');SELECT SCOPE_IDENTITY();"));

            // update Item set finalCode
            var item = db.tbProjects.SingleOrDefault(n => n.prId == insertedId);
            item.prFinalCode = item.prPeymankar.ToString().PadLeft(3, '0') +
                  item.prVahed.ToString().PadLeft(3, '0') +
                  item.prProjectType.ToString().PadLeft(3, '0') +
                  item.prSanadType.ToString().PadLeft(3, '0') +
                  item.prId.ToString().PadLeft(4, '0');
            if (item.TechnicalSuvisor == -1)
                item.TechnicalSuvisor = null;
            db.SaveChanges();
            //add file

            foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;
                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = insertedId;
                newFile.fiTitle = prTitle.Text;
                newFile.fiType = 1;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }
            //add servis catalog


            string path = "D:\\Projects\\NewMellat\\letterTemplate\\";
            string destinationFile = path + "temp\\" + Guid.NewGuid().ToString() + ".docx";

            File.Copy(path + "serviceCatalog.docx", destinationFile);
            var param = new Dictionary<string, string>();
            //var d = JsonConvert.DeserializeObject<prDetails>(hfDetails.Value);
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            hnprDetails d = new hnprDetails();
            d = serializer.Deserialize<hnprDetails>(hfDetails.Value);
            
            param.Add("*0*", prTitle.Text);
            param.Add("*1*", prType.SelectedItem.Text);
            param.Add("*2*", vahed.SelectedItem.Text);
            param.Add("*3*", nazer.SelectedItem.Text);
            string rsk = "";
            if (int.Parse( HF_Risk_Value.Value)<=20)            
                rsk = "خیلی کم ";
            else if (int.Parse(HF_Risk_Value.Value) <= 40)
                rsk = " کم ";
            else if (int.Parse(HF_Risk_Value.Value) <= 60)
                rsk = "متوسط";
            else if (int.Parse(HF_Risk_Value.Value) <= 80)
                rsk = "زیاد";
            else if (int.Parse(HF_Risk_Value.Value) <= 100)
                rsk = "خیلی زیاد";

            param.Add("*4*", rsk);
            param.Add("*5*", prDetail.Text);
            param.Add("*6*", prRequire.Text);
            string time = d.Time == "1" ? "7*24" : d.Time == "2" ? "ساعت اداری" : "";
            param.Add("*7*", time);
            param.Add("*8*",d.Canal);
     

            using (WordprocessingDocument wordDoc = WordprocessingDocument.Open(destinationFile, true))
            {
                string docText = null;
                using (StreamReader sr = new StreamReader(wordDoc.MainDocumentPart.GetStream()))
                    docText = sr.ReadToEnd();

                foreach (var xx in param)
                {
                    docText = docText.Replace(xx.Key, xx.Value);
                }


                using (StreamWriter sw = new StreamWriter(wordDoc.MainDocumentPart.GetStream(FileMode.Create)))
                    sw.Write(docText);

            }

            tbFile newFile2 = new tbFile();
            newFile2.fiAct = 1;

            byte[] fileData2 = System.IO.File.ReadAllBytes(destinationFile);
           // file2.InputStream.Read(fileData2, 0, (int)file2.InputStream.Length);
            newFile2.fiData = fileData2;
            newFile2.fiDate = DateTime.Now;
            newFile2.fiExt = "serviceCatalog.docx";
            newFile2.fiParent = insertedId;
            newFile2.fiTitle = prTitle.Text + "-کاتالوگ";
            newFile2.fiType = 1;
            db.tbFiles.Add(newFile2);
            db.SaveChanges();
             
             File.Delete(destinationFile);
            //add letter
            var secondLetter = "";
            if (letterShenase1.Text != "")
            {
                secondLetter = @",('" + letterShenase1.Text + "','','" + letterDate1.Text + "'," + insertedId + ",1,11)";
            }
            da.NonQueryTxt(@"INSERT INTO [dbo].[tbProjectPaper] ([paShenase],[paNumber],[paDate],[paProject],[paAct],[paType])
                VALUES ('" + letterShenase.Text + "','" + letterNo.Text + "','" + letterDate.Text + "'," + insertedId + ",1,1)" + secondLetter);

            Response.Write("<script>alert('درخواست با موفقیت ثبت شد . ')</script>");
            Response.Redirect("http://172.22.65.16:1983/content/PageProjectList.aspx");
        }
    }
}