<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageGharardadCode.aspx.cs" Inherits="NewMellat.Content.PageGharardadCode" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 106px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="padding-top: 38px">
    
        <table align="center" cellpadding="0" cellspacing="0" dir="rtl">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style1" style="margin-right: 80px">
                    <dx:ASPxTextBox ID="txtG" runat="server" Theme="SoftOrange" Width="100px">
                    </dx:ASPxTextBox>
                </td>
                <td>-</td>
                <td>
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AnimationType="Fade" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="150px">
                    </dx:ASPxComboBox>
                </td>
                <td style="padding-right: 3px">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style1" height="35" style="margin-right: 80px; font-family: 'b yekan'; font-size: 11px;">
                    <asp:Label ID="Label2" runat="server" Text="مبلغ قرارداد تولید"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxTextBox ID="txtTolidPrice" runat="server" Theme="SoftOrange" Width="150px">
                    </dx:ASPxTextBox>
                </td>
                <td style="padding-right: 3px">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style1" height="35" style="margin-right: 80px; font-family: 'b yekan'; font-size: 11px;">
                    <asp:Label ID="Label3" runat="server" Text="مبلغ قرارداد پشتیبانی"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxTextBox ID="txtPoshPrice" runat="server" Theme="SoftOrange" Width="150px">
                    </dx:ASPxTextBox>
                </td>
                <td style="padding-right: 3px">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style1" height="35" style="margin-right: 80px; font-family: 'b yekan'; font-size: 11px;">
                    <asp:Label ID="Label5" runat="server" Text="مبلغ الزامات امنیتی"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxTextBox ID="ASPxTextBoxSecurity" runat="server" Theme="SoftOrange" Width="150px">
                    </dx:ASPxTextBox>
                </td>
                <td style="padding-right: 3px">&nbsp;</td>
            </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style1" height="35" style="margin-right: 80px; font-family: 'b yekan'; font-size: 11px;">
                    <asp:Label ID="Label4" runat="server" Text="نوع قرارداد"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" AnimationType="Fade" RightToLeft="True" Theme="SoftOrange" Width="150px" DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infTitle">
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infTitle From prInformation Where infType =8"></asp:SqlDataSource>
                </td>
                <td style="padding-right: 3px">&nbsp;</td>
            </tr>
        </table>
    
    </div>
        <div align="center" style="padding: 11px">
            <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت تغییرات" Theme="SoftOrange" Width="120px">
            </dx:ASPxButton>
        </div>
        <div align="center" style="padding: 4px; font-family: tahoma; color: #006600; font-size: 12px;">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
