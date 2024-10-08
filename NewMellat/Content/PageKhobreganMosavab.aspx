﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageKhobreganMosavab.aspx.cs" Inherits="NewMellat.Content.PageKhobreganMosavab" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>




<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div style="background-color: #FFFFFF">
        <div>
    <div style="height: 250px">
    <table align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtNumber" runat="server" Theme="SoftOrange" Width="250px">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label8" runat="server" Text=":شماره نامه ابلاغ"></asp:Label>
            </td>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtShenase" runat="server" Theme="SoftOrange" Width="250px">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label7" runat="server" Text=":شناسه نامه ابلاغ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn" style="color: #FF3300">
                <asp:Label ID="lbOlaviatName" runat="server"></asp:Label>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label15" runat="server" Text=":نوع سند"></asp:Label>
            </td>
            <td class="LeftColumn">





                <table align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <dx:ASPxComboBox ID="drpYear" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="65px">
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="drpMonth" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                            </dx:ASPxComboBox>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="drpDay" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label9" runat="server" Text=":تاریخ نامه ابلاغ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <dx:ASPxComboBox ID="drpOlaviat" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="250px" DataSourceID="sourceOlaviat" RightToLeft="True" TextField="infTitle" ValueField="infId" Font-Names="B Yekan" Font-Size="14px" OnDataBound="drpOlaviat_DataBound" TabIndex="5" AutoPostBack="True" OnSelectedIndexChanged="drpOlaviat_SelectedIndexChanged">
                </dx:ASPxComboBox>
        <asp:SqlDataSource ID="sourceOlaviat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label19" runat="server" Text=":اولویت "></asp:Label>
                <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
            </td>
            <td class="LeftColumn">
                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Theme="SoftOrange" Width="250px" RightToLeft="True">
                </dx:ASPxMemo>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label11" runat="server" Text=":توضیحات"></asp:Label>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <dx:ASPxComboBox ID="drpPropozal" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="250px" RightToLeft="True" TextField="infTitle" ValueField="infId" Font-Names="B Yekan" Font-Size="14px" TabIndex="5" Visible="False">
                    <Items>
                        <dx:ListEditItem Text="ارسال پروپوزال  بلامانع است" Value="ارسال پروپوزال  بلامانع است" />
                        <dx:ListEditItem Text="نیاز به پروپوزال ندارد" Value="نیاز به پروپوزال ندارد" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label20" runat="server" Text=":پروپوزال" Visible="False"></asp:Label>
            </td>
            <td class="LeftColumn">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="250px" />
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label10" runat="server" Text=":ضمایم"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <table align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <dx:ASPxComboBox ID="drpYearSRS" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="65px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpMonthSRS" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpDaySRS" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                <dx:ASPxCheckBox ID="chkSRS" runat="server" CheckState="Checked" Theme="SoftOrange">
                </dx:ASPxCheckBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label21" runat="server" Text=":SRS مهلت ارسال "></asp:Label>
            </td>
            <td align="right">
                <table align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <dx:ASPxComboBox ID="drpYearSRSanswer" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="65px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpMonthSRSanswer" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpDaySRSanswer" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                <dx:ASPxCheckBox ID="chkSRSanswer" runat="server" CheckState="Checked" Theme="SoftOrange">
                </dx:ASPxCheckBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label22" runat="server" Text=":SRS مهلت پاسخگویی به "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <table align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <dx:ASPxComboBox ID="drpYearAmaliti" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="65px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpMonthAmaliti" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpDayAmaliti" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                <dx:ASPxCheckBox ID="chkAmaliati" runat="server" Checked="True" CheckState="Checked" Theme="SoftOrange">
                </dx:ASPxCheckBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label13" runat="server" Text=":مهلت عملیاتی شدن"></asp:Label>
            </td>
            <td class="LeftColumn">
                <table align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <dx:ASPxComboBox ID="drpYearPropozal" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="65px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpMonthPropozal" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="drpDayPropozal" runat="server" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="55px">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                <dx:ASPxCheckBox ID="chkPropozal" runat="server" CheckState="Checked" Theme="SoftOrange">
                </dx:ASPxCheckBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label12" runat="server" Text=":مهلت ارسال پروپوزال"></asp:Label>
            </td>
        </tr>
    </table>
