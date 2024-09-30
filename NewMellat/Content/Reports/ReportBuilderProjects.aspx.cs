using DevExpress.DataAccess.ConnectionParameters;
using DevExpress.DataAccess.Sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{
    public partial class ReportBuilderProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            BindToData();


            //ASPxReportDesigner1.OpenReport(new DevExpress.XtraReports.UI.XtraReport());
            ASPxReportDesigner1.OpenReport(new XtraReportEmpty());
        }

        private void BindToData()
        {
            MsSqlConnectionParameters connectionParameters =
                        new MsSqlConnectionParameters(@"172.22.65.20\sql2016", "NewMellat", null, null, MsSqlAuthorizationType.Windows);

            var ds = new DevExpress.DataAccess.Sql.SqlDataSource(connectionParameters);


            CustomSqlQuery query = new CustomSqlQuery();
            query.Name = "لیست پروژه ها";
            query.Sql = @"SELECT        tbProjects.prId N'کد سیستمی', tbProjects.prTitle N'عنوان پروژه', tbProjects.prRegUser N'کاربر ثبت کننده', tbProjects.prBody N'توضیحات پروژه',   tbProjects.prFinalCode N'کد پروژه',
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation
                               WHERE        (infId = tbProjects.prVahed)) AS N'واحد متولی',
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation AS prInformation_4
                               WHERE        (infId = tbProjects.prProjectType)) AS N'نوع پروژه',
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation AS prInformation_3
                               WHERE        (infId = tbProjects.prSanadType)) AS N'نوع سند',
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation AS prInformation_2
                               WHERE        (infId = tbProjects.prOlaviat)) AS N'اولویت' ,
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation AS prInformation_1
                               WHERE        (infId = tbProjects.prPeymankar)) AS N'پیمانکار', DimDate.PersianStr N'تاریخ ثبت', DimDate.PersianYearInt N'سال', DimDate.PersianMonthNo N'ماه', DimDate.PersianMonthName N'نام ماه', DimDate.PersianDayInMonth N'روز'
FROM            tbProjects LEFT JOIN
                         DimDate ON tbProjects.prRegDate = DimDate.GregorianDate
WHERE        (tbProjects.prAct = 1)
ORDER BY tbProjects.prId DESC";
            ds.Queries.Add(query);
            ds.RebuildResultSchema();

            ASPxReportDesigner1.DataSources.Add("Simap Projects", ds);
        }


    }
}