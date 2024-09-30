<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="DashboardBuilderSooratHesab.aspx.cs" Inherits="NewMellat.Content.Reports.DashboardBuilderSooratHesab" %>
<%@ Register assembly="DevExpress.Dashboard.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" DashboardStorageFolder="~/App_Data/Dashboards">
    </dx:ASPxDashboard>
</div>
<div>
</div>
</asp:Content>
