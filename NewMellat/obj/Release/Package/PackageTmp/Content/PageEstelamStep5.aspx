<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageEstelamStep5.aspx.cs" Inherits="NewMellat.Content.PageEstelamStep5" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <dx:aspxgridview id="ASPxGridView1" runat="server" autogeneratecolumns="False" datasourceid="SqlDataSource1" enabletheming="True" font-names="B Yekan" keyfieldname="thId" oncustomcallback="ASPxGridView1_CustomCallback" righttoleft="True" theme="SoftOrange" width="100%"
            onrowcommand="ASPxGridView1_RowCommand">
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
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="nzShenase" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="PersianStr" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="واحد متولی" FieldName="vahed" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پیمانکار" FieldName="peymankar" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="واحد استعلام" FieldName="vahedEstelam" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="آخرین وضعیت اجرا" FieldName="prProjectStatus" VisibleIndex="22">                 
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="23">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/Actions-tab-new-icon.png" Target="_blank" NavigateUrl='<%# Eval("thId", "~/PagePages2.aspx?project={0}&Type=9") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="ثبت نامه" VisibleIndex="50" >
                <DataItemTemplate>
                 <asp:ImageButton ID="ImageButtonLetter" runat="server" CommandName="letter" ImageUrl="~/Content/images/icons/letter.png" Width="42px"/>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="73" Caption="prId" FieldName="prId" Visible="false">  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="72" Caption="thId" FieldName="thId" Visible="false">  </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="76" Caption="nzNumber" FieldName="nzNumber" Visible="false">  </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="75" Caption="nzStatus" FieldName="nzStatus" Visible="false">  </dx:GridViewDataTextColumn>
            </Columns>
        </dx:aspxgridview>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        CONVERT(nvarchar(MAX), tbProjects.prTitle) AS prTitle, tbTarhPishnehadi.thId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thYear, tbTarhPishnehadi.thIsElhaghie,case When tbTarhPishnehadi.thIsElhaghie = 1 Then N'الحاقیه' else N'پروپوزال'end IsElhaghieValue, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, prId,
                         tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, prInformation.infTitle AS vahed, prInformation_1.infTitle AS peymankar,prInformation_3.infTitle AS TechnicalSuvisor, prInformation_2.infTitle AS vahedEstelam, tbNazar.nzId, tbNazar.nzShenase, DimDate.PersianStr,tbNazar.nzNumber,tbNazar.nzStatus,tbProjects.prProjectStatus
FROM            tbTarhPishnehadi INNER JOIN
                         tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId INNER JOIN
                         tbProjectPaper ON tbTarhPishnehadi.thId = tbProjectPaper.paProject INNER JOIN
                         tbNazar ON tbProjectPaper.paId = tbNazar.nzParent INNER JOIN
                         prInformation ON tbProjects.prVahed = prInformation.infId INNER JOIN
						 prInformation AS prInformation_1 ON tbProjects.prPeymankar = prInformation_1.infId INNER JOIN
                         prInformation AS prInformation_2 ON tbProjectPaper.paEdare = prInformation_2.infId LEFT OUTER JOIN
                         prInformation AS prInformation_3 ON tbProjects.TechnicalSuvisor = prInformation_3.infId LEFT OUTER JOIN
                         DimDate ON tbNazar.nzDate = DimDate.GregorianDate
WHERE prProjectStatus in (N'خاتمه یافته',N'در حال اجرا',N'متوقف') and tbProjectPaper.paAct=1 and      (tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prEstelamIsSubmit = 1) AND (tbTarhPishnehadi.thIsCancle = 0) AND (tbNazar.nzAct = 1) AND (tbNazar.nzType = 10) and tbNazar.nzStatus in( 195,423)
and thId not in(Select paProject from tbProjectPaper where  paType = 9 and paAct=1) and thId not in (Select thId from
 tbTarhPishnehadi INNER JOIN
                         tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId INNER JOIN
                         tbProjectPaper ON tbTarhPishnehadi.thId = tbProjectPaper.paProject 
						  Where (tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prEstelamIsSubmit = 1) AND (tbTarhPishnehadi.thIsCancle = 0) AND (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = 8)
and tbProjectPaper.paId not in(select nzParent from tbNazar where (tbNazar.nzAct = 1) AND (tbNazar.nzType = 10)) )
AND tbTarhPishnehadi.thId not in (Select paProject from (Select paProject,paEdare,Min(nzStatus) nzStatus from tbProjectPaper 
Left outer join tbNazar On paId = nzParent  
where paType =8 and paAct=1 and (nzAct is null or nzAct=1)  
Group by  paProject,paEdare) a Where nzStatus = 196 or nzStatus is null)  and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) ">
            <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>
    </div>
    <div align="center" style="padding: 5px">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton1_Click" />
        <dx:aspxgridviewexporter id="ASPxGridViewExporter1" runat="server" filename="تدارکات - آنالیز قیمت" gridviewid="ASPxGridView1">
        </dx:aspxgridviewexporter>
    </div>
</asp:Content>
