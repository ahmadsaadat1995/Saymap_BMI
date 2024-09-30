<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageEstelamStep2.aspx.cs" Inherits="NewMellat.Content.PageEstelamStep2" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceStep2" EnableTheming="True" Font-Names="B Yekan" KeyFieldName="thId" OnCustomCallback="ASPxGridView1_CustomCallback" RightToLeft="True" Theme="SoftOrange" Width="100%">
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
                <dx:GridViewDataTextColumn Caption="وضعیت الحاقیه" FieldName="IsElhaghieValue" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان" FieldName="prTitle" VisibleIndex="1">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <HeaderStyle Font-Bold="False" Font-Size="13px" ForeColor="#003366" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="PersianStr" VisibleIndex="16">
                </dx:GridViewDataTextColumn>

                  <%--<dx:GridViewDataTextColumn Caption="پیگیری" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("paId", "~/content/UpdateResponseDeadlineSupervisor.aspx?project={0}&type=1050") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                    </dx:GridViewDataTextColumn>--%>

                <dx:GridViewDataTextColumn Caption="پیگیری" VisibleIndex="11" Width="45px">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("paId", "~/content/UpdateResponseDeadlineSupervisor.aspx?project={0}&type=1005") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="مهلت پاسخ" FieldName="MohlatDate" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="واحد متولی" FieldName="vahed" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پیمانکار" FieldName="peymankar" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="واحد استعلام" FieldName="vahedEstelam" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="23">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/Actions-tab-new-icon.png" NavigateUrl='<%# Eval("paId", "~/content/PageAnswerEdarat.aspx?id={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="آخرین وضعیت اجرا" FieldName="prProjectStatus" VisibleIndex="18">                 
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceStep2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT CONVERT(nvarchar(MAX), tbProjects.prTitle) AS prTitle, tbTarhPishnehadi.thId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thYear, tbTarhPishnehadi.thIsElhaghie,case When tbTarhPishnehadi.thIsElhaghie = 1 Then N'الحاقیه' else N'پروپوزال'end IsElhaghieValue, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, 
                         tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjectPaper.paShenase, tbProjectPaper.paId, prInformation.infTitle AS vahed,prInformation_3.infTitle AS TechnicalSuvisor, prInformation_1.infTitle AS peymankar,prInformation_2.infTitle AS vahedEstelam, DimDate.PersianStr, DimDate_1.PersianStr AS MohlatDate
						 ,tbProjects.prIsMohtava,tbProjectPaper.paAct,tbProjects.prProjectStatus
FROM            tbTarhPishnehadi INNER JOIN
                         tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId INNER JOIN
                         tbProjectPaper ON tbTarhPishnehadi.thId = tbProjectPaper.paProject Left outer JOIN
                         prInformation ON tbProjects.prVahed = prInformation.infId Left outer JOIN
                         prInformation AS prInformation_1 ON tbProjects.prPeymankar = prInformation_1.infId Left outer JOIN
						 prInformation AS prInformation_2 ON tbProjectPaper.paEdare = prInformation_2.infId Left outer JOIN
                         prInformation AS prInformation_3 ON tbProjects.TechnicalSuvisor = prInformation_3.infId Left outer JOIN
                         DimDate ON tbProjectPaper.paDate = DimDate.GregorianDate Left outer JOIN
                         DimDate AS DimDate_1 ON DATEADD(day, 7, tbProjectPaper.paDate) = DimDate_1.GregorianDate
WHERE    prProjectStatus in (N'خاتمه یافته',N'در حال اجرا',N'متوقف') and   (tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prEstelamIsSubmit = 1) AND (tbTarhPishnehadi.thIsCancle = 0) AND (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = 8)
and tbProjectPaper.paId not in(select nzParent from tbNazar where (tbNazar.nzAct = 1) AND (tbNazar.nzType = 10))  
            Order By MohlatDate asc  and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
"><SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters></asp:SqlDataSource>
</div>
<div>
</div>
<div align="center" style="padding: 5px">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton1_Click" />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="پاسخ داده نشده" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>
        </div>
</asp:Content>
