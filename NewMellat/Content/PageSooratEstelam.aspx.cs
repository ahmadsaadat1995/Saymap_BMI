using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Globalization;
using OfficeAutomationServiceClient.LetterServiceProxy;
using NewMellat.gam;
using System.Text;
using DataAccessLayer;
using System.Data;

namespace NewMellat.Content
{
    public partial class PageSooratEstelam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            sourcePishnevis.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "استعلام";


            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxGridView3_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "est")
            {
                ASPxGridView4.Visible = false;

                ASPxButton1.Enabled = true;


                ASPxRoundPanel2.Visible = true;
                ASPxRoundPanel3.Visible = true;


                int pishId = Convert.ToInt32(e.CommandArgs.CommandArgument);
                var pish = db.tbSooratPishNevis.SingleOrDefault(n => n.pishId == pishId);
                var project = db.tbSooratHesabs.FirstOrDefault(n => n.id == pish.pishProject);

                int intCompany = Convert.ToInt32(project.CompanyName);
                try
                {
                    lbCompany.Text = db.prInformations.FirstOrDefault(n => n.infId == intCompany).infTitle;
                }
                catch { }
                lbProjectName.Text = project.ProjectName;
                lbGharardad.Text = project.ProjectGharardad;
                lbGharardadType.Text = project.GharardadType;

                int nazer1 = Convert.ToInt32(project.Nazer1);
                int nazer2 = Convert.ToInt32(project.Nazer2);

                h1.Value = nazer1.ToString();
                h2.Value = nazer2.ToString();


                //teeeeeeeeeeeeeeeeeeeeeeeesssssssssssssssssssssssssssssssst
                try
                {
                    if (project.Gharardad.Contains("تولید"))
                    {
                        lbPriceTolid.Text = CommonClass.NumberWithGroup(Convert.ToInt64(project.Price));
                    }
                }
                catch { }

                try
                {
                    if (project.Gharardad.Contains("پشتیبانی"))
                    {
                        lbPricePosh.Text = CommonClass.NumberWithGroup(Convert.ToInt64(project.Price));
                    }
                }
                catch { }
                //----------------------------------------------------------------

                try
                {
                    lbNazer1.Text = db.prInformations.FirstOrDefault(n => n.infId == nazer1).infTitle;
                    // Label1.Text = db.prInformations.FirstOrDefault(n => n.infId == nazer2).infTitle;

                }
                catch
                {

                    lbNazer1.Text = string.Empty;
                    //  Label1.Text = string.Empty;


                }

                try
                {
                    lbNazer2.Text = db.prInformations.FirstOrDefault(n => n.infId == nazer2).infTitle;
                    //  Label22.Text = db.prInformations.FirstOrDefault(n => n.infId == nazer2).infTitle;

                }
                catch
                {
                    lbNazer2.Text = string.Empty;
                    // Label22.Text = string.Empty;

                }




                lbOnvan.Text = project.OnvanTahvili;

                try
                {
                    lbPishPrice.Text = CommonClass.NumberWithGroup(Convert.ToInt64(pish.pishPrice));
                }
                catch
                {

                    lbPishPrice.Text = string.Empty;

                }


                try
                {
                    lbPriceArzesh.Text = CommonClass.NumberWithGroup(Convert.ToInt64(pish.pishPricePlus));

                }
                catch
                {
                    lbPriceArzesh.Text = string.Empty;
                }

                lbNafar.Text = pish.pishHours;
                lbDore.Text = pish.pishDore;

                HiddenField1.Value = pishId.ToString();
                HiddenField2.Value = project.id.ToString();


                var infoTolid =
                        db.tbSooratHesabs.FirstOrDefault(
                            n => n.ProjectGharardad == project.ProjectGharardad && n.Gharardad.Contains("تولید"));

                var infoPosh =
                       db.tbSooratHesabs.FirstOrDefault(
                           n => n.ProjectGharardad == project.ProjectGharardad && n.Gharardad.Contains("پشتیبانی"));

                try
                {
                    lbStartTolid.Text = infoTolid.GharardadStart;

                    lbEndTolid.Text = infoTolid.GharardadEnd;
                }
                catch
                {

                    lbStartTolid.Text = string.Empty;

                    lbEndTolid.Text = string.Empty;


                }


                try
                {
                    lbStartPosh.Text = infoPosh.GharardadStart;
                    lbEndPosh.Text = infoPosh.GharardadEnd;
                }
                catch
                {
                    lbStartPosh.Text = string.Empty;
                    lbEndPosh.Text = string.Empty;
                }



                //test
                //           DataBind();
            }
            else if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "Gharardad", "Nazer1Name", "Nazer2Name", "pishDore", "pishId", "companyName", "ProjectName", "ProjectGharardad", "sooratHesabId", "Nazer1", "Nazer2", "ghSdate", "ghEdate", "MoedTahvili" };
                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string GharardadType = fields[0].ToString();
                string department1 = fields[1].ToString();
                string department2 = fields[2].ToString();
                string dore = fields[3].ToString();
                string pishId = fields[4].ToString();
                var company = fields[5].ToString();
                var projectName = fields[6].ToString();
                var projectNo = fields[7].ToString();
                var sooratHesabId = fields[8].ToString();
                var Nazer1 = fields[9].ToString();
                var Nazer2 = fields[10].ToString();
                string ghSdate = fields[11].ToString();
                string ghEdate = fields[12].ToString();
                var MoedTahvili = fields[13].ToString();
                
                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(9);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                // BaseClientSymap bs = new BaseClientSymap("m.khanahmadi");
                string letterName = "PageSooratEstelam\\total";
                string subject = "", caption = "";
                switch (GharardadType)
                {
                    case "استرداد-تضامین":
                        caption = "استردادتضامین";
                        subject = "حسن انجام کار";
                        letterName = "PageSooratEstelam\\tazamin";
                        break;
                    case "استرداد-حسن انجام کار":
                        caption = "استرداد 10% سپرده حسن انجام کار";
                        subject = "حسن انجام کار";
                        letterName = "PageSooratEstelam\\hosn";
                        break;
                    case "استرداد-مفصا حساب":
                        caption = "مفاصا حساب";
                        subject = "مفاصا حساب";
                        letterName = "PageSooratEstelam\\mofasa";
                        break;
                    default:
                        subject = "صورتحساب";
                        caption = "صورت وضعیت مرحله " + String.Join("/", dore.Split('/').Reverse());
                        thisDate = DateTime.Now.AddDays(14);
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

                DataAccessBase db = new DataAccessBase();
                DataTable dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType =1001 order by paId desc" );
                string paNumber = "", paDate = "";
                if (dt2.Rows.Count > 0)
                {
                    paNumber = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                    paDate = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
                }
                string paNumber3 = "", paDate3 = "";
                DataTable dt3 = db.ReaderText("select * from tbProjectPaper where paProject=" + pishId + " and paType=1006 order by paId desc");
             
               
                if (dt3.Rows.Count > 0)
                {
                    letterName = "PageSooratEstelam\\mojadad";
                    paNumber3 = dt3.Rows[0]["PaNumber"] != null ? dt3.Rows[0]["PaNumber"].ToString() : "";
                    paDate3 = dt3.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt3.Rows[0]["PaDate"].ToString()), "/") : "";

                    dt2 = db.ReaderText("select * from  tbProjectPaper where paProject=" + sooratHesabId + " and paAct=1 and paType in(1003,1004)");
                    paNumber = ""; paDate = "";
                    if (dt2.Rows.Count > 0)
                    {
                        paNumber = dt2.Rows[0]["PaNumber"] != null ? dt2.Rows[0]["PaNumber"].ToString() : "";
                        paDate = dt2.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt2.Rows[0]["PaDate"].ToString()), "/") : "";
                    }
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
                dic.Add("*8*", caption);
                dic.Add("*9*", String.Join("/", paNumber3.Split('/').Reverse()));
                dic.Add("*10*", String.Join("/", paDate3.Split('/').Reverse()));
                dic.Add("*52*", String.Join("/", ghSdate.Split('/').Reverse()));
                dic.Add("*53*", String.Join("/", ghEdate.Split('/').Reverse()));
                dic.Add("*54*", String.Join("/", MoedTahvili.Split('/').Reverse()));

                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds(subject);
                  // var actual = "11112223333";
                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
                if (Nazer2 == "")
                    Nazer2 = "-1";

                int result = db.NonQueryTxt(@"INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject],[edare],[edare2],pishid)
VALUES('PageSooratEstelam'," + actual + ","+sooratHesabId+","+Nazer1+","+Nazer2+",'" + pishId + "')");

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");
            }
        }


        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            int intProject = Convert.ToInt32(HiddenField2.Value);
            if (!string.IsNullOrEmpty(h1.Value) && h1.Value != "0")
            {
                if (!string.IsNullOrEmpty(txtShenase.Text))
                {
                    // کنترل نداشتن نامه تایید

                    var paper = db.tbProjectPapers.Count(n => n.paAct == 1 && n.paType == 1003 && n.paEdare == 1 && n.paProject == intProject);

                    //----------------

                    //if (paper == 0)
                    //{
                    sourcePaper.InsertParameters["paDate"].DefaultValue =
                        PersianCalendar1.Date.ToShortDateString();

                    sourcePaper.InsertParameters["paProject"].DefaultValue = HiddenField2.Value;
                    sourcePaper.InsertParameters["paEdare"].DefaultValue = h1.Value;

                    sourcePaper.Insert();
                    //  }
                }
            }



            if (!string.IsNullOrEmpty(h2.Value) && h2.Value != "0")
            {
                if (!string.IsNullOrEmpty(txtShenase.Text))
                {
                    // کنترل نداشتن نامه تایید
                    var paper = db.tbProjectPapers.Count(n => n.paAct == 1 && n.paType == 1004 && n.paEdare == 1 && n.paProject == intProject);

                    //----------------

                    //if (paper == 0)
                    //{
                    sourcePaper.InsertParameters["paDate"].DefaultValue =
                        PersianCalendar1.Date.ToShortDateString();

                    sourcePaper.InsertParameters["paProject"].DefaultValue = HiddenField2.Value;
                    sourcePaper.InsertParameters["paEdare"].DefaultValue = h2.Value;

                    sourcePaper.Insert();
                    // }
                }
            }


            foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
            {

                tbFile newFile = new tbFile();
                newFile.fiAct = 1;

                byte[] fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                newFile.fiData = fileData;

                newFile.fiDate = DateTime.Now;
                newFile.fiExt = Path.GetFileName(file.FileName);
                newFile.fiParent = Convert.ToInt32(HiddenField1.Value);

                newFile.fiType = 1002;
                db.tbFiles.Add(newFile);
                db.SaveChanges();
            }




            // آماره سازی برای نمایش در لیست پاسخ ناظر
            int intId = Convert.ToInt32(HiddenField1.Value);




            var info = db.tbSooratPishNevis.SingleOrDefault(n => n.pishId == intId);

            int intSoorat = info.pishProject.Value;
            info.pishIsNazer = true;
            db.SaveChanges();


            // به روز رسانی ثبت نامه
            var soorat = db.tbSooratHesabs.SingleOrDefault(n => n.id == intSoorat);
            soorat.step2 = true;
            db.SaveChanges();


            //RadNotification1.Show("اطلاعات با موفقیت به ثبت رسید");

            DataBind();

            ASPxGridView4.Visible = true;


            ASPxGridView3.DataBind();
            ASPxButton1.Enabled = false;
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Label30.Text = Persia.Calendar.ConvertToPersian(PersianCalendar1.Date.AddDays(14)).Simple;
            }
            catch { }
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {

            //string pishId = HiddenField1.Value;

            //var department1 = lbNazer1.Text;
            //var department2 = lbNazer2.Text;
            //var company = lbCompany.Text;
            //var projectName = lbProjectName.Text;
            //var projectNo = lbGharardad.Text;
            //PersianCalendar pc = new PersianCalendar();
            //DateTime thisDate = DateTime.Now.AddDays(14);
            //var dore = lbDore.Text;

            //int perId = 0;
            //string userName = "";
            //switch (Page.User.Identity.Name)
            //{
            //    case "e.abdollahi":
            //    case "abdolahi.eh":
            //        perId = 18814;
            //        userName = "0082393958";
            //        break;
            //    case "m.mosayebi":
            //        perId = 509152;
            //        userName = "0012273791";
            //        break;
            //    case "m.teymour":
            //        perId = 1793124;
            //        userName = "2122636521";
            //        break;
            //    case "m.khanahmadi":
            //        perId = 1289147;
            //        userName = "0019482264";
            //        break;
            //    case "a.hadimanesh":
            //    case "hadimanesh":
            //        perId = 16933;
            //        userName = "434118";
            //        break;

            //}
            //BaseClientSymap bs = new BaseClientSymap(perId, userName);

            //// BaseClientSymap bs = new BaseClientSymap(16933, "434118");//434118);//; 0019482264)
            //com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
            //signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = 16933, departmentId =1814302};
            //com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
            //param1.letAccessType = "1";
            //param1.letDocTypeId = bs.GetDocTypeId();
            //param1.letPriorityId = bs.GetPriorityId();
            //param1.letTransfer = bs.TransferType;
            ////  param1.letSenderPerId = 1234;
            //// param1.letSenderDepId = 1234;
            //param1.signers = signers;
            //param1.letRegistrarDepId = bs.GetPersonDepartmentsID();//1646343; //


            //var d = new string[] { department1 };
            //if (department2 != "")
            //    d = new string[] { department1, department2 };
            ////if(d[1]==null)

            //param1.receivers = bs.GetLetterReceivers(d);
            //param1.letComment = projectName + " " + projectNo;

            //DataAccessBase db = new DataAccessBase();
            //DataTable dt = db.ReaderText("select * from  tbProjectPaper where paProject=" + pishId + " and paAct=1 and paType = 1001 ");
            //string paNumber = "", paDate = "";
            //if (dt.Rows.Count > 0)
            //{
            //    paNumber = dt.Rows[0]["PaNumber"] != null ? dt.Rows[0]["PaNumber"].ToString() : "";
            //    paDate = dt.Rows[0]["PaDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(dt.Rows[0]["PaDate"].ToString()), "/") : "";
            //}
            ////  var dd = department1;
            ////  if (department2 != "") dd += " \r\n " + department2;
            //var dic = new Dictionary<string, string>();
            //dic.Add("*0*", department1);
            //dic.Add("*8*", department2);
            //dic.Add("*1*", String.Join("/",paNumber.Split('/').Reverse()));
            //dic.Add("*2*", String.Join("/",paDate.Split('/').Reverse()));
            //dic.Add("*3*", company);
            //dic.Add("*4*", dore);
            //dic.Add("*5*", projectName);
            //dic.Add("*6*",String.Join("-",projectNo.Split('-').Reverse())); 
            //dic.Add("*7*", String.Join("/",CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));
            //// dic.Add("*9*", pc.GetMonth(DateTime.Now).ToString());
            //// dic.Add("*10*", pc.GetDayOfMonth(DateTime.Now).ToString());

            //param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
            //{
            //    content = bs.createFile("estelamSoratHesab", dic)
            //};
            //param1.subjectIds = bs.GetSubjectIds("استعلام");



            //var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
            //lblLetterResult.Text = string.Format("پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual);

            //int result = db.NonQueryTxt("INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject],[edare],[edare2],pishid)VALUES('estelamSoratHesab'," + actual + ",'" + pishId + "','" + h1.Value + "','" + h2.Value + "','" + HiddenField2.Value + "')");
        }
    }
}