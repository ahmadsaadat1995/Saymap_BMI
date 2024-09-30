<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="ReportSooratList.aspx.cs" Inherits="NewMellat.Content.Reports.ReportSooratList" %>
<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 3px">

        <br />

        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Width="100%" HeaderText="" Theme="SoftOrange">
            <PanelCollection>
<dx:PanelContent runat="server">

        <table align="center" cellpadding="0" cellspacing="0" dir="ltr">
            <tr>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar2" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label1" runat="server" Text=":شروع قرارداد تا"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar1" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label2" runat="server" Text=":شروع قرارداد از"></asp:Label>
                </td>
                <td class="RightColumn2">
                    <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" CheckState="Unchecked" Theme="SoftOrange">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar4" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label8" runat="server" Text=":پایان قرارداد تا"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar3" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label9" runat="server" Text=":پایان قرارداد از"></asp:Label>
                </td>
                <td class="RightColumn2">
                    <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" CheckState="Unchecked" Theme="SoftOrange">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar6" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label10" runat="server" Text=":تاریخ نامه تا"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar5" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label11" runat="server" Text=":تاریخ نامه از"></asp:Label>
                </td>
                <td class="RightColumn2">
                    <dx:ASPxCheckBox ID="ASPxCheckBox3" runat="server" CheckState="Unchecked" Theme="SoftOrange">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar8" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label13" runat="server" Text=":تاریخ پرداخت تا"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar7" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label12" runat="server" Text=":تاریخ پرداخت از"></asp:Label>
                </td>
                <td class="RightColumn2">
                    <dx:ASPxCheckBox ID="ASPxCheckBox4" runat="server" CheckState="Unchecked" Theme="SoftOrange">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar10" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label15" runat="server" Text=":تاریخ تدارکات تا"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <cc1:PersianCalendar ID="PersianCalendar9" runat="server"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label14" runat="server" Text=":تاریخ تدارکات از"></asp:Label>
                </td>
                <td class="RightColumn2">
                    <dx:ASPxCheckBox ID="ASPxCheckBox5" runat="server" CheckState="Unchecked" Theme="SoftOrange">
                    </dx:ASPxCheckBox>
                </td>
            </tr>
        </table>


</dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div align="center" style="padding: 9px">
        
        <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="vazir" OnClick="ASPxButton1_Click" Text="نمایش اطلاعات" Theme="SoftOrange" Width="130px">
        </dx:ASPxButton>
    </div>
        <div>
            <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" ColorScheme="dark">
            </dx:ASPxWebDocumentViewer>
    </div>
        <div>
    </div>
</asp:Content>
