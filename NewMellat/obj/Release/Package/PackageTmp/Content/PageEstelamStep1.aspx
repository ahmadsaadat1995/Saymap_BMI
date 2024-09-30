<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageEstelamStep1.aspx.cs" Inherits="NewMellat.Content.PageEstelamStep1" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceStep1" EnableTheming="True" Font-Names="B Yekan" KeyFieldName="thId" OnCustomCallback="ASPxGridView1_CustomCallback" RightToLeft="True" Theme="SoftOrange" Width="100%">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsBehavior AllowDragDrop="False" AllowSort="False" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <ClearFilterButton ButtonType="Image" RenderMode="Image">
                    <Image IconID="filter_clearfilter_16x16">
                    </Image>
                </ClearFilterButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا ..." />
            <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" SearchPanelEditorNullText="جستجوی اطلاعات ..." />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="وضعیت الحاقیه" FieldName="IsElhaghieValue" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان " FieldName="prTitle" VisibleIndex="1">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <HeaderStyle Font-Bold="False" Font-Size="13px" ForeColor="#003366" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="PersianStr" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="واحد متولی" FieldName="vahed" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پیمانکار" FieldName="peymankar" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="22" Visible="False">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/Actions-tab-new-icon.png" NavigateUrl='<%# Eval("paId","~/content/PageAnswerEdarat.aspx?id={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مهلت" FieldName="MohlatDate" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="وضعیت پاسخ" FieldName="thIsEstelamPaper" Visible="False" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn Caption="آخرین وضعیت اجرا" FieldName="prProjectStatus" VisibleIndex="18">                 
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceStep1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbTarhPishnehadi.thId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thYear, tbTarhPishnehadi.thIsElhaghie, case When tbTarhPishnehadi.thIsElhaghie = 1 Then N'الحاقیه' else N'پروپوزال'end IsElhaghieValue, tbTarhPishnehadi.thHajmTolid, tbTarhPishnehadi.thHajmPosh, tbTarhPishnehadi.thPriceTolid, 
                         tbTarhPishnehadi.thPricePosh, tbTarhPishnehadi.thModatTolid, tbTarhPishnehadi.thModatPosh, tbTarhPishnehadi.thMekanizmPosh, tbTarhPishnehadi.thMekanizmtolid, tbProjects.prIsMohtava, 
                         tbProjects.irIsAnalyz, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbTarhPishnehadi.thIsCancle, tbProjects.prTitle, tbProjectPaper.paDate, tbProjectPaper.paShenase, DimDate.PersianStr, 
                         prInformation.infTitle AS vahed, prInformation_1.infTitle AS peymankar, prInformation_2.infTitle AS TechnicalSuvisor, tbProjectPaper.paId, DimDate_1.PersianStr AS MohlatDate, tbTarhPishnehadi.thIsEstelamPaper,tbProjects.prProjectStatus
FROM            tbTarhPishnehadi INNER JOIN
                         tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId INNER JOIN
                         tbProjectPaper ON tbTarhPishnehadi.thId = tbProjectPaper.paProject INNER JOIN
                         DimDate ON tbProjectPaper.paDate = DimDate.GregorianDate INNER JOIN
                         prInformation ON tbProjects.prVahed = prInformation.infId INNER JOIN
                         prInformation AS prInformation_1 ON tbProjects.prPeymankar = prInformation_1.infId Left Outer JOIN
                         prInformation AS prInformation_2 ON tbProjects.TechnicalSuvisor = prInformation_2.infId INNER JOIN
                         DimDate AS DimDate_1 ON DATEADD(day, 10, tbProjectPaper.paDate) = DimDate_1.GregorianDate
WHERE       --( (tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prEstelamIsSubmit = 1) AND 
            --(tbTarhPishnehadi.thIsCancle = 0) AND (tbProjectPaper.paAct = 1) 
			--AND (tbProjectPaper.paType = 8) OR(tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbTarhPishnehadi.thIsCancle = 0)
            -- AND (tbTarhPishnehadi.thIsElhaghie = 1))
            ( ( (tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prEstelamIsSubmit = 1) AND (tbTarhPishnehadi.thIsCancle = 0) AND (tbProjectPaper.paAct = 1) 
			) OR((tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbTarhPishnehadi.thIsCancle = 0) AND (tbTarhPishnehadi.thIsElhaghie = 1)))
 AND (tbProjectPaper.paType = 8)
		      and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) ))
ORDER BY tbTarhPishnehadi.thId DESC"><SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters></asp:SqlDataSource>
    </div>
    <div>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="پروژه های استعلام شده" GridViewID="ASPxGridView1" Landscape="True" PaperKind="A4" RightToLeft="True">
        </dx:ASPxGridViewExporter>
    </div>
    <div align="center" style="padding: 8px">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton1_Click" />
    </div>
</asp:Content>
