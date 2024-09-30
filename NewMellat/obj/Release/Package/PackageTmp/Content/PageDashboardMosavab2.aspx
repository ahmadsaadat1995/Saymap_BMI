<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageDashboardMosavab2.aspx.cs" Inherits="NewMellat.Content.PageDashboardMosavab2" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" Assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc2" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div>
        <div align="center">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/refresh-icon.png" />
                    </td>
                    <td class="LeftColumn">
                        <cc1:PersianCalendar ID="PersianCalendar2" runat="server"></cc1:PersianCalendar>
                    </td>
                    <td class="RightColumn">
                        <asp:Label ID="Label4" runat="server" Text=":تاریخ پایان"></asp:Label>
                    </td>
                    <td class="LeftColumn">
                        <cc1:PersianCalendar ID="PersianCalendar1" runat="server"></cc1:PersianCalendar>
                    </td>
                    <td class="RightColumn">
                        <asp:Label ID="Label3" runat="server" Text=":تاریخ شروع"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
      <div align="center">
          <dx:ASPxRoundPanel ID="ASPxRoundPanel7" runat="server" HeaderText="داشبورد مصوب خبرگان" HorizontalAlign="Center" ShowCollapseButton="true" Width="100%">
              <HeaderStyle Font-Names="B Yekan" Font-Size="14px" ForeColor="#666666" HorizontalAlign="Center" />
              <PanelCollection>
<dx:PanelContent runat="server">
    <div>
        <div align="right">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" valign="top" dir="rtl">
                        <asp:Label ID="Label9" runat="server" CssClass="FontStyle1" Text="مهلت پاسخگویی (واحدهای بانک )"></asp:Label>
                    </td>
                    <td align="center" valign="top">
                        <asp:Label ID="Label8" runat="server" CssClass="FontStyle1" Text="(شرکت) SRS مهلت ارسال  "></asp:Label>
                    </td>
                    <td align="center" valign="top" width="200">
                        <div align="center">
                            <div align="center">
                                <dx:ASPxComboBox ID="drpPeymankar" runat="server" AnimationType="Fade" DataSourceID="sourcePeymankar" Font-Names="B Yekan" Font-Size="16px" NullText="شرکت پیمانکار" RightToLeft="True" TextField="infTitle" Theme="SoftOrange" ValueField="infId" AutoPostBack="True" OnDataBound="drpPeymankar_DataBound">
                                </dx:ASPxComboBox>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding: 5px" valign="top">
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink22" runat="server" CssClass="FontStyle2" Target="_blank">دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink19" runat="server" CssClass="FontStyle2" Target="_blank">انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink10" runat="server" CssClass="FontStyle2" Target="_blank">سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink4" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g44" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E4E7&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#555B67&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge11" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style26" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g43" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E5EA&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#59616F&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge4" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style18" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g42" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F3B030&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#343A49&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge9" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style24" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center">
                                                    <dx:ASPxGaugeControl ID="g41" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C8C8C8&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style11" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" style="padding: 5px" valign="top">
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink16" runat="server" CssClass="FontStyle2" Target="_blank">دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink13" runat="server" CssClass="FontStyle2" Target="_blank">انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink7" runat="server" CssClass="FontStyle2" Target="_blank">سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g14" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E4E7&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#555B67&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge11" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style26" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g13" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px" EnableCallbackAnimation="True">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E5EA&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#59616F&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge4" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style18" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g12" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F3B030&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#343A49&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge9" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style24" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g11" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C8C8C8&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style11" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" valign="middle" width="200">
                        <asp:Label ID="Label5" runat="server" CssClass="FontStyle1" Text="فوری" Font-Size="22px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding: 5px" valign="top">
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink23" runat="server" CssClass="FontStyle2" Target="_blank">دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink20" runat="server" CssClass="FontStyle2" Target="_blank">انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink11" runat="server" CssClass="FontStyle2" Target="_blank">سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink5" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g54" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E4E7&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#555B67&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge11" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style26" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g53" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E5EA&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#59616F&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge4" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style18" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g52" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F3B030&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#343A49&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge9" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style24" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g51" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C8C8C8&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style11" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" style="padding: 5px" valign="top">
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink17" runat="server" CssClass="FontStyle2" Target="_blank">دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink14" runat="server" CssClass="FontStyle2" Target="_blank">انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink8" runat="server" CssClass="FontStyle2" Target="_blank">سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g24" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E4E7&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#555B67&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge11" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style26" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g23" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E5EA&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#59616F&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge4" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style18" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g22" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F3B030&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#343A49&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge9" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style24" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g21" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C8C8C8&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style11" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" valign="middle" width="200">
                        <asp:Label ID="Label6" runat="server" CssClass="FontStyle1" Text="متوسط" Font-Size="22px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding: 5px" valign="top">
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel6" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink24" runat="server" CssClass="FontStyle2" Target="_blank">دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink21" runat="server" CssClass="FontStyle2" Target="_blank">انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink12" runat="server" CssClass="FontStyle2" Target="_blank">سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink6" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g64" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E4E7&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#555B67&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge11" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style26" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g63" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E5EA&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#59616F&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge4" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style18" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g62" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F3B030&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#343A49&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge9" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style24" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g61" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C8C8C8&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style11" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" style="padding: 5px" valign="top">
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink18" runat="server" CssClass="FontStyle2" Target="_blank">دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink15" runat="server" CssClass="FontStyle2" NavigateUrl="~/Content/Rep11.aspx?olv=175&amp;source=5" Target="_blank">انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink9" runat="server" CssClass="FontStyle2" Target="_blank">سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink3" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g34" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E4E7&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#555B67&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge11" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style26" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g33" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E3E5EA&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#59616F&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge4" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style18" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g32" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F3B030&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#343A49&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="digitalGauge9" Padding="26, 20, 26, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="265.8125, 99.9625" Name="digitalBackgroundLayerComponent1" ShapeType="Style24" TopLeft="26, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="g31" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C8C8C8&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style11" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" valign="middle" width="200">
                        <asp:Label ID="Label7" runat="server" CssClass="FontStyle1" Text="عادی" Font-Size="22px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding: 5px" valign="top">
                        <asp:SqlDataSource ID="sourceSum2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        COUNT(*) AS counts, CASE mosOlaviat WHEN 173 THEN N'فوری' WHEN 174 THEN N'متوسط' WHEN 175 THEN N'عادی' END AS OlaviatNamr
