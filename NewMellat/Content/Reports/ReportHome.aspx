<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="ReportHome.aspx.cs" Inherits="NewMellat.Content.Reports.ReportHome" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Dashboard.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="" ShowCollapseButton="true" Theme="SoftOrange" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <table align="center" class="dx-justification">
        <tr>
            <td align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF; border-radius: 5px;">
                <div>
                    <dx:ASPxGaugeControl ID="ASPxGaugeControl5" runat="server" BackColor="White" Height="120px" Value="605" Width="200px">
                        <Gauges>
                            <dx:CircularGauge Bounds="0, 0, 200, 120" Name="cGauge1">
                                <scales>
                                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FF8000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeType="Circular_Style3_4" MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="1560" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style3_3" Name="scale1" RadiusX="104" RadiusY="104" StartAngle="-180" Value="605">
                                    </dx:ArcScaleComponent>
                                </scales>
                                <backgroundlayers>
                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg1" ScaleCenterPos="0.5, 0.815" ScaleID="scale1" ShapeType="CircularHalf_Style3" Size="244, 152" ZOrder="1000" />
                                </backgroundlayers>
                                <needles>
                                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-8" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-50" />
                                </needles>
                                <spindlecaps>
                                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-100" />
                                </spindlecaps>
                            </dx:CircularGauge>
                        </Gauges>
                        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                    </dx:ASPxGaugeControl>
                </div>
                <div align="center">
                    <asp:Label ID="Label9" runat="server" Text="پروژه های منتهی به قرارداد"></asp:Label>
                </div>
            </td>
            <td align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF; border-radius: 5px;">
                <div>
                    <dx:ASPxGaugeControl ID="ASPxGaugeControl4" runat="server" BackColor="White" Height="120px" Value="2900" Width="200px">
                        <Gauges>
                            <dx:CircularGauge Bounds="0, 0, 200, 120" Name="cGauge1">
                                <scales>
                                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FF8000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeType="Circular_Style3_4" MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="4000" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style3_3" Name="scale1" RadiusX="104" RadiusY="104" StartAngle="-180" Value="2900">
                                    </dx:ArcScaleComponent>
                                </scales>
                                <backgroundlayers>
                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg1" ScaleCenterPos="0.5, 0.815" ScaleID="scale1" ShapeType="CircularHalf_Style3" Size="244, 152" ZOrder="1000" />
                                </backgroundlayers>
                                <needles>
                                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-8" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-50" />
                                </needles>
                                <spindlecaps>
                                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-100" />
                                </spindlecaps>
                            </dx:CircularGauge>
                        </Gauges>
                        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                    </dx:ASPxGaugeControl>
                </div>
                <div align="center">
                    <asp:Label ID="Label8" runat="server" Text="پیش نویس و صورتحساب"></asp:Label>
                </div>
            </td>
            <td align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF; border-radius: 5px;">
                <div>
                    <dx:ASPxGaugeControl ID="ASPxGaugeControl3" runat="server" BackColor="White" Height="120px" Value="210" Width="200px">
                        <Gauges>
                            <dx:CircularGauge Bounds="0, 0, 200, 120" Name="cGauge1">
                                <scales>
                                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FF8000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeType="Circular_Style3_4" MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="1460" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style3_3" Name="scale1" RadiusX="104" RadiusY="104" StartAngle="-180" Value="210">
                                    </dx:ArcScaleComponent>
                                </scales>
                                <backgroundlayers>
                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg1" ScaleCenterPos="0.5, 0.815" ScaleID="scale1" ShapeType="CircularHalf_Style3" Size="244, 152" ZOrder="1000" />
                                </backgroundlayers>
                                <needles>
                                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-8" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-50" />
                                </needles>
                                <spindlecaps>
                                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-100" />
                                </spindlecaps>
                            </dx:CircularGauge>
                        </Gauges>
                        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                    </dx:ASPxGaugeControl>
                </div>
                <div align="center">
                    <asp:Label ID="Label10" runat="server" Text="رد شدگان و متوقف شدگان خبرگان"></asp:Label>
                </div>
            </td>
            <td align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF; border-radius: 5px;">
                <div>
                    <dx:ASPxGaugeControl ID="ASPxGaugeControl2" runat="server" BackColor="White" Height="120px" Value="1240" Width="200px">
                        <Gauges>
                            <dx:CircularGauge Bounds="0, 0, 200, 120" Name="cGauge1">
                                <scales>
                                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FF8000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeType="Circular_Style3_4" MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="1460" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style3_3" Name="scale1" RadiusX="104" RadiusY="104" StartAngle="-180" Value="1240">
                                    </dx:ArcScaleComponent>
                                </scales>
                                <backgroundlayers>
                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg1" ScaleCenterPos="0.5, 0.815" ScaleID="scale1" ShapeType="CircularHalf_Style3" Size="244, 152" ZOrder="1000" />
                                </backgroundlayers>
                                <needles>
                                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-8" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-50" />
                                </needles>
                                <spindlecaps>
                                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-100" />
                                </spindlecaps>
                            </dx:CircularGauge>
                        </Gauges>
                        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                    </dx:ASPxGaugeControl>
                </div>
                <div align="center">
                    <asp:Label ID="Label2" runat="server" Text="مصوبات خبرگان"></asp:Label>
                </div>
            </td>
            <td align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF; border-radius: 5px;">
                <div>
                    <dx:ASPxGaugeControl ID="ASPxGaugeControl1" runat="server" BackColor="White" Height="120px" Value="1470" Width="200px">
                        <Gauges>
                            <dx:CircularGauge Bounds="0, 0, 200, 120" Name="cGauge1">
                                <scales>
                                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FF8000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeType="Circular_Style3_4" MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="1560" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style3_3" Name="scale1" RadiusX="104" RadiusY="104" StartAngle="-180" Value="1470">
                                    </dx:ArcScaleComponent>
                                </scales>
                                <backgroundlayers>
                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg1" ScaleCenterPos="0.5, 0.815" ScaleID="scale1" ShapeType="CircularHalf_Style3" Size="244, 152" ZOrder="1000" />
                                </backgroundlayers>
                                <needles>
                                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-8" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-50" />
                                </needles>
                                <spindlecaps>
                                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style3" ZOrder="-100" />
                                </spindlecaps>
                            </dx:CircularGauge>
                        </Gauges>
                        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                    </dx:ASPxGaugeControl>
                </div>
                <div align="center">
                    <asp:Label ID="Label7" runat="server" Text="تعداد خبرگان"></asp:Label>
                </div>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div>
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="" ShowCollapseButton="true" Theme="SoftOrange" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <table align="center" class="dx-justification">
        <tr>
            <td align="center">
                <dx:ASPxGaugeControl ID="ASPxGaugeControl15" runat="server" BackColor="White" Height="150px" Value="00,000" Width="150px">
                    <Gauges>
                        <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#20E0E0E0&quot;/&gt;" AppearanceOn-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Gray&quot;/&gt;" AppearanceOn-BorderWidth="1" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;" Bounds="0, 0, 150, 150" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                            <backgroundlayers>
                                <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style13" TopLeft="20, 0" ZOrder="1000" />
                            </backgroundlayers>
                        </dx:DigitalGauge>
                    </Gauges>
                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                </dx:ASPxGaugeControl>
                <asp:Label ID="Label6" runat="server" Text="DataSource Error"></asp:Label>
            </td>
            <td align="center">
                <dx:ASPxGaugeControl ID="ASPxGaugeControl14" runat="server" BackColor="White" Height="150px" Value="00,000" Width="150px">
                    <Gauges>
                        <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#20E0E0E0&quot;/&gt;" AppearanceOn-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Gray&quot;/&gt;" AppearanceOn-BorderWidth="1" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;" Bounds="0, 0, 150, 150" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                            <backgroundlayers>
                                <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style13" TopLeft="20, 0" ZOrder="1000" />
                            </backgroundlayers>
                        </dx:DigitalGauge>
                    </Gauges>
                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                </dx:ASPxGaugeControl>
                <asp:Label ID="Label5" runat="server" Text="DataSource Error"></asp:Label>
            </td>
            <td align="center">
                <dx:ASPxGaugeControl ID="ASPxGaugeControl13" runat="server" BackColor="White" Height="150px" Value="00,000" Width="150px">
                    <Gauges>
                        <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#20E0E0E0&quot;/&gt;" AppearanceOn-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Gray&quot;/&gt;" AppearanceOn-BorderWidth="1" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;" Bounds="0, 0, 150, 150" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                            <backgroundlayers>
                                <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style13" TopLeft="20, 0" ZOrder="1000" />
                            </backgroundlayers>
                        </dx:DigitalGauge>
                    </Gauges>
                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                </dx:ASPxGaugeControl>
                <asp:Label ID="Label4" runat="server" Text="DataSource Error"></asp:Label>
            </td>
            <td align="center">
                <dx:ASPxGaugeControl ID="ASPxGaugeControl12" runat="server" BackColor="White" Height="150px" Value="00,000" Width="150px">
                    <Gauges>
                        <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#20E0E0E0&quot;/&gt;" AppearanceOn-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Gray&quot;/&gt;" AppearanceOn-BorderWidth="1" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;" Bounds="0, 0, 150, 150" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                            <backgroundlayers>
                                <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style13" TopLeft="20, 0" ZOrder="1000" />
                            </backgroundlayers>
                        </dx:DigitalGauge>
                    </Gauges>
                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                </dx:ASPxGaugeControl>
                <asp:Label ID="Label3" runat="server" Text="DataSource Error"></asp:Label>
            </td>
            <td align="center">
                <dx:ASPxGaugeControl ID="ASPxGaugeControl10" runat="server" BackColor="White" Height="150px" Value="00,000" Width="150px">
                    <Gauges>
                        <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#20E0E0E0&quot;/&gt;" AppearanceOn-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Gray&quot;/&gt;" AppearanceOn-BorderWidth="1" AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;" Bounds="0, 0, 150, 150" DigitCount="5" Name="Gauge0" Padding="20, 20, 20, 20" Text="00,000">
                            <backgroundlayers>
                                <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" BottomRight="259.8125, 99.9625" Name="digitalBackgroundLayerComponent13" ShapeType="Style13" TopLeft="20, 0" ZOrder="1000" />
                            </backgroundlayers>
                        </dx:DigitalGauge>
                    </Gauges>
                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                </dx:ASPxGaugeControl>
                <asp:Label ID="Label1" runat="server" Text="DataSource Error"></asp:Label>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    </div>
    <div>
        <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server" DashboardSource="~/Content/Dashboards/1.xml" Height="600px" Width="100%">
        </dx:ASPxDashboardViewer>
    </div>
</asp:Content>
