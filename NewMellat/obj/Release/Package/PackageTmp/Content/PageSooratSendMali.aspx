<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageSooratSendMali.aspx.cs" Inherits="NewMellat.Content.PageSooratSendMali" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

.LeftColumn {
    font-family: "b yekan";
    font-size: 14px;
    color: #444444;
    text-decoration: none;
    font-style: normal;
    vertical-align: middle;
    text-align: right;
    padding-left: 2px;
    width: 200px;
    height: 35px;
}

.RightColumn {
    font-family: "b yekan";
    font-size: 16px;
    color: #444444;
    text-decoration: none;
    font-style: normal;
    vertical-align: middle;
    text-align: left;
    padding-left: 2px;
    width: 150px;
    height: 35px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div align="right">
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="LeftColumn">
                    <asp:Label ID="Label25" runat="server"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":شناسه صورتحساب" ID="Label4"></asp:Label>

                </td>
                <td class="LeftColumn">
                    <asp:Label ID="Label24" runat="server"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":نام شرکت" ID="Label3"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <asp:Label ID="Label26" runat="server"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":شناسنامه تایید" ID="Label6"></asp:Label>

                </td>
                <td class="LeftColumn">
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":ناظر1" ID="Label5"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <asp:Label ID="Label29" runat="server"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":شناسنامه تایید" ID="Label7"></asp:Label>

                </td>
                <td class="LeftColumn">
                    <asp:Label ID="Label28" runat="server"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":ناظر2" ID="Label8"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="LeftColumn">&nbsp;</td>
                <td class="RightColumn">
                    &nbsp;</td>
                <td class="LeftColumn">&nbsp;</td>
                <td class="RightColumn">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":مبلغ" ID="Label10"></asp:Label>

                </td>
                <td class="LeftColumn">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":سند هزینه" ID="Label9"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":مبلغ پرداختی" ID="Label13"></asp:Label>

                </td>
                <td class="LeftColumn">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":کسورات" ID="Label11"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="LeftColumn">&nbsp;</td>
                <td class="RightColumn">&nbsp;</td>
                <td class="LeftColumn">&nbsp;</td>
                <td class="RightColumn">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":شماره نامه ارسال به مالی" ID="Label18"></asp:Label>

                </td>
                <td class="LeftColumn">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":شناسه ارسال به مالی" ID="Label17"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <asp:Label ID="Label30" runat="server" ClientIDMode="AutoID"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":مهلت" ID="Label21"></asp:Label>

                </td>
                <td class="LeftColumn">
                    <cc1:PersianCalendar runat="server" Skin="win2k_cold_1" TabIndex="9" ID="PersianCalendar1"></cc1:PersianCalendar>

                </td>
                <td class="RightColumn">
                    <asp:Label runat="server" Text=":تاریخ" ID="Label20"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label23" runat="server" Text=":توضیحات"></asp:Label>
                </td>
                <td class="LeftColumn">
                <telerik:RadUpload ID="RadUpload1" Runat="server" ControlObjectsVisibility="RemoveButtons, AddButton" MaxFileInputsCount="10" Width="250px" Skin="Sunset">
                    <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                </telerik:RadUpload>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label22" runat="server" Text=":ضمایم"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    
    </div>
    </form>
</body>
</html>
