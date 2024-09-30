using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace NewMellat.Content.Reports
{
    public partial class ReportLoader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.IsInRole("admins"))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            var qs = Request.QueryString["act"];
            if (qs == "ReportNoEstelam")
            {
                XtraReportNoEstelam report = new XtraReportNoEstelam();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "EstelamPending")
            {

            }
            else if (qs == "Cancle")
            {
                XtraReportCancle report = new XtraReportCancle();
                ASPxWebDocumentViewer1.OpenReport(report);

            }
            else if (qs == "KhobreganEtmam")
            {
                XtraReportKhobreganEtmam report = new XtraReportKhobreganEtmam();
                ASPxWebDocumentViewer1.OpenReport(report);

            }
            else if (qs == "KhobreganPending")
            {
                XtraReportKhobreganPending report = new XtraReportKhobreganPending();
                ASPxWebDocumentViewer1.OpenReport(report);

            }
            else if (qs == "AnalyzWaiting")
            {
                XtraReportAnalyzWaiting report = new XtraReportAnalyzWaiting();
                ASPxWebDocumentViewer1.OpenReport(report);

            }
            else if (qs == "KhobreganEdgham")
            {
                XtraReportKhobreganEdgham report = new XtraReportKhobreganEdgham();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "KhobreganLaghv")
            {
                XtraReportKhobreganLaghv report = new XtraReportKhobreganLaghv();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "KhobreganMosavab")
            {
                XtraReportKhobreganMosavab report = new XtraReportKhobreganMosavab();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "ReportGharardad")
            {
                XtraReportGharardad report = new XtraReportGharardad();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "KhobreganRad")
            {
                XtraReportKhobreganRad report = new XtraReportKhobreganRad();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "1")
            {
                XtraReport1 report = new XtraReport1();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "WaitingAnswers")
            {
                XtraReportWaitingAnswers report = new XtraReportWaitingAnswers();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "RevalWaitingProto")
            {
                XtraReportRevalWaitingProto report = new XtraReportRevalWaitingProto();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "RevalWaitingProtoAnswer")
            {
                XtraReportRevalWaitingProtoAnswer report = new XtraReportRevalWaitingProtoAnswer();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "RevalWaitingSrs")
            {
                XtraReportRevalWaitingSrs report = new XtraReportRevalWaitingSrs();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "RevalWaitingSrsAnswer")
            {
                XtraReportRevalWaitingSrsAnswer report = new XtraReportRevalWaitingSrsAnswer();
                ASPxWebDocumentViewer1.OpenReport(report);
            }

            else if (qs == "WaitingPishnevis")
            {
                XtraReportWaitingPishnevis report = new XtraReportWaitingPishnevis();
                ASPxWebDocumentViewer1.OpenReport(report);
            }

            else if (qs == "WaitingEstelamAnswers")
            {
                var report = new XtraReportXtraReportWaitingEstelamAnswers();
                ASPxWebDocumentViewer1.OpenReport(report);
            }

            else if (qs == "GharardadEblagh")
            {
                var report = new XtraReportGharardadEblagh();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "Reval")
            {
                var report = new XtraReportReval();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "Reval2")
            {
                var report = new XtraReportReval2();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "SooratHesabTahvili")
            {
                var report = new XtraReportSooratHesabTahvili();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "SooratHesabWaitAnswerNazer")
            {
                var report = new XtraReportSooratHesabWaitAnswerNazer();
                ASPxWebDocumentViewer1.OpenReport(report);
            }

            else if (qs == "SooratHesabWaitAnswerCompany")
            {
                var report = new XtraReportSooratHesabWaitAnswerCompany();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "SooratMaliTadarokat")
            {
                var report = new XtraReportSooratMaliTadarokat();
                ASPxWebDocumentViewer1.OpenReport(report);
            }
            else if (qs == "BehCapacity")
            {
                //var report = new();
                //ASPxWebDocumentViewer1.OpenReport(report);
            }



        }
    }
}