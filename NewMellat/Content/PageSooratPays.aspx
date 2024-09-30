<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageSooratPays.aspx.cs" Inherits="NewMellat.Content.PageSooratPays" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger">
    <dx:ASPxGridView runat="server" RightToLeft="True" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%" EnableTheming="True" ID="ASPxGridView1" DataSourceID="sourceOdats" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnSummaryDisplayText="ASPxGridView1_SummaryDisplayText" Font-Names="vazir">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="True" />
        <SettingsBehavior EnableRowHotTrack="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsLoadingPanel Text="در حال اجرا ..." />
        <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر را جهت گروه بندی اطلاعات قرار دهید" SearchPanelEditorNullText="جستجوی اطلاعات" />
        <Columns>
<dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True"></dx:GridViewCommandColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="شماره قرارداد" VisibleIndex="2" FieldName="ProjectGharardad">
    <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="تحویلی" VisibleIndex="3" FieldName="OnvanTahvili">
    <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="4" Caption="شماره صورتحساب" FieldName="pishSooratHesab">
    <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="مبلغ" VisibleIndex="5" FieldName="pishPriceArzeshAfzoode">
            <Settings AutoFilterCondition="Contains" />
            <DataItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("pishPriceArzeshAfzoode") %>'></asp:Label>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="نام پروژه" VisibleIndex="1" FieldName="ProjectName">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="ناظر1" FieldName="Nazer1" VisibleIndex="7">
                <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="ناظر2" FieldName="Nazer2" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="شرکت" FieldName="CompanyName" VisibleIndex="6">
                <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
</Columns>

        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0}" FieldName="pishPriceArzeshAfzoode" ShowInColumn="مبلغ" ShowInGroupFooterColumn="مبلغ" SummaryType="Sum" />
        </TotalSummary>

<Styles>
<Header HorizontalAlign="Center" Font-Names="vazir" Font-Size="13px"></Header>
    <Row Font-Names="vazir">
    </Row>
    <Footer Font-Bold="True" Font-Names="vazir">
    </Footer>
</Styles>
</dx:ASPxGridView>

                </div>
