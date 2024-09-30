<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageUploadXls.aspx.cs" Inherits="NewMellat.Content.PageUploadXls" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger">
    <div align="center">
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="left" height="35" width="200">
                    <asp:Label ID="Label1" runat="server" Text="انتخاب فایل اکسل:"></asp:Label>
                </td>
                <td align="right" width="250">

                    <asp:FileUpload ID="FileUpload1" runat="server" />

                </td>
            </tr>
        </table>
    </div>
    <div align="center" style="padding: 8px">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Width="140px">
        </dx:ASPxButton>
</div>
    <div align="center" style="padding: 7px">
        <asp:Label ID="lbResult" runat="server"></asp:Label>
</div></div>
</asp:Content>
