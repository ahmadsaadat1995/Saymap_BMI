using DataAccessLayer;
using OfficeAutomationServiceTest;
using OfficeAutomationServiceClient.LetterServiceProxy;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace serviceForGam
{
    public partial class formTest : Form
    {
        public formTest()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            BaseClientSymap bs = new BaseClientSymap();
            com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOLetterService = new com_gam_secretariat_webservice_complextypes_SecurityContextWTO()
            {
                systemName = "simapws",
                systemPass = "simap@1398",
                depId = 1814302,
                perId = 16933
            };


            DataAccessBase db = new DataAccessBase();
            DataTable dt = db.ReaderText("select * from  tbGamLetterNumber where letterNo="+textBox1.Text);


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

                    // MessageBox.Show("aaaa");
                }


            }
        }
    }
}
