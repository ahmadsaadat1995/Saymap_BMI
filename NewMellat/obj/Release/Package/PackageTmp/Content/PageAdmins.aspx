﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageAdmins.aspx.cs" Inherits="NewMellat.Content.PageAdmins" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function loadDoc(parent) {

            var oWnd = radopen("PageIsAdmin.aspx?user=" + parent, "RadWindow1");
            oWnd.setSize(150, 200);
            oWnd.Center();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 40px; padding-top: 9px;" class="box box-danger">
        <table align="right" cellpadding="0" cellspacing="0" dir="ltr" width="100%">
            <tr>
                <td class="LeftColumn" width="36%">
                    <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Theme="SoftOrange">
                    </dx:ASPxCheckBox>
                </td>
                <td align="right" width="14%">
                    <asp:Label ID="Label12" runat="server" Text=":مدیر سیستم"></asp:Label>
                </td>
                <td align="right" width="36%">
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AnimationType="Fade" DataSourceID="sourceUsers" EnableTheming="True" RightToLeft="True" TextField="UserName" Theme="SoftOrange" ValueField="UserName" Width="95%">
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="sourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT UserName FROM aspnet_Users"></asp:SqlDataSource>
                </td>
                <td class="RightColumn" width="14%">
                    <asp:Label ID="Label10" runat="server" Text=":نام کاربری"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div align="center" style="padding: 6px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Width="150px" ValidationGroup=" ">
        </dx:ASPxButton>
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="adId" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" RightToLeft="True" Theme="SoftOrange" Width="100%" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" OnCustomButtonInitialize="ASPxGridView1_CustomButtonInitialize" Font-Names="b yekan">
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsDataSecurity AllowInsert="False" />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="کد پرسنلی" FieldName="adPersonCode" VisibleIndex="1">
                    <DataItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("adPersonCode") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مدیر سیستم" VisibleIndex="2">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/admin-privilege-icon.png" NavigateUrl='<%# Eval("adPersonCode","~/content/PageIsAdmin.aspx?user={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <Cell HorizontalAlign="Center">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="DELETE FROM tbAdmins WHERE (adId = @adId)" SelectCommand="SELECT * FROM [tbAdmins] WHERE ([adAct] = @adAct)">
            <DeleteParameters>
                <asp:Parameter Name="adId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="adAct" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
        </telerik:RadWindowManager>
    </div>

</asp:Content>
