<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageKhobregan.aspx.cs" Inherits="NewMellat.Content.PageKhobregan" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
            <script type="text/javascript">



                function loadDoc(parent) {

                    var oWnd = radopen("PageAttach.aspx?Parent=" + parent + "&Type=3", "RadWindow3");
                    oWnd.setSize(910, 500);
                    oWnd.Center();
                }


             


                function loadDoc2(parent) {

                    var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=70", "RadWindow2");
                    oWnd.setSize(910, 500);
                    oWnd.Center();
                }
                

                function loadDoc3(parent) {

                    var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=4", "RadWindow1");
                    oWnd.setSize(910, 500);
                    oWnd.Center();
                }
                

                function loadDoc4(parent) {

                    var oWnd = radopen("PageKhobreganMosavab.aspx?id=" + parent , "RadWindow1");
                    oWnd.setSize(910, 500);
                    oWnd.Center();
                }
                
             
                

                function loadDoc5(parent) {

                    var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=3", "RadWindow2");
                    oWnd.setSize(910, 500);
                    oWnd.Center();
                }



                function loadDoc6(parent) {

                    var oWnd = radopen("pagekhrePort.aspx?Project=" + parent + "&Type=3", "RadWindow2");
                    oWnd.setSize(910, 600);
                    oWnd.Center();
                }



    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
    <div style="height: 360px; padding-top: 9px;" dir="ltr" class="box box-danger">
    <table align="right" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="right" colspan="3">
                <asp:SqlDataSource ID="sourceProjects2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM tbProjects WHERE (prStatus = 0) AND (prAct = 1)   and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
                     ORDER BY prId DESC"><SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectProjectsKhob" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <dx:ASPxListBox ID="ASPxListBox1" runat="server" DataSourceID="sourceProjects2" RightToLeft="True" SelectionMode="CheckColumn" TextField="prTitle" Theme="Office2010Silver" ValueField="prId" Width="98%">
                    <Border BorderColor="#F8DF8E" />
                </dx:ASPxListBox>
            </td>
            <td width="14%">
                <asp:Label ID="Label1" runat="server" Text=":نام پروژه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                <cc1:PersianCalendar ID="PersianCalendar2" runat="server" Width="89%"></cc1:PersianCalendar>
            </td>
            <td class="RightColumn" width="14%">
                <asp:Label ID="Label12" runat="server" Text=":تاریخ برگزاری"></asp:Label>
            </td>
            <td align="right" style="padding-top: 4px" width="36%">
                    <asp:TextBox ID="txtJalaseNumber" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                </td>
            <td class="RightColumn">
                <asp:Label ID="Label13" runat="server" Text=":شماره جلسه "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
        </tr>
        <tr>
            <td class="LeftColumn" align="right">
                    <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label8" runat="server" Text=":شماره نامه"></asp:Label>
            </td>
            <td class="LeftColumn" align="right">
                    <asp:TextBox ID="txtShenase" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label7" runat="server" Text=":شناسه نامه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectProjects" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn" align="right" style="padding-top: 4px">
                <cc1:PersianCalendar ID="PersianCalendar1" runat="server" Width="89%"></cc1:PersianCalendar>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label9" runat="server" Text=":تاریخ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="right" style="padding-top: 4px">
                    <asp:TextBox ID="ASPxMemo1" runat="server" CssClass="form-control" Width="98%"></asp:TextBox>
                </td>
            <td class="RightColumn">
                <asp:Label ID="Label11" runat="server" Text=":توضیحات"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                    &nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn" style="padding-top: 11px" align="right">
                <telerik:RadUpload ID="RadUpload1" Runat="server" ControlObjectsVisibility="RemoveButtons, AddButton" MaxFileInputsCount="10" Width="95%" Skin="Sunset">
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
    <div align="center" class="box box-success" style="padding: 6px 6px 11px 6px">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Font-Names="vazir" Font-Size="13px" Width="150px">
        </dx:ASPxButton>
        <asp:SqlDataSource ID="sourcePaper" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="spInsertPaper" InsertCommandType="StoredProcedure" SelectCommand="SELECT TOP (1) infId FROM prInformation">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtShenase" Name="paShenase" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtNumber" Name="paNumber" PropertyName="Text" Type="String" />
                <asp:Parameter DbType="Date" DefaultValue="" Name="paDate" />
                <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="paProject" PropertyName="Value" Type="Int32" />
                <asp:Parameter Name="paType" Type="Int32" DefaultValue="3" />
                <asp:ControlParameter ControlID="ASPxMemo1" Name="paBody" PropertyName="Text" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>

   
    <div style="padding-top: 8px" class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Office2010Silver" AutoGenerateColumns="False" DataSourceID="sourceKhobregan" KeyFieldName="khId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnRowCommand="ASPxGridView1_RowCommand" Font-Names="vazir">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <EditButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/edit-icon.png">
                    </Image>
                </EditButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="شماره جلسه " VisibleIndex="2" FieldName="khJalaseNumber">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مصوب" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Content/images/icons/mp3tag-icon.png" NavigateUrl='<%# Eval("khId","~/content/PageKhobreganMosavab.aspx?id={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="رد" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/Content/images/icons/Mimetypes-document-seal-icon.png" NavigateUrl='<%# Eval("khId","~/content/PagePages.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="توقف" VisibleIndex="6">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" ImageUrl="~/Content/images/icons/missed-calls-icon.png" NavigateUrl='<%# Eval("khId","~/content/PagePages.aspx?project={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="طرح در جلسه" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Theme="SoftOrange">
                        </dx:ASPxCheckBox>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="پروژه" FieldName="khProject" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="sourceProjects" TextField="prTitle" ValueField="prId">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ضمایم" VisibleIndex="8">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png" Target="_blank" NavigateUrl='<%# Eval("khId","~/content/PageAttach.aspx?Parent={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نامه ها" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("khId","~/content/PagePages.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ برگزاری جلسه" FieldName="khJalaseDate" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="d">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <DataItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("khJalaseDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="olaviat" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="sourceOlaviat" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="vahed" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="sourceVahed" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظرفنی" FieldName="TechnicalSuvisor" VisibleIndex="12">
                    <PropertiesComboBox DataSourceID="sourceVahed" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn VisibleIndex="13">
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" AlternateText="بازگشت به مرحله قبل" CommandArgument='<%# Eval("khId") %>' CommandName="bk" ImageUrl="~/Content/images/icons/refresh-icon.png" ToolTip="بازگشت به مرحله قبل" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <%--  <dx:GridViewDataTextColumn Caption="گزارش " VisibleIndex="14" >
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink7" runat="server" ImageUrl="~/Content/images/icons/App-chart-icon.png" NavigateUrl="~/Content/PageKhReport.aspx" Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="سند" FieldName="khAct" VisibleIndex="15">
                    <Settings AllowAutoFilter="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" ImageUrl="~/Content/images/icons/product-sales-report-icon.png" NavigateUrl='<%# Eval("khProject","~/content/PageDt.aspx?pr={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نامه های ثبتی" VisibleIndex="16">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink9" runat="server" ImageUrl="~/Content/images/icons/folder-documents-icon24.png" NavigateUrl='<%# Eval("khProject","~/content/PagePg.aspx?pr={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>--%>
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceKhobregan" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbKhbregan SET khAct = 0 WHERE (khId = @khId)" InsertCommand="INSERT INTO tbKhbregan(khProject, khAct, khJalaseNumber, khJalaseDate) VALUES (@khProject, 1, @khJalaseNumber, @khJalaseDate)
SELECT @khId = SCOPE_IDENTITY()" SelectCommand="SELECT khId, khProject, khAct, khJalaseNumber, khJalaseDate, khStatus,prOlaviat as olaviat,prVahed as vahed,TechnicalSuvisor
 FROM tbKhbregan join tbProjects on prId=khProject
 WHERE (khAct = 1) AND (khStatus IN (0, 2)) 
 and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects  WHERE (prType = 1)  AND (prCode = @prCode) ))  
 ORDER BY khId DESC" OnInserted="sourceKhobregan_Inserted" UpdateCommand="UPDATE tbKhbregan SET khJalaseNumber = @khJalaseNumber, khJalaseDate = @khJalaseDate WHERE (khId = @khId)">
           <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
             <DeleteParameters>
                <asp:Parameter Name="khId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="khProject" />
                <asp:ControlParameter ControlID="txtJalaseNumber" Name="khJalaseNumber" PropertyName="Text" />
                <asp:Parameter Name="khJalaseDate" />
                <asp:Parameter Name="khId" Direction="Output" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="khJalaseNumber" />
                <asp:Parameter Name="khJalaseDate" />
                <asp:Parameter Name="khId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="vazir" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation">
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceOlaviat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="sourceFile" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbFiles(fiAct, fiData, fiDate, fiParent, fiType, fiTitle, fiExt) VALUES (1, @fiData, @fiDate, @fiParent, 3, @fiTitle, @fiExt)" SelectCommand="SELECT TOP (1) fiId, fiAct, fiData, fiDate, fiParent, fiType FROM tbFiles">
        <InsertParameters>
            <asp:ControlParameter ControlID="FileUpload1" Name="fiData" PropertyName="FileBytes" />
            <asp:Parameter Name="fiDate" />
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="fiParent" PropertyName="Value" />
            <asp:Parameter Name="fiTitle" />
            <asp:ControlParameter ControlID="FileUpload1" Name="fiExt" PropertyName="FileName" />
        </InsertParameters>
    </asp:SqlDataSource>
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

</asp:Content>
