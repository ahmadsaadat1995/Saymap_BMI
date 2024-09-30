<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="DashboardEdarat.aspx.cs" Inherits="NewMellat.Content.Reports.DashboardEdarat" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF;    border-radius:5px;">
    <div align="center" style="margin: 5px; border: 1px solid #CC3300; background-color: #F2FBFF;    border-radius:5px;">
    <table align="center" cellpadding="4" cellspacing="5" width="100%">
        <tr>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="true" Width="200px" Font-Names="vazir" HeaderText="پیمانکاران" Theme="SoftOrange">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <div> <dx:ASPxListBox ID="drpPeymankar0" runat="server" DataSourceID="sourcePeymankar" EnableTheming="True" Font-Names="vazir" Font-Size="15px" RightToLeft="True" SelectionMode="CheckColumn" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="300px" ClientInstanceName="listbox">
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
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" ShowCollapseButton="true" Width="200px" Font-Names="vazir" HeaderText="واحدهای متولی" Theme="SoftOrange">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <div>
    <dx:ASPxListBox ID="drpVahed2" runat="server" DataSourceID="sourceVahed" EnableTheming="True" Font-Names="vazir" Font-Size="15px" RightToLeft="True" SelectionMode="CheckColumn" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="300px" ClientInstanceName="listbox3">
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
                <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infTitle, infId FROM prInformation WHERE (infAct = 1) AND (infType = 5)"></asp:SqlDataSource>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/refresh-icon.png" OnClick="ImageButton1_Click" />
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infAct FROM prInformation WHERE (infType = 1) AND (infAct = 1)"></asp:SqlDataSource>
            </div>
<div>
</div>
<div>
    <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" Font-Names="vazir" ShowCollapseButton="true" Theme="SoftOrange" Width="200px" HeaderText="سند نیازمندی ها">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGaugeControl ID="ASPxGaugeControl2" runat="server" BackColor="White" Height="240px" Value="82" Width="360px">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 360, 240" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 8pt, style=Bold" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C00000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-15" MajorTickmark-ShapeType="Circular_Style12_1" MajorTickmark-TextOffset="7" MajorTickmark-TextOrientation="LeftToRight" MaxValue="160" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style12_2" Name="scale1" RadiusX="105" RadiusY="105" StartAngle="-180" Value="82">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.7" ScaleID="scale1" ShapeType="CircularHalf_Style12" Size="250, 178" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-7.5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style12" StartOffset="-5" ZOrder="-50" />
                </needles>
            </dx:CircularGauge>
        </Gauges>
        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
    </dx:ASPxGaugeControl>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel6" runat="server" Font-Names="vazir" ShowCollapseButton="true" Theme="SoftOrange" Width="200px" HeaderText="پروپوزال">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGaugeControl ID="ASPxGaugeControl3" runat="server" BackColor="White" Height="240px" Value="80" Width="360px">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 360, 240" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 8pt, style=Bold" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C00000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-15" MajorTickmark-ShapeType="Circular_Style12_1" MajorTickmark-TextOffset="7" MajorTickmark-TextOrientation="LeftToRight" MaxValue="900" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style12_2" Name="scale1" RadiusX="105" RadiusY="105" StartAngle="-180" Value="80">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.7" ScaleID="scale1" ShapeType="CircularHalf_Style12" Size="250, 178" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-7.5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style12" StartOffset="-5" ZOrder="-50" />
                </needles>
            </dx:CircularGauge>
        </Gauges>
        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
    </dx:ASPxGaugeControl>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" Font-Names="vazir" ShowCollapseButton="true" Theme="SoftOrange" Width="200px" HeaderText="پیش نویس قرارداد">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGaugeControl ID="ASPxGaugeControl1" runat="server" BackColor="White" Height="240px" Value="20" Width="360px">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 360, 240" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 8pt, style=Bold" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C00000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-15" MajorTickmark-ShapeType="Circular_Style12_1" MajorTickmark-TextOffset="7" MajorTickmark-TextOrientation="LeftToRight" MaxValue="200" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style12_2" MinValue="20" Name="scale1" RadiusX="105" RadiusY="105" StartAngle="-180" Value="20">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.7" ScaleID="scale1" ShapeType="CircularHalf_Style12" Size="250, 178" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-7.5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style12" StartOffset="-5" ZOrder="-50" />
                </needles>
            </dx:CircularGauge>
        </Gauges>
        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
    </dx:ASPxGaugeControl>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel9" runat="server" Font-Names="vazir" ShowCollapseButton="true" Theme="SoftOrange" Width="200px" HeaderText="صورتحساب">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGaugeControl ID="ASPxGaugeControl6" runat="server" BackColor="White" Height="240px" Value="2950" Width="360px">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 360, 240" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 8pt, style=Bold" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C00000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-15" MajorTickmark-ShapeType="Circular_Style12_1" MajorTickmark-TextOffset="7" MajorTickmark-TextOrientation="LeftToRight" MaxValue="4100" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style12_2" Name="scale1" RadiusX="105" RadiusY="105" StartAngle="-180" Value="2950">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.7" ScaleID="scale1" ShapeType="CircularHalf_Style12" Size="250, 178" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-7.5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style12" StartOffset="-5" ZOrder="-50" />
                </needles>
            </dx:CircularGauge>
        </Gauges>
        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
    </dx:ASPxGaugeControl>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td align="center">
                &nbsp;</td>
            <td align="center">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel7" runat="server" Font-Names="vazir" ShowCollapseButton="true" Theme="SoftOrange" Width="200px" HeaderText="پروتوتایپ">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGaugeControl ID="ASPxGaugeControl4" runat="server" BackColor="White" Height="240px" Value="65" Width="360px">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 360, 240" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 8pt, style=Bold" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#C00000&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="7" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-15" MajorTickmark-ShapeType="Circular_Style12_1" MajorTickmark-TextOffset="7" MajorTickmark-TextOrientation="LeftToRight" MaxValue="160" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style12_2" Name="scale1" RadiusX="105" RadiusY="105" StartAngle="-180" Value="65">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.7" ScaleID="scale1" ShapeType="CircularHalf_Style12" Size="250, 178" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="-7.5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style12" StartOffset="-5" ZOrder="-50" />
                </needles>
            </dx:CircularGauge>
        </Gauges>
        <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
    </dx:ASPxGaugeControl>
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
        </tr>
    </table>
</div>
<div>
</div>
</asp:Content>
