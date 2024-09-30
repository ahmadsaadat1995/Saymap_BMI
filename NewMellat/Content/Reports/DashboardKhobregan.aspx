<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="DashboardKhobregan.aspx.cs" Inherits="NewMellat.Content.Reports.DashboardKhobregan" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF; border-radius: 5px;">
    <table align="center" cellpadding="4" cellspacing="5" width="100%">
        <tr>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="true" Width="200px" Font-Names="vazir" HeaderText="پیمانکاران" Theme="SoftOrange">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <div> <dx:ASPxListBox ID="drpPeymankar" runat="server" DataSourceID="sourcePeymankar" EnableTheming="True" Font-Names="vazir" Font-Size="15px" RightToLeft="True" SelectionMode="CheckColumn" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="300px" ClientInstanceName="listbox">
    </dx:ASPxListBox></div>
     <div align="center" style="padding: 2px">
         <dx:ASPxImage ID="ASPxImage5" runat="server" ShowLoadingImage="true" ImageUrl="~/Content/images/category-item-select-icon.png">
             <ClientSideEvents Click="function(s, e) {
	listbox.SelectAll();
}" />
         </dx:ASPxImage>
     </div>
   
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td valign="top" align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel6" runat="server" HeaderText="تاریخ برگزاری جلسه" Height="190px" ShowCollapseButton="true" Theme="SoftOrange" Width="200px">
                    <PanelCollection>
<dx:PanelContent runat="server">
    <div style="height: 45px; margin-top: 10px;">
        <table>
            <tr>
                <td>
                    <cc1:PersianCalendar ID="PersianCalendar1" runat="server" Skin="win2k_cold_1" Width="100px"></cc1:PersianCalendar>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Names="B Nazanin" Text="از تاریخ"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <cc1:PersianCalendar ID="PersianCalendar2" runat="server" Skin="win2k_cold_1" Width="100px"></cc1:PersianCalendar>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Names="B Nazanin" Text="تا تاریخ"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" ShowCollapseButton="true" Width="200px" Font-Names="vazir" HeaderText="واحدهای متولی" Theme="SoftOrange">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <div>
    <dx:ASPxListBox ID="drpVahed" runat="server" DataSourceID="sourceVahed" EnableTheming="True" Font-Names="vazir" Font-Size="15px" RightToLeft="True" SelectionMode="CheckColumn" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="300px" ClientInstanceName="listbox3">
    </dx:ASPxListBox></div>

  <div align="center" style="padding: 2px">
         <dx:ASPxImage ID="ASPxImage6" runat="server" ShowLoadingImage="true" ImageUrl="~/Content/images/category-item-select-icon.png">
             <ClientSideEvents Click="function(s, e) {
	listbox3.SelectAll();
}" />
         </dx:ASPxImage>
     </div>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
        </tr>
    </table>
    </div>
    <div>
    <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>&nbsp;</td>
            <td align="center">
                <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infTitle, infId FROM prInformation WHERE (infAct = 1) AND (infType = 5)"></asp:SqlDataSource>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/refresh-icon.png" OnClick="ImageButton1_Click" />
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infAct FROM prInformation WHERE (infType = 1) AND (infAct = 1)"></asp:SqlDataSource>

            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
  <div>
    <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Theme="SoftOrange" Width="100%" HeaderText="" HorizontalAlign="Center">
                    <PanelCollection>
<dx:PanelContent runat="server">
    <table align="center" cellpadding="4" cellspacing="2" width="100%" border="0">
        <tr align="center">
            <td valign="top">
                <dx:WebChartControl ID="WebChartControl2" runat="server" CrosshairEnabled="True" DataSourceID="Source4" Height="450px" RightToLeft="True" Width="550px" PaletteName="Aspect">
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 8.25pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="infTitle" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="infTitle" ValueDataMembersSerializable="counts">
                            <ViewSerializable>
                                <dx:PieSeriesView>
                                </dx:PieSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate>
                        <ViewSerializable>
                            <dx:PieSeriesView>
                            </dx:PieSeriesView>
                        </ViewSerializable>
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="اولویت پروژه ها" />
                    </Titles>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="Source4" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        prInformation.infTitle,count(*) as counts
FROM            tbProjects INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject INNER JOIN
                         tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN
                         prInformation ON tbProjects.prOlaviat = prInformation.infId