<div>

                <asp:SqlDataSource ID="sourceOdats" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.Nazer1, tbSooratHesab.Nazer2, tbSooratHesab.CompanyName, tbSooratHesab.GharardadType, tbSooratHesab.GharardadStart, tbSooratHesab.GharardadEnd, tbSooratHesab.Gharardad, tbSooratHesab.Type, tbSooratHesab.ElhaghieType, tbSooratHesab.OnvanTahvili, tbSooratHesab.MoedTahvili, tbSooratHesab.Price, tbSooratHesab.Vaziat, tbSooratHesab.SoorathesbPrice, tbSooratHesab.DoreErsali, tbSooratHesab.ShomareNamePishnevisSoorathesab, tbSooratHesab.TarikheNamePishnevisSoorathesab, tbSooratHesab.ShenaseNamePishnevisSoorathesab, tbSooratHesab.ShenaseEstelamPishSoorathesabNazer1, tbSooratHesab.TarikheEstelamPishSoorathesabNazer1, tbSooratHesab.MoedZamani1, tbSooratHesab.ShenaseEstelamPishSoorathesabNazer2, tbSooratHesab.TarikheEstelamPishSoorathesabNazer2, tbSooratHesab.MoedZamani2, tbSooratHesab.ShenaseAnswerNazerPishnevis, tbSooratHesab.TarikheAnswerNazerPishnevis, tbSooratHesab.ElamNazarAnswerNazerPishnevis, tbSooratHesab.ShenaseAnswerNazerPishnevis2, tbSooratHesab.TarikheAnswerNazerPishnevis2, tbSooratHesab.ElamNazarAnswerNazerPishnevis2, tbSooratHesab.ShenaseErsalTaeedNazer, tbSooratHesab.TarikheErsalTaeedNazer, tbSooratHesab.ShenaseErsalAdameTaeedNazer, tbSooratHesab.TarikheErsalAdameTaeedNazer, tbSooratHesab.MoedZamani3, tbSooratHesab.ShenaseDaryaftAnswerPishnevis, tbSooratHesab.TarikheDaryaftAnswerPishnevis, tbSooratHesab.ShenaseEstelamMojadadNazer1, tbSooratHesab.TarikheEstelamMojadadNazer1, tbSooratHesab.MoedZamani4, tbSooratHesab.ShenaseEstelamMojadadNazer2, tbSooratHesab.TarikheEstelamMojadadNazer2, tbSooratHesab.MoedZamani5, tbSooratHesab.ShenaseAnswerMojadadNazer1, tbSooratHesab.TarikheAnswerMojadadNazer1, tbSooratHesab.ElamNazarAnswerMojadadNazer1, tbSooratHesab.ShenaseAnswerMojadadNazer2, tbSooratHesab.TarikheAnswerMojadadNazer2, tbSooratHesab.ElamNazarAnswerMojadadNazer2, tbSooratHesab.ShenaseNameSooratHesab, tbSooratHesab.TarikhNameSooratHesab, tbSooratHesab.YearSooratHesab, tbSooratHesab.SomareSoorathesab, tbSooratHesab.ShenaseSoorathesab, tbSooratHesab.Vosool, tbSooratHesab.ShenaseEstelamVahed, tbSooratHesab.TarikheEstelamVahed, tbSooratHesab.MoedEstelamVahed, tbSooratHesab.ShenaseDaryaftAnswerNazer1, tbSooratHesab.TarikheDaryaftAnswerNazer1, tbSooratHesab.ElamNazarDaryaftAnswerNazer1, tbSooratHesab.ShenaseDaryaftAnswerNazer2, tbSooratHesab.TarikheDaryaftAnswerNazer2, tbSooratHesab.ElamNazarDaryaftAnswerNazer2, tbSooratHesab.SooratJalase, tbSooratHesab.TarikheSooratJalase, tbSooratHesab.ShenaseErsalBeSherkat, tbSooratHesab.TarikheErsalBeSherkat, tbSooratHesab.ShenaseDaryaftAnswerSHerkat, tbSooratHesab.DateDaryaftAnswerSHerkat, tbSooratHesab.EstelamMojadadVahed, tbSooratHesab.EstelamMojadadVahedTarikh, tbSooratHesab.ShenaseDaryaftMojaddVahed, tbSooratHesab.VahedDaryaftMojaddVahed, tbSooratHesab.ElamNazarDaryaftMojaddVahed, tbSooratHesab.ShenaseErsalTadarokat, tbSooratHesab.TarikheErsalTadarokat, tbSooratHesab.ShenaseOdatTadarokat, tbSooratHesab.TarikheOdatTadarokat, tbSooratHesab.ShenaseErsalAzTadarokat, tbSooratHesab.TarikheErsalAzTadarokat, tbSooratHesab.ShenaseAnswerSherkatTadarokat, tbSooratHesab.TarikheAnswerSherkatTadarokat, tbSooratHesab.ShenaseErsalMojadad, tbSooratHesab.TarikheErsalMojadad, tbSooratHesab.shenasePeigiriEstelam, tbSooratHesab.TarikhePeigiriEstelam, tbSooratHesab.ShenaseErsalMali, tbSooratHesab.TarikheErsalMali, tbSooratHesab.BodyPapers, tbSooratHesab.Body, tbSooratHesab.id, tbProjectPaper.paShenase, tbProjectPaper.paNumber,DimDate.PersianStr as paDate, tbProjectPaper.paType, tbSooratPishNevis.* FROM tbProjectPaper INNER JOIN tbSooratHesab ON tbProjectPaper.paProject = tbSooratHesab.id INNER JOIN tbSooratPishNevis ON tbSooratHesab.id = tbSooratPishNevis.pishProject left JOIN  tbProjects ON tbSooratHesab.prId = tbProjects.prId Left  Join DimDate On DimDate.GregorianDate = tbProjectPaper.paDate WHERE (tbProjectPaper.paType = 1015)   and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) ">
       <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters> </asp:SqlDataSource>

        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>

                </div>
</asp:Content>
