using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content.Reports
{
    public partial class DashboardBuilderSooratHesab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DashboardSqlDataSource sqlDataSource = new DashboardSqlDataSource("Simap", "NewMellatConnectionString");

            CustomSqlQuery query = new CustomSqlQuery();
            query.Name = "صورتحساب ها";
            query.Sql = @"SELECT        vwSooratList.ProjectName AS 'نام پروژه', vwSooratList.ProjectGharardad AS 'شماره قرارداد',
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation
                               WHERE        (infId = vwSooratList.Nazer1)) AS 'ناظر اول',
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation AS prInformation_2
                               WHERE        (infId = vwSooratList.Nazer2)) AS 'ناظر دوم',
                             (SELECT        TOP (1) infTitle
                               FROM            prInformation AS prInformation_1
                               WHERE        (infId = vwSooratList.CompanyName)) AS 'نام شرکت', vwSooratList.GharardadStart AS 'شروع قرارداد', vwSooratList.GharardadEnd AS 'پایان قرارداد', vwSooratList.Gharardad AS 'نوع قرارداد', 
                         vwSooratList.Price AS 'مبلغ', vwSooratList.DoreErsali AS 'دوره ارسالی', vwSooratList.Body AS 'توضیحات', vwSooratList.BodyPapers AS 'توضیحات نامه', vwSooratList.SoorathesbPrice AS 'صورتحساب', 
                         vwSooratList.paShenase AS 'شناسه نامه پیش نویس', vwSooratList.years AS 'سال', vwSooratList.paShenase2 AS 'شناسه نامه پرداخت', vwSooratList.paShenase3 AS 'شناسه تدارکات', vwSooratList.OnvanTahvili AS 'عنوان تحویل', 
                         vwSooratList.MoedTahvili AS 'موعد تحویل', vwSooratList.GharardadType AS 'نوع قرارداد صورتحساب', vwSooratList.id AS 'کد سیستمی', DimDate.PersianYearInt AS 'سال نامه', DimDate.PersianStr AS 'تاریخ نامه', 
                         DimDate.PersianMonthNo AS 'ماه نامه', DimDate_1.PersianYearInt AS 'سال نامه پرداخت', DimDate_1.PersianStr AS 'تاریخ نامه پرداخت', DimDate_1.PersianMonthNo AS 'ماه نامه پرداخت', DimDate_2.PersianYearInt AS 'سال تدارکات', 
                         DimDate_2.PersianMonthNo AS 'ماه تدارکات', DimDate_2.PersianStr AS 'تاریخ تدارکات'
FROM            vwSooratList LEFT OUTER JOIN
                         DimDate AS DimDate_2 ON vwSooratList.paDate3 = DimDate_2.GregorianDate LEFT OUTER JOIN
                         DimDate AS DimDate_1 ON vwSooratList.paDate2 = DimDate_1.GregorianDate LEFT OUTER JOIN
                         DimDate ON vwSooratList.Expr1 = DimDate.GregorianDate
 ";


            sqlDataSource.Queries.Add(query);


            DataSourceInMemoryStorage dataSourceStorage = new DataSourceInMemoryStorage();
            dataSourceStorage.RegisterDataSource("SqlDataSource1", sqlDataSource.SaveToXml());
            ASPxDashboard1.SetDataSourceStorage(dataSourceStorage);
        }

    }
}