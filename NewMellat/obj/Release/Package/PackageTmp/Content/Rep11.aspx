<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rep11.aspx.cs" Inherits="NewMellat.Content.Rep11" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="direction: ltr">
    
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="mosId" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" RightToLeft="True" Theme="SoftOrange" Width="100%" Font-Names="B Yekan">
            <SettingsPager Mode="ShowAllRecords" Visible="False">
            </SettingsPager>
            <SettingsSearchPanel Visible="True" />
            <SettingsText SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="شناسه نامه مصوب" FieldName="mosShenase" VisibleIndex="5">
                    <DataItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("mosShenase") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ ارسال پروپوزال" FieldName="mosErsalDate" VisibleIndex="8">
                    <DataItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("mosErsalDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ عملیاتی شدن" FieldName="mosAmaliatiDate" VisibleIndex="7">
                    <DataItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("mosAmaliatiDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="نام پروژه" FieldName="prTitle" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="شرکت پیمانکار" FieldName="prPeymankar" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ردیف" VisibleIndex="0">
                    <DataItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="اولویت" FieldName="mosOlaviat" VisibleIndex="9">
                    <DataItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("mosOlaviat") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="mosDate" VisibleIndex="6">
                    <DataItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("mosDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="srs تاریخ " FieldName="mosSRS" VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("mosSRS") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="srs پاسخ " FieldName="mosSRSanswer" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("mosSRSanswer") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نوع پروژه" FieldName="infTitle" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره جلسه خبرگان" FieldName="khJalaseNumber" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="source1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, 
                         tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, 
                         tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbProjects.prTitle, tbProjects.prVahed, tbProjects.prPeymankar, tbProjects.prSanadType, tbKhbregan.khJalaseNumber,
                          prInformation.infTitle
FROM            tbKhobreganMosavab INNER JOIN
                         tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN
                         tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN
                         prInformation ON tbProjects.prProjectType = prInformation.infId
WHERE        (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosOlaviat IS NOT NULL) AND (tbKhobreganMosavab.mosErsalDate IS NOT NULL) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbProjects.prTitle, tbProjects.prVahed, tbProjects.prPeymankar, tbProjects.prSanadType, tbKhbregan.khJalaseNumber, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosOlaviat IS NOT NULL) AND (tbKhobreganMosavab.mosAmaliatiDate IS NOT NULL) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source3" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prVahed, tbProjects.prOlaviat, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbProjects.prProjectType, tbProjects.prPeymankar, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosDate, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbProjects.prSanadType, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbProjects.prAct = 1) AND (tbProjects.prIsTarh &lt;&gt; 1) AND (tbProjects.prEstelamIsSubmit &lt;&gt; 1) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbKhobreganMosavab.mosErsalDate &gt; GETDATE()) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed)">
            <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source4" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prVahed, tbProjects.prOlaviat, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbProjects.prProjectType, tbProjects.prPeymankar, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosDate, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbProjects.prSanadType, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbProjects.prAct = 1) AND (tbProjects.prId NOT IN (SELECT paProject FROM tbProjectPaper WHERE (paType IN (101, 102, 303)))) AND (tbKhobreganMosavab.mosAmaliatiDate &gt; GETDATE()) AND (tbProjects.prIsTarh &lt;&gt; 1) AND (tbProjects.prEstelamIsSubmit &lt;&gt; 1) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbKhobreganMosavab.mosAmaliatiDate &gt; GETDATE()) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed)">
            <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source12" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhbregan.khId, tbKhbregan.khProject, tbKhbregan.khAct, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbKhbregan.khStatus, tbKhbregan.khIsTarh, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, tbProjects.prEstelamPending, tbProjects.prKhobreganStatusMosavab, tbProjects.prTemp, tbProjects.prBody, tbProjects.prProjectStatus, tbProjects.prMainBody, tbProjects.prProjectManager, tbProjects.prSt, tbProjects.prSt2, tbProjects.prFinalCode, tbProjects.prRiskType, tbProjects.prRiskTitle, tbProjects.prRiskDegree, tbProjects.prRiskEhtemal, tbProjects.prRiskPayamad, tbProjects.prRiskAnswer, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosSRS IS NOT NULL) AND (tbKhobreganMosavab.mosSRS &gt;= GETDATE()) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1) AND (tbKhbregan.khProject NOT IN (SELECT reProject FROM tbReval WHERE (reSanadType = 3000) AND (reAct = 1)))
and tbProjects.prId not  in (select tbProjectPaper.paProject from tbProjectPaper where tbProjectPaper.paType in (101,102,303))
">  <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source17" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhbregan.khId, tbKhbregan.khProject, tbKhbregan.khAct, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbKhbregan.khStatus, tbKhbregan.khIsTarh, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, tbProjects.prEstelamPending, tbProjects.prKhobreganStatusMosavab, tbProjects.prTemp, tbProjects.prBody, tbProjects.prProjectStatus, tbProjects.prMainBody, tbProjects.prProjectManager, tbProjects.prSt, tbProjects.prSt2, tbProjects.prFinalCode, tbProjects.prRiskType, tbProjects.prRiskTitle, tbProjects.prRiskDegree, tbProjects.prRiskEhtemal, tbProjects.prRiskPayamad, tbProjects.prRiskAnswer, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosSRSanswer IS NOT NULL) AND (tbKhobreganMosavab.mosSRSanswer &lt; GETDATE()) AND (tbKhbregan.khProject NOT IN (SELECT nzParent FROM tbNazar WHERE (nzType = 4001))) AND (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1)
and tbProjects.prId not  in (select tbProjectPaper.paProject from tbProjectPaper where tbProjectPaper.paType in (101,102,303))">  <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source5" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT vwMosavabDashboardAjam.* FROM vwMosavabDashboardAjam WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="mosOlaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source13" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhbregan.khId, tbKhbregan.khProject, tbKhbregan.khAct, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbKhbregan.khStatus, tbKhbregan.khIsTarh, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, tbProjects.prEstelamPending, tbProjects.prKhobreganStatusMosavab, tbProjects.prTemp, tbProjects.prBody, tbProjects.prProjectStatus, tbProjects.prMainBody, tbProjects.prProjectManager, tbProjects.prSt, tbProjects.prSt2, tbProjects.prFinalCode, tbProjects.prRiskType, tbProjects.prRiskTitle, tbProjects.prRiskDegree, tbProjects.prRiskEhtemal, tbProjects.prRiskPayamad, tbProjects.prRiskAnswer, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbKhbregan.khProject IN (SELECT reProject FROM tbReval WHERE (reSanadType = 3000) AND (reAct = 1))) AND (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1)
and tbProjects.prId not  in (select tbProjectPaper.paProject from tbProjectPaper where tbProjectPaper.paType in (101,102,303))">  <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source6" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT vwMosavabDashboardTakhir.* FROM vwMosavabDashboardTakhir WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="mosOlaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source14" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhbregan.khId, tbKhbregan.khProject, tbKhbregan.khAct, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbKhbregan.khStatus, tbKhbregan.khIsTarh, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, tbProjects.prEstelamPending, tbProjects.prKhobreganStatusMosavab, tbProjects.prTemp, tbProjects.prBody, tbProjects.prProjectStatus, tbProjects.prMainBody, tbProjects.prProjectManager, tbProjects.prSt, tbProjects.prSt2, tbProjects.prFinalCode, tbProjects.prRiskType, tbProjects.prRiskTitle, tbProjects.prRiskDegree, tbProjects.prRiskEhtemal, tbProjects.prRiskPayamad, tbProjects.prRiskAnswer, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosSRS IS NOT NULL) AND (tbKhobreganMosavab.mosSRS &lt; GETDATE()) AND (tbKhbregan.khProject NOT IN (SELECT reProject FROM tbReval WHERE (reSanadType = 3000) AND (reAct = 1))) AND (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1)
and tbProjects.prId not  in (select tbProjectPaper.paProject from tbProjectPaper where tbProjectPaper.paType in (101,102,303))">  <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source7" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT vwMosavabDashboardAmaliatiAnjam.* FROM vwMosavabDashboardAmaliatiAnjam WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="mosOlaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source16" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhbregan.khId, tbKhbregan.khProject, tbKhbregan.khAct, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbKhbregan.khStatus, tbKhbregan.khIsTarh, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, tbProjects.prEstelamPending, tbProjects.prKhobreganStatusMosavab, tbProjects.prTemp, tbProjects.prBody, tbProjects.prProjectStatus, tbProjects.prMainBody, tbProjects.prProjectManager, tbProjects.prSt, tbProjects.prSt2, tbProjects.prFinalCode, tbProjects.prRiskType, tbProjects.prRiskTitle, tbProjects.prRiskDegree, tbProjects.prRiskEhtemal, tbProjects.prRiskPayamad, tbProjects.prRiskAnswer, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbKhbregan.khProject IN (SELECT nzParent FROM tbNazar WHERE (nzType = 4000) AND (nzId IN (SELECT nzParent FROM tbNazar AS tbNazar_1 WHERE (nzType = 4001))))) AND (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1)
and tbProjects.prId not  in (select tbProjectPaper.paProject from tbProjectPaper where tbProjectPaper.paType in (101,102,303))">  <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source15" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhbregan.khId, tbKhbregan.khProject, tbKhbregan.khAct, tbKhbregan.khJalaseNumber, tbKhbregan.khJalaseDate, tbKhbregan.khStatus, tbKhbregan.khIsTarh, tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, tbProjects.prEstelamPending, tbProjects.prKhobreganStatusMosavab, tbProjects.prTemp, tbProjects.prBody, tbProjects.prProjectStatus, tbProjects.prMainBody, tbProjects.prProjectManager, tbProjects.prSt, tbProjects.prSt2, tbProjects.prFinalCode, tbProjects.prRiskType, tbProjects.prRiskTitle, tbProjects.prRiskDegree, tbProjects.prRiskEhtemal, tbProjects.prRiskPayamad, tbProjects.prRiskAnswer, prInformation.infTitle FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId INNER JOIN prInformation ON tbProjects.prProjectType = prInformation.infId WHERE (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosSRSanswer IS NOT NULL) AND (tbKhobreganMosavab.mosSRSanswer &gt;= GETDATE()) AND (tbKhobreganMosavab.mosAct = 1) AND (tbKhobreganMosavab.mosOlaviat = @olaviat) AND (tbProjects.prPeymankar = @peymankar) AND (tbKhobreganMosavab.mosDate BETWEEN @sd AND @ed) AND (tbProjects.prAct = 1) AND (tbKhbregan.khProject NOT IN (SELECT nzParent FROM tbNazar WHERE (nzType = 4000) AND (nzId IN (SELECT nzParent FROM tbNazar AS tbNazar_1 WHERE (nzType = 4001)))))
and tbProjects.prId not  in (select tbProjectPaper.paProject from tbProjectPaper where tbProjectPaper.paType in (101,102,303))">  <SelectParameters>
                <asp:QueryStringParameter Name="olaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="source8" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT vwMosavabDashboardAmaliatiTakhir.* FROM vwMosavabDashboardAmaliatiTakhir WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="mosOlaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle FROM prInformation"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sourceSum2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM vwMosavabDashboardAmaliatiAnjam WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)
union all
SELECT * FROM vwMosavabDashboardAmaliatiTakhir WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)
union all
SELECT * FROM vwMosavabAmaliatiSarResiNashode WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)">
           <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="mosOlaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sourceSum1" runat="server" SelectCommand="SELECT  * FROM vwMosavabDashboardAjam
 WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)

union all
SELECT  * FROM vwMosavabDashboardTakhir
 WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)

union all
SELECT  * FROM vwMosavabSarResidNashode
 WHERE (mosOlaviat = @mosOlaviat)
and
(prPeymankar=@peymankar)
and 
(mosDate between @sd and @ed)
" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>">
             <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="mosOlaviat" QueryStringField="olv" />
                <asp:QueryStringParameter Name="peymankar" QueryStringField="peymankar" />
                <asp:QueryStringParameter Name="sd" QueryStringField="sd" />
                <asp:QueryStringParameter Name="ed" QueryStringField="ed" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
          <div>
    
    </div>
          <div>
    
    </div>
          <div>
    
    </div>

    </form>
</body>
</html>
