﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageSooratNew.aspx.cs" Inherits="NewMellat.Content.PageSooratNew" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="Telerik.Web.UI, Version=2018.1.117.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="LavaControl" Namespace="LavaControl" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function txt() {
            var ms = document.getElementById('txtFinalPrice').value;
            document.getElementById('txtPriceEhtesab').value = parseInt(ms) + parseInt(ms * 10 / 100);
        }



    </script>

    <style type="text/css">

        .RightColumn {
    font-family: "vazir";
    font-size: 16px;
    color: #444444;
    text-decoration: none;
    font-style: normal;
    vertical-align: middle;
    text-align: left;
    padding-left: 2px;
    width: 150px;
    height: 35px;
}


.RightColumn2 {
    font-family: "vazir";
    font-size: 14px;
    color: #8b4513;
    text-decoration: none;
    font-style: normal;
    vertical-align: middle;
    text-align: left;
    padding-left: 2px;
    width: 150px;
    height: 35px;
}

.LeftColumn {
    font-family: "vazir";
    font-size: 14px;
    color: #444444;
    text-decoration: none;
    font-style: normal;
    vertical-align: middle;
    text-align: right;
    padding-left: 2px;
    width: 200px;
    height: 35px;
}




        .RadInput_Default {
            font: 12px "segoe ui",arial,sans-serif;
        }

        .RadInput {
            vertical-align: middle;
        }

            .RadInput .riTextBox {
                height: 17px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="padding: 9px">
        <div align="center" class="box box-warning" dir="ltr" style="padding-top: 7px; padding-bottom: 7px">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding-right: 7px">
                        <dx:ASPxButton ID="ASPxButton2" runat="server" Font-Names="vazir" OnClick="ASPxButton2_Click" Text="جستجو" Theme="SoftOrange">
                        </dx:ASPxButton>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label33" runat="server" Text=":شماره قرارداد"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="box box-danger">

        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" EnableTheming="True" RightToLeft="True" Theme="Office2010Silver" Width="100%" DataSourceID="sourcePishnevis" KeyFieldName="pishId" OnRowCommand="ASPxGridView3_RowCommand" Font-Names="vazir">
            <SettingsBehavior EnableRowHotTrack="True" />
            <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="نام پروژه" VisibleIndex="5" FieldName="ProjectName">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره قرارداد" VisibleIndex="6" FieldName="ProjectGharardad">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="موعد تحویل" VisibleIndex="8" FieldName="MoedTahvili">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="9">
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("pishId") %>' CommandName="est" ImageUrl="~/Content/images/icons/page-edit-icon.png" CausesValidation="False" ValidationGroup="gbui" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان تحویلی" FieldName="OnvanTahvili" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
            </Styles>
        </dx:ASPxGridView>





        <asp:SqlDataSource ID="sourcePishnevis" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbSooratPishNevis.pishId, tbSooratPishNevis.pishPrice, tbSooratPishNevis.pishPricePlus, tbSooratPishNevis.pishSooratHesab, tbSooratPishNevis.pishHours, tbSooratPishNevis.pishDore, 
                         tbSooratPishNevis.pishType, tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.MoedTahvili, tbSooratHesab.Price, tbSooratHesab.OnvanTahvili, tbSooratPishNevis.pishIsSabt
FROM            tbSooratPishNevis INNER JOIN
                         tbSooratHesab ON tbSooratPishNevis.pishProject = tbSooratHesab.id
                                  left JOIN  tbProjects ON tbSooratHesab.prId = tbProjects.prId
WHERE        (tbSooratPishNevis.pishAct = 1) AND (tbSooratPishNevis.pishIsNazer = 0) AND (tbSooratHesab.ProjectGharardad LIKE '%' + @ProjectGharardad + '%') AND (tbSooratPishNevis.pishIsSabt = 0) AND 
                         (tbSooratHesab.step6 = 1) and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
ORDER BY tbSooratPishNevis.pishId DESC">
            <SelectParameters>
                <asp:Parameter Name="prCode" />
                <asp:ControlParameter ControlID="TextBox1" Name="ProjectGharardad" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>





        <asp:HiddenField ID="HiddenField2" runat="server" />





        <asp:HiddenField ID="HiddenField1" runat="server" />
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="اطلاعات پروژه" ShowCollapseButton="true" Theme="SoftOrange" Width="100%" Visible="False">
            <HeaderStyle Font-Names="vazir" HorizontalAlign="Right" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <div align="right" class="box box-warning">
                        <table align="center" cellpadding="0" cellspacing="0"  dir="ltr">
                            <tr>
                                <td align="right" colspan="5" style="font-family: 'vazir'; font-size: 16px">
                                    <asp:Label ID="lbProjectName" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label3" runat="server" Text=":نام پروژه"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="5" style="font-family: 'vazir'; font-size: 16px">
                                    <asp:Label ID="lbGharardad" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label4" runat="server" Text=":شماره قرارداد "></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LeftColumn">&nbsp;</td>
                                <td class="RightColumn">&nbsp;</td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbNazer2" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label6" runat="server" Text=":ناظر2"></asp:Label>
                                </td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbNazer1" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label5" runat="server" Text=":ناظر1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LeftColumn">&nbsp;</td>
                                <td class="RightColumn">&nbsp;</td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbGharardadType" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label7" runat="server" Text=":نوع قرارداد"></asp:Label>
                                </td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbCompany" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label8" runat="server" Text=":نام شرکت"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbPriceTolid" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label12" runat="server" Text=":مبلغ تولید"></asp:Label>
                                </td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbEndTolid" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label10" runat="server" Text=":پایان قرارداد تولید"></asp:Label>
                                </td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbStartTolid" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label9" runat="server" Text=":شروع قرارداد تولید"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbPricePosh" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label14" runat="server" Text=":مبلغ پشتیبانی"></asp:Label>
                                </td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbEndPosh" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label13" runat="server" Text=":پایان قراداد پشتیبانی"></asp:Label>
                                </td>
                                <td class="LeftColumn">
                                    <asp:Label ID="lbStartPosh" runat="server"></asp:Label>
                                </td>
                                <td class="RightColumn2">
                                    <asp:Label ID="Label11" runat="server" Text=":شروع قرارداد پشتیبانی"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div align="right" style="padding: 4px;">
                        <asp:Panel ID="Panel1" runat="server" Height="80px">
                            <div align="right"   class="box box-warning">
                                <table align="right" cellpadding="0" cellspacing="0"  dir="ltr">
                                    <tr>
                                        <td class="LeftColumn">
                                            <asp:Label ID="lbPishPrice" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label18" runat="server" Text=":مبلغ پیش فاکتور"></asp:Label>
                                        </td>
                                        <td class="LeftColumn">
                                            <asp:Label ID="lbOnvan" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label17" runat="server" Text=":عنوان تحویلی"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="LeftColumn">
                                            <asp:Label ID="lbPriceArzesh" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label19" runat="server" Text=":مبلغ با ارزش افزوده"></asp:Label>
                                        </td>
                                        <td class="LeftColumn">
                                            <asp:Label ID="lbDore" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label20" runat="server" Text=":دوره ارسالی"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" Height="80px">
                            <div align="right">
                                <table align="right" cellpadding="0" cellspacing="0" dir="ltr"   class="box box-warning">
                                    <tr>
                                        <td class="LeftColumn">
                                            <asp:Label ID="lnD1" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label2" runat="server" Text=":تاریخ تایید ناظر 1"></asp:Label>
                                        </td>
                                        <td class="LeftColumn">
                                            <asp:Label ID="ln1" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label16" runat="server" Text=":شناسه تایید ناظر 1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="LeftColumn">
                                            <asp:Label ID="lnD2" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label28" runat="server" Text=":تاریخ تایید ناظر 2"></asp:Label>
                                        </td>
                                        <td class="LeftColumn">
                                            <asp:Label ID="ln2" runat="server"></asp:Label>
                                        </td>
                                        <td class="RightColumn2">
                                            <asp:Label ID="Label32" runat="server" Text=":شناسه تایید ناظر 2"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div align="center" id="dv1" runat="server" class="box box-warning" dir="ltr">
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr >
                <td align="right"  width="36%">
                    <telerik:RadNumericTextBox ID="txtPriceEhtesab" runat="server" DataType="System.Int64" Width="95%" ClientIDMode="Static" BorderColor="#F8DF8E">
                        <NegativeStyle Resize="None"></NegativeStyle>

                        <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>

                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                        <FocusedStyle Resize="None"></FocusedStyle>

                        <DisabledStyle Resize="None"></DisabledStyle>

                        <InvalidStyle Resize="None"></InvalidStyle>

                        <HoveredStyle Resize="None"></HoveredStyle>

                        <EnabledStyle Resize="None"></EnabledStyle>
                    </telerik:RadNumericTextBox>

                </td>
                <td  width="14%">
                    <asp:Label runat="server" Text=":مبلغ با احتساب ارزش افزوده" ID="Label24"></asp:Label>

                </td>
                <td align="right"  width="36%" style="padding-top: 6px">
                    <telerik:RadNumericTextBox ID="txtFinalPrice" runat="server" DataType="System.Int64" Width="95%" ClientIDMode="Static" BorderColor="#F8DF8E">
                        <NegativeStyle Resize="None"></NegativeStyle>

                        <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>

                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                        <FocusedStyle Resize="None"></FocusedStyle>

                        <DisabledStyle Resize="None"></DisabledStyle>

                        <InvalidStyle Resize="None"></InvalidStyle>

                        <HoveredStyle Resize="None"></HoveredStyle>

                        <EnabledStyle Resize="None"></EnabledStyle>
                    </telerik:RadNumericTextBox>

                </td>
                <td  width="14%">
                    <asp:Label runat="server" Text=":مبلغ نهایی فاکتور" ID="Label25"></asp:Label>

                </td>
            </tr>
            <tr >
                <td align="right" >&nbsp;</td>
                <td >&nbsp;</td>
                <td align="right" style="padding-top: 4px; padding-bottom: 4px;">
                    <asp:TextBox ID="txtSoorat1" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>

                </td>
                <td >
                    <asp:Label runat="server" Text=":شماره صورتحساب" ID="Label27"></asp:Label>

                </td>
            </tr>
        </table>
    </div>
    <div align="center" style="padding: 8px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Width="150px" ValidationGroup="gg1">
        </dx:ASPxButton>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFinalPrice" Display="None" ErrorMessage="مبلغ نهایی فاکتور خالی می باشد" ValidationGroup="gg1"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSoorat1" Display="None" ErrorMessage="شماره صورتحساب خالی می باشد" ValidationGroup="gg1"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPriceEhtesab" Display="None" ErrorMessage="مبلغ با ارزش افزوده خالی می باشد" ValidationGroup="gg1"></asp:RequiredFieldValidator>
    </div>
    <div align="center" style="padding: 4px">
        <asp:Label ID="lbresult" runat="server"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="gg1" />
    </div>
    <div align="center" style="padding: 7px">
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="FontStyle1" NavigateUrl="~/Content/PageSooratNew.aspx" Target="_parent">بازگشت به لیست</asp:HyperLink>
    </div>
</asp:Content>
