<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="DashboardSooratHesab.aspx.cs" Inherits="NewMellat.Content.Reports.DashboardSooratHesab" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table align="center" cellpadding="4" cellspacing="5" width="100%">
        <tr>
            <td>
                <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="true" Width="200px" Font-Names="vazir" HeaderText="پیمانکاران" Theme="SoftOrange">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <div> <dx:ASPxListBox ID="drpPeymankar1" runat="server" DataSourceID="sourcePeymankar" EnableTheming="True" Font-Names="vazir" Font-Size="15px" RightToLeft="True" SelectionMode="CheckColumn" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="300px" ClientInstanceName="listbox">
    </dx:ASPxListBox></div>
     <div align="center" style="padding: 2px">
         <dx:ASPxImage ID="ASPxImage7" runat="server" ShowLoadingImage="true" ImageUrl="~/Content/images/category-item-select-icon.png">
             <ClientSideEvents Click="function(s, e) {
	listbox.SelectAll();
}" />
         </dx:ASPxImage>
     </div>
   
                        </dx:PanelContent>
</PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td>
                <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" ShowCollapseButton="true" Width="200px" Font-Names="vazir" HeaderText="واحدهای متولی" Theme="SoftOrange">
                    <HeaderStyle HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent runat="server">
    <div>
    <dx:ASPxListBox ID="drpVahed3" runat="server" DataSourceID="sourceVahed" EnableTheming="True" Font-Names="vazir" Font-Size="15px" RightToLeft="True" SelectionMode="CheckColumn" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="300px" ClientInstanceName="listbox3">
    </dx:ASPxListBox></div>

  <div align="center" style="padding: 2px">
         <dx:ASPxImage ID="ASPxImage8" runat="server" ShowLoadingImage="true" ImageUrl="~/Content/images/category-item-select-icon.png">
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
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" ProcessingMode="Remote" ShowBackButton="False" ShowFindControls="False" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" ZoomMode="PageWidth">
            <ServerReport ReportServerUrl="http://localhost/ReportServer_SQL2016" />
        </rsweb:ReportViewer>
    </div>
</asp:Content>
