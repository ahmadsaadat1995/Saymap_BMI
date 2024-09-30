<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="DashboardProjecta.aspx.cs" Inherits="NewMellat.Content.Reports.DashboardProjecta" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 302px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF;    border-radius:5px;">
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
         <dx:ASPxImage ID="ASPxImage1" runat="server" ShowLoadingImage="true" ImageUrl="~/Content/images/category-item-select-icon.png">
             <ClientSideEvents Click="function(s, e) {
	listbox.SelectAll();
}" />
         </dx:ASPxImage>
     </div>
   
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td class="auto-style1" valign="top">
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
    <dx:ASPxListBox ID="drpVahed1" runat="server" DataSourceID="sourceVahed" EnableTheming="True" Font-Names="vazir" Font-Size="15px" RightToLeft="True" SelectionMode="CheckColumn" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="300px" ClientInstanceName="listbox3">
    </dx:ASPxListBox></div>

  <div align="center" style="padding: 2px">
         <dx:ASPxImage ID="ASPxImage3" runat="server" ShowLoadingImage="true" ImageUrl="~/Content/images/category-item-select-icon.png">
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
        <tr>
            <td align="center">
                &nbsp;</td>
            <td align="center" class="auto-style1">
                &nbsp;</td>
        </tr>
    </table>
</div>
<div  align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF;    border-radius:5px;">
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
                <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" ShowCollapseButton="true" Theme="SoftOrange" Width="100%" HeaderText="" HorizontalAlign="Center">
                    <PanelCollection>
<dx:PanelContent runat="server">
    <table align="center" cellpadding="4" cellspacing="2" width="100%" border="0">
        <tr align="center">
            <td valign="top">
                <dx:WebChartControl ID="WebChartControl44441" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source1" Height="450px" RightToLeft="True" Width="550px">
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 8.25pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="infTitle" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="infTitle" ValueDataMembersSerializable="Column1">
                            <ViewSerializable>
                                <dx:PieSeriesView>
                                </dx:PieSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="infTitle" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="آخرین وضعیت قرارداد" />
                    </Titles>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="Source1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        COUNT(tbProjects.prSt), prInformation.infTitle
FROM            tbProjects INNER JOIN
                         prInformation ON tbProjects.prSt = prInformation.infId INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject
