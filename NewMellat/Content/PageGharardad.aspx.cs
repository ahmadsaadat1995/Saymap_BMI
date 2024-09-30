using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using NewMellat.gam;
using System.Text;
using DataAccessLayer;
using OfficeAutomationServiceClient.LetterServiceProxy;

namespace NewMellat.Content
{
    public partial class PageGharardad : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }

            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "فرآیند انعقاد قرارداد";

            sourceGharadad.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            //g5.Value = db.tbGharardads.Where(n => n.ghAct == 1 && n.ghCode != null).Count().ToString();

            //g4.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 9).tmData.Value.ToString();

            //g1.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 5).tmData.Value.ToString();

            //g2.Value = db.tbTemps.SingleOrDefault(n => n.tmId == 7).tmData.Value.ToString();

        }

        NewMellatEntities db = new NewMellatEntities();


        int GharardadId(string code, bool IsElhaghie)
        {
            try
            {
                var info = db.vwGharardadIDs.FirstOrDefault(n => n.ghCode == code && n.isElhaghie == IsElhaghie);


                return info.ghId;
            }
            catch
            {
                return -1;
            }
        }


        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.VisibleIndex == 4)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink5") as HyperLink;
                HiddenField h1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h1") as HiddenField;
                HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;

                bool isElhagh;
                if (h2.Value == "1")
                {
                    isElhagh = true;
                }
                else
                {
                    isElhagh = false;
                }

                var ghId = h1.Value; // GharardadId(h1.Value, isElhagh);

                hp.NavigateUrl = "~/content/PagePages.aspx?project=" + ghId;

                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc({0}); return false;", strItembody[1]));
            }

            if (e.DataColumn.VisibleIndex == 5)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink6") as HyperLink;

                HiddenField h1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h1") as HiddenField;
                HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;

                bool isElhagh;
                if (h2.Value == "1")
                {
                    isElhagh = true;
                }
                else
                {
                    isElhagh = false;
                }

                var ghId = h1.Value; // GharardadId(h1.Value, isElhagh);

                hp.NavigateUrl = "~/content/PageEstelamgharardad.aspx?id=" + ghId;




                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc2({0}); return false;", strItembody[1]));
            }


            if (e.DataColumn.VisibleIndex == 7)
            {


                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink2") as HyperLink;
                HyperLink hp2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink8") as HyperLink;
                HyperLink hp3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink9") as HyperLink;
                HiddenField HiddenField1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField1") as HiddenField;




                HiddenField h1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h1") as HiddenField;
                HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;
                HiddenField h3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h3") as HiddenField;

                bool isElhagh;
                if (h2.Value == "1")
                {
                    isElhagh = true;
                }
                else
                {
                    isElhagh = false;
                }

                var ghId = h1.Value; // GharardadId(h1.Value, isElhagh);;

                HiddenField1.Value = ghId.ToString();

                //   hp2.NavigateUrl = "~/content/PageGharardadCode.aspx?id=" + ghId;
                int intPrId = Convert.ToInt32(h3.Value);


                bool elhaghie = Convert.ToBoolean(h2.Value);

                //var tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thProject == intPrId && n.thIsElhaghie == elhaghie);
                hp2.NavigateUrl = "~/content/PageGharardadCode.aspx?thId=" + intPrId + "&id=" + ghId;







                hp.NavigateUrl = "~/content/PagePages.aspx?project=" + ghId;
                hp3.NavigateUrl = "~/content/PageAttach.aspx?parent=" + ghId;






                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc4({0}); return false;", strItembody[1]));


                //string[] strItembody2 = hp2.NavigateUrl.Split('=');
                //hp2.Attributes.Add("onclick", string.Format("loadDoc5({0}); return false;", strItembody2[1]));


                string[] strItembody3 = hp3.NavigateUrl.Split('=');
                hp3.Attributes.Add("onclick", string.Format("loadDoc7({0}); return false;", strItembody3[1]));
            }


            if (e.DataColumn.VisibleIndex == 6)
            {
                HyperLink hp = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HyperLink7") as HyperLink;


                HiddenField hf = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "HiddenField3") as HiddenField;


                HiddenField h1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h1") as HiddenField;
                HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;

                bool isElhagh;
                if (h2.Value == "1")
                {
                    isElhagh = true;
                }
                else
                {
                    isElhagh = false;
                }

                var ghId =h1.Value; // GharardadId(h1.Value, isElhagh);

                hf.Value = ghId.ToString();



                var info = db.spCountNazarGharardadOk(Convert.ToInt32(hf.Value)).First().Value;


                hp.NavigateUrl = "~/content/PageGharardadEblagh.aspx?project=" + hf.Value;

                string[] strItembody = hp.NavigateUrl.Split('=');
                hp.Attributes.Add("onclick", string.Format("loadDoc3({0}); return false;", strItembody[1]));

            }



            if (e.DataColumn.VisibleIndex == 12)
            {
                Image img =
                    ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Image2") as Image;
                string ghCode = img.ToolTip;

                // کنترل موجودیت قرارداد در صورتحساب
                var soorat = db.tbSooratHesabs.Count(n => n.ProjectGharardad == ghCode);
                if (soorat > 0)
                {
                    img.Visible = true;
                }
                else
                {
                    img.Visible = false;
                }

            }


            if (e.DataColumn.VisibleIndex == 11)
            {
                ImageButton btn = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "ImageButton15") as ImageButton;




                HiddenField h1 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h1") as HiddenField;
                HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;

                bool isElhagh;
                if (h2.Value == "1")
                {
                    isElhagh = true;
                }
                else
                {
                    isElhagh = false;
                }

                var ghId = h1.Value; // GharardadId(h1.Value, isElhagh);;

                btn.CommandArgument = ghId.ToString();


            }


            //----------------------------------------------------------------------
            if (e.DataColumn.VisibleIndex == 17)
            {

                //HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;
                //HiddenField h3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h3") as HiddenField;
                //Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label8") as Label;


                //int intPrId = Convert.ToInt32(h3.Value);


                //bool elhaghie = Convert.ToBoolean(h2.Value);

                //var tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thProject == intPrId && n.thIsElhaghie == elhaghie);
                //lb.Text = tarh.gPriceTolid;


            }

            if (e.DataColumn.VisibleIndex == 18)
            {

                //HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;
                //HiddenField h3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h3") as HiddenField;
                //Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label8") as Label;


                //int intPrId = Convert.ToInt32(h3.Value);


                //bool elhaghie = Convert.ToBoolean(h2.Value);

                //var tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thProject == intPrId && n.thIsElhaghie == elhaghie);
                //lb.Text = tarh.gPricePosh;


            }

            if (e.DataColumn.VisibleIndex == 20)
            {

                HiddenField h2 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h2") as HiddenField;
                HiddenField h3 = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "h3") as HiddenField;
                Label lb = ASPxGridView1.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "Label8") as Label;


                int intPrId = Convert.ToInt32(h3.Value);


                bool elhaghie = Convert.ToBoolean(h2.Value);

                var tarh = db.tbTarhPishnehadis.FirstOrDefault(n => n.thProject == intPrId && n.thIsElhaghie == elhaghie);
                lb.Text = tarh.gType;


            }





        }

        protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "soorat")
            {
                
                int ghId = Convert.ToInt32(e.KeyValue.ToString());
                var gharardad = db.tbGharardads.SingleOrDefault(n => n.ghId == ghId);
                var project = db.tbProjects.SingleOrDefault(n => n.prId == gharardad.ghProject);

                // ثبت در لیست صورتحساب
                sourceSoorat.InsertParameters["ProjectName"].DefaultValue = project.prTitle;
                sourceSoorat.InsertParameters["ProjectGharardad"].DefaultValue = gharardad.ghCode;
                sourceSoorat.InsertParameters["Nazer1"].DefaultValue = project.prVahed.Value.ToString();
                if (project.TechnicalSuvisor != null  && project.TechnicalSuvisor.HasValue)
                    sourceSoorat.InsertParameters["Nazer2"].DefaultValue = project.TechnicalSuvisor.Value.ToString();
                sourceSoorat.InsertParameters["CompanyName"].DefaultValue = project.prPeymankar.Value.ToString();
                sourceSoorat.InsertParameters["prId"].DefaultValue = project.prId.ToString();
                sourceSoorat.Insert();
                DataBind();
            }
            else if (e.CommandArgs.CommandName == "letter")
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback += (se, cert, chain, sslerror) => { return true; };
                ASPxGridView grid = (ASPxGridView)sender;
                string[] x = new string[] { "ghId", "ProjectTitle", "vahed", "peymankar", "TechnicalSuvisor", "thId", "vahedId", "TechnicalSuvisorId" };

                object[] fields = grid.GetRowValues(e.VisibleIndex, x) as object[];

                string ghId = fields[0].ToString();
                string ProjectTitle = fields[1].ToString();
                string department1 = fields[2].ToString();
                string company = fields[3].ToString();
                var department2 = fields[4].ToString();
                var thId = fields[5].ToString();
                var vahedId = fields[6].ToString();
                var TechnicalSuvisorId = fields[7].ToString();
               
                string desc = "", paNumber = "", paDate = "", paNumber0 = "", paDate0 = "";

                PersianCalendar pc = new PersianCalendar();
                DateTime thisDate = DateTime.Now.AddDays(3);

                BaseClientSymap bs = new BaseClientSymap(Page.User.Identity.Name);
                DataAccessBase db = new DataAccessBase();

                string letterName = "PageGharardad\\answer";

               
                DataTable dt1 = db.ReaderText(@"SELECT paId, paShenase, paNumber, paDate, paProject, paAct, paType, paBody 
                                                FROM tbProjectPaper 
                                                WHERE (paAct = 1) AND (paType = 25) AND (paProject = " + ghId + ")");
                if (dt1.Rows.Count > 0)
                {
                    DataRow row = dt1.Rows[0];
                    paNumber = row["paNumber"] != null ? row["paNumber"].ToString() : "";
                    paDate = row["paDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row["paDate"].ToString()), "/") : "";
                }


                DataTable dt2 = db.ReaderText(@"select * from tbNazar where nzParent=(select top 1 paid from tbProjectPaper where  paProject="+thId+" and paType=8 and paAct = 1)");
                if (dt2.Rows.Count > 0)
                {
                    DataRow row = dt2.Rows[0];
                    paNumber0 = row["nzNumber"] != null ? row["nzNumber"].ToString() : "";
                    paDate0 = row["nzDate"] != null ? CommonClass.ShamsiDate(DateTime.Parse(row["nzDate"].ToString()), "/") : "";
                    if (row["nzStatus"] != null && row["nzStatus"].ToString() == "423")
                    {
                        letterName = "PageGharardad\\noAnswer";
                    }
                }

                DataTable dt3 = db.ReaderText(@"SELECT nzId, nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent,                   nzDate, nzStatus
	                FROM tbNazar WHERE (nzAct = 1) AND (nzParent = (select paid FROM tbProjectPaper WHERE (paAct = 1) AND (paType =26) AND (paProject = " + ghId + "))) AND (nzType = 11)");
                if (dt3.Rows.Count > 0)
                {
                    DataRow row = dt3.Rows[0];
                    if (row["nzBody"] != null && row["nzBody"].ToString() != "")
                    {
                        desc = row["nzBody"].ToString();
                        letterName = letterName + "Desc";
                    }
                }


                com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] signers = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[1];
                signers[0] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO() { personId = bs.pIdHadimanesh, departmentId = bs.depIdHadimanesh };
                com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
                param1.letAccessType = "1";
                param1.letDocTypeId = bs.GetDocTypeId();
                param1.letPriorityId = bs.GetPriorityId();
                param1.letTransfer = bs.TransferType;

                param1.signers = signers;
                param1.letRegistrarDepId = bs.GetPersonDepartmentsID();

                var d = new string[] { "اداره کل تدارکات" };
               param1.receivers = bs.GetLetterReceivers(d);
                param1.letComment = "پیش نویس قرارداد - "+ProjectTitle;

               var dic = new Dictionary<string, string>();
                dic.Add("*6*", company);
                dic.Add("*0*", String.Join("/", paNumber.Split('/').Reverse()));
                dic.Add("*1*", String.Join("/", paDate.Split('/').Reverse()));
                dic.Add("*2*", ProjectTitle);
               
                dic.Add("*4*", String.Join("/", paNumber0.Split('/').Reverse()));
                dic.Add("*5*", String.Join("/", paDate0.Split('/').Reverse()));
                dic.Add("*3*", department1);
                dic.Add("*7*", desc);
                dic.Add("*8*", String.Join("/", CommonClass.ShamsiDate(thisDate, "/").Split('/').Reverse()));

                param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
                {
                    content = bs.createFile(letterName, dic)
                };
                param1.subjectIds = bs.GetSubjectIds("قرارداد");
                //var actual = "11112223333";
                var actual = bs.LetterServiceClient.insertLetter(bs.SecurityContextWTOLetterService, param1);
                // if (Nazer2 == "")
                //      Nazer2 = "-1";

                int result = db.NonQueryTxt(@"INSERT INTO [dbo].[tbGamLetterNumber]([entity],[letterNo],[paProject])
                               VALUES('PageGharardad'," + actual + "," + ghId + ")");

                Response.Write("<script>alert('پیش نویس نامه با موفقیت در سامانه گام ایجاد گردید. شماره نامه : " + actual + "')</script>");

            }
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {

                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 1))
                {
                    e.Visible = false;
                }
            }


            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                DataRow dr = ((DataRowView)(sender as ASPxGridView).GetRow(e.VisibleIndex)).Row;
                if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
                {
                    e.Visible = false;
                }
            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse();
        }
    }
}