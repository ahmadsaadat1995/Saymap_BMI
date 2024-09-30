<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageRole.aspx.cs" Inherits="NewMellat.Content.PageRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="create role" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    <div>
    </div>
    <div>
    </div>
</asp:Content>
