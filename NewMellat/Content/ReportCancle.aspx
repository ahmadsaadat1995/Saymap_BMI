﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ReportCancle.aspx.cs" Inherits="NewMellat.Content.ReportCancle" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceInfo" EnableTheming="True" KeyFieldName="prId" RightToLeft="True" Theme="Office2010Silver" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Width="100%" Font-Names="vazir">
        <SettingsPager PageSize="25">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior EnableRowHotTrack="True" />
        <SettingsSearchPanel Visible="True" />
        <SettingsLoadingPanel Text="در حال اجرا..." />
        <SettingsText GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="کد سیستمی پروژه" FieldName="prId" ReadOnly="True" VisibleIndex="2">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="عنوان پروژه" FieldName="prTitle" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="وضعیت 1" FieldName="status1" VisibleIndex="11">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="وضعیت 2" FieldName="status2" VisibleIndex="12">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="وضعیت پروپوزال" FieldName="status3" VisibleIndex="13">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="10">
                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="prOlaviat" VisibleIndex="9">
                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="7">
                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="واحد" FieldName="prVahed" VisibleIndex="6">
                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="ردیف" VisibleIndex="1">
                <DataItemTemplate>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbTarhPishnehadi.thId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thYear, tbTarhPishnehadi.thHajmTolid, tbTarhPishnehadi.thHajmPosh, tbTarhPishnehadi.thPriceTolid, tbTarhPishnehadi.thPricePosh, tbTarhPishnehadi.thModatTolid, tbTarhPishnehadi.thModatPosh, tbTarhPishnehadi.thAct, tbTarhPishnehadi.thMekanizmPosh, tbTarhPishnehadi.thMekanizmtolid, tbProjects.prVahed AS Expr1, tbProjects.prIsMohtava AS Expr2, tbProjects.irIsAnalyz AS Expr3, tbProjects.prIsEstelamMohtavayi AS Expr4, tbProjects.prEstelamIsSubmit AS Expr5, tbTarhPishnehadi.thIsEstelamPaper, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, tbProjects.prEstelamPending, tbTarhPishnehadi.thIsCancle FROM tbTarhPishnehadi INNER JOIN tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId WHERE (tbTarhPishnehadi.thAct = 1) AND (tbProjects.irIsAnalyz = 0) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prIsEstelamMohtavayi = 1) AND (tbProjects.prEstelamIsSubmit = 1) AND (tbTarhPishnehadi.thIsEstelamPaper = 0) AND (tbTarhPishnehadi.thIsCancle = 1) ORDER BY tbTarhPishnehadi.thId DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
    </div>
    <div>
    </div>
    <div>
    </div>
</asp:Content>
