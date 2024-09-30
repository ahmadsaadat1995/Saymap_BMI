<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageIndex3.aspx.cs" Inherits="NewMellat.Content.PageIndex3" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

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
    <div align="center">
    

    <div style="height: 100px" align="right" id="dv4" runat="server">


        <table align="right" cellpadding="0" cellspacing="0">
            <tr>
                <td class="LeftColumn">&nbsp;</td>
                <td class="RightColumn">&nbsp;</td>
                <td class="LeftColumn">
                    <dx:ASPxTextBox ID="txtShenase13" runat="server" Theme="SoftOrange" Width="140px" TabIndex="7" Height="25px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label34" runat="server" Text=":نام واحد درخواست کننده"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="LeftColumn">
                    <dx:ASPxTextBox ID="txtShenase15" runat="server" Theme="SoftOrange" Width="140px" TabIndex="7" Height="25px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label36" runat="server" Text=":برآورد هزینه"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <dx:ASPxTextBox ID="txtShenase14" runat="server" Theme="SoftOrange" Width="140px" TabIndex="7" Height="25px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label35" runat="server" Text=":نام و نام خانوادگی شخص مسئول"></asp:Label>
                </td>
            </tr>
        </table>


    </div>

    </div>

    <div align="right" style="height: 400px;" id="dv5" runat="server">


        <div align="right">
            <table align="right" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">
                        &nbsp;</td>
                    <td class="RightColumn">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">
                        &nbsp;</td>
                    <td class="RightColumn">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">&nbsp;</td>
                    <td class="RightColumn">&nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">
                        &nbsp;</td>
                    <td class="RightColumn">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">
                        &nbsp;</td>
                    <td class="RightColumn">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">
                        <dx:ASPxMemo ID="ASPxMemo6" runat="server" Height="41px" RightToLeft="True" Theme="SoftOrange" Width="600px">
                        </dx:ASPxMemo>
                    </td>
                    <td class="RightColumn">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">
                        <dx:ASPxMemo ID="ASPxMemo7" runat="server" Height="41px" RightToLeft="True" Theme="SoftOrange" Width="600px">
                        </dx:ASPxMemo>
                    </td>
                    <td class="RightColumn">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-top: 2px; padding-bottom: 2px">
                        <dx:ASPxMemo ID="ASPxMemo8" runat="server" Height="41px" RightToLeft="True" Theme="SoftOrange" Width="600px">
                        </dx:ASPxMemo>
                    </td>
                    <td class="RightColumn">
                        &nbsp;</td>
                </tr>
            </table>
        </div>


    </div>
        <div align="center" style="padding: 5px">
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ثبت اطلاعات" Theme="SoftOrange" Width="150px">
            </dx:ASPxButton>
        </div>
    </form>
</body>
</html>
