<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageEstelamStep6.aspx.cs" Inherits="NewMellat.Content.PageEstelamStep6" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Font-Names="B Yekan" KeyFieldName="thId" OnCustomCallback="ASPxGridView1_CustomCallback" RightToLeft="True" Theme="SoftOrange" Width="100%">
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
                <dx:GridViewDataTextColumn Caption="وضعیت الحاقیه" FieldName="IsElhaghieValue" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان" FieldName="prTitle" VisibleIndex="1">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <HeaderStyle Font-Bold="False" Font-Size="13px" ForeColor="#003366" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="PersianStr" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مهلت پاسخ" FieldName="MohlatDate" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="واحد متولی" FieldName="vahed" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پیمانکار" FieldName="peymankar" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ تولید" FieldName="ghPriceTolid" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ پشتیبانی" FieldName="ghPricePosh" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn Caption="آخرین وضعیت اجرا" FieldName="prProjectStatus" VisibleIndex="17">                 
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="24">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/Actions-tab-new-icon.png" Target="_blank" NavigateUrl='<%# Eval("thId", "~/content/PageAnswerAnalyz.aspx?project={0}&Type=10") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        CONVERT(nvarchar(MAX), tbProjects.prTitle) AS prTitle, tbTarhPishnehadi.thId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thYear, tbTarhPishnehadi.thIsElhaghie,case When tbTarhPishnehadi.thIsElhaghie = 1 Then N'الحاقیه' else N'پروپوزال'end IsElhaghieValue, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, 
                         tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjectPaper.paShenase, tbProjectPaper.paId, prInformation.infTitle AS vahed, prInformation_3.infTitle AS TechnicalSuvisor,prInformation_1.infTitle AS peymankar, DimDate.PersianStr,DimDate_1.PersianStr AS MohlatDate, 
                         tbProjectPaper.paType, tbProjectPaper.paAct,
						 Cast(Isnull(tbTarhPishnehadi.thPricePosh,0) as bigint) ghPricePosh ,Cast(Isnull(tbTarhPishnehadi.thPriceTolid,0) as bigint) as ghPriceTolid,PriceSecurity,tbProjects.prProjectStatus
FROM            tbTarhPishnehadi INNER JOIN
                         tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId INNER JOIN
                         tbProjectPaper ON tbTarhPishnehadi.thId = tbProjectPaper.paProject left outer JOIN
                         prInformation ON tbProjects.prVahed = prInformation.infId left outer JOIN
                         prInformation AS prInformation_1 ON tbProjects.prPeymankar = prInformation_1.infId left outer JOIN
                         prInformation AS prInformation_3 ON tbProjects.TechnicalSuvisor = prInformation_3.infId left outer JOIN
                         DimDate ON tbProjectPaper.paDate = DimDate.GregorianDate left outer JOIN
                         DimDate AS DimDate_1 ON DATEADD(day, 14, tbProjectPaper.paDate) = DimDate_1.GregorianDate

WHERE prProjectStatus in (N'خاتمه یافته',N'در حال اجرا',N'متوقف') and     (tbProjectPaper.paType = 9) AND (tbProjectPaper.paAct = 1) and
					 thId not in (select paProject from tbProjectPaper where paAct=1  and paType=10)    and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
"> <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters></asp:SqlDataSource>
    </div>
    <div align="center" style="padding: 5px">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton1_Click" />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="گزارش پاسخ آنالیز" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>
        </div>

</asp:Content>