WHERE        (tbProjects.prSt IS NOT NULL) AND (tbProjects.prAct = 1)
and (prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ',')) or @peymankar='-1')
and (prVahed in (SELECT * FROM fnSplitString(@vahed, ',')) or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')
GROUP BY tbProjects.prSt, prInformation.infTitle
ORDER BY tbProjects.prSt">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <dx:WebChartControl ID="WebChartControl44442" runat="server" CrosshairEnabled="True" DataSourceID="Source2" Height="450px" RightToLeft="True" Width="550px">
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 8.25pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="prProjectStatus" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="prProjectStatus" ValueDataMembersSerializable="Column1">
                            <ViewSerializable>
                                <dx:PieSeriesView>
                                </dx:PieSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="آخرین وضعیت اجرا" />
                    </Titles>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="Source2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        COUNT(tbProjects.prProjectStatus), tbProjects.prProjectStatus
FROM            tbProjects INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject
WHERE        (tbProjects.prProjectStatus IS NOT NULL) AND (tbProjects.prAct = 1)
and (prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ',')) or @peymankar='-1')
and (prVahed in (SELECT * FROM fnSplitString(@vahed, ',')) or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')
GROUP BY tbProjects.prProjectStatus">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <dx:WebChartControl ID="WebChartControl44443" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source3" Height="450px" RightToLeft="True" Width="600px">
                    <Padding Left="0" Right="0" Top="0" />
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="prSt2" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="prSt2" ValueDataMembersSerializable="Column1">
                            <ViewSerializable>
                                <dx:PieSeriesView>
                                </dx:PieSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="در حال اجرا" />
                    </Titles>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="Source3" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        COUNT(tbProjects.prSt2), tbProjects.prSt2
FROM            tbProjects INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject
WHERE        (tbProjects.prSt2 IS NOT NULL) AND (tbProjects.prSt2 &lt;&gt; '') AND (tbProjects.prAct = 1)
and (prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ',')) or @peymankar='-1')
and (prVahed in (SELECT * FROM fnSplitString(@vahed, ',')) or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY tbProjects.prSt2

order by prSt2">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
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
                                <dx:DoughnutSeriesView>
                                </dx:DoughnutSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate>
                        <ViewSerializable>
                            <dx:DoughnutSeriesView>
                            </dx:DoughnutSeriesView>
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
                <dx:WebChartControl ID="WebChartControl44444" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source6" Height="450px" RightToLeft="True" Width="600px" PaletteName="Green Yellow">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="years" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="years" ValueDataMembersSerializable="counts" LegendText="تعداد قرارداد">
                        </dx:Series>
                        <dx:Series LegendText="مبلغ قرارداد پشتیبانی" Name="Series 2">
                        </dx:Series>
                        <dx:Series LegendText="مبلغ قرارداد تولید" Name="Series 3">
                        </dx:Series>
                        <dx:Series LegendText="نوع قرارداد" Name="Series 4">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="years" ToolTipHintDataMember="counts" ValueDataMembersSerializable="counts">
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="وضعیت قراردادها" />
                    </Titles>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="Source6" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        COUNT(SUBSTRING(tbGharardad.ghCode, 1, 2)) AS counts, SUBSTRING(tbGharardad.ghCode, 1, 2) AS years
FROM            tbGharardad INNER JOIN
                         tbProjects ON tbGharardad.ghProject = tbProjects.prId INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject
WHERE        (tbGharardad.ghCode IS NOT NULL) AND (tbGharardad.ghAct = 1) AND (SUBSTRING(tbGharardad.ghCode, 1, 2) &gt; 92)
and (prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ',')) or @peymankar='-1')
and (prVahed in (SELECT * FROM fnSplitString(@vahed, ',')) or @vahed='-1')
and (tbKhbregan.khJalaseDate between @start and @end) or (@start='-1')

GROUP BY SUBSTRING(tbGharardad.ghCode, 1, 2)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                        <asp:Parameter DefaultValue="-1" Name="start" />
                        <asp:Parameter DefaultValue="-1" Name="end" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <dx:WebChartControl ID="WebChartControl3" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="Source5" Height="450px" PaletteName="Aspect" RightToLeft="True" Width="600px">
                    <Padding Left="0" Right="0" Top="0" />
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="True"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="infTitle" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" ToolTipHintDataMember="infTitle" ValueDataMembersSerializable="counts">
                            <ViewSerializable>
                                <dx:DoughnutSeriesView>
                                </dx:DoughnutSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate>
                        <ViewSerializable>
                            <dx:DoughnutSeriesView>
                            </dx:DoughnutSeriesView>
                        </ViewSerializable>
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Font="B Yekan, 12pt" Text="نوع پروژه" />
                    </Titles>
                </dx:WebChartControl>
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
            </td>
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
    <div style="margin-top: 25px"> 
        <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" HeaderText="" ShowCollapseButton="true" Theme="SoftOrange" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center">
                <asp:SqlDataSource ID="source7" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT   count(*)
FROM            DimDate AS DimDate_1 INNER JOIN
                         tbNazar AS tbNazar_2 ON DimDate_1.GregorianDate = tbNazar_2.nzDate INNER JOIN
                         DimDate AS DimDate_2 ON dateadd(day,7,tbNazar_2.nzDate) = DimDate_2.GregorianDate RIGHT OUTER JOIN
                         tbKhbregan INNER JOIN
                         tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN
                         tbReval INNER JOIN
                         tbProjects ON tbReval.reProject = tbProjects.prId ON tbKhbregan.khProject = tbProjects.prId ON tbNazar_2.nzParent = tbProjects.prId LEFT OUTER JOIN
                         DimDate ON tbKhobreganMosavab.mosSRS = DimDate.GregorianDate
