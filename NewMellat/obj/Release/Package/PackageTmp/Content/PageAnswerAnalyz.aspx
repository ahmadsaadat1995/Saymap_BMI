﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageAnswerAnalyz.aspx.cs" Inherits="NewMellat.Content.PageAnswerAnalyz" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2018.1.117.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            font-family: "b yekan";
            font-size: 16px;
            color: #444444;
            text-decoration: none;
            font-style: normal;
            vertical-align: middle;
            text-align: left;
            padding-left: 2px;
            width: 209px;
            height: 35px;
        }
        .auto-style2 {
            font-family: "b yekan";
            font-size: 16px;
            color: #444444;
            text-decoration: none;
            font-style: normal;
            vertical-align: middle;
            text-align: left;
            padding-left: 2px;
            width: 207px;
            height: 35px;
        }
    </style>
</head>
<body>
       <form id="form1" runat="server">
    <div align="center">
    
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="right" style="font-family: 'b yekan'; font-size: 15px; color: #CC3300;">
                    <asp:Label ID="lbPricePosh" runat="server"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label7" runat="server" Text=":مبلغ پشتیبانی پیشنهادی شرکت"></asp:Label>
                </td>
                <td align="right" style="font-family: 'b yekan'; font-size: 15px; color: #CC3300;">
                    <asp:Label ID="lbPriceTolid" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text=":مبلغ تولید پیشنهادی شرکت"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                <div align="center">
                    <table align="right" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Label23" runat="server" Font-Names="B Yekan" Font-Size="14px" Text="ریال"></asp:Label>
                            </td>
                            <td>
                <dx:ASPxTextBox ID="txtPriceTolid0" runat="server" Theme="SoftOrange" Width="170px">
                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label9" runat="server" Text=":مبلغ پشتیبانی پیشنهادی تدارکات"></asp:Label>
                </td>
                <td align="right">
                <div align="center">
                    <table align="right" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Label22" runat="server" Font-Names="B Yekan" Font-Size="14px" Text="ریال"></asp:Label>
                            </td>
                            <td>
                <dx:ASPxTextBox ID="txtPriceTolid" runat="server" Theme="SoftOrange" Width="170px">
                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Text=":مبلغ تولید پیشنهادی تدارکات"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td align="right">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right">
                    <dx:ASPxTextBox ID="txtShenase0" runat="server" Theme="SoftOrange" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text=":شماره نامه"></asp:Label>
                </td>
                <td align="right">
                    <dx:ASPxTextBox ID="txtShenase" runat="server" Theme="SoftOrange" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text=":شناسه نامه"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <dx:ASPxTextBox ID="txtBody" runat="server" Theme="SoftOrange" Width="170px" RightToLeft="True">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" Text=":توضیحات"></asp:Label>
                </td>
                <td class="LeftColumn">
                <cc1:PersianCalendar ID="PersianCalendar1" runat="server" TabIndex="9"></cc1:PersianCalendar>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text=":تاریخ نامه"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
        <div align="center" style="padding: 8px">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="B Yekan" Font-Size="13px" OnClick="ASPxButton1_Click" Text="ثبت نامه جدید" Theme="SoftOrange" Width="150px">
            </dx:ASPxButton>
        </div>
        <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourcePages" KeyFieldName="paId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnDataBound="ASPxGridView1_DataBound">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <UpdateButton ButtonType="Image">
                    <Image ToolTip="ذخیره تغییرات" Url="~/Content/images/icons/Actions-document-save-icon.png">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image ToolTip="انصراف" Url="~/Content/images/icons/Close-2-icon.png">
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
                <dx:GridViewDataTextColumn Caption="شناسه نامه" VisibleIndex="1" FieldName="paShenase">
                    <settings autofiltercondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره نامه" FieldName="paNumber" VisibleIndex="2">
                    <settings autofiltercondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="paDate" VisibleIndex="3">
                    <settings allowautofilter="False" />
                    <EditFormSettings Visible="False" />
                    <dataitemtemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                    </dataitemtemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات" FieldName="paBody" VisibleIndex="4">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
            <asp:SqlDataSource ID="sourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbProjectPaper SET paAct = 0 WHERE (paId = @paId)" InsertCommand="INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paBody) VALUES (@paShenase, @paNumber, @paDate, @paProject, 1, @paType, @paBody)" SelectCommand="SELECT paId, paShenase, paNumber, paDate, paProject, paAct, paType, paBody FROM tbProjectPaper WHERE (paAct = 1) AND (paType = @paType) AND (paProject = @paProject)" UpdateCommand="UPDATE tbProjectPaper SET paShenase = @paShenase, paNumber = @paNumber, paBody = @paBody WHERE (paId = @paId)">
                <DeleteParameters>
                    <asp:Parameter Name="paId" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtShenase" Name="paShenase" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtShenase0" Name="paNumber" PropertyName="Text" />
                    <asp:Parameter Name="paDate" />
                    <asp:QueryStringParameter Name="paProject" QueryStringField="project" />
                    <asp:QueryStringParameter Name="paType" QueryStringField="type" />
                    <asp:ControlParameter ControlID="txtBody" Name="paBody" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="paType" QueryStringField="type" />
                    <asp:QueryStringParameter DefaultValue="" Name="paProject" QueryStringField="project" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="paShenase" />
                    <asp:Parameter Name="paNumber" />
                    <asp:Parameter Name="paBody" />
                    <asp:Parameter Name="paId" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
        </div>
    </form>

</body>
</html>
