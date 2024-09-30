<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageInfoSetting.aspx.cs" Inherits="NewMellat.Content.PageInfoSetting" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="right">
        <div align="right" style="height: 30px; padding-top: 6px;" class="box box-danger">
            <table align="right" cellpadding="0" cellspacing="0" dir="ltr">
                <tr>
                    <td align="right">
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AnimationType="Fade" AutoPostBack="True" EnableTheming="True" Theme="SoftOrange">
                            <Items>
                                <dx:ListEditItem Text="واحد درخواست کننده" Value="1" />
                                <dx:ListEditItem Text="نوع پروژه" Value="2" />
                                <dx:ListEditItem Text="نوع سند" Value="3" />
                                <dx:ListEditItem Text="اولویت (ارایه پروپوزال و زمانبندی)" Value="4" />
                                <dx:ListEditItem Text="شرکت پیمانکار" Value="5" />
                                  <dx:ListEditItem Text="اهداف استراتژیک" Value="13" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                    <td class="RightColumn">
                        <asp:Label ID="Label3" runat="server" Text=":نوع اطلاعات"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="LeftColumn">&nbsp;</td>
                    <td class="RightColumn">&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="infId" RightToLeft="True" Theme="SoftOrange" Width="100%" Font-Names="B Yekan">
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <NewButton ButtonType="Image">
                    <Image IconID="reports_addgroupheader_16x16">
                    </Image>
                </NewButton>
                <UpdateButton ButtonType="Image">
                    <Image IconID="save_save_16x16">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image IconID="actions_close_16x16">
                    </Image>
                </CancelButton>
                <EditButton ButtonType="Image">
                    <Image IconID="edit_edit_16x16">
                    </Image>
                </EditButton>
                <DeleteButton ButtonType="Image">
                    <Image IconID="actions_deletelist_16x16">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="عنوان" FieldName="infTitle" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE prInformation SET infAct = 0 WHERE (infId = @infId)" 
            InsertCommand="INSERT INTO prInformation(infType, infAct, infTitle) VALUES (@infType, 1, @infTitle)"
             SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infAct = 1) AND (infType = @infType)" 
            UpdateCommand="UPDATE prInformation SET infTitle = @infTitle WHERE (infId = @infId)">
            <DeleteParameters>
                <asp:Parameter Name="infId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="infType" PropertyName="Value" />
                <asp:Parameter Name="infTitle" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="infType" PropertyName="Value" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="infTitle" />
                <asp:Parameter Name="infId" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div>
    </div>
</asp:Content>
