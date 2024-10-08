﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageAnswerEdarat.aspx.cs" Inherits="NewMellat.Content.PageAnswerEdarat" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2018.1.117.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #FFFFFF">
        <div>
    <div style="height: 250px">
    <table align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="LeftColumn">
                &nbsp;</td>
            <td class="RightColumn">
                &nbsp;</td>
            <td class="LeftColumn">
                <dx:ASPxComboBox ID="drpNazarType" runat="server" AnimationType="Fade" DataSourceID="sourceNazarType" RightToLeft="True" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Font-Names="B Yekan" Font-Size="13px" Width="250px">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="sourceNazarType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="6" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label1" runat="server" Text=":اعلام نظر"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtNumber" runat="server" Theme="SoftOrange" Width="250px">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label8" runat="server" Text=":شماره نامه"></asp:Label>
            </td>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtShenase" runat="server" Theme="SoftOrange" Width="250px">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label7" runat="server" Text=":شناسه نامه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">
                <cc1:PersianCalendar ID="PersianCalendar1" runat="server" Width="222px"></cc1:PersianCalendar>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label9" runat="server" Text=":تاریخ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">
                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Theme="SoftOrange" Width="250px">
                </dx:ASPxMemo>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label11" runat="server" Text=":توضیحات"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="250px" />
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label10" runat="server" Text=":ضمایم"></asp:Label>
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
        <asp:SqlDataSource ID="sourceNazar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbNazar(nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus) VALUES (1, @nzShenase, @nzNumber, @nzBody, 10, @nzParent, @nzDate, @nzStatus)" SelectCommand="SELECT nzId, nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus FROM tbNazar WHERE (nzAct = 1) AND (nzParent = @id) AND (nzType = 10)" DeleteCommand="DELETE FROM tbNazar WHERE (nzId = @nzId)">
            <DeleteParameters>
                <asp:Parameter Name="nzId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtShenase" Name="nzShenase" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtNumber" Name="nzNumber" PropertyName="Text" />
                <asp:ControlParameter ControlID="ASPxMemo1" Name="nzBody" PropertyName="Text" />
                <asp:QueryStringParameter Name="nzParent" QueryStringField="id" />
                <asp:Parameter Name="nzDate" />
                <asp:ControlParameter ControlID="drpNazarType" Name="nzStatus" PropertyName="Value" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourceNazar" KeyFieldName="nzId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" />
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
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="nzShenase" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره نامه" VisibleIndex="3" FieldName="nzNumber">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات" VisibleIndex="5" FieldName="nzBody">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="nzDate" VisibleIndex="4">
                    <Settings AllowAutoFilter="False" />
                    <DataItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("nzDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="وضعیت" FieldName="nzStatus" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ارسال به شرکت" VisibleIndex="6">
                    <DataItemTemplate>
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("nzStatus") %>' />
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/add-icon.png" NavigateUrl='<%# Eval("nzId", "~/content/PageEdarat3.aspx?project={0}&type=41") %>' Visible="False"></asp:HyperLink>
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
    </div>

    </div>
    </form>
</body>
</html>
