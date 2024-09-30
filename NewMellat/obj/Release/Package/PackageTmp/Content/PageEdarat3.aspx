<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageEdarat3.aspx.cs" Inherits="NewMellat.Content.PageEdarat3" %>
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
    <div align="center">
    
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label7" runat="server" Text=":مهلت"></asp:Label>
                </td>
                <td align="right">
                <dx:ASPxTokenBox ID="tokenVahed" runat="server" AllowMouseWheel="True" AnimationType="Fade" DataSourceID="sourceVahed" RightToLeft="True" Theme="SoftOrange" Tokens="" TextField="infTitle" ValueField="infId" Font-Names="B Yekan" Font-Size="13px" Height="25px" Width="170px" TabIndex="2">
                </dx:ASPxTokenBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label6" runat="server" Text=":ادارات"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtShenase0" runat="server" Theme="SoftOrange" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label2" runat="server" Text=":شماره نامه"></asp:Label>
                </td>
                <td align="right">
                    <dx:ASPxTextBox ID="txtShenase" runat="server" Theme="SoftOrange" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label3" runat="server" Text=":شناسه نامه"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <dx:ASPxTextBox ID="txtBody" runat="server" Theme="SoftOrange" Width="170px" RightToLeft="True">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label5" runat="server" Text=":توضیحات"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/sync-icon.png" OnClick="ImageButton1_Click" />
                <cc1:PersianCalendar ID="PersianCalendar1" runat="server" TabIndex="9"></cc1:PersianCalendar>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label4" runat="server" Text=":تاریخ نامه"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
        <div align="center" style="padding: 8px">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="B Yekan" Font-Size="13px" OnClick="ASPxButton1_Click" Text="ثبت نامه جدید" Theme="SoftOrange" Width="150px">
            </dx:ASPxButton>
        </div>
        <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourcePages" KeyFieldName="paId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnDataBound="ASPxGridView1_DataBound">
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
                <dx:GridViewDataTextColumn Caption="شناسه نامه" VisibleIndex="2" FieldName="paShenase">
                    <settings autofiltercondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره نامه" FieldName="paNumber" VisibleIndex="3">
                    <settings autofiltercondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="paDate" VisibleIndex="4">
                    <settings allowautofilter="False" />
                    <dataitemtemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                    </dataitemtemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات" FieldName="paBody" VisibleIndex="5">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="6">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/check-icon.png" NavigateUrl='<%# Eval("paId","~/content/PageAnswerEdarat2.aspx?id={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="اداره" FieldName="infTitle" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
            <asp:SqlDataSource ID="sourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbProjectPaper SET paAct = 0 WHERE (paId = @paId)" InsertCommand="INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paBody, paEdare) VALUES (@paShenase, @paNumber, @paDate, @paProject, 1, @paType, @paBody, @paEdare)
SELECT @paId = SCOPE_IDENTITY()" SelectCommand="SELECT tbProjectPaper.paId, tbProjectPaper.paShenase, tbProjectPaper.paNumber, tbProjectPaper.paDate, tbProjectPaper.paProject, tbProjectPaper.paAct, tbProjectPaper.paType, tbProjectPaper.paBody, tbProjectPaper.paEdare, tbProjectPaper_1.paProject AS vahedName, prInformation.infTitle FROM tbProjectPaper INNER JOIN tbNazar ON tbProjectPaper.paProject = tbNazar.nzId INNER JOIN tbProjectPaper AS tbProjectPaper_1 ON tbNazar.nzParent = tbProjectPaper_1.paId LEFT OUTER JOIN prInformation ON tbProjectPaper_1.paEdare = prInformation.infId WHERE (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = @paType) AND (tbProjectPaper.paProject = @paProject)" OnInserted="sourcePages_Inserted">
                <DeleteParameters>
                    <asp:Parameter Name="paId" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtShenase" Name="paShenase" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtShenase0" Name="paNumber" PropertyName="Text" />
                    <asp:Parameter Name="paDate" />
                    <asp:QueryStringParameter Name="paProject" QueryStringField="project" />
                    <asp:Parameter DefaultValue="50" Name="paType" />
                    <asp:ControlParameter ControlID="txtBody" Name="paBody" PropertyName="Text" />
                    <asp:Parameter Name="paEdare" />
                    <asp:Parameter Direction="Output" Name="paId" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="50" Name="paType" />
                    <asp:QueryStringParameter DefaultValue="" Name="paProject" QueryStringField="project" />
                </SelectParameters>
            </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
        </div>
          </form>
</body>
</html>