WHERE        (tbReval.reAct = 1) AND (tbNazar_2.nzAct = 1) AND (tbNazar_2.nzType = 4000)

and  tbReval.reSanadType = 3000

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <dx:WebChartControl ID="WebChartControl44445" runat="server" CrosshairEnabled="True" DataSourceID="source7" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="Column1" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Column1">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="Column1" ToolTipHintDataMember="counts" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                </dx:WebChartControl>
            </td>
            <td align="center">
                <dx:WebChartControl ID="WebChartControl44446" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="source8" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="Column1" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Column1">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="Column1" ToolTipHintDataMember="counts" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="source8" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT    count(*)
FROM            DimDate AS DimDate_1 INNER JOIN
                         tbNazar AS tbNazar_2 ON DimDate_1.GregorianDate = tbNazar_2.nzDate INNER JOIN
                         DimDate AS DimDate_2 ON dateadd(day,14,tbNazar_2.nzDate) = DimDate_2.GregorianDate RIGHT OUTER JOIN
                         tbKhbregan INNER JOIN
                         tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN
                         tbReval INNER JOIN
                         tbProjects ON tbReval.reProject = tbProjects.prId ON tbKhbregan.khProject = tbProjects.prId ON tbNazar_2.nzParent = tbProjects.prId LEFT OUTER JOIN
                         DimDate ON tbKhobreganMosavab.mosSRS = DimDate.GregorianDate
WHERE        (tbReval.reAct = 1) AND (tbNazar_2.nzAct = 1) AND (tbNazar_2.nzType = 4000)

and  tbReval.reSanadType = 4000

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center">
                <asp:SqlDataSource ID="source9" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT    count(*)
FROM            DimDate INNER JOIN
                         tbProjectPaper ON DimDate.GregorianDate = tbProjectPaper.paDate INNER JOIN
                         tbTarhPishnehadi ON tbProjectPaper.paProject = tbTarhPishnehadi.thId INNER JOIN
                         tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId INNER JOIN
                         DimDate AS DimDate_1 ON  dateadd(day,10,paDate) = DimDate_1.GregorianDate
WHERE        (tbProjectPaper.paType = 8) AND (tbProjectPaper.paAct = 1) AND (tbTarhPishnehadi.thAct = 1) AND (tbProjects.irIsAnalyz = 0) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prEstelamIsSubmit = 1) AND 
                         (tbTarhPishnehadi.thIsCancle = 0) and
                         (tbTarhPishnehadi.thAct = 1) AND (tbProjects.irIsAnalyz = 0) AND (tbProjects.prIsMohtava = 0) AND (tbTarhPishnehadi.thIsCancle = 0) AND (tbTarhPishnehadi.thIsElhaghie = 1)
and
paid
  in (
select tbProjectPaper.paId  from tbProjectPaper where paAct=1 and paType=8
EXCEPT 

(SELECT        tbProjectPaper.paId 
FROM            tbProjectPaper INNER JOIN
                         tbNazar ON tbProjectPaper.paId = tbNazar.nzParent
WHERE        (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = 8) AND (tbNazar.nzType = 10) AND (tbNazar.nzAct = 1))
)

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <dx:WebChartControl ID="WebChartControl44447" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="source9" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="Column1" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Column1">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="Column1" ToolTipHintDataMember="counts" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                </dx:WebChartControl>
            </td>
            <td align="center">
                <dx:WebChartControl ID="WebChartControl44448" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="source10" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="Column1" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Column1">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="Column1" ToolTipHintDataMember="counts" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="source10" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT     count(*)
