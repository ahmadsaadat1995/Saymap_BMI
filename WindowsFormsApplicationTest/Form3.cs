using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using OfficeAutomationServiceTest;
using OfficeAutomationServiceClient.LetterServiceProxy;
//using Microsoft.Office.Interop.Word;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using System.IO;
using System.Text.RegularExpressions;
using DataAccessLayer;
using System.Data.OleDb;

namespace WindowsFormsApplicationTest
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LetterServicePortTypeClientSymap l = new LetterServicePortTypeClientSymap();
            MessageBox.Show(l.insertLetterSymap());

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Microsoft.Office.Interop.Word.Application app = new Microsoft.Office.Interop.Word.Application();
            Microsoft.Office.Interop.Word.Document doc = app.Documents.Open("D:\\Projects\\NewMellat\\letterTemplate\\estelamSoratHesab.doc");
            //   Microsoft.Office.Interop.Word.Document doc2 = app.Documents.Open("D:\\Projects\\NewMellat\\letterTemplate\\test.doc");
            object missing = System.Reflection.Missing.Value;
            app.Visible = false;
            doc.Content.Text = doc.Content.Text.Replace("*1*", " حسین نیک پور");
            object filename = @"D:\Projects\12345.doc";
            doc.SaveAs2(ref filename);
            doc.Close(ref missing);
            //doc2.Close(ref missing);
            app.Quit(ref missing);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //label1.Text = "به روز رسانی";
            //MessageBox.Show("aaaa");
            string path = "D:\\Projects\\NewMellat\\letterTemplate\\";
            string fileOrgName = "estelamSoratHesab.docx";
            string destinationFile = path + "temp\\" + Guid.NewGuid().ToString() + ".docx";

            File.Copy(path + fileOrgName, destinationFile);


            using (WordprocessingDocument wordDoc = WordprocessingDocument.Open(destinationFile, true))
            {
                string docText = null;
                using (StreamReader sr = new StreamReader(wordDoc.MainDocumentPart.GetStream()))
                    docText = sr.ReadToEnd();

                docText = docText.Replace("*1*", " حسین نیک پور");
                //Regex regexText = new Regex("Hello world!");
                //docText = regexText.Replace(docText, "Hi Everyone!");

                using (StreamWriter sw = new StreamWriter(wordDoc.MainDocumentPart.GetStream(FileMode.Create)))
                    sw.Write(docText);

                MessageBox.Show("done");


            }

            File.Delete(destinationFile);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            BaseClientSymap bs = new BaseClientSymap();
            com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOLetterService = new com_gam_secretariat_webservice_complextypes_SecurityContextWTO()
            {
                systemName = "simapws",
                systemPass = "simap@1398",
                depId = 1646343,
                perId = 16933
            };
            com_gam_secretariat_webservice_complextypes_Item[] items = new com_gam_secretariat_webservice_complextypes_Item[2];
            items[0] = new com_gam_secretariat_webservice_complextypes_Item();
            items[0].key = "letterId";
            items[0].value = "14823071";

            com_gam_secretariat_webservice_complextypes_FetchLetterParamWTO fetchLetter = new com_gam_secretariat_webservice_complextypes_FetchLetterParamWTO() { items = items };

            var res = bs.LetterServiceClient.fetchLetter(SecurityContextWTOLetterService, fetchLetter);
            MessageBox.Show("done");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            BaseClientSymap bs = new BaseClientSymap();
            com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOLetterService = new com_gam_secretariat_webservice_complextypes_SecurityContextWTO()
            {
                systemName = "simapws",
                systemPass = "simap@1398",
                depId = 1646343,
                perId = 16933
            };


            DataAccessBase db = new DataAccessBase();
            DataTable dt = db.ReaderText("select * from  tbGamLetterNumber");


            foreach (DataRow row in dt.Rows)
            {
                com_gam_secretariat_webservice_complextypes_Item[] items = new com_gam_secretariat_webservice_complextypes_Item[1];
                items[0] = new com_gam_secretariat_webservice_complextypes_Item();
                items[0].key = "letterId";
                items[0].value = row["letterNo"].ToString();

                com_gam_secretariat_webservice_complextypes_FetchLetterParamWTO fetchLetter = new com_gam_secretariat_webservice_complextypes_FetchLetterParamWTO() { items = items };

                var res = bs.LetterServiceClient.fetchLetter(SecurityContextWTOLetterService, fetchLetter);



                if (res[0].letRegisterNumber != null && res[0].letFinalRegDate != null)
                {


                    string xx = "";
                    if (row["edare2"] != null)
                    {
                        xx = string.Format(",('{0}', '{1}', '{2}', {3}, 1, 1002, '','{4}')", row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["paProject"].ToString(), row["edare2"].ToString());
                    }
                    int result = db.NonQueryTxt(string.Format("INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paBody,paEdare) VALUES ('{0}', '{1}', '{2}', {3}, 1, 1002, '','{4}') {5}",
                  row["letterNo"].ToString(), res[0].letRegisterNumber, res[0].letFinalRegDate, row["pishId"].ToString(), row["edare"].ToString(), xx));//row["paProject"].ToString()


                    string intId = row["paProject"].ToString();
                    db.NonQueryTxt("update tbSooratPishNevis set pishIsNazer=1 where pishid=" + intId);
                    string intSoorat = db.ScalarTxt("select pishProject from tbSooratPishNevis where pishid=" + intId).ToString();


                    // به روز رسانی ثبت نامه
                    db.NonQueryTxt("update tbSooratHesab set step2=1 where id=" + intSoorat);

                    //  db.NonQueryTxt("DELETE FROM [dbo].[tbGamLetterNumber] where id=" + row["id"].ToString());

                    MessageBox.Show("aaaa");
                }


            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            var dic = new Dictionary<string, string>();
            dic.Add("*0*", "	اداره کل زیر ساخت و نرم افزار");
            dic.Add("*8*", "	اداره کل بانکداری شخصی و بهبود تجربه مشتری");
            dic.Add("*1*", "99/ب/33");
            dic.Add("*2*", "1395/11/01");

            var x = createFile("estelamSoratHesab", dic);

        }

        public byte[] createFile(string templateName, Dictionary<string, string> param)
        {
            string path = "D:\\Projects\\NewMellat\\letterTemplate\\";
            string destinationFile = path + "temp\\" + Guid.NewGuid().ToString() + ".docx";

            File.Copy(path + templateName + ".docx", destinationFile);


            using (WordprocessingDocument wordDoc = WordprocessingDocument.Open(destinationFile, true))
            {
                string docText = null;
                using (StreamReader sr = new StreamReader(wordDoc.MainDocumentPart.GetStream()))
                    docText = sr.ReadToEnd();

                foreach (var item in param)
                {
                    docText = docText.Replace(item.Key, item.Value);
                }


                using (
                    StreamWriter sw = new StreamWriter(wordDoc.MainDocumentPart.GetStream(FileMode.Create)))
                    sw.Write(docText);

                //  MessageBox.Show("done");


            }
            return System.IO.File.ReadAllBytes(destinationFile);
            // File.Delete(destinationFile);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            var fileName = string.Format("{0}\\data", Directory.GetCurrentDirectory());
            var connectionString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0; data source={0}; Extended Properties=Excel 8.0;", fileName);

            var adapter = new OleDbDataAdapter("SELECT * FROM [Sheet1$]", connectionString);
            var ds = new DataSet();

            adapter.Fill(ds, "anyNameHere");

            DataTable data = ds.Tables["anyNameHere"];


            
        }
    }
}
