using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

/// <summary>
/// Summary description for XtraReportSooratList
/// </summary>
public class XtraReportSooratList : DevExpress.XtraReports.UI.XtraReport
{
    private DevExpress.XtraReports.UI.DetailBand Detail;
    private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private DevExpress.DataAccess.Sql.SqlDataSource sqlDataSource1;
    private PageFooterBand pageFooterBand1;
    private ReportHeaderBand reportHeaderBand1;
    private XRControlStyle Title;
    private XRControlStyle FieldCaption;
    private XRControlStyle PageInfo;
    private XRControlStyle DataField;
    private DevExpress.XtraReports.Parameters.Parameter YearGharardadStart;
    private XRLabel xrLabel1;
    private XRLabel xrLabel2;
    private ReportFooterBand ReportFooter;
    private XRLabel xrLabel3;
    private XRLabel xrLabel7;

    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    public XtraReportSooratList()
    {
        InitializeComponent();
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary> 
    /// Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Designer generated code

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
            this.components = new System.ComponentModel.Container();
            DevExpress.XtraReports.UI.XRSummary xrSummary1 = new DevExpress.XtraReports.UI.XRSummary();
            DevExpress.DataAccess.Sql.CustomSqlQuery customSqlQuery1 = new DevExpress.DataAccess.Sql.CustomSqlQuery();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter1 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter2 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter3 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter4 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter5 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter6 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter7 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter8 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter9 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter10 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter11 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter12 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter13 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter14 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter15 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter16 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter17 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter18 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter19 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter20 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter21 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter22 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter23 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter24 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter25 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter26 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter27 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter28 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter29 = new DevExpress.DataAccess.Sql.QueryParameter();
            DevExpress.DataAccess.Sql.QueryParameter queryParameter30 = new DevExpress.DataAccess.Sql.QueryParameter();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(XtraReportSooratList));
            DevExpress.XtraReports.UI.XRSummary xrSummary2 = new DevExpress.XtraReports.UI.XRSummary();
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLine1 = new DevExpress.XtraReports.UI.XRLine();
            this.xrLabel31 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel30 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel29 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel28 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel27 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel24 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel23 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel22 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel16 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel15 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.sqlDataSource1 = new DevExpress.DataAccess.Sql.SqlDataSource(this.components);
            this.pageFooterBand1 = new DevExpress.XtraReports.UI.PageFooterBand();
            this.xrPageInfo2 = new DevExpress.XtraReports.UI.XRPageInfo();
            this.reportHeaderBand1 = new DevExpress.XtraReports.UI.ReportHeaderBand();
            this.xrLabel17 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel20 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel19 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel18 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrPictureBox1 = new DevExpress.XtraReports.UI.XRPictureBox();
            this.xrLabel21 = new DevExpress.XtraReports.UI.XRLabel();
            this.Title = new DevExpress.XtraReports.UI.XRControlStyle();
            this.FieldCaption = new DevExpress.XtraReports.UI.XRControlStyle();
            this.PageInfo = new DevExpress.XtraReports.UI.XRControlStyle();
            this.DataField = new DevExpress.XtraReports.UI.XRControlStyle();
            this.YearGharardadStart = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthGharardadStart = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayGharardadStart = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearGharardadEnd = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthGharardadEnd = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayGharardadEnd = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearPaDate = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthPaDate = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayPaDate = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearPaDate2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthPaDate2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayPaDate2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearPaDate3 = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthPaDate3 = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayPaDate3 = new DevExpress.XtraReports.Parameters.Parameter();
            this.PageHeader = new DevExpress.XtraReports.UI.PageHeaderBand();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel43 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel42 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel41 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel40 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel39 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel36 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel35 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel34 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel33 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel32 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel90 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel95 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
            this.YearGharardadStart2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthGharardadStart2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayGharardadStart2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearGharardadEnd2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthGharardadEnd2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayGharardadEnd2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearPaDate3_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthPaDate3_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayPaDate3_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthPaDate2_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearPaDate2_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayPaDate2_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.DayPaDate_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.MonthPaDate_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.YearPaDate_2 = new DevExpress.XtraReports.Parameters.Parameter();
            this.ReportFooter = new DevExpress.XtraReports.UI.ReportFooterBand();
            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel2,
            this.xrLine1,
            this.xrLabel31,
            this.xrLabel30,
            this.xrLabel29,
            this.xrLabel28,
            this.xrLabel27,
            this.xrLabel24,
            this.xrLabel23,
            this.xrLabel22,
            this.xrLabel6,
            this.xrLabel16,
            this.xrLabel15,
            this.xrLabel11,
            this.xrLabel5});
            this.Detail.Dpi = 100F;
            this.Detail.HeightF = 26.12502F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrLabel2
            // 
            this.xrLabel2.Dpi = 100F;
            this.xrLabel2.Font = new System.Drawing.Font("B Titr", 8F);
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(1420.125F, 0F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(33.87531F, 23F);
            this.xrLabel2.StylePriority.UseFont = false;
            this.xrLabel2.StylePriority.UseTextAlignment = false;
            xrSummary1.FormatString = "{0:#-}";
            xrSummary1.Func = DevExpress.XtraReports.UI.SummaryFunc.RecordNumber;
            xrSummary1.Running = DevExpress.XtraReports.UI.SummaryRunning.Report;
            this.xrLabel2.Summary = xrSummary1;
            this.xrLabel2.Text = "xrLabel11";
            this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLine1
            // 
            this.xrLine1.Dpi = 100F;
            this.xrLine1.LineStyle = System.Drawing.Drawing2D.DashStyle.Dot;
            this.xrLine1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 22.99998F);
            this.xrLine1.Name = "xrLine1";
            this.xrLine1.SizeF = new System.Drawing.SizeF(1454F, 2F);
            // 
            // xrLabel31
            // 
            this.xrLabel31.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.GharardadType")});
            this.xrLabel31.Dpi = 100F;
            this.xrLabel31.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel31.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
            this.xrLabel31.Name = "xrLabel31";
            this.xrLabel31.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel31.SizeF = new System.Drawing.SizeF(81.7453F, 23F);
            this.xrLabel31.StylePriority.UseFont = false;
            this.xrLabel31.StylePriority.UseTextAlignment = false;
            this.xrLabel31.Text = "xrLabel31";
            this.xrLabel31.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel30
            // 
            this.xrLabel30.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.OnvanTahvili")});
            this.xrLabel30.Dpi = 100F;
            this.xrLabel30.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel30.LocationFloat = new DevExpress.Utils.PointFloat(81.74519F, 0F);
            this.xrLabel30.Name = "xrLabel30";
            this.xrLabel30.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel30.SizeF = new System.Drawing.SizeF(161.5388F, 23F);
            this.xrLabel30.StylePriority.UseFont = false;
            this.xrLabel30.StylePriority.UseTextAlignment = false;
            this.xrLabel30.Text = "xrLabel30";
            this.xrLabel30.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel29
            // 
            this.xrLabel29.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.MoedTahvili")});
            this.xrLabel29.Dpi = 100F;
            this.xrLabel29.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel29.LocationFloat = new DevExpress.Utils.PointFloat(243.284F, 0F);
            this.xrLabel29.Name = "xrLabel29";
            this.xrLabel29.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel29.SizeF = new System.Drawing.SizeF(89.38678F, 23F);
            this.xrLabel29.StylePriority.UseFont = false;
            this.xrLabel29.StylePriority.UseTextAlignment = false;
            this.xrLabel29.Text = "xrLabel29";
            this.xrLabel29.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel28
            // 
            this.xrLabel28.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.paDate3Persian")});
            this.xrLabel28.Dpi = 100F;
            this.xrLabel28.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel28.LocationFloat = new DevExpress.Utils.PointFloat(332.6707F, 0F);
            this.xrLabel28.Name = "xrLabel28";
            this.xrLabel28.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel28.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel28.StylePriority.UseFont = false;
            this.xrLabel28.StylePriority.UseTextAlignment = false;
            this.xrLabel28.Text = "xrLabel28";
            this.xrLabel28.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel27
            // 
            this.xrLabel27.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.paShenase3")});
            this.xrLabel27.Dpi = 100F;
            this.xrLabel27.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel27.LocationFloat = new DevExpress.Utils.PointFloat(432.6707F, 0F);
            this.xrLabel27.Name = "xrLabel27";
            this.xrLabel27.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel27.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel27.StylePriority.UseFont = false;
            this.xrLabel27.StylePriority.UseTextAlignment = false;
            this.xrLabel27.Text = "xrLabel27";
            this.xrLabel27.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel24
            // 
            this.xrLabel24.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.years")});
            this.xrLabel24.Dpi = 100F;
            this.xrLabel24.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel24.LocationFloat = new DevExpress.Utils.PointFloat(532.6707F, 0F);
            this.xrLabel24.Name = "xrLabel24";
            this.xrLabel24.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel24.SizeF = new System.Drawing.SizeF(61.69354F, 23F);
            this.xrLabel24.StylePriority.UseFont = false;
            this.xrLabel24.StylePriority.UseTextAlignment = false;
            this.xrLabel24.Text = "xrLabel24";
            this.xrLabel24.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel23
            // 
            this.xrLabel23.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.Gharardad")});
            this.xrLabel23.Dpi = 100F;
            this.xrLabel23.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel23.LocationFloat = new DevExpress.Utils.PointFloat(594.3643F, 0F);
            this.xrLabel23.Name = "xrLabel23";
            this.xrLabel23.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel23.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel23.StylePriority.UseFont = false;
            this.xrLabel23.StylePriority.UseTextAlignment = false;
            this.xrLabel23.Text = "xrLabel23";
            this.xrLabel23.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel22
            // 
            this.xrLabel22.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.CompanyName")});
            this.xrLabel22.Dpi = 100F;
            this.xrLabel22.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel22.LocationFloat = new DevExpress.Utils.PointFloat(694.3643F, 0F);
            this.xrLabel22.Name = "xrLabel22";
            this.xrLabel22.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel22.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel22.StylePriority.UseFont = false;
            this.xrLabel22.StylePriority.UseTextAlignment = false;
            this.xrLabel22.Text = "xrLabel22";
            this.xrLabel22.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel6
            // 
            this.xrLabel6.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.ProjectGharardad")});
            this.xrLabel6.Dpi = 100F;
            this.xrLabel6.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(1094.364F, 0F);
            this.xrLabel6.Name = "xrLabel6";
            this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel6.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel6.StylePriority.UseFont = false;
            this.xrLabel6.StylePriority.UseTextAlignment = false;
            this.xrLabel6.Text = "xrLabel6";
            this.xrLabel6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel16
            // 
            this.xrLabel16.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.Nazer2")});
            this.xrLabel16.Dpi = 100F;
            this.xrLabel16.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel16.LocationFloat = new DevExpress.Utils.PointFloat(794.364F, 0F);
            this.xrLabel16.Name = "xrLabel16";
            this.xrLabel16.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel16.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel16.StylePriority.UseFont = false;
            this.xrLabel16.StylePriority.UseTextAlignment = false;
            this.xrLabel16.Text = "xrLabel16";
            this.xrLabel16.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel15
            // 
            this.xrLabel15.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.Nazer1")});
            this.xrLabel15.Dpi = 100F;
            this.xrLabel15.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel15.LocationFloat = new DevExpress.Utils.PointFloat(894.3641F, 0F);
            this.xrLabel15.Name = "xrLabel15";
            this.xrLabel15.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel15.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel15.StylePriority.UseFont = false;
            this.xrLabel15.StylePriority.UseTextAlignment = false;
            this.xrLabel15.Text = "xrLabel15";
            this.xrLabel15.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel11
            // 
            this.xrLabel11.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.SoorathesbPrice")});
            this.xrLabel11.Dpi = 100F;
            this.xrLabel11.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(994.3641F, 0F);
            this.xrLabel11.Name = "xrLabel11";
            this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel11.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel11.StylePriority.UseFont = false;
            this.xrLabel11.StylePriority.UseTextAlignment = false;
            this.xrLabel11.Text = "xrLabel11";
            this.xrLabel11.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel5
            // 
            this.xrLabel5.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.ProjectName")});
            this.xrLabel5.Dpi = 100F;
            this.xrLabel5.Font = new System.Drawing.Font("B Nazanin", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(1194.364F, 0F);
            this.xrLabel5.Name = "xrLabel5";
            this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel5.SizeF = new System.Drawing.SizeF(225.7601F, 23F);
            this.xrLabel5.StylePriority.UseFont = false;
            this.xrLabel5.StylePriority.UseTextAlignment = false;
            this.xrLabel5.Text = "xrLabel5";
            this.xrLabel5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // TopMargin
            // 
            this.TopMargin.Dpi = 100F;
            this.TopMargin.HeightF = 0F;
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // BottomMargin
            // 
            this.BottomMargin.Dpi = 100F;
            this.BottomMargin.HeightF = 0F;
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // sqlDataSource1
            // 
            this.sqlDataSource1.ConnectionName = "NewMellatConnectionString";
            this.sqlDataSource1.Name = "sqlDataSource1";
            customSqlQuery1.Name = "Query";
            queryParameter1.Name = "YearGharardadStart";
            queryParameter1.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter1.Value = new DevExpress.DataAccess.Expression("[Parameters.YearGharardadStart]", typeof(string));
            queryParameter2.Name = "MonthGharardadStart";
            queryParameter2.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter2.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthGharardadStart]", typeof(string));
            queryParameter3.Name = "DayGharardadStart";
            queryParameter3.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter3.Value = new DevExpress.DataAccess.Expression("[Parameters.DayGharardadStart]", typeof(string));
            queryParameter4.Name = "YearGharardadEnd";
            queryParameter4.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter4.Value = new DevExpress.DataAccess.Expression("[Parameters.YearGharardadEnd]", typeof(string));
            queryParameter5.Name = "MonthGharardadEnd";
            queryParameter5.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter5.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthGharardadEnd]", typeof(string));
            queryParameter6.Name = "DayGharardadEnd";
            queryParameter6.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter6.Value = new DevExpress.DataAccess.Expression("[Parameters.DayGharardadEnd]", typeof(string));
            queryParameter7.Name = "YearPaDate";
            queryParameter7.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter7.Value = new DevExpress.DataAccess.Expression("[Parameters.YearPaDate]", typeof(int));
            queryParameter8.Name = "MonthPaDate";
            queryParameter8.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter8.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthPaDate]", typeof(int));
            queryParameter9.Name = "DayPaDate";
            queryParameter9.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter9.Value = new DevExpress.DataAccess.Expression("[Parameters.DayPaDate]", typeof(int));
            queryParameter10.Name = "YearPaDate2";
            queryParameter10.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter10.Value = new DevExpress.DataAccess.Expression("[Parameters.YearPaDate2]", typeof(int));
            queryParameter11.Name = "MonthPaDate2";
            queryParameter11.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter11.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthPaDate2]", typeof(int));
            queryParameter12.Name = "DayPaDate2";
            queryParameter12.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter12.Value = new DevExpress.DataAccess.Expression("[Parameters.DayPaDate2]", typeof(int));
            queryParameter13.Name = "YearPaDate3";
            queryParameter13.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter13.Value = new DevExpress.DataAccess.Expression("[Parameters.YearPaDate3]", typeof(int));
            queryParameter14.Name = "MonthPaDate3";
            queryParameter14.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter14.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthPaDate3]", typeof(int));
            queryParameter15.Name = "DayPaDate3";
            queryParameter15.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter15.Value = new DevExpress.DataAccess.Expression("[Parameters.DayPaDate3]", typeof(int));
            queryParameter16.Name = "YearGharardadStart2";
            queryParameter16.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter16.Value = new DevExpress.DataAccess.Expression("[Parameters.YearGharardadStart2]", typeof(string));
            queryParameter17.Name = "MonthGharardadStart2";
            queryParameter17.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter17.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthGharardadStart2]", typeof(string));
            queryParameter18.Name = "DayGharardadStart2";
            queryParameter18.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter18.Value = new DevExpress.DataAccess.Expression("[Parameters.DayGharardadStart2]", typeof(string));
            queryParameter19.Name = "YearGharardadEnd2";
            queryParameter19.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter19.Value = new DevExpress.DataAccess.Expression("[Parameters.YearGharardadEnd2]", typeof(string));
            queryParameter20.Name = "MonthGharardadEnd2";
            queryParameter20.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter20.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthGharardadEnd2]", typeof(string));
            queryParameter21.Name = "DayGharardadEnd2";
            queryParameter21.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter21.Value = new DevExpress.DataAccess.Expression("[Parameters.DayGharardadEnd2]", typeof(string));
            queryParameter22.Name = "YearPaDate3_2";
            queryParameter22.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter22.Value = new DevExpress.DataAccess.Expression("[Parameters.YearPaDate3_2]", typeof(int));
            queryParameter23.Name = "MonthPaDate3_2";
            queryParameter23.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter23.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthPaDate3_2]", typeof(int));
            queryParameter24.Name = "DayPaDate3_2";
            queryParameter24.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter24.Value = new DevExpress.DataAccess.Expression("[Parameters.DayPaDate3_2]", typeof(int));
            queryParameter25.Name = "MonthPaDate2_2";
            queryParameter25.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter25.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthPaDate2_2]", typeof(int));
            queryParameter26.Name = "YearPaDate2_2";
            queryParameter26.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter26.Value = new DevExpress.DataAccess.Expression("[Parameters.YearPaDate2_2]", typeof(int));
            queryParameter27.Name = "DayPaDate2_2";
            queryParameter27.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter27.Value = new DevExpress.DataAccess.Expression("[Parameters.DayPaDate2_2]", typeof(int));
            queryParameter28.Name = "DayPaDate_2";
            queryParameter28.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter28.Value = new DevExpress.DataAccess.Expression("[Parameters.DayPaDate_2]", typeof(int));
            queryParameter29.Name = "MonthPaDate_2";
            queryParameter29.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter29.Value = new DevExpress.DataAccess.Expression("[Parameters.MonthPaDate_2]", typeof(int));
            queryParameter30.Name = "YearPaDate_2";
            queryParameter30.Type = typeof(DevExpress.DataAccess.Expression);
            queryParameter30.Value = new DevExpress.DataAccess.Expression("[Parameters.YearPaDate_2]", typeof(int));
            customSqlQuery1.Parameters.Add(queryParameter1);
            customSqlQuery1.Parameters.Add(queryParameter2);
            customSqlQuery1.Parameters.Add(queryParameter3);
            customSqlQuery1.Parameters.Add(queryParameter4);
            customSqlQuery1.Parameters.Add(queryParameter5);
            customSqlQuery1.Parameters.Add(queryParameter6);
            customSqlQuery1.Parameters.Add(queryParameter7);
            customSqlQuery1.Parameters.Add(queryParameter8);
            customSqlQuery1.Parameters.Add(queryParameter9);
            customSqlQuery1.Parameters.Add(queryParameter10);
            customSqlQuery1.Parameters.Add(queryParameter11);
            customSqlQuery1.Parameters.Add(queryParameter12);
            customSqlQuery1.Parameters.Add(queryParameter13);
            customSqlQuery1.Parameters.Add(queryParameter14);
            customSqlQuery1.Parameters.Add(queryParameter15);
            customSqlQuery1.Parameters.Add(queryParameter16);
            customSqlQuery1.Parameters.Add(queryParameter17);
            customSqlQuery1.Parameters.Add(queryParameter18);
            customSqlQuery1.Parameters.Add(queryParameter19);
            customSqlQuery1.Parameters.Add(queryParameter20);
            customSqlQuery1.Parameters.Add(queryParameter21);
            customSqlQuery1.Parameters.Add(queryParameter22);
            customSqlQuery1.Parameters.Add(queryParameter23);
            customSqlQuery1.Parameters.Add(queryParameter24);
            customSqlQuery1.Parameters.Add(queryParameter25);
            customSqlQuery1.Parameters.Add(queryParameter26);
            customSqlQuery1.Parameters.Add(queryParameter27);
            customSqlQuery1.Parameters.Add(queryParameter28);
            customSqlQuery1.Parameters.Add(queryParameter29);
            customSqlQuery1.Parameters.Add(queryParameter30);
            customSqlQuery1.Sql = resources.GetString("customSqlQuery1.Sql");
            this.sqlDataSource1.Queries.AddRange(new DevExpress.DataAccess.Sql.SqlQuery[] {
            customSqlQuery1});
            this.sqlDataSource1.ResultSchemaSerializable = resources.GetString("sqlDataSource1.ResultSchemaSerializable");
            // 
            // pageFooterBand1
            // 
            this.pageFooterBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPageInfo2});
            this.pageFooterBand1.Dpi = 100F;
            this.pageFooterBand1.HeightF = 26.34042F;
            this.pageFooterBand1.Name = "pageFooterBand1";
            // 
            // xrPageInfo2
            // 
            this.xrPageInfo2.Dpi = 100F;
            this.xrPageInfo2.Font = new System.Drawing.Font("B Nazanin", 8F, System.Drawing.FontStyle.Bold);
            this.xrPageInfo2.Format = "صفحه {0} از {1}";
            this.xrPageInfo2.LocationFloat = new DevExpress.Utils.PointFloat(491.4836F, 0F);
            this.xrPageInfo2.Name = "xrPageInfo2";
            this.xrPageInfo2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrPageInfo2.SizeF = new System.Drawing.SizeF(438F, 23F);
            this.xrPageInfo2.StyleName = "PageInfo";
            this.xrPageInfo2.StylePriority.UseFont = false;
            this.xrPageInfo2.StylePriority.UseTextAlignment = false;
            this.xrPageInfo2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // reportHeaderBand1
            // 
            this.reportHeaderBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel17,
            this.xrLabel20,
            this.xrLabel19,
            this.xrLabel18,
            this.xrPictureBox1,
            this.xrLabel21});
            this.reportHeaderBand1.Dpi = 100F;
            this.reportHeaderBand1.HeightF = 57.00001F;
            this.reportHeaderBand1.Name = "reportHeaderBand1";
            // 
            // xrLabel17
            // 
            this.xrLabel17.AutoWidth = true;
            this.xrLabel17.Dpi = 100F;
            this.xrLabel17.Font = new System.Drawing.Font("B Titr", 11F);
            this.xrLabel17.LocationFloat = new DevExpress.Utils.PointFloat(1217.113F, 10.00002F);
            this.xrLabel17.Name = "xrLabel17";
            this.xrLabel17.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel17.SizeF = new System.Drawing.SizeF(178.9701F, 30.34374F);
            this.xrLabel17.StylePriority.UseFont = false;
            this.xrLabel17.StylePriority.UseTextAlignment = false;
            this.xrLabel17.Text = "سامانه یکپارچه مدیریت پروژه ها";
            this.xrLabel17.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel20
            // 
            this.xrLabel20.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.todayDate")});
            this.xrLabel20.Dpi = 100F;
            this.xrLabel20.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel20.LocationFloat = new DevExpress.Utils.PointFloat(0F, 12.93742F);
            this.xrLabel20.Name = "xrLabel20";
            this.xrLabel20.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel20.SizeF = new System.Drawing.SizeF(100F, 28.34373F);
            this.xrLabel20.StylePriority.UseFont = false;
            this.xrLabel20.Text = "xrLabel20";
            // 
            // xrLabel19
            // 
            this.xrLabel19.AutoWidth = true;
            this.xrLabel19.Dpi = 100F;
            this.xrLabel19.Font = new System.Drawing.Font("B Titr", 11F);
            this.xrLabel19.LocationFloat = new DevExpress.Utils.PointFloat(610.1051F, 12.93742F);
            this.xrLabel19.Name = "xrLabel19";
            this.xrLabel19.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel19.SizeF = new System.Drawing.SizeF(222.7201F, 30.34374F);
            this.xrLabel19.StylePriority.UseFont = false;
            this.xrLabel19.StylePriority.UseTextAlignment = false;
            this.xrLabel19.Text = "گزارش پرداختی ها";
            this.xrLabel19.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel18
            // 
            this.xrLabel18.AutoWidth = true;
            this.xrLabel18.Dpi = 100F;
            this.xrLabel18.Font = new System.Drawing.Font("B Titr", 10F);
            this.xrLabel18.LocationFloat = new DevExpress.Utils.PointFloat(1168.729F, 12.93744F);
            this.xrLabel18.Name = "xrLabel18";
            this.xrLabel18.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel18.SizeF = new System.Drawing.SizeF(48.38367F, 24.78143F);
            this.xrLabel18.StylePriority.UseFont = false;
            this.xrLabel18.StylePriority.UseTextAlignment = false;
            this.xrLabel18.Text = "(سایمپ)";
            this.xrLabel18.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrPictureBox1
            // 
            this.xrPictureBox1.Dpi = 100F;
            this.xrPictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("xrPictureBox1.Image")));
            this.xrPictureBox1.LocationFloat = new DevExpress.Utils.PointFloat(1396.083F, 0F);
            this.xrPictureBox1.Name = "xrPictureBox1";
            this.xrPictureBox1.SizeF = new System.Drawing.SizeF(47.91681F, 55.12517F);
            this.xrPictureBox1.Sizing = DevExpress.XtraPrinting.ImageSizeMode.StretchImage;
            // 
            // xrLabel21
            // 
            this.xrLabel21.AutoWidth = true;
            this.xrLabel21.Dpi = 100F;
            this.xrLabel21.Font = new System.Drawing.Font("B Titr", 11F);
            this.xrLabel21.LocationFloat = new DevExpress.Utils.PointFloat(100F, 10.9374F);
            this.xrLabel21.Name = "xrLabel21";
            this.xrLabel21.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel21.SizeF = new System.Drawing.SizeF(178.9701F, 30.34374F);
            this.xrLabel21.StylePriority.UseFont = false;
            this.xrLabel21.StylePriority.UseTextAlignment = false;
            this.xrLabel21.Text = "تاریخ گزارش:";
            this.xrLabel21.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight;
            // 
            // Title
            // 
            this.Title.BackColor = System.Drawing.Color.Transparent;
            this.Title.BorderColor = System.Drawing.Color.Black;
            this.Title.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.Title.BorderWidth = 1F;
            this.Title.Font = new System.Drawing.Font("Times New Roman", 24F);
            this.Title.ForeColor = System.Drawing.Color.Black;
            this.Title.Name = "Title";
            // 
            // FieldCaption
            // 
            this.FieldCaption.BackColor = System.Drawing.Color.Transparent;
            this.FieldCaption.BorderColor = System.Drawing.Color.Black;
            this.FieldCaption.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.FieldCaption.BorderWidth = 1F;
            this.FieldCaption.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.FieldCaption.ForeColor = System.Drawing.Color.Black;
            this.FieldCaption.Name = "FieldCaption";
            // 
            // PageInfo
            // 
            this.PageInfo.BackColor = System.Drawing.Color.Transparent;
            this.PageInfo.BorderColor = System.Drawing.Color.Black;
            this.PageInfo.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.PageInfo.BorderWidth = 1F;
            this.PageInfo.Font = new System.Drawing.Font("Times New Roman", 8F);
            this.PageInfo.ForeColor = System.Drawing.Color.Black;
            this.PageInfo.Name = "PageInfo";
            // 
            // DataField
            // 
            this.DataField.BackColor = System.Drawing.Color.Transparent;
            this.DataField.BorderColor = System.Drawing.Color.Black;
            this.DataField.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.DataField.BorderWidth = 1F;
            this.DataField.Font = new System.Drawing.Font("Times New Roman", 8F);
            this.DataField.ForeColor = System.Drawing.Color.Black;
            this.DataField.Name = "DataField";
            this.DataField.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            // 
            // YearGharardadStart
            // 
            this.YearGharardadStart.Description = "@YearGharardadStart";
            this.YearGharardadStart.Name = "YearGharardadStart";
            this.YearGharardadStart.ValueInfo = "-1";
            this.YearGharardadStart.Visible = false;
            // 
            // MonthGharardadStart
            // 
            this.MonthGharardadStart.Description = "@MonthGharardadStart";
            this.MonthGharardadStart.Name = "MonthGharardadStart";
            this.MonthGharardadStart.ValueInfo = "-1";
            this.MonthGharardadStart.Visible = false;
            // 
            // DayGharardadStart
            // 
            this.DayGharardadStart.Description = "@DayGharardadStart";
            this.DayGharardadStart.Name = "DayGharardadStart";
            this.DayGharardadStart.ValueInfo = "-1";
            this.DayGharardadStart.Visible = false;
            // 
            // YearGharardadEnd
            // 
            this.YearGharardadEnd.Description = "@YearGharardadEnd";
            this.YearGharardadEnd.Name = "YearGharardadEnd";
            this.YearGharardadEnd.ValueInfo = "-1";
            this.YearGharardadEnd.Visible = false;
            // 
            // MonthGharardadEnd
            // 
            this.MonthGharardadEnd.Description = "@MonthGharardadEnd";
            this.MonthGharardadEnd.Name = "MonthGharardadEnd";
            this.MonthGharardadEnd.ValueInfo = "-1";
            this.MonthGharardadEnd.Visible = false;
            // 
            // DayGharardadEnd
            // 
            this.DayGharardadEnd.Description = "@DayGharardadEnd";
            this.DayGharardadEnd.Name = "DayGharardadEnd";
            this.DayGharardadEnd.ValueInfo = "-1";
            this.DayGharardadEnd.Visible = false;
            // 
            // YearPaDate
            // 
            this.YearPaDate.Description = "@YearPaDate";
            this.YearPaDate.Name = "YearPaDate";
            this.YearPaDate.Type = typeof(int);
            this.YearPaDate.ValueInfo = "-1";
            this.YearPaDate.Visible = false;
            // 
            // MonthPaDate
            // 
            this.MonthPaDate.Description = "@MonthPaDate";
            this.MonthPaDate.Name = "MonthPaDate";
            this.MonthPaDate.Type = typeof(int);
            this.MonthPaDate.ValueInfo = "-1";
            this.MonthPaDate.Visible = false;
            // 
            // DayPaDate
            // 
            this.DayPaDate.Description = "@DayPaDate";
            this.DayPaDate.Name = "DayPaDate";
            this.DayPaDate.Type = typeof(int);
            this.DayPaDate.ValueInfo = "-1";
            this.DayPaDate.Visible = false;
            // 
            // YearPaDate2
            // 
            this.YearPaDate2.Description = "@YearPaDate2";
            this.YearPaDate2.Name = "YearPaDate2";
            this.YearPaDate2.Type = typeof(int);
            this.YearPaDate2.ValueInfo = "-1";
            this.YearPaDate2.Visible = false;
            // 
            // MonthPaDate2
            // 
            this.MonthPaDate2.Description = "@MonthPaDate2";
            this.MonthPaDate2.Name = "MonthPaDate2";
            this.MonthPaDate2.Type = typeof(int);
            this.MonthPaDate2.ValueInfo = "-1";
            this.MonthPaDate2.Visible = false;
            // 
            // DayPaDate2
            // 
            this.DayPaDate2.Description = "@DayPaDate2";
            this.DayPaDate2.Name = "DayPaDate2";
            this.DayPaDate2.Type = typeof(int);
            this.DayPaDate2.ValueInfo = "-1";
            this.DayPaDate2.Visible = false;
            // 
            // YearPaDate3
            // 
            this.YearPaDate3.Description = "@YearPaDate3";
            this.YearPaDate3.Name = "YearPaDate3";
            this.YearPaDate3.Type = typeof(int);
            this.YearPaDate3.ValueInfo = "-1";
            this.YearPaDate3.Visible = false;
            // 
            // MonthPaDate3
            // 
            this.MonthPaDate3.Description = "@MonthPaDate3";
            this.MonthPaDate3.Name = "MonthPaDate3";
            this.MonthPaDate3.Type = typeof(int);
            this.MonthPaDate3.ValueInfo = "-1";
            this.MonthPaDate3.Visible = false;
            // 
            // DayPaDate3
            // 
            this.DayPaDate3.Description = "@DayPaDate3";
            this.DayPaDate3.Name = "DayPaDate3";
            this.DayPaDate3.Type = typeof(int);
            this.DayPaDate3.ValueInfo = "-1";
            this.DayPaDate3.Visible = false;
            // 
            // PageHeader
            // 
            this.PageHeader.BackColor = System.Drawing.Color.WhiteSmoke;
            this.PageHeader.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel1,
            this.xrLabel43,
            this.xrLabel42,
            this.xrLabel41,
            this.xrLabel40,
            this.xrLabel39,
            this.xrLabel36,
            this.xrLabel35,
            this.xrLabel34,
            this.xrLabel33,
            this.xrLabel32,
            this.xrLabel90,
            this.xrLabel95,
            this.xrLabel4});
            this.PageHeader.Dpi = 100F;
            this.PageHeader.HeightF = 34.45833F;
            this.PageHeader.Name = "PageHeader";
            this.PageHeader.StylePriority.UseBackColor = false;
            // 
            // xrLabel1
            // 
            this.xrLabel1.Dpi = 100F;
            this.xrLabel1.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(1420.124F, 0F);
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(33.87543F, 23F);
            this.xrLabel1.StylePriority.UseFont = false;
            this.xrLabel1.StylePriority.UseTextAlignment = false;
            this.xrLabel1.Text = "ردیف";
            this.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel43
            // 
            this.xrLabel43.Dpi = 100F;
            this.xrLabel43.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel43.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
            this.xrLabel43.Name = "xrLabel43";
            this.xrLabel43.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel43.SizeF = new System.Drawing.SizeF(81.74547F, 23F);
            this.xrLabel43.StylePriority.UseFont = false;
            this.xrLabel43.StylePriority.UseTextAlignment = false;
            this.xrLabel43.Text = "نوع قرارداد";
            this.xrLabel43.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel42
            // 
            this.xrLabel42.Dpi = 100F;
            this.xrLabel42.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel42.LocationFloat = new DevExpress.Utils.PointFloat(81.74544F, 0F);
            this.xrLabel42.Name = "xrLabel42";
            this.xrLabel42.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel42.SizeF = new System.Drawing.SizeF(161.5387F, 23F);
            this.xrLabel42.StylePriority.UseFont = false;
            this.xrLabel42.StylePriority.UseTextAlignment = false;
            this.xrLabel42.Text = "عنوان تحویل";
            this.xrLabel42.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel41
            // 
            this.xrLabel41.Dpi = 100F;
            this.xrLabel41.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel41.LocationFloat = new DevExpress.Utils.PointFloat(243.2841F, 0F);
            this.xrLabel41.Name = "xrLabel41";
            this.xrLabel41.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel41.SizeF = new System.Drawing.SizeF(89.38678F, 23F);
            this.xrLabel41.StylePriority.UseFont = false;
            this.xrLabel41.StylePriority.UseTextAlignment = false;
            this.xrLabel41.Text = "موعد تحویل";
            this.xrLabel41.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel40
            // 
            this.xrLabel40.Dpi = 100F;
            this.xrLabel40.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel40.LocationFloat = new DevExpress.Utils.PointFloat(332.6713F, 0F);
            this.xrLabel40.Name = "xrLabel40";
            this.xrLabel40.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel40.SizeF = new System.Drawing.SizeF(99.99988F, 23F);
            this.xrLabel40.StylePriority.UseFont = false;
            this.xrLabel40.StylePriority.UseTextAlignment = false;
            this.xrLabel40.Text = "تاریخ تدارکات";
            this.xrLabel40.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel39
            // 
            this.xrLabel39.Dpi = 100F;
            this.xrLabel39.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel39.LocationFloat = new DevExpress.Utils.PointFloat(432.6713F, 0F);
            this.xrLabel39.Name = "xrLabel39";
            this.xrLabel39.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel39.SizeF = new System.Drawing.SizeF(99.99988F, 23F);
            this.xrLabel39.StylePriority.UseFont = false;
            this.xrLabel39.StylePriority.UseTextAlignment = false;
            this.xrLabel39.Text = "شناسه تدارکات";
            this.xrLabel39.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel36
            // 
            this.xrLabel36.Dpi = 100F;
            this.xrLabel36.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel36.LocationFloat = new DevExpress.Utils.PointFloat(532.6711F, 0F);
            this.xrLabel36.Name = "xrLabel36";
            this.xrLabel36.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel36.SizeF = new System.Drawing.SizeF(61.69373F, 23F);
            this.xrLabel36.StylePriority.UseFont = false;
            this.xrLabel36.StylePriority.UseTextAlignment = false;
            this.xrLabel36.Text = "سال";
            this.xrLabel36.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel35
            // 
            this.xrLabel35.Dpi = 100F;
            this.xrLabel35.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel35.LocationFloat = new DevExpress.Utils.PointFloat(594.3649F, 0F);
            this.xrLabel35.Name = "xrLabel35";
            this.xrLabel35.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel35.SizeF = new System.Drawing.SizeF(99.99957F, 23F);
            this.xrLabel35.StylePriority.UseFont = false;
            this.xrLabel35.StylePriority.UseTextAlignment = false;
            this.xrLabel35.Text = "نوع قرارداد";
            this.xrLabel35.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel34
            // 
            this.xrLabel34.Dpi = 100F;
            this.xrLabel34.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel34.LocationFloat = new DevExpress.Utils.PointFloat(694.3643F, 0F);
            this.xrLabel34.Name = "xrLabel34";
            this.xrLabel34.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel34.SizeF = new System.Drawing.SizeF(99.99988F, 23F);
            this.xrLabel34.StylePriority.UseFont = false;
            this.xrLabel34.StylePriority.UseTextAlignment = false;
            this.xrLabel34.Text = "پیمانکار";
            this.xrLabel34.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel33
            // 
            this.xrLabel33.Dpi = 100F;
            this.xrLabel33.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel33.LocationFloat = new DevExpress.Utils.PointFloat(794.3642F, 0F);
            this.xrLabel33.Name = "xrLabel33";
            this.xrLabel33.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel33.SizeF = new System.Drawing.SizeF(99.99988F, 23F);
            this.xrLabel33.StylePriority.UseFont = false;
            this.xrLabel33.StylePriority.UseTextAlignment = false;
            this.xrLabel33.Text = "ناظر 2";
            this.xrLabel33.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel32
            // 
            this.xrLabel32.Dpi = 100F;
            this.xrLabel32.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel32.LocationFloat = new DevExpress.Utils.PointFloat(894.3644F, 0F);
            this.xrLabel32.Name = "xrLabel32";
            this.xrLabel32.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel32.SizeF = new System.Drawing.SizeF(99.99988F, 23F);
            this.xrLabel32.StylePriority.UseFont = false;
            this.xrLabel32.StylePriority.UseTextAlignment = false;
            this.xrLabel32.Text = "ناظر 1";
            this.xrLabel32.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel90
            // 
            this.xrLabel90.Dpi = 100F;
            this.xrLabel90.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel90.LocationFloat = new DevExpress.Utils.PointFloat(1094.364F, 0F);
            this.xrLabel90.Name = "xrLabel90";
            this.xrLabel90.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel90.SizeF = new System.Drawing.SizeF(99.99988F, 23F);
            this.xrLabel90.StylePriority.UseFont = false;
            this.xrLabel90.StylePriority.UseTextAlignment = false;
            this.xrLabel90.Text = "شماره قرارداد";
            this.xrLabel90.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel95
            // 
            this.xrLabel95.Dpi = 100F;
            this.xrLabel95.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel95.LocationFloat = new DevExpress.Utils.PointFloat(1194.364F, 0F);
            this.xrLabel95.Name = "xrLabel95";
            this.xrLabel95.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel95.SizeF = new System.Drawing.SizeF(225.7603F, 23F);
            this.xrLabel95.StylePriority.UseFont = false;
            this.xrLabel95.StylePriority.UseTextAlignment = false;
            this.xrLabel95.Text = "نام پروژه";
            this.xrLabel95.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel4
            // 
            this.xrLabel4.Dpi = 100F;
            this.xrLabel4.Font = new System.Drawing.Font("B Titr", 9.75F);
            this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(994.3643F, 0F);
            this.xrLabel4.Name = "xrLabel4";
            this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel4.SizeF = new System.Drawing.SizeF(99.99988F, 23F);
            this.xrLabel4.StylePriority.UseFont = false;
            this.xrLabel4.StylePriority.UseTextAlignment = false;
            this.xrLabel4.Text = "صورتحساب";
            this.xrLabel4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // YearGharardadStart2
            // 
            this.YearGharardadStart2.Description = "YearGharardadStart2";
            this.YearGharardadStart2.Name = "YearGharardadStart2";
            this.YearGharardadStart2.ValueInfo = "-1";
            this.YearGharardadStart2.Visible = false;
            // 
            // MonthGharardadStart2
            // 
            this.MonthGharardadStart2.Description = "MonthGharardadStart2";
            this.MonthGharardadStart2.Name = "MonthGharardadStart2";
            this.MonthGharardadStart2.ValueInfo = "-1";
            this.MonthGharardadStart2.Visible = false;
            // 
            // DayGharardadStart2
            // 
            this.DayGharardadStart2.Description = "DayGharardadStart2";
            this.DayGharardadStart2.Name = "DayGharardadStart2";
            this.DayGharardadStart2.ValueInfo = "-1";
            this.DayGharardadStart2.Visible = false;
            // 
            // YearGharardadEnd2
            // 
            this.YearGharardadEnd2.Description = "YearGharardadEnd2";
            this.YearGharardadEnd2.Name = "YearGharardadEnd2";
            this.YearGharardadEnd2.ValueInfo = "-1";
            this.YearGharardadEnd2.Visible = false;
            // 
            // MonthGharardadEnd2
            // 
            this.MonthGharardadEnd2.Description = "MonthGharardadEnd2";
            this.MonthGharardadEnd2.Name = "MonthGharardadEnd2";
            this.MonthGharardadEnd2.ValueInfo = "-1";
            this.MonthGharardadEnd2.Visible = false;
            // 
            // DayGharardadEnd2
            // 
            this.DayGharardadEnd2.Description = "DayGharardadEnd2";
            this.DayGharardadEnd2.Name = "DayGharardadEnd2";
            this.DayGharardadEnd2.ValueInfo = "-1";
            this.DayGharardadEnd2.Visible = false;
            // 
            // YearPaDate3_2
            // 
            this.YearPaDate3_2.Description = "YearPaDate3_2";
            this.YearPaDate3_2.Name = "YearPaDate3_2";
            this.YearPaDate3_2.Type = typeof(int);
            this.YearPaDate3_2.ValueInfo = "-1";
            this.YearPaDate3_2.Visible = false;
            // 
            // MonthPaDate3_2
            // 
            this.MonthPaDate3_2.Description = "MonthPaDate3_2";
            this.MonthPaDate3_2.Name = "MonthPaDate3_2";
            this.MonthPaDate3_2.Type = typeof(int);
            this.MonthPaDate3_2.ValueInfo = "-1";
            this.MonthPaDate3_2.Visible = false;
            // 
            // DayPaDate3_2
            // 
            this.DayPaDate3_2.Description = "DayPaDate3_2";
            this.DayPaDate3_2.Name = "DayPaDate3_2";
            this.DayPaDate3_2.Type = typeof(int);
            this.DayPaDate3_2.ValueInfo = "-1";
            this.DayPaDate3_2.Visible = false;
            // 
            // MonthPaDate2_2
            // 
            this.MonthPaDate2_2.Description = "MonthPaDate2_2";
            this.MonthPaDate2_2.Name = "MonthPaDate2_2";
            this.MonthPaDate2_2.Type = typeof(int);
            this.MonthPaDate2_2.ValueInfo = "-1";
            this.MonthPaDate2_2.Visible = false;
            // 
            // YearPaDate2_2
            // 
            this.YearPaDate2_2.Description = "YearPaDate2_2";
            this.YearPaDate2_2.Name = "YearPaDate2_2";
            this.YearPaDate2_2.Type = typeof(int);
            this.YearPaDate2_2.ValueInfo = "-1";
            this.YearPaDate2_2.Visible = false;
            // 
            // DayPaDate2_2
            // 
            this.DayPaDate2_2.Description = "DayPaDate2_2";
            this.DayPaDate2_2.Name = "DayPaDate2_2";
            this.DayPaDate2_2.Type = typeof(int);
            this.DayPaDate2_2.ValueInfo = "-1";
            this.DayPaDate2_2.Visible = false;
            // 
            // DayPaDate_2
            // 
            this.DayPaDate_2.Description = "DayPaDate_2";
            this.DayPaDate_2.Name = "DayPaDate_2";
            this.DayPaDate_2.Type = typeof(int);
            this.DayPaDate_2.ValueInfo = "-1";
            this.DayPaDate_2.Visible = false;
            // 
            // MonthPaDate_2
            // 
            this.MonthPaDate_2.Description = "MonthPaDate_2";
            this.MonthPaDate_2.Name = "MonthPaDate_2";
            this.MonthPaDate_2.Type = typeof(int);
            this.MonthPaDate_2.ValueInfo = "-1";
            this.MonthPaDate_2.Visible = false;
            // 
            // YearPaDate_2
            // 
            this.YearPaDate_2.Description = "YearPaDate_2";
            this.YearPaDate_2.Name = "YearPaDate_2";
            this.YearPaDate_2.Type = typeof(int);
            this.YearPaDate_2.ValueInfo = "-1";
            this.YearPaDate_2.Visible = false;
            // 
            // ReportFooter
            // 
            this.ReportFooter.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel7,
            this.xrLabel3});
            this.ReportFooter.Dpi = 100F;
            this.ReportFooter.HeightF = 28.125F;
            this.ReportFooter.Name = "ReportFooter";
            // 
            // xrLabel3
            // 
            this.xrLabel3.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Query.SoorathesbPrice")});
            this.xrLabel3.Dpi = 100F;
            this.xrLabel3.Font = new System.Drawing.Font("B Titr", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(944.3643F, 0F);
            this.xrLabel3.Name = "xrLabel3";
            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 96F);
            this.xrLabel3.SizeF = new System.Drawing.SizeF(197.9167F, 23F);
            this.xrLabel3.StylePriority.UseFont = false;
            this.xrLabel3.StylePriority.UseTextAlignment = false;
            xrSummary2.FormatString = "{0:#,#}";
            xrSummary2.Running = DevExpress.XtraReports.UI.SummaryRunning.Report;
            this.xrLabel3.Summary = xrSummary2;
            this.xrLabel3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel7
            // 
            this.xrLabel7.Dpi = 100F;
            this.xrLabel7.Font = new System.Drawing.Font("B Titr", 9F);
            this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(1142.281F, 0F);
            this.xrLabel7.Name = "xrLabel7";
            this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 96F);
            this.xrLabel7.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel7.StylePriority.UseFont = false;
            this.xrLabel7.StylePriority.UseTextAlignment = false;
            this.xrLabel7.Text = "جمع صورتحساب:";
            this.xrLabel7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight;
            // 
            // XtraReportSooratList
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin,
            this.pageFooterBand1,
            this.reportHeaderBand1,
            this.PageHeader,
            this.ReportFooter});
            this.ComponentStorage.AddRange(new System.ComponentModel.IComponent[] {
            this.sqlDataSource1});
            this.DataMember = "Query";
            this.DataSource = this.sqlDataSource1;
            this.Landscape = true;
            this.Margins = new System.Drawing.Printing.Margins(100, 100, 0, 0);
            this.PageHeight = 1169;
            this.PageWidth = 1654;
            this.PaperKind = System.Drawing.Printing.PaperKind.A3Transverse;
            this.Parameters.AddRange(new DevExpress.XtraReports.Parameters.Parameter[] {
            this.YearGharardadStart,
            this.MonthGharardadStart,
            this.DayGharardadStart,
            this.YearGharardadEnd,
            this.MonthGharardadEnd,
            this.DayGharardadEnd,
            this.YearPaDate,
            this.MonthPaDate,
            this.DayPaDate,
            this.YearPaDate2,
            this.MonthPaDate2,
            this.DayPaDate2,
            this.YearPaDate3,
            this.MonthPaDate3,
            this.DayPaDate3,
            this.YearGharardadStart2,
            this.MonthGharardadStart2,
            this.DayGharardadStart2,
            this.YearGharardadEnd2,
            this.MonthGharardadEnd2,
            this.DayGharardadEnd2,
            this.YearPaDate3_2,
            this.MonthPaDate3_2,
            this.DayPaDate3_2,
            this.MonthPaDate2_2,
            this.YearPaDate2_2,
            this.DayPaDate2_2,
            this.DayPaDate_2,
            this.MonthPaDate_2,
            this.YearPaDate_2});
            this.RightToLeft = DevExpress.XtraReports.UI.RightToLeft.Yes;
            this.StyleSheet.AddRange(new DevExpress.XtraReports.UI.XRControlStyle[] {
            this.Title,
            this.FieldCaption,
            this.PageInfo,
            this.DataField});
            this.Version = "16.2";
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

    }

    #endregion

    private DevExpress.XtraReports.Parameters.Parameter MonthGharardadStart;
    private DevExpress.XtraReports.Parameters.Parameter DayGharardadStart;
    private DevExpress.XtraReports.Parameters.Parameter YearGharardadEnd;
    private DevExpress.XtraReports.Parameters.Parameter MonthGharardadEnd;
    private DevExpress.XtraReports.Parameters.Parameter DayGharardadEnd;
    private DevExpress.XtraReports.Parameters.Parameter YearPaDate;
    private DevExpress.XtraReports.Parameters.Parameter MonthPaDate;
    private DevExpress.XtraReports.Parameters.Parameter DayPaDate;
    private DevExpress.XtraReports.Parameters.Parameter YearPaDate2;
    private DevExpress.XtraReports.Parameters.Parameter MonthPaDate2;
    private DevExpress.XtraReports.Parameters.Parameter DayPaDate2;
    private DevExpress.XtraReports.Parameters.Parameter YearPaDate3;
    private DevExpress.XtraReports.Parameters.Parameter MonthPaDate3;
    private DevExpress.XtraReports.Parameters.Parameter DayPaDate3;
    private PageHeaderBand PageHeader;
    private XRPageInfo xrPageInfo2;
    private XRLabel xrLabel17;
    private XRLabel xrLabel20;
    private XRLabel xrLabel19;
    private XRLabel xrLabel18;
    private XRPictureBox xrPictureBox1;
    private XRLabel xrLabel21;
    private XRLabel xrLabel90;
    private XRLabel xrLabel95;
    private XRLabel xrLabel4;
    private XRLabel xrLabel5;
    private XRLabel xrLabel11;
    private XRLabel xrLabel16;
    private XRLabel xrLabel15;
    private XRLabel xrLabel6;
    private XRLabel xrLabel22;
    private XRLabel xrLabel23;
    private XRLabel xrLabel24;
    private XRLabel xrLabel28;
    private XRLabel xrLabel27;
    private XRLabel xrLabel30;
    private XRLabel xrLabel29;
    private XRLabel xrLabel31;
    private XRLabel xrLabel33;
    private XRLabel xrLabel32;
    private XRLabel xrLabel36;
    private XRLabel xrLabel35;
    private XRLabel xrLabel34;
    private XRLabel xrLabel43;
    private XRLabel xrLabel42;
    private XRLabel xrLabel41;
    private XRLabel xrLabel40;
    private XRLabel xrLabel39;
    private XRLine xrLine1;
    private DevExpress.XtraReports.Parameters.Parameter YearGharardadStart2;
    private DevExpress.XtraReports.Parameters.Parameter MonthGharardadStart2;
    private DevExpress.XtraReports.Parameters.Parameter DayGharardadStart2;
    private DevExpress.XtraReports.Parameters.Parameter YearGharardadEnd2;
    private DevExpress.XtraReports.Parameters.Parameter MonthGharardadEnd2;
    private DevExpress.XtraReports.Parameters.Parameter DayGharardadEnd2;
    private DevExpress.XtraReports.Parameters.Parameter YearPaDate3_2;
    private DevExpress.XtraReports.Parameters.Parameter MonthPaDate3_2;
    private DevExpress.XtraReports.Parameters.Parameter DayPaDate3_2;
    private DevExpress.XtraReports.Parameters.Parameter MonthPaDate2_2;
    private DevExpress.XtraReports.Parameters.Parameter YearPaDate2_2;
    private DevExpress.XtraReports.Parameters.Parameter DayPaDate2_2;
    private DevExpress.XtraReports.Parameters.Parameter DayPaDate_2;
    private DevExpress.XtraReports.Parameters.Parameter MonthPaDate_2;
    private DevExpress.XtraReports.Parameters.Parameter YearPaDate_2;
}
