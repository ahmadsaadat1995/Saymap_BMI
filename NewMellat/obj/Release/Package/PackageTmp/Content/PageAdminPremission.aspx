<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageAdminPremission.aspx.cs" Inherits="NewMellat.Content.PageAdminPremission" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div style="height: 30px" class="box box-danger">
        <table align="right" cellpadding="0" cellspacing="0" dir="ltr">
            <tr>
                <td class="LeftForm">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpUsers" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="gg" InitialValue="-1"></asp:RequiredFieldValidator>
                </td>
                <td align="right" class="LeftColumn">
                    <dx:ASPxComboBox ID="drpUsers" runat="server" AnimationType="Fade" DataSourceID="sourceUsers" RightToLeft="True"  AutoPostBack="True" TextField="UserName" Theme="SoftOrange" ValueField="UserName" OnDataBound="drpUsers_DataBound" OnSelectedIndexChanged="drpUsers_SelectedIndexChanged">
                    </dx:ASPxComboBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label12" runat="server" Text=":نام کاربری"></asp:Label>
                </td>
            </tr>
            </table>
    </div>
    
    <div style="padding: 9px; text-align: center;" class="box box-warning">
        <table align="right" cellpadding="0" cellspacing="0" dir="ltr">
            <tr>
                <td class="LeftForm">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drpPermissions" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="gg" InitialValue="-1"></asp:RequiredFieldValidator>
                </td>
                <td align="right" class="LeftColumn">
        <dx:ASPxComboBox ID="drpPermissions" runat="server" AnimationType="Fade" DataSourceID="sourcePremission" RightToLeft="True" AutoPostBack="True" TextField="prName" Theme="SoftOrange" ValueField="prId" OnDataBound="drpPermissions_DataBound" OnSelectedIndexChanged="drpPermissions_SelectedIndexChanged">
         </dx:ASPxComboBox>
                     </td>
                <td class="RightColumn">
                    <asp:Label ID="Label1" runat="server" Text=":دسترسی"></asp:Label>
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
         
        <dx:ASPxCheckBoxList ID="ASPxCheckBoxList1" runat="server" DataSourceID="sourcePages" RepeatColumns="3" RepeatDirection="Horizontal" RightToLeft="True" TextField="pgTitle" Theme="SoftOrange" ValueField="pgName" Width="100%" Font-Names="B Yekan" Font-Size="14px" Caption="لیست صفحات">
            <CaptionSettings Position="Top" />
        </dx:ASPxCheckBoxList>
        <asp:SqlDataSource ID="sourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [tbPages]"></asp:SqlDataSource>
    </div>
    <div style="height: 14px">
    </div>
    <div class="divStyle3">
        <asp:SqlDataSource ID="sourcePremission" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [tbAdminPremission] WHERE ([prAct] = @prAct)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="prAct" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT UserName FROM aspnet_Users"></asp:SqlDataSource>
    </div>
    <div align="center" style="padding: 8px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="به روز رسانی" Theme="SoftOrange" Width="130px" OnClick="ASPxButton1_Click" ValidationGroup="gg">
        </dx:ASPxButton>
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssClass="divStyle3" DataSourceID="sourceAccess" EnableTheming="True" KeyFieldName="acId" RightToLeft="True" Theme="SoftOrange" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" Font-Names="b yekan">
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="acCode" VisibleIndex="3" Caption="اطلاعات پرسنلی">
                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("acCode") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="دسترسی" FieldName="acPremission" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="sourcePremission" TextField="prName" ValueField="prId">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نام صفحه" FieldName="acPage" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="sourcePages" TextField="pgTitle" ValueField="pgName">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("acPage") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="کد سیستمی" FieldName="acId" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header HorizontalAlign="Center" VerticalAlign="Middle">
                </Header>
                <Cell HorizontalAlign="Center">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceAccess" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT acId, acPremission, acPage, acAct, acCode FROM tbAminPremissionAccess WHERE (acAct = 1)" DeleteCommand="DELETE FROM tbAminPremissionAccess WHERE (acId = @acId)">
            <DeleteParameters>
                <asp:Parameter Name="acId" />
            </DeleteParameters>
        </asp:SqlDataSource>
</div>

    

</asp:Content>
