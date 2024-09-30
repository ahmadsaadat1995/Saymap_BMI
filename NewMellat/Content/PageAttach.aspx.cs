using DataAccessLayer;
using DocumentFormat.OpenXml.Packaging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageAttach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if ( Request.QueryString["tyExt"] != null)
                {
                    string extra = Request.QueryString["tyExt"].ToString();
                    string type = Request.QueryString["Type"].ToString();
                    string s = sourceFiles.SelectCommand;
                    sourceFiles.SelectCommand = s.Replace("=@fiType", string.Format(@" in ({0},{1})",type,extra));

                   // sourceFiles.Update();
                }
            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

            try
            {
                if (e.DataColumn.FieldName == "fiDate")
                {
                    Label lb =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label3") as Label;
                    lb.Text = CommonClass.ShamsiDate(Convert.ToDateTime(lb.Text)).Insert(4, "/").Insert(7, "/");
                }
            }
            catch { }


            try
            {
                if (e.DataColumn.VisibleIndex == 4)
                {
                    HyperLink hp =
                        ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink1") as HyperLink;

                    HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;
                    int intId = Convert.ToInt32(hf.Value);
                    var info = db.tbFiles.SingleOrDefault(n => n.fiId == intId);

                    string fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + Path.GetExtension(info.fiExt);
                    FileStream file = new FileStream(Server.MapPath(@"~\content\images\documents\" + fileName), FileMode.CreateNew, FileAccess.ReadWrite, FileShare.ReadWrite);

                    file.Write(info.fiData, 0, info.fiData.Length);
                    file.Flush();
                    file.Close();

                    hp.NavigateUrl = @"~\content\images\documents\" + fileName;


                }
            }
            catch { }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            // sourceFiles.InsertParameters["fiDate"].DefaultValue = DateTime.Now.ToShortDateString();
            sourceFiles.Insert();

            ASPxGridView1.DataBind();
            RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");

        }
        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            string tTable = @" <w:tbl>
         <w:tblPr>
            <w:tblpPr w:leftFromText=""180"" w:rightFromText=""180"" w:vertAnchor=""text"" w:tblpXSpec=""center"" w:tblpY=""1"" />
            <w:tblOverlap w:val=""never"" />
            <w:bidiVisual />
            <w:tblW w:w=""10020"" w:type=""dxa"" />
            <w:jc w:val=""center"" />
            <w:tblCellMar>
               <w:left w:w=""0"" w:type=""dxa"" />
               <w:right w:w=""0"" w:type=""dxa"" />
            </w:tblCellMar>
            <w:tblLook w:val=""0420"" w:firstRow=""1"" w:lastRow=""0"" w:firstColumn=""0"" w:lastColumn=""0"" w:noHBand=""0"" w:noVBand=""1"" />
         </w:tblPr>
         <w:tblGrid>
            <w:gridCol w:w=""2082"" />
            <w:gridCol w:w=""1938"" />
            <w:gridCol w:w=""2100"" />
            <w:gridCol w:w=""3900"" />
         </w:tblGrid>";
            var guid = Guid.NewGuid().ToString();
            string id = Request.QueryString["Parent"].ToString(); // "9875";
            DataAccessBase db = new DataAccessBase();
            DataTable dt = db.ReaderText(@"select p.* ,i1.infTitle as vahed,i2.infTitle as Peymankar,i3.infTitle as SanadType,i4.infTitle as prType
from  tbProjects as p left join prInformation as i1 on p.prVahed=i1.infId
					  left join prInformation as i2 on p.prPeymankar=i2.infId
					  left join prInformation as i3 on p.prSanadType=i3.infId
					  left join prInformation as i4 on p.prProjectType=i4.infId
                                            where prid=" + id);

            var row = dt.Rows[0];
            var dic = new Dictionary<string, string>();
            dic.Add("*0*", row["prTitle"].ToString());
            dic.Add("*1*", row["vahed"].ToString());
            dic.Add("*2*", row["Peymankar"].ToString());
            dic.Add("*3*", row["prType"].ToString());
            dic.Add("*4*", row["SanadType"].ToString());
            string prevContractNo = row["SanadType"] != null ? "شماره قرارداد قبلی : " + row["prevContractNo"].ToString() : "";
            dic.Add("*5*", prevContractNo);

            dynamic app = JsonConvert.DeserializeObject(row["prApprove"].ToString());
            string appStr = "";
            if (app != null)
                for (int i = 0; i < app.Count; i++)
                {
                    appStr += string.Format(@" \n {0}  شماره نامه : {1}  تاریخ نامه {2}", app[i].dep, app[i].letterNo, app[i].letterDate);
                }
            dic.Add("*6*", appStr);

            string tbl1 = tTable;
            string[] cols = { "نقش", "نام و نام خانوادگی", "نام واحد", "تلفن ", " نشانی پست الکترونیک" };
            tbl1 += createRow(cols, 0);
            dynamic arr1 = JsonConvert.DeserializeObject(row["projectTeam"].ToString());
            if (arr1 != null)
                for (int i = 0; i < arr1.Count; i++)
                {
                    string[] colsx = new string[5];
                    colsx[0] = arr1[i].role;
                    colsx[1] = arr1[i].name;
                    colsx[2] = arr1[i].vahed;
                    colsx[3] = arr1[i].tell;
                    colsx[4] = arr1[i].email;
                    tbl1 += createRow(colsx, i % 2 == 0 ? 1 : 2);

                }
            tbl1 += " </w:tbl>";

            dic.Add("*7*", tbl1);

            string tbl2 = tTable;
            string[] cols2 = { "نقش", "نام و نام خانوادگی", "سمت", "تاریخ ", " امضا" };
            tbl2 += createRow(cols2, 0);
            dynamic arr2 = JsonConvert.DeserializeObject(row["ApprovedDoc"].ToString());
            if (arr2 != null)
                for (int i = 0; i < arr2.Count; i++)
                {
                    string[] colsx = new string[5];
                    colsx[0] = arr2[i].role;
                    colsx[1] = arr2[i].name;
                    colsx[2] = arr2[i].position;
                    colsx[3] = arr2[i].date;
                    colsx[4] = "";
                    tbl2 += createRow(colsx, i % 2 == 0 ? 1 : 2);

                }
            tbl2 += " </w:tbl>";
            dic.Add("*8*", tbl2);
            dynamic dtl = JsonConvert.DeserializeObject(row["prDetails"].ToString());

            dic.Add("*9*", dtl != null ? dtl.prDetail.Value : "");
            dic.Add("*10*", dtl != null ? row["prGoal"].ToString() : "");
            dic.Add("*11*", dtl != null ? dtl.prRequire.Value : "");


            dic.Add("*12*", dtl != null ? dtl.Raghib == true ? "دارد" : "ندارد" : "");
            dic.Add("*13*", dtl != null && dtl.Raghib == true ? dtl.RaghibDesc.Value : "");
            dic.Add("*14*", dtl != null ? dtl.Chera1 == true ? "دارد" : "ندارد" : "");
            dic.Add("*15*", dtl != null && dtl.Chera1 == true ? dtl.Chera1Desc.Value : "");
            dic.Add("*16*", dtl != null ? dtl.Chera2 == true ? "دارد" : "ندارد" : "");
            dic.Add("*17*", dtl != null && dtl.Chera2 == true ? dtl.Chera2Desc.Value : "");
            dic.Add("*18*", dtl != null ? dtl.Chera3 == true ? "دارد" : "ندارد" : "");
            dic.Add("*19*", dtl != null && dtl.Chera3 == true ? dtl.Chera3Desc.Value : "");
            dic.Add("*20*", dtl != null ? dtl.Chera4 == true ? "دارد" : "ندارد" : "");
            dic.Add("*21*", dtl != null && dtl.Chera4 == true ? dtl.Chera4Desc.Value : "");

            dic.Add("*24*", dtl != null && dtl.Hamposh == true ? "دارد" : "ندارد");
            dic.Add("*25*", dtl != null ? dtl.Hamposh1.Value : "");
            dic.Add("*26*", dtl != null ? dtl.Hamposh2.Value : "");
            dic.Add("*27*", dtl != null ? dtl.Hamposh3.Value : "");


            dynamic bnf = JsonConvert.DeserializeObject(row["prBenefit"].ToString());
            string bnf1 = "";
            string bnf2 = "";
            if (bnf != null)
            {
                if (bnf.Mali1 == true)
                    bnf1 += "سودآوری ، ";
                if (bnf.Mali2 == true)
                    bnf1 += "کاهش هزینه ها ، ";
                if (bnf.Mali3 == true)
                    bnf1 += "ایجاد ارزش افزوده ، ";
                if (bnf.Mali4 == true)
                    bnf1 += "حفط و جذب منابع ، ";
                if (bnf.Mali5 == true)
                    bnf1 += " کاهش مطالبات ، ";
                if (bnf1.Length > 0)
                    bnf1 = bnf1.Remove(bnf1.Length - 2);



                
                if (bnf.NoMali1 == true)
                    bnf2 += "خلق ارزش برای مشتری ، ";
                if (bnf.NoMali2 == true)
                    bnf2 += "خلق ارزش برای بانک ، ";
                if (bnf.NoMali3 == true)
                    bnf2 += "ایجاد فرصت رقابتی ، ";
                if (bnf.NoMali4 == true)
                    bnf2 += "بهبود فرآیند داخلی ، ";
                if (bnf.NoMali5 == true)
                    bnf2 += "تکمیل سبد محصول ، ";
                if (bnf.NoMali6 == true)
                    bnf2 += "جذب مشتریان جدید ، ";
                if (bnf2.Length > 0)
                    bnf2 = bnf2.Remove(bnf2.Length - 2);
            }
            dic.Add("*22*", bnf1);
            dic.Add("*23*", bnf2);

            string path = "D:\\Projects\\NewMellat\\letterTemplate\\";
            string destinationFile = path + "temp\\" + guid + ".docx";
            File.Copy(path + "formNo1.docx", destinationFile);


            using (WordprocessingDocument wordDoc = WordprocessingDocument.Open(destinationFile, true))
            {
                string docText = null;
                using (StreamReader sr = new StreamReader(wordDoc.MainDocumentPart.GetStream()))
                    docText = sr.ReadToEnd();

                foreach (var item in dic)
                {
                    docText = docText.Replace(item.Key, item.Value);
                }


                using (StreamWriter sw = new StreamWriter(wordDoc.MainDocumentPart.GetStream(FileMode.Create)))
                    sw.Write(docText);
            }
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment; filename= سند چشم انداز.docx");
            Response.TransmitFile(destinationFile);
            Response.End();
        }



        private string createRow(string[] col, int rowType)
        {
            string[] colors = { "C0504D", "E8D0D0", "F4E9E9" };
            string str = @"<w:tr w:rsidR=""00B507F6"" w:rsidRPr=""003016DA"" w:rsidTr=""00D5773A"">
            <w:trPr>
               <w:trHeight w:val=""545"" />
               <w:jc w:val=""center"" />
            </w:trPr>";

            for (int i = 0; i < col.Length; i++)
            {
                str += string.Format(@"<w:tc>
               <w:tcPr>
                  <w:tcW w:w=""2082"" w:type=""dxa"" />
                  <w:tcBorders>
                     <w:top w:val=""single"" w:sz=""24"" w:space=""0"" w:color=""FFFFFF"" />
                     <w:left w:val=""single"" w:sz=""8"" w:space=""0"" w:color=""FFFFFF"" />
                     <w:bottom w:val=""single"" w:sz=""8"" w:space=""0"" w:color=""FFFFFF"" />
                     <w:right w:val=""single"" w:sz=""8"" w:space=""0"" w:color=""FFFFFF"" />
                  </w:tcBorders>
                  <w:shd w:val=""clear"" w:color=""auto"" w:fill=""{0}"" />
                  <w:tcMar>
                     <w:top w:w=""72"" w:type=""dxa"" />
                     <w:left w:w=""144"" w:type=""dxa"" />
                     <w:bottom w:w=""72"" w:type=""dxa"" />
                     <w:right w:w=""144"" w:type=""dxa"" />
                  </w:tcMar>
                  <w:vAlign w:val=""center"" />
                  <w:hideMark />
               </w:tcPr>
               <w:p w:rsidR=""00B507F6"" w:rsidRPr=""003016DA"" w:rsidRDefault=""00B507F6"" w:rsidP=""00D5773A"">
                  <w:pPr>
                     <w:spacing w:after=""0"" />
                     <w:jc w:val=""center"" />
                     <w:rPr>
                        <w:rFonts w:cs=""B Yekan"" w:hint=""cs"" />
                        <w:rtl />
                     </w:rPr>
                  </w:pPr>
                  <w:r>
                     <w:rPr>
                        <w:rFonts w:cs=""B Yekan"" w:hint=""cs"" />
                        <w:rtl />
                     </w:rPr>
                     <w:t>{1}</w:t>
                  </w:r>
               </w:p>
            </w:tc>", colors[rowType], col[i]);
            }
            str += " </w:tr>";
            return str;
        }

    }
}