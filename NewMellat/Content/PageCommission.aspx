<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageCommission.aspx.cs" Inherits="NewMellat.Content.PageCommission" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="LavaControl" Namespace="LavaControl" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function RefreshParentPage()//function in parent page
        {
            document.location.reload();
        }


        function loadDoc(parent) {

            var oWnd = radopen("PageSheaseNumber.aspx?id=" + parent, "RadWindow1");
            oWnd.setSize(710, 400);
            oWnd.Center();
        }


        function loadDoc2(parent) {
            var oWnd = radopen("PageCommissionMosavab.aspx?id=" + parent, "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc3(parent) {

            var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=20", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc4(parent) {

            var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=21", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }




        function loadDoc5(parent) {

            var oWnd = radopen("PageAttach.aspx?Parent=" + parent + "&Type=1001", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <div style="height: 270px; padding-top: 9px;" dir="ltr" class="box box-danger">
                <table align="right" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right" colspan="3">
                          
                <dx:ASPxTokenBox ID="tokenVahed" runat="server" AllowMouseWheel="True" AnimationType="Fade" DataSourceID="sourceNezarat" RightToLeft="True" Theme="SoftOrange" Tokens="" TextField="ProjectTitle" ValueField="ItemID" Font-Names="vazir" Font-Size="13px" Height="25px" Width="98%" TabIndex="1">
                    <Border BorderColor="#F1DF9E" />
                </dx:ASPxTokenBox>
                        </td>
                        <td width="14%">
                            <asp:Label ID="Label1" runat="server" Text=":نام پروژه"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <cc1:PersianCalendar ID="PersianCalendar2" runat="server" Width="89%"></cc1:PersianCalendar>
                        </td>
                        <td class="RightColumn">
                            <asp:Label ID="Label12" runat="server" Text=":تاریخ برگزاری جلسه"></asp:Label>
                        </td>
                        <td align="right" style="padding-top: 4px">
                    <asp:TextBox ID="txtJalaseNumber" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                        </td>
                        <td class="RightColumn">
                            <asp:Label ID="Label13" runat="server" Text=":شماره جلسه"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="LeftColumn">&nbsp;</td>
                        <td class="RightColumn">&nbsp;</td>
                        <td class="LeftColumn">&nbsp;</td>
                        <td class="RightColumn">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" width="36%">
                    <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                        </td>
                        <td width="14%">
                            <asp:Label ID="Label8" runat="server" Text=":شماره نامه"></asp:Label>
                        </td>
                        <td align="right" width="36%">
                    <asp:TextBox ID="txtShenase" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                        </td>
                        <td class="RightColumn" width="14%">
                            <asp:Label ID="Label7" runat="server" Text=":شناسه نامه"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="LeftColumn">&nbsp;</td>
                        <td class="RightColumn">&nbsp;</td>
                        <td align="right" style="padding-top: 4px">
                            <cc1:PersianCalendar ID="PersianCalendar1" runat="server" Width="88%"></cc1:PersianCalendar>
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
                        <td class="LeftColumn">&nbsp;</td>
                        <td class="RightColumn">&nbsp;</td>
                        <td align="right" style="padding-top: 5px">
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
    </div>
    <div align="center" style="padding: 8px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="vazir" Font-Size="13px" Text="ثبت اطلاعات" Theme="SoftOrange" Width="150px" OnClick="ASPxButton1_Click">
        </dx:ASPxButton>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infType, infAct, infTitle FROM prInformation WHERE (infType = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)">
        </asp:SqlDataSource>
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Office2010Silver" AutoGenerateColumns="False" DataSourceID="sourceHeyatNezarat" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" KeyFieldName="heId" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" Font-Names="vazir">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <UpdateButton ButtonType="Image">
                    <Image IconID="save_save_16x16office2013">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image IconID="edit_delete_16x16" ToolTip="انصراف">
                    </Image>
                </CancelButton>
                <EditButton ButtonType="Image">
                    <Image IconID="edit_edit_16x16">
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
                <dx:GridViewDataTextColumn Caption="شماره جلسه " VisibleIndex="4" FieldName="JalaseNumber">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نتایج جلسه" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Content/images/icons/mp3tag-icon.png" Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پروژه" FieldName="prTitle" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="Vahed" VisibleIndex="2">
                    
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="3">
                    
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                 <dx:GridViewDataTextColumn Caption="تاریخ برگزاری جلسه" FieldName="JalasePDate" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نوع درخواست" VisibleIndex="6" FieldName="Elhaghie">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="sourceHeyatNezarat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO Commission (Act, ProjectId, JalaseNumber, JalaseDate, IsElhaghie,ProposalId)
VALUES (1,@Project,@JalaseNumber,@JalaseDate,@IsElhaghie,@ProposalId) SELECT @ID = SCOPE_IDENTITY()" SelectCommand="SELECT tbProjects.prTitle, DimDate.PersianStr as  JalasePDate,Commission.JalaseDate, Commission.JalaseNumber, Commission.Id, prInformation.infTitle as Vahed,prInformation_1.infTitle as TechnicalSuvisor, tbProjects.prPeymankar, Commission.IsElhaghie,
 tbProjects.prId,(case Commission.IsElhaghie when 1 then N'الحاقیه' else N'پروپزال' end)  Elhaghie

FROM Commission INNER JOIN tbProjects ON Commission.ProjectId = tbProjects.prId Inner Join 
prInformation On infId = tbProjects.prVahed left Outer Join 
            prInformation prInformation_1 On prInformation_1.infId = tbProjects.TechnicalSuvisor left Outer Join
DimDate On  Commission.JalaseDate = DimDate.GregorianDate

WHERE (Commission.Act = 1) AND (tbProjects.irIsAnalyz = 1)  
             --and (select top 1 paId from tbProjectPaper where paProject=prid and paType=82) is not null
             and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) " DeleteCommand="UPDATE Commission SET Act = 0 WHERE (Id = @Id)" UpdateCommand="UPDATE tbHeyatNezarat SET JalaseNumber = @JalaseNumber, JalaseDate = @JalaseDate WHERE (Id = @Id)" OnInserted="sourceHeyatNezarat_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Act" />
                <asp:Parameter Name="ProjectId" />
                <asp:ControlParameter ControlID="txtJalaseNumber" Name="JalaseNumber" PropertyName="Text" />
                <asp:Parameter Name="JalaseDate" />
                <asp:Parameter Name="IsElhaghie" />
                <asp:Parameter Name="ProposalId" />
                <asp:Parameter Name="ID" Direction="Output" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="JalaseNumber" />
                <asp:Parameter Name="JalaseDate" />
                <asp:Parameter Name="Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="vazir" Font-Size="15px" Skin="Sunset">
        </telerik:RadNotification>
        <asp:SqlDataSource ID="sourcePaper" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="spInsertPaper" InsertCommandType="StoredProcedure" SelectCommand="SELECT TOP (1) infId FROM prInformation">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtShenase" Name="paShenase" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtNumber" Name="paNumber" PropertyName="Text" Type="String" />
                <asp:Parameter DbType="Date" DefaultValue="" Name="paDate" />
                <asp:ControlParameter ControlID="HiddenField2" DefaultValue="" Name="paProject" PropertyName="Value" Type="Int32" />
                <asp:Parameter Name="paType" Type="Int32" DefaultValue="151" />
                <asp:ControlParameter ControlID="ASPxMemo1" Name="paBody" PropertyName="Text" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="sourceFile" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbFiles(fiAct, fiData, fiDate, fiParent, fiType, fiTitle, fiExt) VALUES (1, @fiData, GetDate(), @fiParent, 8, @fiTitle, @fiExt)" SelectCommand="SELECT TOP (1) fiId, fiAct, fiData, fiDate, fiParent, fiType FROM tbFiles">
        <InsertParameters>
            <asp:ControlParameter ControlID="FileUpload1" Name="fiData" PropertyName="FileBytes" />
            <asp:ControlParameter ControlID="HiddenField2" DefaultValue="" Name="fiParent" PropertyName="Value" />
            <asp:Parameter Name="fiTitle" />
            <asp:ControlParameter ControlID="FileUpload1" Name="fiExt" PropertyName="FileName" />
        </InsertParameters>
    </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField2" runat="server" />
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
        <asp:SqlDataSource ID="sourceNezarat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT  tbTarhPishnehadi.thId ItemID ,tbProjects.prTitle ProjectTitle FROM 
tbProjects INNER JOIN tbTarhPishnehadi ON tbProjects.prId = tbTarhPishnehadi.thProject Left Outer Join
Commission On tbTarhPishnehadi.thId = Commission.ProposalId 

 WHERE (tbTarhPishnehadi.thAct = 1) AND (tbProjects.irIsAnalyz = 1) and tbTarhPishnehadi.NezaratMosavab =1  
AND (tbProjects.prIsTarh = 1)  and Commission.Id is null   and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) "><SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters></asp:SqlDataSource>
    </div>
</asp:Content>