FROM            tbKhobreganMosavab INNER JOIN
                         tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN
                         tbProjects ON tbKhbregan.khProject = tbProjects.prId
where mosAct=1 and mosOlaviat is not null and mosAmaliatiDate is not null and mosOlaviat in (173,174,175)
and (mosDate between @sd and @ed) and prAct=1
and 
prPeymankar=@peymankar
group by mosOlaviat">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="PersianCalendar1" Name="sd" PropertyName="Text" />
                                <asp:ControlParameter ControlID="PersianCalendar2" Name="ed" PropertyName="Text" />
                                <asp:ControlParameter ControlID="drpPeymankar" Name="peymankar" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel9" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink29" runat="server" CssClass="FontStyle2" Target="_blank">جمع دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink30" runat="server" CssClass="FontStyle2" NavigateUrl="~/Content/Rep11.aspx?olv=175&amp;source=5" Target="_blank">جمع انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink31" runat="server" CssClass="FontStyle2" Target="_blank">جمع سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink32" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs5" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs6" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs7" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs8" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" style="padding: 5px" valign="top">
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel8" runat="server" ShowHeader="False" Theme="SoftOrange" Width="200px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div align="right">
                                        <table align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink25" runat="server" CssClass="FontStyle2" Target="_blank">جمع دارای تاخیر</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink26" runat="server" CssClass="FontStyle2" NavigateUrl="~/Content/Rep11.aspx?olv=175&amp;source=5" Target="_blank">جمع انجام شده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink27" runat="server" CssClass="FontStyle2" Target="_blank">جمع سررسید نشده</asp:HyperLink>
                                                </td>
                                                <td align="center">
                                                    <asp:HyperLink ID="HyperLink28" runat="server" CssClass="FontStyle2" Target="_blank">جمع کل</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs4" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs3" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs2" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                                <td align="center" width="100">
                                                    <dx:ASPxGaugeControl ID="gs1" runat="server" BackColor="White" Height="50px" LayoutInterval="6" Value="00,000" Width="120px">
                                                        <Gauges>
                                                            <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFC0C0&quot;/&gt;" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#A40000&quot;/&gt;" Bounds="6, 6, 108, 38" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                                                                <backgroundlayers>
                                                                    <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style12" TopLeft="20, 0" ZOrder="1000" />
                                                                </backgroundlayers>
                                                            </dx:DigitalGauge>
                                                        </Gauges>
                                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                    </dx:ASPxGaugeControl>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td align="center" valign="middle" width="200">&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <asp:SqlDataSource ID="sourceSum1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        COUNT(*) AS counts, CASE mosOlaviat WHEN 173 THEN N'فوری' WHEN 174 THEN N'متوسط' WHEN 175 THEN N'عادی' END AS OlaviatNamr
FROM            tbKhobreganMosavab INNER JOIN
                         tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN
                         tbProjects ON tbKhbregan.khProject = tbProjects.prId
where mosAct=1 and mosOlaviat is not null and mosErsalDate is not null and mosOlaviat in (173,174,175)
and (mosDate between @sd and @ed) and prAct=1
and 
prPeymankar=@peymankar
group by mosOlaviat">
            <SelectParameters>
                <asp:ControlParameter ControlID="PersianCalendar1" Name="sd" PropertyName="Text" />
                <asp:ControlParameter ControlID="PersianCalendar2" Name="ed" PropertyName="Text" />
                <asp:ControlParameter ControlID="drpPeymankar" Name="peymankar" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <div align="right">
        </div>
    </div>
    <div></div>
                  </dx:PanelContent>
</PanelCollection>
          </dx:ASPxRoundPanel>
    </div>

      <div>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)">
        </asp:SqlDataSource>
    </div>

    </form>
</body>
</html>