WHERE        (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1)
and (prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ',')) or @peymankar='-1')
and (prVahed in (SELECT * FROM fnSplitString(@vahed, ',')) or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY prInformation.infTitle">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <asp:SqlDataSource ID="Source7" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        COUNT(*) AS counts, CASE WHEN tbProjectPaper.paType = 101 THEN N'اتمام یافته' WHEN tbProjectPaper.paType = 102 THEN N'ادغام شده' WHEN tbProjectPaper.paType = 303 THEN N'لغو شده' END AS title
FROM            tbProjects INNER JOIN
                         tbProjectPaper ON tbProjects.prId = tbProjectPaper.paProject INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject
WHERE        (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType IN (101, 102, 303))
and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY tbProjectPaper.paType">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <dx:WebChartControl ID="WebChartControl44445" runat="server" CrosshairEnabled="True" DataSourceID="Source7" Height="450px" RightToLeft="True" Width="550px">
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 8.25pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="title" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="infTitle" ValueDataMembersSerializable="counts">
                            <ViewSerializable>
                                <dx:DoughnutSeriesView>
                                </dx:DoughnutSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="title" ValueDataMembersSerializable="counts">
                        <ViewSerializable>
                            <dx:DoughnutSeriesView>
                            </dx:DoughnutSeriesView>
                        </ViewSerializable>
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="وضعیت پروژه ها" />
                    </Titles>
                </dx:WebChartControl>
            </td>
            <td valign="top">
                <asp:SqlDataSource ID="Source5" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="
SELECT        prInformation.infTitle, COUNT(*) AS counts
FROM            tbProjects INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject INNER JOIN
                         tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN
                         prInformation ON tbProjects.prProjectType = prInformation.infId
WHERE        (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1)
and (prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ',')) or @peymankar='-1')
and (prVahed in (SELECT * FROM fnSplitString(@vahed, ',')) or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY prInformation.infTitle">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <dx:WebChartControl ID="WebChartControl3" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source5" Height="450px" PaletteName="Aspect" RightToLeft="True" Width="600px">
                    <Padding Left="0" Right="0" Top="0" />
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="infTitle" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="infTitle" ValueDataMembersSerializable="counts">
                            <ViewSerializable>
                                <dx:PieSeriesView>
                                </dx:PieSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate>
                        <ViewSerializable>
                            <dx:PieSeriesView>
                            </dx:PieSeriesView>
                        </ViewSerializable>
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="نوع پروژه" />
                    </Titles>
                </dx:WebChartControl>
            </td>
        </tr>
        <tr align="center">
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
        </tr>
    </table>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>

      <div>
    <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" ShowCollapseButton="true" Theme="SoftOrange" Width="100%" HeaderText="" HorizontalAlign="Center">
                    <PanelCollection>
<dx:PanelContent runat="server">
    <table align="center" cellpadding="4" cellspacing="2" width="100%" border="0">
        <tr align="center">
            <td valign="top">
                <dx:WebChartControl ID="WebChartControl44444" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source6" Height="450px" PaletteName="Concourse" RightToLeft="True" Width="600px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="years" LabelsVisibility="True" LegendName="Default Legend" LegendText="تعداد قرارداد" LegendTextPattern="{A}" Name="Series 1" ValueDataMembersSerializable="counts">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="years" ToolTipHintDataMember="counts" ValueDataMembersSerializable="counts">
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="تعداد پروژه های طرح شده در جلسه خبرکان" />
                    </Titles>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="Source6" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        SUBSTRING(tbKhbregan.khJalaseNumber, 1, 2) AS years, COUNT(*) AS counts
FROM            tbKhbregan INNER JOIN
                         tbProjects ON tbKhbregan.khProject = tbProjects.prId
WHERE        (tbKhbregan.khJalaseNumber LIKE '9%')

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY SUBSTRING(tbKhbregan.khJalaseNumber, 1, 2)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <asp:SqlDataSource ID="Source9" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        SUBSTRING(tbKhbregan.khJalaseNumber, 1, 2) AS years,  COUNT(*) AS counts, substring(convert(nvarchar,DimDate.PersianYearInt),3,2) as amaliatiDate
FROM            tbKhbregan INNER JOIN
                         tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN
                         tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN
                         DimDate ON tbKhobreganMosavab.mosAmaliatiDate = DimDate.GregorianDate
WHERE        (tbKhbregan.khJalaseNumber LIKE '9%') AND (tbKhobreganMosavab.mosAmaliatiDate IS NOT NULL) and (mosErsalDate is null)
and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY    DimDate.PersianYearInt ,SUBSTRING(tbKhbregan.khJalaseNumber, 1, 2)
 order by SUBSTRING(tbKhbregan.khJalaseNumber, 1, 2)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <dx:WebChartControl ID="WebChartControl44447" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source9" Height="450px" PaletteName="Concourse" RightToLeft="True" SeriesDataMember="years" Width="600px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"></Legend>
                    <SeriesTemplate ArgumentDataMember="amaliatiDate" LabelsVisibility="True" ToolTipHintDataMember="counts" ValueDataMembersSerializable="counts">
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="عملیاتی شدن محصول" />
                    </Titles>
                </dx:WebChartControl>
            </td>
            <td valign="top">
                <dx:WebChartControl ID="WebChartControl44446" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source8" Height="450px" PaletteName="Aspect" RightToLeft="True" Width="600px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="amaliatiDate" LabelsVisibility="True" LegendName="Default Legend" LegendText="تعداد قرارداد" LegendTextPattern="{A}" Name="Series 1" ValueDataMembersSerializable="counts">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="amaliatiDate" ToolTipHintDataMember="counts" ValueDataMembersSerializable="counts">
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="ارسال پروپوزال" />
                    </Titles>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="Source8" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT          COUNT(*) AS counts, convert(nvarchar,DimDate.PersianYearInt) as amaliatiDate
FROM            tbKhbregan INNER JOIN
                         tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN
                         tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN
                         DimDate ON tbKhobreganMosavab.mosErsalDate = DimDate.GregorianDate
WHERE        (tbKhbregan.khJalaseNumber LIKE '9%') AND mosErsalDate is not null
and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY    DimDate.PersianYearInt 
order by   DimDate.PersianYearInt ">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr align="center">
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
        </tr>
    </table>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>


</asp:Content>
