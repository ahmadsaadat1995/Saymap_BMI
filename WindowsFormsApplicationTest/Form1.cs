using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using OfficeAutomationServiceClient;
using OfficeAutomationServiceClient.LetterServiceProxy;
using OfficeAutomationServiceClient.ListProviderServiceProxy;
using System.Text.RegularExpressions;
using NewMellat.gam;
using System.IO;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using Newtonsoft.Json;



namespace WindowsFormsApplicationTest
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }



        private void button1_Click(object sender, EventArgs e)
        {
            var guid = Guid.NewGuid().ToString();
            string id = "9870";
            DataAccessBase db = new DataAccessBase();
            DataTable dt = db.ReaderText(@"select p.* ,i1.infTitle as vahed,i2.infTitle as Peymankar,i3.infTitle as SanadType
from  tbProjects as p left join prInformation as i1 on p.prVahed=i1.infId
					  left join prInformation as i2 on p.prPeymankar=i2.infId
					  left join prInformation as i3 on p.prSanadType=i3.infId
                                            where prid=" + id);
            if (dt.Rows.Count < 1)
            {
                MessageBox.Show("آیتمی وجود ندارد");
                return;
            }
            else
            {
                var row = dt.Rows[0];
                var dic = new Dictionary<string, string>();
                dic.Add("*0*", row["prTitle"].ToString());
                dic.Add("*1*", row["vahed"].ToString());
                dic.Add("*2*", row["Peymankar"].ToString());
                dic.Add("*3*", row["SanadType"].ToString());
                string prevContractNo = row["SanadType"]!=null?"شماره قرارداد قبلی : "+ row["SanadType"].ToString():"";
                dic.Add("*4*", prevContractNo);
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


                string tRow = @"<w:tr w:rsidR=""00B507F6"" w:rsidRPr=""003016DA"" w:rsidTr=""00D5773A"">
            <w:trPr>
               <w:trHeight w:val=""545"" />
               <w:jc w:val=""center"" />
            </w:trPr>";
                string tCell = @"<w:tc>
               <w:tcPr>
                  <w:tcW w:w=""2082"" w:type=""dxa"" />
                  <w:tcBorders>
                     <w:top w:val=""single"" w:sz=""24"" w:space=""0"" w:color=""FFFFFF"" />
                     <w:left w:val=""single"" w:sz=""8"" w:space=""0"" w:color=""FFFFFF"" />
                     <w:bottom w:val=""single"" w:sz=""8"" w:space=""0"" w:color=""FFFFFF"" />
                     <w:right w:val=""single"" w:sz=""8"" w:space=""0"" w:color=""FFFFFF"" />
                  </w:tcBorders>
                  <w:shd w:val=""clear"" w:color=""auto"" w:fill=""E8D0D0"" />
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
                     <w:t>ردیف از توی کد</w:t>
                  </w:r>
               </w:p>
            </w:tc>";
                tRow += tCell;
                tRow += tCell;
                tRow += tCell;
                tRow += tCell;
                tRow += " </w:tr>";

                tTable += tRow;
                tTable += @"   </w:tbl>";
                //dic.Add("*5*", row["vahed"].ToString());
                dic.Add("*6*",tTable);
                //dic.Add("*7*", row["vahed"].ToString());
                //dic.Add("*8*", row["vahed"].ToString());

                
                string path = "D:\\Projects\\NewMellat\\letterTemplate\\";
                string destinationFile = path + "temp\\" + guid+ ".docx";
               // File.Copy(path + "formNo1.docx", destinationFile);
                File.Copy(path + "test.docx", destinationFile);

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
                   System.IO.File.WriteAllText(@"D:\\Projects\\NewMellat\\letterTemplate\\temp\\"+guid+".txt", docText);

                }
               // return guid;
            }
            MessageBox.Show(guid);
        }
        static string ConvertDateFormat(Match m)
        {
            //var mydate = DateTime.Parse(m.Value);
            return String.Join("/", m.Value.Split('/').Reverse());
        }
        private string createRow(string[] col, int rowType)
        {
            string[] colors = { "C0504D", "E8D0D0", "F4E9E9" };
            string str= @"<w:tr w:rsidR=""00B507F6"" w:rsidRPr=""003016DA"" w:rsidTr=""00D5773A"">
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
            </w:tc>",colors[rowType],col[i]);
            }
            str += " </w:tr>";
            return str;
        }

        private void button2_Click(object sender, EventArgs e)
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
            string id = "9875";
            DataAccessBase db = new DataAccessBase();
            DataTable dt = db.ReaderText(@"select p.* ,i1.infTitle as vahed,i2.infTitle as Peymankar,i3.infTitle as SanadType,i4.infTitle as prType
from  tbProjects as p left join prInformation as i1 on p.prVahed=i1.infId
					  left join prInformation as i2 on p.prPeymankar=i2.infId
					  left join prInformation as i3 on p.prSanadType=i3.infId
					  left join prInformation as i4 on p.prProjectType=i4.infId
                                            where prid=" + id);
            if (dt.Rows.Count < 1)
            {
                MessageBox.Show("آیتمی وجود ندارد");
                return;
            }
            else
            {
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
                if(app!=null)
                 for (int i = 0; i < app.Count; i++)
                 {
                     appStr += string.Format(@" \n {0}  شماره نامه : {1}  تاریخ نامه {2}", app[i].dep, app[i].letterNo, app[i].letterDate);
                 }
                 dic.Add("*6*", appStr);

                string tbl1 = tTable;
                string[] cols = { "نقش", "نام و نام خانوادگی", "نام واحد", "تلفن "," نشانی پست الکترونیک" };
                tbl1+=createRow(cols,0);
                dynamic arr1 = JsonConvert.DeserializeObject(row["projectTeam"].ToString());
                for (int i = 0; i < arr1.Count; i++)
                {
                     string[] colsx =new string[5];
                    colsx[0] = arr1[i].role;
                    colsx[1] = arr1[i].name;
                    colsx[2] = arr1[i].vahed;
                    colsx[3] = arr1[i].tell;
                    colsx[4] = arr1[i].email;
                    tbl1 += createRow(colsx, i % 2 == 0?1:2);
                    
                }
                tbl1  +=" </w:tbl>";

                dic.Add("*7*", tbl1);

                string tbl2 = tTable;
                string[] cols2 = { "نقش", "نام و نام خانوادگی", "سمت", "تاریخ ", " امضا" };
                tbl2 += createRow(cols2, 0);
                dynamic arr2 = JsonConvert.DeserializeObject(row["ApprovedDoc"].ToString());
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
                dic.Add("*9*", dtl.prDetail.Value);
                dic.Add("*10*", row["prGoal"].ToString());
                dic.Add("*11*", dtl.prRequire.Value);

             
                dic.Add("*12*", dtl.Raghib==true?"دارد":"ندارد");
                dic.Add("*13*", dtl.Raghib==true ? dtl.RaghibDesc.Value : "");
                dic.Add("*14*", dtl.Chera1 == true ? "دارد" : "ندارد");
                dic.Add("*15*", dtl.Chera1 == true ? dtl.Chera1Desc.Value : "");
                dic.Add("*16*", dtl.Chera2 == true ? "دارد" : "ندارد");
                dic.Add("*17*", dtl.Chera2 == true ? dtl.Chera2Desc.Value : "");
                dic.Add("*18*", dtl.Chera3 == true ? "دارد" : "ندارد");
                dic.Add("*19*", dtl.Chera3 == true ? dtl.Chera3Desc.Value : "");
                dic.Add("*20*", dtl.Chera4 == true ? "دارد" : "ندارد");
                dic.Add("*21*", dtl.Chera4 == true ? dtl.Chera4Desc.Value : "");

                dic.Add("*24*", dtl.Hamposh == true ? "دارد" : "ندارد");
                dic.Add("*25*", dtl.Hamposh1.Value);
                dic.Add("*26*", dtl.Hamposh2.Value);
                dic.Add("*27*", dtl.Hamposh3.Value);


                dynamic bnf = JsonConvert.DeserializeObject(row["prBenefit"].ToString());
                string bnf1 = "";
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
                dic.Add("*22*", bnf1);

                string bnf2 = "";
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
                dic.Add("*23*", bnf2);

                 string path = "D:\\Projects\\NewMellat\\letterTemplate\\";
                string destinationFile = path + "temp\\" + guid+ ".docx";
                File.Copy(path + "formNo1.docx", destinationFile);
                //File.Copy(path + "test.docx", destinationFile);

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
                 //  System.IO.File.WriteAllText(@"D:\\Projects\\NewMellat\\letterTemplate\\temp\\"+guid+".txt", docText);

                }
               // return guid;
            }
            MessageBox.Show(guid);
            }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
           

        }

        private void button4_Click(object sender, EventArgs e)
        {

        }
   
    }
}
