<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageZarfiatDashboard.aspx.cs" Inherits="NewMellat.Content.PageZarfiatDashboard" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceInfo" EnableTheming="True" Font-Names="B Yekan" KeyFieldName="prId" RightToLeft="True" Theme="SoftOrange" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="عنوان پروژه" FieldName="prTitle" VisibleIndex="1">
                <DataItemTemplate>
                    <asp:Label ID="Label21" runat="server" Text='<%# Eval("prTitle") %>' ToolTip='<%# Eval("prId") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="sourceProjectType" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="sourceSanad" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="حجم نفر ساعت" VisibleIndex="6" FieldName="khAct">
                <DataItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("prProjectType") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="حجم کلی" VisibleIndex="7" FieldName="mosAct">
                <DataItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("prProjectType") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="فروردین" VisibleIndex="8" FieldName="khId">
                <DataItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                    <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#AEFFAE">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ادیبهشت" VisibleIndex="9" FieldName="mosId">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#EAEA00">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="خرداد" VisibleIndex="10" FieldName="mosDate">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#84FF84">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="تیر" VisibleIndex="11" FieldName="prId">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#FFCB7D">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مرداد" VisibleIndex="12" FieldName="mosNumber">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#FFAF9B">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="شهریور" VisibleIndex="13" FieldName="mosSRS">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#FFC6C6">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مهر" VisibleIndex="14" FieldName="mosPropozal">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#FFFFB7">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="آبان" VisibleIndex="15" FieldName="prVahed">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#FFFF5E">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="آذر" VisibleIndex="16" FieldName="prPeymankar">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#FFD940">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="دی" VisibleIndex="17" FieldName="mosShenase">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#DFF7F7">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="بهمن" VisibleIndex="18" FieldName="mosSRSanswer">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#D2D2FF">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="اسفند" VisibleIndex="19" FieldName="prProjectStatus">
                <DataItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" dir="ltr" width="460">
                        <tr>
                            <td align="center" width="75">
                                <asp:Label ID="Label12" runat="server" Text="تست تحویل"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("mosDate") %>' Visible="False"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("prOlaviat") %>' Visible="False"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label11" runat="server" Text="تست آلفا"></asp:Label>
                            </td>
                            <td align="center" width="85">
                                <asp:Label ID="Label10" runat="server" Text="طراحی / تولید"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label9" runat="server" Text="پروتوتایپ"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label8" runat="server" Text="پروپوزال"></asp:Label>
                            </td>
                            <td align="center" width="75">
                                <asp:Label ID="Label7" runat="server" Text="SRS"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("prProjectType") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </DataItemTemplate>
                <CellStyle BackColor="#AEC9E3">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="prOlaviat" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="sourceOlaviat" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="تاریخ ابلاغ" FieldName="mosErsalDate" VisibleIndex="5">
                <DataItemTemplate>
                    <asp:Label ID="Label20" runat="server" Text='<%# Eval("mosDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#F4F4F4" Font-Italic="True" ForeColor="#993300">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceSanad" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label27" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="sourceOlaviat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infType, infAct, infTitle FROM prInformation WHERE (infAct = 1) AND (infType = 4)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosAmaliatiDate, tbKhbregan.khAct, tbKhobreganMosavab.mosAct, tbKhbregan.khId, tbKhbregan.khProject, tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosErsalDate, tbProjects.prTitle, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.prId, tbProjects.prProjectStatus, tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer FROM tbProjects INNER JOIN tbKhbregan ON tbProjects.prId = tbKhbregan.khProject INNER JOIN tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob WHERE (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1)"></asp:SqlDataSource>
</div>
<div>
</div>
<div>
</div>
<div>
</div>
</asp:Content>
