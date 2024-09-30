<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageBody.aspx.cs" Inherits="NewMellat.Content.pageBody" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="100px" RightToLeft="True" Theme="SoftOrange" Width="350px">
            </dx:ASPxMemo>
        </div>
        <div align="center" style="padding: 8px">
            <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت توضیحات" Theme="SoftOrange" Width="130px">
            </dx:ASPxButton>
        </div>
        <div align="center" style="padding: 2px; font-family: tahoma; font-size: 12px; color: #339933">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