</div>
    </div>
    <div align="center" style="padding: 6px">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Font-Names="B Yekan" Font-Size="13px" Width="150px">
        </dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourceMosavab" KeyFieldName="mosId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <UpdateButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Actions-document-save-icon.png">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </CancelButton>
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
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="mosShenase" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره نامه" VisibleIndex="2" FieldName="mosNumber">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="mosDate" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("mosDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ ارسال پروپوزال" FieldName="mosErsalDate" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("mosErsalDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ عملیاتی شدن" FieldName="mosAmaliatiDate" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosAmaliatiDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات" VisibleIndex="6" FieldName="mosbody">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پروپوزال" FieldName="mosPropozal" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="mosOlaviat" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ضمیمه" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png" NavigateUrl='<%# Eval("mosId", "~/content/PageAttach.aspx?Parent={0}&type=4") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceMosavab" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbKhobreganMosavab SET mosAct = 0 WHERE (mosId = @mosId)" InsertCommand="INSERT INTO tbKhobreganMosavab
                         (mosAct, mosKhob, mosShenase, mosNumber, mosDate, mosErsalDate, mosAmaliatiDate, mosbody, mosType, mosPropozal, mosOlaviat, mosSRS, mosSRSanswer)
VALUES        (1,@mosKhob,@mosShenase,@mosNumber,@mosDate,@mosErsalDate,@mosAmaliatiDate,@mosbody,@mosType,@mosPropozal,@mosOlaviat,@mosSRS,@mosSRSanswer)
SELECT @mosId = SCOPE_IDENTITY()" SelectCommand="SELECT tbKhobreganMosavab.* FROM tbKhobreganMosavab WHERE (mosAct = 1) AND (mosKhob = @mosKhob)" UpdateCommand="UPDATE tbKhobreganMosavab SET mosShenase = @mosShenase, mosNumber = @mosNumber, mosbody = @mosbody, mosType = @mosType, mosPropozal = @mosPropozal, mosOlaviat = @mosOlaviat WHERE (mosId = @mosId)" OnInserted="sourceMosavab_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="mosId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="mosKhob" QueryStringField="id" />
                <asp:ControlParameter ControlID="txtShenase" Name="mosShenase" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtNumber" Name="mosNumber" PropertyName="Text" />
                <asp:Parameter Name="mosDate" />
                <asp:Parameter Name="mosErsalDate" />
                <asp:Parameter Name="mosAmaliatiDate" />
                <asp:ControlParameter ControlID="ASPxMemo1" Name="mosbody" PropertyName="Text" />
                <asp:Parameter Name="mosType" />
                <asp:ControlParameter ControlID="drpPropozal" Name="mosPropozal" PropertyName="Value" />
                <asp:ControlParameter ControlID="drpOlaviat" Name="mosOlaviat" PropertyName="Value" />
                <asp:Parameter Direction="Output" Name="mosId" Type="Int32" />
                <asp:Parameter Name="mosSRS" />
                <asp:Parameter Name="mosSRSanswer" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="mosKhob" QueryStringField="id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="mosShenase" />
                <asp:Parameter Name="mosNumber" />
                <asp:Parameter Name="mosbody" />
                <asp:Parameter Name="mosType" />
                <asp:Parameter Name="mosPropozal" />
                <asp:Parameter Name="mosOlaviat" />
                <asp:Parameter Name="mosId" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
        <asp:HiddenField ID="HiddenField2" runat="server" />
    <asp:SqlDataSource ID="sourceFile" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbFiles(fiAct, fiData, fiDate, fiParent, fiType, fiTitle, fiExt) VALUES (1, @fiData, @fiDate, @fiParent, 4, @fiTitle, @fiExt)" SelectCommand="SELECT TOP (1) fiId, fiAct, fiData, fiDate, fiParent, fiType FROM tbFiles">
        <InsertParameters>
            <asp:ControlParameter ControlID="FileUpload1" Name="fiData" PropertyName="FileBytes" />
            <asp:Parameter Name="fiDate" />
            <asp:ControlParameter ControlID="HiddenField2" DefaultValue="" Name="fiParent" PropertyName="Value" />
            <asp:Parameter Name="fiTitle" />
            <asp:ControlParameter ControlID="FileUpload1" Name="fiExt" PropertyName="FileName" />
        </InsertParameters>
    </asp:SqlDataSource>
    </div>

    </div>
    
    </div>
    </form>
</body>
</html>
