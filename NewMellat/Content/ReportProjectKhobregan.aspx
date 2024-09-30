<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ReportProjectKhobregan.aspx.cs" Inherits="NewMellat.Content.ReportProjectKhobregan" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" RightToLeft="True" Theme="Office2010Silver" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Width="100%" Font-Names="vazir">
        <SettingsPager PageSize="15">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior EnableRowHotTrack="True" />
        <SettingsSearchPanel Visible="True" />
        <SettingsLoadingPanel Text="در حال اجرا..." />
        <SettingsText GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="شناسه" FieldName="mosShenase" VisibleIndex="4" ShowInCustomizationForm="True">
                <DataItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("mosShenase") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="مهلت عملیاتی شدن" FieldName="mosAmaliatiDate" ShowInCustomizationForm="True" VisibleIndex="6">
                <DataItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("mosAmaliatiDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="mosDate" ShowInCustomizationForm="True" VisibleIndex="5">
                <DataItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("mosDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="مهلت ارسال پروپوزال" FieldName="mosErsalDate" ShowInCustomizationForm="True" VisibleIndex="7">
                <DataItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("mosErsalDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="نام پروژه" FieldName="prTitle" VisibleIndex="0">
                <settings autofiltercondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="2">
                <propertiescombobox datasourceid="SqlDataSource2" textfield="infTitle" valuefield="infId"></propertiescombobox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="شرکت" FieldName="prPeymankar" VisibleIndex="3">
                <propertiescombobox datasourceid="SqlDataSource2" textfield="infTitle" valuefield="infId"></propertiescombobox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="1">
                <propertiescombobox datasourceid="SqlDataSource2" textfield="infTitle" valuefield="infId"></propertiescombobox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosAmaliatiDate, tbKhbregan.khAct, tbKhobreganMosavab.mosAct, tbKhbregan.khId, tbKhbregan.khProject, 
                         tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosErsalDate, tbProjects.prTitle, tbProjects.prVahed, tbProjects.prProjectType, 
                         tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar
FROM            tbProjects INNER JOIN
                         tbKhobreganMosavab ON tbProjects.prId = tbKhobreganMosavab.mosProjectId LEFT OUTER JOIN
                         tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId
WHERE        (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
</div>
<div align="center" style="padding: 7px">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton1_Click" />
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="گزارش پروژه ها" GridViewID="ASPxGridView1" Landscape="True" PaperKind="A4">
    </dx:ASPxGridViewExporter>
</div>
</asp:Content>
