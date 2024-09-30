<%@ Page Title="" Language="C#" MasterPageFile="~/SiteRibbon.Master" AutoEventWireup="true" CodeBehind="ReportReval.aspx.cs" Inherits="NewMellat.Content.Reports.ReportReval" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">


*, :after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

    *, :after, :before {
        color: #000 !important;
        text-shadow: none !important;
        background: 0 0 !important;
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
    }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <asp:SqlDataSource ID="sourceFile" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbFiles(fiAct, fiData, fiDate, fiParent, fiType, fiTitle, fiExt) VALUES (1, @fiData, @fiDate, @fiParent, 5, @fiTitle, @fiExt)" SelectCommand="SELECT TOP (1) fiId, fiAct, fiData, fiDate, fiParent, fiType FROM tbFiles">
        <InsertParameters>
            <asp:ControlParameter ControlID="FileUpload1" Name="fiData" PropertyName="FileBytes" />
            <asp:Parameter Name="fiDate" />
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="fiParent" PropertyName="Value" />
            <asp:Parameter Name="fiTitle" />
            <asp:ControlParameter ControlID="FileUpload1" Name="fiExt" PropertyName="FileName" />
        </InsertParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1)  AND (prInformation.infType = 1)">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbProjects.prTitle, tbProjects.prId FROM tbProjects INNER JOIN tbKhbregan ON tbProjects.prId = tbKhbregan.khProject INNER JOIN tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob WHERE (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1)"></asp:SqlDataSource>
        `<asp:SqlDataSource ID="sourceNazar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbNazar(nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus) VALUES (1, @nzShenase, @nzNumber, @nzBody, @nzType, @nzParent, @nzDate, @nzStatus)" SelectCommand="SELECT nzId, nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus FROM tbNazar WHERE (nzAct = 1) AND (nzParent = @id) AND (nzType = 90)" DeleteCommand="DELETE FROM tbNazar WHERE (nzId = @nzId)">
            <DeleteParameters>
                <asp:Parameter Name="nzId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtShenase" Name="nzShenase" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtNumber" Name="nzNumber" PropertyName="Text" />
                <asp:ControlParameter ControlID="ASPxMemo1" Name="nzBody" PropertyName="Text" />
                <asp:ControlParameter ControlID="drpProjects" Name="nzParent" PropertyName="Value" />
                <asp:Parameter Name="nzDate" />
                <asp:Parameter Name="nzStatus" />
                <asp:ControlParameter ControlID="drpDocType" Name="nzType" PropertyName="Value" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePaper" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="spInsertPaper" InsertCommandType="StoredProcedure" SelectCommand="SELECT TOP (1) infId FROM prInformation">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtShenase" Name="paShenase" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtNumber" Name="paNumber" PropertyName="Text" Type="String" />
                <asp:Parameter DbType="Date" DefaultValue="" Name="paDate" />
                <asp:ControlParameter ControlID="drpProjects" DefaultValue="" Name="paProject" PropertyName="Value" Type="Int32" />
                <asp:Parameter Name="paType" Type="Int32" DefaultValue="6" />
                <asp:ControlParameter ControlID="ASPxMemo1" DefaultValue="" Name="paBody" PropertyName="Text" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Office2010Silver" AutoGenerateColumns="False" DataSourceID="sourceReval" KeyFieldName="reId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Font-Names="vazir">
            <SettingsPager PageSize="10">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
                <dx:GridViewDataComboBoxColumn Caption="پروژه" FieldName="reProject" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="sourceProjects" TextField="prTitle" ValueField="prId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="sourceVahed" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="نوع سند" FieldName="reSanadType" VisibleIndex="7" ShowInCustomizationForm="True">
                    <DataItemTemplate>
                        <asp:Label ID="Label31" runat="server" Text='<%# Eval("reSanadType") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="sourcePeymankar" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="SRS تاریخ ارسال " FieldName="mosSRS" VisibleIndex="9" ShowInCustomizationForm="True">
                    <DataItemTemplate>
                        <asp:Label ID="Label24" runat="server" Text='<%# Eval("mosSRS") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="وضعیت پاسخ" FieldName="nazar" VisibleIndex="12" ShowInCustomizationForm="True">
                    <DataItemTemplate>
                        <asp:Label ID="Label32" runat="server" Text='<%# Eval("reSanadType") %>' Font-Bold="True"></asp:Label>
                        <asp:Label ID="Label34" runat="server" Text='<%# Eval("reProject") %>' Font-Italic="True"></asp:Label>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select top 1 tbNazar.nzStatus,tbNazar.nzDate from tbNazar
where nzParent=(select top 1 nzId from tbNazar where nzParent=@projectId and nzType=@type) and nzType=4001 order by nzId desc ">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label34" Name="projectId" PropertyName="Text" />
                                <asp:ControlParameter ControlID="Label32" Name="type" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:Label ID="Label35" runat="server" Text='<%# Eval("reSanadType") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Label36" runat="server" Text='<%# Eval("reProject") %>' Visible="False"></asp:Label>
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT top 1 nzDate, nzStatus FROM tbNazar
where nzType=@type and nzParent=@project
order by nzid desc">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label32" Name="type" PropertyName="Text" />
                                <asp:ControlParameter ControlID="Label34" Name="project" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ پاسخ" ShowInCustomizationForm="True" VisibleIndex="13">
                    <DataItemTemplate>
                        <asp:Label ID="Label38" runat="server" Text='<%# Eval("reSanadType") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Label39" runat="server" Text='<%# Eval("reProject") %>' Visible="False"></asp:Label>
                         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select top 1 tbNazar.nzStatus,tbNazar.nzDate from tbNazar
where nzParent=(select top 1 nzId from tbNazar where nzParent=@projectId and nzType=@type) and nzType=4001 order by nzId desc ">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label34" Name="projectId" PropertyName="Text" />
                                <asp:ControlParameter ControlID="Label32" Name="type" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مهلت" ShowInCustomizationForm="True" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:Label ID="Label41" runat="server" Text='<%# Eval("reSanadType") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Label42" runat="server" Text='<%# Eval("reProject") %>' Visible="False"></asp:Label>
                         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT top 1 nzDate, nzStatus FROM tbNazar
where nzType=@type and nzParent=@project
order by nzid desc">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label32" Name="type" PropertyName="Text" />
                                <asp:ControlParameter ControlID="Label34" Name="project" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceReval" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbReval
                         (reType, reAct, reProject, reSanadType)
VALUES        (@reType, 1,@reProject,@reSanadType)
SELECT @reId = SCOPE_IDENTITY()" SelectCommand="SELECT tbReval.reId, tbReval.reType, tbReval.reAct, tbReval.reProject, tbReval.reVahed, tbReval.reSanadNumber, tbReval.reSanadType, tbProjects.prTitle, tbProjects.prPeymankar, tbKhobreganMosavab.mosSRS, (SELECT TOP (1) paDate FROM tbProjectPaper WHERE (paProject = tbReval.reProject) AND (paType = 6)) AS paperDate, (SELECT top 1 tbNazar.nzStatus FROM tbNazar  where nzParent=tbReval.reProject  and nzType=90 and nzAct=1 order by nzId desc) AS nazar, (SELECT top 1 tbNazar.nzDate FROM tbNazar  where nzParent=tbReval.reProject and nzType=90 and nzAct=1 order by nzId desc) AS nazarDate, tbProjects.prId, tbProjects.prVahed FROM tbKhbregan INNER JOIN tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob INNER JOIN tbReval INNER JOIN tbProjects ON tbReval.reProject = tbProjects.prId ON tbKhbregan.khProject = tbProjects.prId WHERE (tbReval.reAct = 1) ORDER BY tbReval.reId DESC" DeleteCommand="UPDATE tbReval SET reAct = 0 WHERE (reId = @reId)">
            <DeleteParameters>
                <asp:Parameter Name="reId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DefaultValue="1" Name="reType" />
                <asp:ControlParameter ControlID="drpProjects" DefaultValue="" Name="reProject" PropertyName="Value" />
                <asp:ControlParameter ControlID="drpDocType" Name="reSanadType" PropertyName="Value" />
                <asp:Parameter Name="reId" DefaultValue="" Direction="Output" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1)  AND (prInformation.infType = 5)">
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
    <div>
    </div>
</asp:Content>
