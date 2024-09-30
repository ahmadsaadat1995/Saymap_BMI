<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageZarfiatReport.aspx.cs" Inherits="NewMellat.Content.PageZarfiatReport" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" RightToLeft="True" DataSourceID="SqlDataSource1" Font-Names="b yekan" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Width="100%">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" HorizontalScrollBarMode="Auto" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsLoadingPanel Text="در حال اجرا ..." />
        <SettingsText GroupPanel="ستون مورد نظر را وارد نمایید" SearchPanelEditorNullText="جستجوی اطلاعات" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" Width="25px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="عنوان پروژه" VisibleIndex="1" FieldName="prTitle">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مهلت عملیاتی شدن" VisibleIndex="7" FieldName="mosAmaliatiDate">
                <DataItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("mosAmaliatiDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مهلت ارسال پروپوزال" VisibleIndex="8" FieldName="mosErsalDate">
                <DataItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("mosErsalDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SRS مهلت ارسال " VisibleIndex="9" FieldName="mosSRS">
                <DataItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("mosSRS") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SRS تاریخ پاسخ " VisibleIndex="10" FieldName="mosSRSanswer">
                <DataItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("mosSRSanswer") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="تاریخ ثبت" VisibleIndex="12" FieldName="mosDate">
                <DataItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("mosDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مدت تولید" VisibleIndex="13" FieldName="thModatTolid">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مدت پشتیبانی" VisibleIndex="14" FieldName="thModatPosh">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="حجم تولید" VisibleIndex="15" FieldName="thHajmTolid">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="حجم پشتیبانی" VisibleIndex="16" FieldName="thHajmPosh">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="عنوان تحویل" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="تاریخ تحویل" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ارسال به مالی" VisibleIndex="21">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="sourceVahed" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="sourceProjectType" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="sourceSanad" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="prOlaviat" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="sourceOlaviat" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="6">
                <PropertiesComboBox DataSourceID="sourcePeymankar" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="مکانیزم تولید" FieldName="thMekanizmtolid" VisibleIndex="17">
                <PropertiesComboBox DataSourceID="sourceMakanizmTolid" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="مکانیزم پشتیبانی" FieldName="thMekanizmPosh" VisibleIndex="18">
                <PropertiesComboBox DataSourceID="sourceMekanizPosh" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Styles>
            <Header Font-Names="B Yekan">
            </Header>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosAmaliatiDate, tbKhbregan.khAct, tbKhobreganMosavab.mosAct, tbKhbregan.khId, tbKhbregan.khProject, 
                         tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosErsalDate, tbProjects.prTitle, tbProjects.prVahed, tbProjects.prProjectType, 
                         tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.prId, tbProjects.prProjectStatus, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbReval.reId, 
                         tbTarhPishnehadi.thHajmTolid, tbTarhPishnehadi.thHajmPosh, tbTarhPishnehadi.thPriceTolid, tbTarhPishnehadi.thPricePosh, tbTarhPishnehadi.thModatTolid, tbTarhPishnehadi.thModatPosh, 
                         tbTarhPishnehadi.thMekanizmPosh, tbTarhPishnehadi.thMekanizmtolid
FROM            tbProjects INNER JOIN
                         tbKhbregan ON tbProjects.prId = tbKhbregan.khProject INNER JOIN
                         tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN
                         tbReval ON tbProjects.prId = tbReval.reProject LEFT OUTER JOIN
                         tbTarhPishnehadi ON tbProjects.prId = tbTarhPishnehadi.thProject
WHERE        (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1)"></asp:SqlDataSource>
</div>
<div align="center" style="padding: 6px">
    <asp:SqlDataSource ID="sourceMekanizPosh" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select * from prInformation
where prInformation.infType=8"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 1)">
                </asp:SqlDataSource>
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton3_Click" />
    <asp:SqlDataSource ID="sourceMakanizmTolid" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select * from prInformation
where prInformation.infType=7"></asp:SqlDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="گزارش ظرفیت سنجی" GridViewID="ASPxGridView1" Landscape="True" PaperKind="A4">
    </dx:ASPxGridViewExporter>
        <asp:SqlDataSource ID="sourceSanad" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select * from prInformation
where prInformation.infType=3">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceOlaviat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
<div>
</div>
</asp:Content>
