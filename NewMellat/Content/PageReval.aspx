<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageReval.aspx.cs" Inherits="NewMellat.Content.PageReval" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    
        function loadDoc(parent) {

            var oWnd = radopen("PageAttach.aspx?Parent=" + parent + "&Type=5", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc2(parent) {

            var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=6", "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

    </script>

    <style type="text/css">
        .dex
        {
            width:200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <div>
    <div style="height: 340px; padding-top: 9px;" dir="ltr" class="box box-danger">
    <table align="right" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="36%" align="right">
                <dx:ASPxComboBox ID="drpDocType" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="95%" RightToLeft="True" TextField="prTitle" ValueField="prId" Font-Names="vazir" Font-Size="13px" OnDataBound="drpProjects_DataBound">
                    <Items>
                        <dx:ListEditItem Text="سند نیازمندیها" Value="3000" />
                        <dx:ListEditItem Text="پروتوتایپ" Value="4000" />
                    </Items>
                    <Border BorderColor="#F8DF8E" />
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1)  AND (prInformation.infType = 1)">
                </asp:SqlDataSource>
            </td>
            <td width="14%">
                <asp:Label ID="Label13" runat="server" Text=":نوع"></asp:Label>
            </td>
            <td align="right" width="36%">
                <dx:ASPxComboBox ID="drpProjects" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="95%" DataSourceID="sourceProjects" RightToLeft="True" TextField="prTitle" ValueField="prId" Font-Names="vazir" Font-Size="13px" OnDataBound="drpProjects_DataBound" AutoPostBack="True" DropDownStyle="DropDown" HorizontalAlign="Center">
                    <ListBoxStyle Wrap="True" CssClass="dex">
                    </ListBoxStyle>
                    <Border BorderColor="#F8DF8E" />
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbProjects.prTitle, tbProjects.prId FROM tbProjects INNER JOIN tbKhbregan ON tbProjects.prId = tbKhbregan.khProject INNER JOIN tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob WHERE (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1) and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) ">
                    <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td width="14%">
                <asp:Label ID="Label1" runat="server" Text=":نام پروژه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                &nbsp;</td>
            <td class="RightColumn">
                &nbsp;</td>
            <td class="LeftColumn">
                &nbsp;</td>
            <td class="RightColumn">
                &nbsp;</td>
        </tr>
        <tr>
            <td  colspan="4" align="center">
                <div class="box box-warning" style="width: 80%">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceInfo" AllowPaging="True" GridLines="None" OnDataBound="GridView1_DataBound" PageSize="1" ShowHeader="False">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="LeftColumn" align="right" width="150">
                                        <asp:Label ID="Label29" runat="server" ForeColor="#990000" Text='<%# Eval("prVahed") %>'></asp:Label>
                                    </td>
                                    <td class="RightColumn" width="150">
                                        <asp:Label ID="Label28" runat="server" Text=":واحد متولی"></asp:Label>
                                    </td>
                                    <td class="LeftColumn" align="right" width="150">
                                        <asp:Label ID="Label19" runat="server" ForeColor="#990000" Text='<%# Eval("mosOlaviat") %>'></asp:Label>
                                    </td>
                                    <td class="RightColumn" style="width: 150px; height: 30px">
                                        <asp:Label ID="Label14" runat="server" Text=":اولویت پروژه"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="LeftColumn" align="right">
                                        <asp:Label ID="Label21" runat="server" ForeColor="#990000" Text='<%# Eval("mosSRSanswer") %>'></asp:Label>
                                    </td>
                                    <td class="RightColumn">
                                        <asp:Label ID="Label16" runat="server" Text=":مهلت زمانی پاسخ ناظر"></asp:Label>
                                    </td>
                                    <td class="LeftColumn" align="right" width="150">
                                        <asp:Label ID="Label20" runat="server" ForeColor="#990000" Text='<%# Eval("mosSRS") %>'></asp:Label>
                                    </td>
                                    <td class="RightColumn" style="width: 150px; height: 30px">
                                        <asp:Label ID="Label17" runat="server" Text=":SRS تاریخ ارسال "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="LeftColumn" align="right">
                                        <asp:Label ID="Label23" runat="server" ForeColor="#990000" Text='<%# Eval("prPeymankar") %>'></asp:Label>
                                    </td>
                                    <td class="RightColumn">
                                        <asp:Label ID="Label2" runat="server" Text=":پیمانکار"></asp:Label>
                                    </td>
                                    <td class="LeftColumn" align="right" width="150">
                                        <asp:Label ID="Label22" runat="server" ForeColor="#990000" Text='<%# Eval("mosPropozal") %>'></asp:Label>
                                    </td>
                                    <td class="RightColumn" style="width: 150px; height: 30px">
                                        <asp:Label ID="Label18" runat="server" Text=":تاریخ ارسال پروپوزال"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Visible="False" />
            </asp:GridView>
                    </div>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding-top: 4px">
                    <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label8" runat="server" Text=":شماره نامه"></asp:Label>
            </td>
            <td align="right" style="padding-top: 4px">
                    <asp:TextBox ID="txtShenase" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label7" runat="server" Text=":شناسه نامه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn" align="right" style="padding-top: 4px">
                <cc1:PersianCalendar ID="PersianCalendar1" runat="server" Width="89%"></cc1:PersianCalendar>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label9" runat="server" Text=":تاریخ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3" style="padding-top: 4px">
                    <asp:TextBox ID="ASPxMemo1" runat="server" CssClass="form-control" Width="98%"></asp:TextBox>
                </td>
            <td class="RightColumn">
                <asp:Label ID="Label11" runat="server" Text=":توضیحات"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="right" style="padding-top: 4px">
                <telerik:RadUpload ID="RadUpload1" Runat="server" ControlObjectsVisibility="RemoveButtons, AddButton" MaxFileInputsCount="3" Width="95%" Skin="Sunset">
                    <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                </telerik:RadUpload>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label10" runat="server" Text=":ضمایم"></asp:Label>
            </td>
        </tr>
    </table>
</div>
    </div>
        <div>
            <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosSRS, tbProjects.prTitle, tbKhobreganMosavab.mosPropozal, tbProjects.prPeymankar, tbKhobreganMosavab.mosSRSanswer, tbProjects.prVahed FROM tbKhobreganMosavab INNER JOIN tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId INNER JOIN tbProjects ON tbKhbregan.khProject = tbProjects.prId WHERE (tbProjects.prId = @prId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="drpProjects" Name="prId" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    <div align="center" style="padding: 6px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Font-Names="vazir" Font-Size="13px" Width="150px">
        </dx:ASPxButton>
    <asp:SqlDataSource ID="sourceFile" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbFiles(fiAct, fiData, fiDate, fiParent, fiType, fiTitle, fiExt) VALUES (1, @fiData, @fiDate, @fiParent, 5, @fiTitle, @fiExt)" SelectCommand="SELECT TOP (1) fiId, fiAct, fiData, fiDate, fiParent, fiType FROM tbFiles">
        <InsertParameters>
            <asp:ControlParameter ControlID="FileUpload1" Name="fiData" PropertyName="FileBytes" />
            <asp:Parameter Name="fiDate" />
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="fiParent" PropertyName="Value" />
            <asp:Parameter Name="fiTitle" />
            <asp:ControlParameter ControlID="FileUpload1" Name="fiExt" PropertyName="FileName" />
        </InsertParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceNazar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbNazar(nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus) VALUES (1, @nzShenase, @nzNumber, @nzBody, @nzType, @nzParent, @nzDate, @nzStatus)" SelectCommand="SELECT nzId, nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus FROM tbNazar WHERE (nzAct = 1) AND (nzParent = @id) AND (nzType = 90)" DeleteCommand="DELETE FROM tbNazar WHERE (nzId = @nzId)">
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
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Office2010Silver" AutoGenerateColumns="False" DataSourceID="sourceReval" KeyFieldName="reId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" Font-Names="vazir">
            <SettingsPager PageSize="10">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="شماره استعلام سند نیازمندیها " VisibleIndex="14" FieldName="reSanadNumber" Visible="False" ShowInCustomizationForm="True">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نامه ها" VisibleIndex="5" ShowInCustomizationForm="True">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("reId","~/content/PagePages.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ضمایم" VisibleIndex="4" ShowInCustomizationForm="True">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png" Target="_blank" NavigateUrl='<%# Eval("reId","~/content/PageAttach.aspx?Parent={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
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
                 <dx:GridViewDataComboBoxColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="3">
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
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="8" ShowInCustomizationForm="True">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Content/images/icons/mp3tag-icon.png" NavigateUrl='<%# Eval("prId", "~/content/PageAnswer3.aspx?id={0}") %>' Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Eval("reSanadType") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="SRS تاریخ ارسال " FieldName="mosSRS" VisibleIndex="9" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="وضعیت استعلام پاسخ SRS / پروتوتایپ" FieldName="nazarStaus" VisibleIndex="12" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ دریافت SRS / پروتوتایپ" VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:Label ID="Label32" runat="server" Text='<%# Eval("reSanadType") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Label34" runat="server" Text='<%# Eval("reProject") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" OnRowDataBound="GridView22_RowDataBound" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="nzDate" SortExpression="nzDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nzDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nzDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT top 1 nzDate, nzStatus FROM tbNazar
where nzType=@type and nzParent=@project
order by nzid desc">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label32" Name="type" PropertyName="Text" />
                                <asp:ControlParameter ControlID="Label34" Name="project" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ پاسخ" ShowInCustomizationForm="True" VisibleIndex="13" FieldName="nazarDate1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مهلت پاسخ استعلام SRS / پروتوتایپ" ShowInCustomizationForm="True" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:Label ID="Label32" runat="server" Text='<%# Eval("reSanadType") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Label34" runat="server" Text='<%# Eval("reProject") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView22345" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" OnRowDataBound="GridView22345_RowDataBound" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="nzDate" SortExpression="nzDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nzDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nzDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT top 1 nzDate, nzStatus FROM tbNazar
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
SELECT @reId = SCOPE_IDENTITY()" SelectCommand="SELECT tbReval.reId,tbKhobreganMosavab.mosId,tbKhbregan.khId, tbReval.reType, tbReval.reAct, tbReval.reProject, tbReval.reVahed, tbReval.reSanadNumber, tbReval.reSanadType, tbProjects.prTitle, tbProjects.prPeymankar,  
(SELECT TOP (1) paDate FROM tbProjectPaper WHERE (paProject = tbReval.reProject) AND (paType = 6) order by paId desc) AS paperDate,
(SELECT top 1 tbNazar.nzStatus FROM tbNazar  where nzParent=tbReval.reProject  and nzType=90 and nzAct=1 order by nzId desc) AS nazar, 
 (SELECT top 1 tbNazar.nzDate FROM tbNazar  where nzParent=tbReval.reProject and nzType=90 and nzAct=1 order by nzId desc) AS nazarDate,
  tbProjects.prId, tbProjects.prVahed,tbProjects.TechnicalSuvisor,
   (SELECT    TOP 1    DimDate.PersianStr
FROM            DimDate RIGHT OUTER JOIN
                         tbKhobreganMosavab ON DimDate.GregorianDate = tbKhobreganMosavab.mosSRS where mosKhob=khId) as mosSRS,
(SELECT        TOP (1) DimDate.PersianStr
FROM            tbNazar INNER JOIN
                         DimDate ON tbNazar.nzDate = DimDate.GregorianDate
WHERE        (tbNazar.nzParent =
                             (SELECT        TOP (1) nzId
                               FROM            tbNazar AS tbNazar_1
                               WHERE        (nzParent = reProject) AND (nzType = reSanadType) order by nzId desc) ) AND (tbNazar.nzType = 4001) ORDER BY tbNazar.nzId DESC) as nazarDate1
, (select top 1 CASE WHEN tbNazar.nzStatus = 195 THEN N'تایید'  WHEN tbNazar.nzStatus = 196 THEN N'عدم تایید'  END
 from tbNazar
 where nzParent=(select top 1 nzId from tbNazar where nzParent=reProject and nzType=reSanadType) and nzType=4001 order by nzId desc) as nazarStaus 


 FROM tbKhbregan INNER JOIN tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob and tbKhobreganMosavab.mosAct =1 INNER JOIN tbReval INNER JOIN tbProjects ON tbReval.reProject = tbProjects.prId and tbReval.reAct=1 ON tbKhbregan.khProject = tbProjects.prId WHERE (tbReval.reAct = 1) and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
             ORDER BY tbReval.reId DESC
" DeleteCommand="UPDATE tbReval SET reAct = 0 WHERE (reId = @reId)" OnInserted="sourceReval_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="reId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter DefaultValue="1" Name="reType" />
                <asp:ControlParameter ControlID="drpProjects" DefaultValue="" Name="reProject" PropertyName="Value" />
                <asp:ControlParameter ControlID="drpDocType" Name="reSanadType" PropertyName="Value" />
                <asp:Parameter Direction="Output" Name="reId" Type="Int32"  />
            </InsertParameters>
        </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="vazir" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1)  AND (prInformation.infType = 5)">
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Close" Skin="Sunset">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
    </div>

    </div>
    <div align="center" style="padding: 5px" class="box box-danger">



        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton3_Click" />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="Reval" GridViewID="ASPxGridView1" Landscape="True" PaperKind="A4">
        </dx:ASPxGridViewExporter>



    </div>
</asp:Content>
