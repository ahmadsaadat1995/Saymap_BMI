<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="ReportLoader.aspx.cs" Inherits="NewMellat.Content.Reports.ReportLoader" %>
<%@ Register assembly="DevExpress.XtraReports.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" ColorScheme="dark">
    </dx:ASPxWebDocumentViewer>
</div>
<div>
</div>
</asp:Content>
