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
    public partial class DashboardBuilderProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DashboardSqlDataSource sqlDataSource = new DashboardSqlDataSource("Simap", "NewMellatConnectionString");

            CustomSqlQuery query = new CustomSqlQuery();
            query.Name = "پروژه ها";
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
FROM            tbProjects left JOIN
                         DimDate ON tbProjects.prRegDate = DimDate.GregorianDate
WHERE        (tbProjects.prAct = 1)
ORDER BY tbProjects.prId DESC";
 

            sqlDataSource.Queries.Add(query);


            DataSourceInMemoryStorage dataSourceStorage = new DataSourceInMemoryStorage();
           dataSourceStorage.RegisterDataSource("SqlDataSource1", sqlDataSource.SaveToXml());
            ASPxDashboard1.SetDataSourceStorage(dataSourceStorage);
        }
    }
}