FROM            DimDate AS DimDate_1 RIGHT OUTER JOIN
                         tbProjectPaper ON DimDate_1.GregorianDate =dateadd(day,5, tbProjectPaper.paDate) LEFT OUTER JOIN
                         DimDate ON tbProjectPaper.paDate = DimDate.GregorianDate RIGHT OUTER JOIN
                         tbProjects INNER JOIN
                         tbGharardad ON tbProjects.prId = tbGharardad.ghProject INNER JOIN
                         tbTarhPishnehadi ON tbGharardad.ghProject = tbTarhPishnehadi.thProject ON tbProjectPaper.paProject = tbGharardad.ghId
WHERE        (tbGharardad.ghAct = 1) AND (tbProjectPaper.paType = 26) AND (tbProjectPaper.paAct = 1)and
 prid
 in
(SELECT        tbGharardad.ghProject
FROM            tbGharardad INNER JOIN
                         tbProjects ON tbGharardad.ghProject = tbProjects.prId
WHERE        (tbGharardad.ghProject = tbProjects.prId) AND (tbGharardad.ghCode IS NULL))

and
  ghProject in 

(
SELECT        tbProjectPaper.paProject from tbProjectPaper where (tbProjectPaper.paType = 26) AND (tbProjectPaper.paAct = 1)
EXCEPT 
(
SELECT        tbProjectPaper.paId
FROM            tbNazar INNER JOIN
                         tbProjectPaper ON tbNazar.nzParent = tbProjectPaper.paId
WHERE        (tbNazar.nzAct = 1) AND (tbNazar.nzType = 11) AND (tbProjectPaper.paType = 26) AND (tbProjectPaper.paAct = 1)
)
)

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center">
                <dx:WebChartControl ID="WebChartControl44452" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="source11" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="Column1" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Column1">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="Column1" ToolTipHintDataMember="counts" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="source11" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT  count(*) 
 
FROM            tbProjects INNER JOIN
                         tbTarhPishnehadi ON tbProjects.prId = tbTarhPishnehadi.thProject
					 
						 where thid in
(
SELECT        tbTarhPishnehadi.thId
FROM            tbProjectPaper INNER JOIN
                         tbTarhPishnehadi ON tbProjectPaper.paProject = tbTarhPishnehadi.thId
						 where paAct=1 and paType=9

						 except
 
SELECT          tbTarhPishnehadi.thId
FROM            tbProjectPaper INNER JOIN
                         tbTarhPishnehadi ON tbProjectPaper.paProject = tbTarhPishnehadi.thId
						 where paAct=1 and paType=10


						 )

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center">
                <dx:WebChartControl ID="WebChartControl44449" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="source12" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="Column1" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Column1">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="Column1" ToolTipHintDataMember="counts" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="source12" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT  count(*)
FROM            tbGharardad INNER JOIN
                         tbProjects ON tbGharardad.ghProject = tbProjects.prId
where  ghId not in 
(
SELECT        tbGharardad.ghId
FROM            tbGharardad INNER JOIN
                         tbProjectPaper ON tbGharardad.ghId = tbProjectPaper.paProject
WHERE        (tbProjectPaper.paType = 25)
)
and 
ghCode is null

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center">
                <dx:WebChartControl ID="WebChartControl44451" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="source13" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="Column1" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Column1">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="Column1" ToolTipHintDataMember="counts" ValueDataMembersSerializable="Column1">
                    </SeriesTemplate>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="source13" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT        COUNT(*) 
FROM            tbTarhPishnehadi INNER JOIN
                         tbGharardad AS tbGharardad_1 ON tbTarhPishnehadi.thProject = tbGharardad_1.ghProject INNER JOIN
                         tbProjectPaper ON tbGharardad_1.ghId = tbProjectPaper.paProject INNER JOIN
                         tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId LEFT OUTER JOIN
                         DimDate AS DimDate_1 ON DATEADD(day, 3, tbProjectPaper.paDate) = DimDate_1.GregorianDate LEFT OUTER JOIN
                         DimDate ON tbProjectPaper.paDate = DimDate.GregorianDate
						 WHERE        (tbGharardad_1.ghCode IS NULL) AND (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = 27)
