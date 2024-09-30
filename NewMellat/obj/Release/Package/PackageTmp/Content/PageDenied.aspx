<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageDenied.aspx.cs" Inherits="NewMellat.Content.PageDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="padding: 8px" class="box box-danger">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/images/Sign-Delete-icon.png" />
    </div>

    <div align="center" style="font-family: tahoma; font-size: 13px; color: #800000">
        <asp:Label ID="Label1" runat="server" Text="کاربر گرامی , دسترسی شما به صفحه مورد نظر امکان پذیر نمی باشد"></asp:Label>
        <br />
    </div>
</asp:Content>
