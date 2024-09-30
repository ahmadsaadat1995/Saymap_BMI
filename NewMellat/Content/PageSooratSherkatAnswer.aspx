<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageSooratSherkatAnswer.aspx.cs" Inherits="NewMellat.Content.PageSooratSherkatAnswer" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger">
    <dx:ASPxGridView runat="server" RightToLeft="True" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%" EnableTheming="True" ID="ASPxGridView2" DataSourceID="sourceInfo" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Font-Names="vazir">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior EnableRowHotTrack="True" />
        <SettingsCommandButton>
            <ClearFilterButton ButtonType="Image">
                <Image IconID="filter_clearfilter_16x16">
                </Image>
            </ClearFilterButton>
        </SettingsCommandButton>
        <SettingsSearchPanel Visible="True" />
        <SettingsLoadingPanel Text="در حال اجرا ..." />
        <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد کنید" SearchPanelEditorNullText="جستجوی اطلاعات" />
        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="شماره قرارداد" VisibleIndex="2" FieldName="ProjectGharardad">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="عنوان تحویلی" VisibleIndex="6" FieldName="OnvanTahvili">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="مبلغ" VisibleIndex="7" FieldName="Price">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="8" Caption="شناسه نامه PMO" FieldName="paShenase">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="تاریخ نامه  PMO" VisibleIndex="9" FieldName="paDate">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="10">
                <DataItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/message-bubble-send-icon.png" NavigateUrl='<%# Eval("pishId", "~/content/PageSooratPaper.aspx?project={0}&type=1006") %>' Target="_blank"></asp:HyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="نام پروژه" VisibleIndex="1" FieldName="ProjectName">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="ناظر 1" FieldName="Nazer1" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="sourceInfo0" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn Caption="ناظر2" FieldName="Nazer2" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="sourceInfo0" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="شرکت" VisibleIndex="5" FieldName="CompanyName">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center" Font-Names="vazir" Font-Size="13px">
            </Header>
            <Row Font-Names="vazir">
            </Row>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbSooratHesab.ProjectName,prInformation.infTitle CompanyName, tbSooratHesab.ProjectGharardad, tbSooratHesab.id, tbSooratHesab.Nazer1, tbSooratHesab.Nazer2, tbSooratHesab.OnvanTahvili,tbSooratHesab.Price, tbProjectPaper.paShenase, 
                         tbProjectPaper.paNumber, DimDate.PersianStr as paDate, tbProjectPaper.paAct, tbSooratPishNevis.pishId, tbProjectPaper.paType, tbSooratHesab.step1, tbSooratHesab.step2
FROM tbSooratPishNevis  INNER JOIN tbSooratHesab ON tbSooratPishNevis.pishProject = tbSooratHesab.id
        left JOIN  tbProjects ON tbSooratHesab.prId = tbProjects.prId 
					   Inner Join prInformation On infId = tbSooratHesab.CompanyName
					  left  Join(select * from tbProjectPaper )as tbProjectPaper on tbProjectPaper.paId=(select top 1 paId from tbProjectPaper where paType = 1005 and paAct = 1 and paProject=tbSooratPishNevis.pishId order by paDate desc)
        Left  Join DimDate On DimDate.GregorianDate = tbProjectPaper.paDate
WHERE  (tbSooratPishNevis.pishAct = 1) AND (tbSooratHesab.step4 = 1) and pishIsNazer=1   and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) ">
        <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo0" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Close" Skin="Sunset">
        <Windows>
            <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
            </telerik:RadWindow>
            <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>

         <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="لیست پاسخ شرکت" GridViewID="ASPxGridView2">
        </dx:ASPxGridViewExporter>

                </div>
    <div align="center" style="padding: 5px">
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton3_Click" />
    </div>
</asp:Content>
