<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageFinalize.aspx.cs" Inherits="NewMellat.Content.pageFinalize" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="direction:rtl">
            <table style="width:100%">
                <tr>
                    <td class="RightColumn">
                        <asp:Label ID="Label2" runat="server" Text="آیا سامانه درحال حاضر مورد استفاده قرار می گیرد؟"></asp:Label>

                    </td>
                    <td >
                        <asp:checkbox ID="CheckBoxIsUsing" runat="server"></asp:checkbox>

                    </td>

                </tr>
                <tr>
                    <td class="RightColumn">
                        <asp:Label ID="Label3" runat="server" Text="تعداد کاربران"></asp:Label>

                    </td>
                    <td>
                        
                        <asp:textbox ID="TextBoxCount" runat="server"></asp:textbox>
                        <asp:regularexpressionvalidator runat="server" errormessage="فقط عدد وارد شود" ControlToValidate="TextBoxCount" ValidationExpression="\d*">فقط عدد وارد شود</asp:regularexpressionvalidator>
                    </td>

                </tr>
                <tr>
                    <td class="RightColumn">
                        <asp:Label ID="Label34" runat="server" Text="توضیح در مورد سامانه"></asp:Label>

                    </td>
                    <td><dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="100px" RightToLeft="True" Theme="SoftOrange" Width="350px">
            </dx:ASPxMemo>


                    </td>

                </tr>
            </table>
            
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
