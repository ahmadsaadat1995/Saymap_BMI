<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageAdminPages.aspx.cs" Inherits="NewMellat.Content.PageAdminPages" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <div class="box box-danger" style="height: 50px; padding-top: 9px;">
        <table align="right" cellpadding="0" cellspacing="0" dir="ltr" title="100%">
            <tr>
                <td class="LeftForm">
                    <asp:SqlDataSource ID="sourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [tbPages] order by pgTitle"></asp:SqlDataSource>
                </td>
                <td align="right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ASPxComboBox1" Display="Dynamic" ErrorMessage="*" ForeColor="#FF3300" ValidationGroup="ggg" InitialValue="-1"></asp:RequiredFieldValidator>
                </td>
                <td align="right" class="LeftColumn">
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AnimationType="Fade" DataSourceID="sourceUsers" EnableTheming="True" OnDataBound="ASPxComboBox1_DataBound" RightToLeft="True" AutoPostBack="true" TextField="UserName" Theme="SoftOrange" ValueField="UserName" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged">
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="sourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT UserName FROM aspnet_Users"></asp:SqlDataSource>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label10" runat="server" Text=":نام کاربری"></asp:Label>
                </td>
            </tr>
            </table>
    </div>
    <div class="box box-warning">
        <table>
            <tr>
                <td><dx:ASPxButton ID="ASPxButtonAll" runat="server"  Text="انتخاب همه" Theme="SoftOrange" OnClick="ASPxButtonAll_Click"  >
        </dx:ASPxButton></td>
                <td><dx:ASPxButton ID="ASPxButtonReverse" runat="server"  Text="عکس انتخاب ها" Theme="SoftOrange" OnClick="ASPxButtonReverse_Click"  >
        </dx:ASPxButton></td>
            </tr>
        </table>
         
        
           
        <dx:ASPxCheckBoxList ID="ASPxCheckBoxList1" runat="server" DataSourceID="sourcePages" ItemSpacing="7px" RepeatColumns="3" RightToLeft="True" TextField="pgTitle" Theme="SoftOrange" ValueField="pgName" Width="100%">
        </dx:ASPxCheckBoxList>
        </div>
    <div align="center" style="padding: 6px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Width="150px" ValidationGroup="ggg">
        </dx:ASPxButton>
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="pgId" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" RightToLeft="True" Theme="SoftOrange" Width="100%" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" Font-Names="B Yekan">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsDataSecurity AllowInsert="False" AllowEdit="False" />
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="عنوان صفحه" FieldName="pgPageName" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("pgPageName") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نام کاربری" FieldName="pgCode" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("pgCode") %>'></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Label ID="Label15" runat="server"></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="کد سیستمی" FieldName="pgId" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <Cell HorizontalAlign="Center">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="DELETE FROM tbAdminInPages WHERE (pgId = @pgId)" SelectCommand="SELECT tbAdminInPages.* FROM tbAdminInPages">
            <DeleteParameters>
                <asp:Parameter Name="pgId" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    

</asp:Content>
