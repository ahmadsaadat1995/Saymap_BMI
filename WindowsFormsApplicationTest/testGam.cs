using NewMellat;
using NewMellat.gam;
using OfficeAutomationServiceClient.LetterServiceProxy;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplicationTest
{
    public partial class testGam : Form
    {
        public testGam()
        {
            InitializeComponent();
        }
        string pageQuery1 = @"SELECT tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.id, tbSooratHesab.Nazer1, tbSooratHesab.Nazer2, tbSooratHesab.OnvanTahvili,tbSooratHesab.Price, tbProjectPaper.paShenase,tbProjectPaper.paNumber, dbo.getShamsiDate(tbProjectPaper.paDate) AS paDate, tbProjectPaper.paAct, tbSooratPishNevis.pishId, tbProjectPaper.paType,
		 prInformation.infTitle as companyName,n1.infTitle as Nazer1Name,n2.infTitle as Nazer2Name,tbSooratPishNevis.pishDore
            FROM tbSooratHesab INNER JOIN tbSooratPishNevis ON tbSooratHesab.id = tbSooratPishNevis.pishProject 
                               INNER JOIN tbProjectPaper ON tbSooratHesab.id = tbProjectPaper.paProject
							   inner Join prInformation on tbSooratHesab .CompanyName=prInformation.infId 
                               left Join prInformation n1 on tbSooratHesab .Nazer1=n1.infId 
							   left Join prInformation n2 on tbSooratHesab .Nazer2=n2.infId 
            WHERE (tbProjectPaper.paType IN (1003, 1004)) AND (tbProjectPaper.paAct = 1) AND (tbSooratPishNevis.pishAct = 1) AND (tbProjectPaper.paEdare = 2) and step4=0 and pishId not in (select tbProjectPaper.paProject from tbProjectPaper where paType=1005 and paAct=1  and pastatus=1)";
        private void button1_Click(object sender, EventArgs e)
        {
            DataAccessBase db = new DataAccessBase();


            DataTable dt = db.ReaderText(pageQuery1);
            int index = dt.Rows.Count - 1;

            string pishId = dt.Rows[index]["pishId"].ToString();

            string department = dt.Rows[index]["Nazer1Name"].ToString();
            if (dt.Rows[index]["paType"].ToString() == "1004")
                department = dt.Rows[index]["Nazer2Name"].ToString();
            string paNumber = dt.Rows[index]["PaNumber"] != null ? dt.Rows[index]["PaNumber"].ToString() : "";
            string paDate = dt.Rows[index]["PaDate"] != null ? dt.Rows[index]["PaDate"].ToString() : "";
            var company = dt.Rows[index]["companyName"].ToString();
            var projectName = dt.Rows[index]["ProjectName"].ToString();
            var projectNo = dt.Rows[index]["ProjectGharardad"].ToString();
            PersianCalendar pc = new PersianCalendar();
            DateTime thisDate = DateTime.Now.AddDays(7);

            BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");


            com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
            signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
            com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
            param1.letAccessType = "1";
            param1.letDocTypeId = bs.GetDocTypeId();
            param1.letPriorityId = bs.GetPriorityId();
            param1.letTransfer = bs.TransferType;
            //  param1.letSenderPerId = 1234;
            // param1.letSenderDepId = 1234;
            param1.signers = signers;
            param1.letRegistrarDepId = bs.GetPersonDepartmentsID();


            var d = new string[] { company };

            param1.receivers = bs.GetLetterReceivers(d);
            param1.letComment = projectName + " " + projectNo;


            DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType = 1001 ");
            string paNumber2 = "", paDate2 = "";
            if (dt2.Rows.Count > 0)
            {
                paNumber2 = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                paDate2 = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
            }

            var dic = new Dictionary<string, string>();
            dic.Add("*0*", company);
            dic.Add("*1*", String.Join("/", paNumber2.Split('/').Reverse()));
            dic.Add("*2*", String.Join("/", paDate2.Split('/').Reverse()));
            dic.Add("*3*", projectName);
            dic.Add("*4*", String.Join("-", projectNo.Split('-').Reverse()));
            dic.Add("*5*", String.Join("/", paNumber.Split('/').Reverse()));
            dic.Add("*6*", String.Join("/", paDate.Split('/').Reverse()));
            dic.Add("*7*", department);
            dic.Add("*8*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


            param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
            {
                content = bs.createFile("pasokhEstelamTazmin", dic)
            };
            param1.subjectIds = bs.GetSubjectIds("حسن انجام کار");



            var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
            lblLetterResult.Text = string.Format("پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual);

            //   int result = db.NonQueryTxt("INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject],[edare],[edare2],pishid)VALUES('estelamSoratHesab'," + actual + ",'" + pishId + "','" + h1.Value + "','" + h2.Value + "','" + HiddenField2.Value + "')");

            MessageBox.Show("Done");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DataAccessBase db = new DataAccessBase();


            DataTable dt = db.ReaderText(pageQuery1);
            int index = dt.Rows.Count - 1;

            string pishId = dt.Rows[index]["pishId"].ToString();

            string dore = dt.Rows[index]["pishDore"].ToString();
            string department = dt.Rows[index]["Nazer1Name"].ToString();
            if (dt.Rows[index]["paType"].ToString() == "1004")
                department = dt.Rows[index]["Nazer2Name"].ToString();
            string paNumber = dt.Rows[index]["PaNumber"] != null ? dt.Rows[index]["PaNumber"].ToString() : "";
            string paDate = dt.Rows[index]["PaDate"] != null ? dt.Rows[index]["PaDate"].ToString() : "";
            var company = dt.Rows[index]["companyName"].ToString();
            var projectName = dt.Rows[index]["ProjectName"].ToString();
            var projectNo = dt.Rows[index]["ProjectGharardad"].ToString();
            PersianCalendar pc = new PersianCalendar();
            DateTime thisDate = DateTime.Now.AddDays(7);

            BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");


            com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
            signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
            com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
            param1.letAccessType = "1";
            param1.letDocTypeId = bs.GetDocTypeId();
            param1.letPriorityId = bs.GetPriorityId();
            param1.letTransfer = bs.TransferType;
            //  param1.letSenderPerId = 1234;
            // param1.letSenderDepId = 1234;
            param1.signers = signers;
            param1.letRegistrarDepId = bs.GetPersonDepartmentsID();


            var d = new string[] { company };


            param1.receivers = bs.GetLetterReceivers(d);
            param1.letComment = projectName + " " + projectNo;


            DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType = 1001 ");
            string paNumber2 = "", paDate2 = "";
            if (dt2.Rows.Count > 0)
            {
                paNumber2 = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                paDate2 = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
            }

            var dic = new Dictionary<string, string>();
            dic.Add("*0*", company);
            dic.Add("*1*", String.Join("/", paNumber2.Split('/').Reverse()));
            dic.Add("*2*", String.Join("/", paDate2.Split('/').Reverse()));
            dic.Add("*3*", dore);
            dic.Add("*4*", projectName);
            dic.Add("*5*", String.Join("-", projectNo.Split('-').Reverse()));
            dic.Add("*6*", String.Join("/", paNumber.Split('/').Reverse()));
            dic.Add("*7*", String.Join("/", paDate.Split('/').Reverse()));
            dic.Add("*8*", department);
            dic.Add("*9*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


            param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
            {
                content = bs.createFile("pasokhEstelamDore", dic)
            };
            param1.subjectIds = bs.GetSubjectIds("حسن انجام کار");



            var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
            lblLetterResult.Text = string.Format("پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual);

            //   int result = db.NonQueryTxt("INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject],[edare],[edare2],pishid)VALUES('estelamSoratHesab'," + actual + ",'" + pishId + "','" + h1.Value + "','" + h2.Value + "','" + HiddenField2.Value + "')");

            MessageBox.Show("Done");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataAccessBase db = new DataAccessBase();
            string pageQuery = @"SELECT tbSooratPishNevis.pishId, tbSooratPishNevis.pishPrice, tbSooratPishNevis.pishPricePlus, tbSooratPishNevis.pishType, tbSooratPishNevis.pishSooratHesab, tbSooratPishNevis.pishHours, tbSooratPishNevis.pishDore, tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.MoedTahvili, tbSooratHesab.Price,tbSooratHesab.OnvanTahvili
              ,prInformation.infTitle as companyName,n1.infTitle as Nazer1Name,n2.infTitle as Nazer2Name
            FROM tbSooratPishNevis INNER JOIN tbSooratHesab ON tbSooratPishNevis.pishProject = tbSooratHesab.id
                                   inner Join prInformation on tbSooratHesab .CompanyName=prInformation.infId
                                   left Join prInformation n1 on tbSooratHesab .Nazer1=n1.infId 
							       left Join prInformation n2 on tbSooratHesab .Nazer2=n2.infId  
            WHERE (tbSooratPishNevis.pishAct = 1) AND (tbSooratPishNevis.pishIsNazer = 0) AND (tbSooratHesab.step2 = 0)";

            DataTable dt = db.ReaderText(pageQuery);
            int index = 0;

            string pishId = dt.Rows[index]["pishId"].ToString();

            string department = dt.Rows[index]["Nazer1Name"].ToString();
            if (dt.Rows[index]["paType"].ToString() == "1004")
                department = dt.Rows[index]["Nazer2Name"].ToString();
            string paNumber = dt.Rows[index]["PaNumber"] != null ? dt.Rows[index]["PaNumber"].ToString() : "";
            string paDate = dt.Rows[index]["PaDate"] != null ? dt.Rows[index]["PaDate"].ToString() : "";
            var company = dt.Rows[index]["companyName"].ToString();
            var projectName = dt.Rows[index]["ProjectName"].ToString();
            var projectNo = dt.Rows[index]["ProjectGharardad"].ToString();
            PersianCalendar pc = new PersianCalendar();
            DateTime thisDate = DateTime.Now.AddDays(7);

            BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");


            com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
            signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
            com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
            param1.letAccessType = "1";
            param1.letDocTypeId = bs.GetDocTypeId();
            param1.letPriorityId = bs.GetPriorityId();
            param1.letTransfer = bs.TransferType;
            //  param1.letSenderPerId = 1234;
            // param1.letSenderDepId = 1234;
            param1.signers = signers;
            param1.letRegistrarDepId = bs.GetPersonDepartmentsID();


            var d = new string[] { company };


            param1.receivers = bs.GetLetterReceivers(d);
            param1.letComment = projectName + " " + projectNo;


            DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType = 1001 ");
            string paNumber2 = "", paDate2 = "";
            if (dt2.Rows.Count > 0)
            {
                paNumber2 = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                paDate2 = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
            }

            var dic = new Dictionary<string, string>();
            dic.Add("*0*", company);
            dic.Add("*1*", String.Join("/", paNumber.Split('/').Reverse()));
            dic.Add("*2*", String.Join("/", paDate.Split('/').Reverse()));
            dic.Add("*3*", projectName);
            dic.Add("*4*", String.Join("-", projectNo.Split('-').Reverse()));
            dic.Add("*5*", String.Join("/", paNumber2.Split('/').Reverse()));
            dic.Add("*6*", String.Join("/", paDate2.Split('/').Reverse()));
            dic.Add("*7", department);
            dic.Add("*8*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


            param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
            {
                content = bs.createFile("estelamHosn", dic)
            };
            param1.subjectIds = bs.GetSubjectIds("استعلام");



            //    var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
            //   lblLetterResult.Text = string.Format("پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual);

            //   int result = db.NonQueryTxt("INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject],[edare],[edare2],pishid)VALUES('estelamSoratHesab'," + actual + ",'" + pishId + "','" + h1.Value + "','" + h2.Value + "','" + HiddenField2.Value + "')");

            MessageBox.Show("Done");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string pageQuery = @"SELECT tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.id, tbSooratHesab.Nazer1, tbSooratHesab.Nazer2, tbSooratHesab.OnvanTahvili,tbSooratHesab.Price, tbProjectPaper.paShenase,tbProjectPaper.paNumber , dbo.getShamsiDate(tbProjectPaper.paDate) AS paDate, tbProjectPaper.paAct, tbSooratPishNevis.pishId, tbProjectPaper.paType,
		 prInformation.infTitle as companyName,n1.infTitle as Nazer1Name,n2.infTitle as Nazer2Name,tbSooratPishNevis.pishDore, tbSooratHesab.Gharardad
            FROM tbSooratHesab INNER JOIN tbSooratPishNevis ON tbSooratHesab.id = tbSooratPishNevis.pishProject 
                               INNER JOIN tbProjectPaper ON tbSooratHesab.id = tbProjectPaper.paProject
							   inner Join prInformation on tbSooratHesab .CompanyName=prInformation.infId 
                               left Join prInformation n1 on tbSooratHesab .Nazer1=n1.infId 
							   left Join prInformation n2 on tbSooratHesab .Nazer2=n2.infId 
            WHERE (tbProjectPaper.paType IN (1003, 1004)) AND (tbProjectPaper.paAct = 1) AND (tbSooratPishNevis.pishAct = 1) AND (tbProjectPaper.paEdare = 2) and step4=0 and pishId not in (select tbProjectPaper.paProject from tbProjectPaper where paType=1005 and paAct=1  and pastatus=1)";


            DataAccessBase db = new DataAccessBase();


            DataTable dt = db.ReaderText(pageQuery);
            int index = 0;

            string dore = dt.Rows[index]["pishDore"].ToString();
            string pishId = dt.Rows[index]["pishId"].ToString();
            string department = dt.Rows[index]["Nazer1Name"].ToString();
            string OnvanTahvili = dt.Rows[index]["Gharardad"].ToString();
            if (dt.Rows[index]["paType"].ToString() == "1004")
                department = dt.Rows[index]["Nazer2Name"].ToString();
            string paNumber = dt.Rows[index]["PaNumber"] != null ? dt.Rows[index]["PaNumber"].ToString() : "";
            string paDate = dt.Rows[index]["PaDate"] != null ? dt.Rows[index]["PaDate"].ToString() : "";
            var company = dt.Rows[index]["companyName"].ToString();
            var projectName = dt.Rows[index]["ProjectName"].ToString();
            var projectNo = dt.Rows[index]["ProjectGharardad"].ToString();
            PersianCalendar pc = new PersianCalendar();
            DateTime thisDate = DateTime.Now.AddDays(7);

            BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");

            string letterName = "PageSooratErsalSHerkat\\total";
            string subject = "", caption = "";
            switch (OnvanTahvili)
            {
                case "استرداد-تضامین":
                    caption = "استردادتضامین";
                    subject = "حسن انجام کار";
                    break;
                case "استرداد-حسن انجام کار":
                    caption = "استرداد 10% سپرده حسن انجام کار";
                    subject = "حسن انجام کار";
                    break;
                case "استرداد-مفصا حساب":
                    caption = "مفاصا حساب";
                    subject = "مفاصا حساب";
                    break;
                default:
                    subject = "صورتحساب";
                    caption = "صورت وضعیت مرحله " + dore;
                    break;
            }

            com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
            signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
            com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
            param1.letAccessType = "1";
            param1.letDocTypeId = bs.GetDocTypeId();
            param1.letPriorityId = bs.GetPriorityId();
            param1.letTransfer = bs.TransferType;
            //  param1.letSenderPerId = 1234;
            // param1.letSenderDepId = 1234;
            param1.signers = signers;
            param1.letRegistrarDepId = bs.GetPersonDepartmentsID();


            var d = new string[] { company };


            param1.receivers = bs.GetLetterReceivers(d);
            param1.letComment = projectName + " " + projectNo;

            // DataAccessBase db = new DataAccessBase();
            DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType = 1001 ");
            string paNumber2 = "", paDate2 = "";
            if (dt2.Rows.Count > 0)
            {
                paNumber2 = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                paDate2 = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
            }

            var dic = new Dictionary<string, string>();
            dic.Add("*0*", company);
            dic.Add("*1*", String.Join("/", paNumber2.Split('/').Reverse()));
            dic.Add("*2*", String.Join("/", paDate2.Split('/').Reverse()));

            dic.Add("*3*", projectName);
            dic.Add("*4*", String.Join("-", projectNo.Split('-').Reverse()));
            dic.Add("*5*", String.Join("/", paNumber.Split('/').Reverse()));
            dic.Add("*6*", String.Join("/", paDate.Split('/').Reverse()));
            dic.Add("*7*", department);
            dic.Add("*8*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


            dic.Add("*9*", caption);

            param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
            {
                content = bs.createFile(letterName, dic)
            };
            param1.subjectIds = bs.GetSubjectIds(subject);
            int result = db.NonQueryTxt(@"INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],pishid)
                                                                     VALUES('PageSooratErsalSHerkat',12345,'" + pishId + "')");
            MessageBox.Show("end");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string pageQuery = @"SELECT        tbSooratPishNevis.pishId, tbSooratPishNevis.pishPrice, tbSooratPishNevis.pishPricePlus, tbSooratPishNevis.pishSooratHesab, tbSooratPishNevis.pishHours, tbSooratPishNevis.pishDore, 
                         tbSooratPishNevis.pishType, tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.MoedTahvili, tbSooratHesab.Price, tbSooratHesab.OnvanTahvili
                ,prInformation.infTitle as companyName,n1.infTitle as Nazer1Name,n2.infTitle as Nazer2Name
FROM            tbSooratPishNevis INNER JOIN
                         tbSooratHesab ON tbSooratPishNevis.pishProject = tbSooratHesab.id
                               inner Join prInformation on tbSooratHesab .CompanyName=prInformation.infId 
                               left Join prInformation n1 on tbSooratHesab .Nazer1=n1.infId 
							   left Join prInformation n2 on tbSooratHesab .Nazer2=n2.infId 
WHERE        (tbSooratPishNevis.pishAct = 1) AND (tbSooratPishNevis.pishIsNazer = 0) AND (tbSooratHesab.step2 = 0)";

            DataAccessBase db = new DataAccessBase();


            DataTable dt = db.ReaderText(pageQuery);
            int index = 0;

            string pishId = dt.Rows[index]["pishId"].ToString();
            string department1 = dt.Rows[index]["Nazer1Name"].ToString();
            string OnvanTahvili = dt.Rows[index]["OnvanTahvili"].ToString();
            //  if (dt.Rows[index]["paType"].ToString() == "1004")
            string department2 = dt.Rows[index]["Nazer2Name"].ToString();
            //  string paNumber = dt.Rows[index]["PaNumber"] != null ? dt.Rows[index]["PaNumber"].ToString() : "";
            //  string paDate = dt.Rows[index]["PaDate"] != null ? dt.Rows[index]["PaDate"].ToString() : "";
            var company = dt.Rows[index]["companyName"].ToString();
            var projectName = dt.Rows[index]["ProjectName"].ToString();
            var projectNo = dt.Rows[index]["ProjectGharardad"].ToString();
            var dore = dt.Rows[index]["pishDore"].ToString();
            PersianCalendar pc = new PersianCalendar();
            DateTime thisDate = DateTime.Now.AddDays(7);

            BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");

            string letterName = "";
            string subject = "";
            switch (OnvanTahvili)
            {
                case "سپرده تضامین":
                case "تضامین قرارداد":
                    letterName = "PageSooratEstelam\\tazamin";
                    subject = "حسن انجام کار";
                    break;
                case "حسن انجام کار":
                case "سپرده حسن انجام کار":
                    letterName = "PageSooratEstelam\\hosn";
                    subject = "حسن انجام کار";
                    break;

                case "مفاصا حساب":
                    letterName = "PageSooratEstelam\\mofasa";
                    subject = "مفاصا حساب";
                    break;
                default:
                    letterName = "PageSooratEstelam\\sayer";
                    subject = "صورتحساب";
                    break;
            }

            com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
            signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
            com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
            param1.letAccessType = "1";
            param1.letDocTypeId = bs.GetDocTypeId();
            param1.letPriorityId = bs.GetPriorityId();
            param1.letTransfer = bs.TransferType;
            //  param1.letSenderPerId = 1234;
            // param1.letSenderDepId = 1234;
            param1.signers = signers;
            param1.letRegistrarDepId = bs.GetPersonDepartmentsID();


            var d = new string[] { department1 };
            if (department2 != "")
                d = new string[] { department1, department2 };


            param1.receivers = bs.GetLetterReceivers(d);
            param1.letComment = projectName + " " + projectNo;

            // DataAccessBase db = new DataAccessBase();
            DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType = 1001 ");
            string paNumber = "", paDate = "";
            if (dt2.Rows.Count > 0)
            {
                paNumber = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                paDate = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
            }

            var dic = new Dictionary<string, string>();
            dic.Add("*0*", department1);
            dic.Add("*1*", department2);
            dic.Add("*2*", String.Join("/", paNumber.Split('/').Reverse()));
            dic.Add("*3*", String.Join("/", paDate.Split('/').Reverse()));
            dic.Add("*4*", company);
            dic.Add("*5*", projectName);
            dic.Add("*6*", String.Join("-", projectNo.Split('-').Reverse()));


            dic.Add("*7*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));


            dic.Add("*8*", dore);

            param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
            {
                content = bs.createFile(letterName, dic)
            };
            param1.subjectIds = bs.GetSubjectIds(subject);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            DataAccessBase db = new DataAccessBase();
            DataTable dt = db.ReaderText("select * from  tbGamLetterNumber where id=125");
            DataRow row = dt.Rows[0];
            if (row["entity"].ToString() == "PageSooratErsalSHerkat")
            {
                string paShenase = "123456789", paNumber = "123456", paDate = "2020-08-13";
                string query = string.Format(@"INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType,paStatus) VALUES ({0},{1}, {2},{3}, 1, 1005,1)",
                    paShenase, paNumber, paDate, row["pishId"].ToString());
            }
            else if (row["entity"].ToString() == "PageSooratEstelam")
            {
            }
        }
    }
}