and  
  
 thProject in (
select tbTarhPishnehadi.thProject from tbTarhPishnehadi
intersect 
select ghProject from tbGharardad
)

and (tbProjects.prPeymankar in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')
and (tbProjects.prVahed in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center">
                <dx:WebChartControl ID="WebChartControl44450" runat="server" AutoLayout="True" CrosshairEnabled="True" DataSourceID="source14" Height="200px" PaletteName="Aspect" RightToLeft="True" Width="100px">
                    <Padding Left="0" Right="0" Top="0" />
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX LabelVisibilityMode="AutoGeneratedAndCustom" Visibility="True" VisibleInPanesSerializable="-1">
                                <Label Visible="False">
                                </Label>
                            </AxisX>
                            <AxisY Visibility="False" VisibleInPanesSerializable="-1">
                                <VisualRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                                <WholeRange Auto="False" MaxValueSerializable="150" MinValueSerializable="0" />
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="RightToLeft" Font="Tahoma, 6.75pt" Name="Default Legend" Visibility="False"><Title Text="daaaasTitle"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="counts" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="counts">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="counts" ToolTipHintDataMember="counts" ValueDataMembersSerializable="counts">
                    </SeriesTemplate>
                </dx:WebChartControl>
                <asp:SqlDataSource ID="source14" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT     count(*) as counts 
FROM            tbSooratHesab INNER JOIN
                         tbSooratPishNevis ON tbSooratHesab.id = tbSooratPishNevis.pishProject LEFT OUTER JOIN
                         prInformation AS [شرکت پیمانکار] ON tbSooratHesab.CompanyName = [شرکت پیمانکار].infId LEFT OUTER JOIN
                         prInformation AS ناظر2 ON tbSooratHesab.Nazer2 = ناظر2.infId LEFT OUTER JOIN
                         prInformation AS ناظر1 ON tbSooratHesab.Nazer1 = ناظر1.infId

						 WHERE        (tbSooratPishNevis.pishAct = 1) AND (tbSooratPishNevis.pishIsNazer = 1)
and 
	id not in (select paProject from tbProjectPaper where paProject=tbSooratHesab.id and paAct=1 and paType in (1003,1004) and paEdare=1 )

	and 
	id not in (select paProject from tbProjectPaper where paProject=tbSooratHesab.id and paAct=1 and paType in (1003,1004) and paEdare=2 )

	
and (tbSooratHesab.CompanyName in (SELECT * FROM fnSplitString(@peymankar, ','))  or @peymankar='-1')

and ((tbSooratHesab.Nazer1 in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1')
or
(tbSooratHesab.Nazer2 in (SELECT * FROM fnSplitString(@vahed, ','))  or @vahed='-1'))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="-1" Name="peymankar" />
                        <asp:Parameter DefaultValue="-1" Name="vahed" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label3" runat="server" Text="سند نیازمندیها (SRS)"></asp:Label>
            </td>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label4" runat="server" Text="پروتوتایپ"></asp:Label>
            </td>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label5" runat="server" Text="منتظر پاسخ استعلام"></asp:Label>
            </td>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label6" runat="server" Text="منتظر پاسخ استعلام پیش تویس قرارداد"></asp:Label>
            </td>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label7" runat="server" Text="منتظر تدارکات - آنالیز قیمت"></asp:Label>
            </td>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label8" runat="server" Text="منتظر پیش نویس قرارداد"></asp:Label>
            </td>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label9" runat="server" Text="منتظر ابلاغ قرارداد"></asp:Label>
            </td>
            <td align="center" style="padding: 6px 0px 9px 0px; font-family: 'b titr'">
                <asp:Label ID="Label10" runat="server" Text="منتظر پاسخ ناظر"></asp:Label>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    </div>


</asp:Content>
