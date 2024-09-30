<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageSooratFull.aspx.cs" Inherits="NewMellat.Content.PageSooratFull" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" EnableTheming="True" RightToLeft="True" Theme="SoftOrange" Width="100%" DataSourceID="sourceInfo" KeyFieldName="id">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsCommandButton>
                <ClearFilterButton ButtonType="Image">
                    <Image IconID="filter_clearfilter_16x16office2013">
                    </Image>
                </ClearFilterButton>
                <UpdateButton ButtonType="Image">
                    <Image IconID="save_save_16x16">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image IconID="actions_cancel_16x16">
                    </Image>
                </CancelButton>
                <EditButton ButtonType="Image">
                    <Image IconID="edit_edit_16x16">
                    </Image>
                </EditButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا ..." />
            <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر برای گروه بندی را وارد کنید" SearchPanelEditorNullText="جستجوی اطلاعات" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="نام پروژه" FieldName="ProjectName" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره قرارداد" FieldName="ProjectGharardad" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نوع قرارداد" FieldName="GharardadType" VisibleIndex="7">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="کد سیستمی" FieldName="id" ReadOnly="True" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر1" FieldName="Nazer1" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="sourceNazer" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر2" FieldName="Nazer2" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="sourceNazer" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="شرکت" FieldName="CompanyName" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="sourceCompany" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" HorizontalAlign="Center" VerticalAlign="Middle">
                </Header>
                <Row Font-Names="B Yekan">
                </Row>
            </Styles>
        </dx:ASPxGridView>
    <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT ProjectName, ProjectGharardad, Nazer1, Nazer2, CompanyName, GharardadType, id FROM tbSooratHesab" UpdateCommand="UPDATE tbSooratHesab SET ProjectName = @ProjectName, ProjectGharardad = @ProjectGharardad, Nazer1 = @Nazer1, Nazer2 = @Nazer2, CompanyName = @CompanyName, GharardadType = @GharardadType WHERE (id = @id)">
        <UpdateParameters>
            <asp:Parameter Name="ProjectName" />
            <asp:Parameter Name="ProjectGharardad" />
            <asp:Parameter Name="Nazer1" />
            <asp:Parameter Name="Nazer2" />
            <asp:Parameter Name="CompanyName" />
            <asp:Parameter Name="GharardadType" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceNazer" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infType = 1) AND (infAct = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infType = 5) AND (infAct = 1)"></asp:SqlDataSource>
</div>
<div>
</div>
<div>
</div>
</asp:Content>
