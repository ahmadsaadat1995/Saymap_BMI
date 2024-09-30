<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageSooratPaperSherkat.aspx.cs" Inherits="NewMellat.Content.PageSooratPaperSherkat" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


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
                    &nbsp;</td>
                <td class="RightColumn">
                    &nbsp;</td>
                <td align="right">
                <dx:ASPxComboBox ID="drpPeymankar" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="250px" DataSourceID="sourcePeymankar" RightToLeft="True" TextField="infTitle" ValueField="infId" Font-Names="B Yekan" Font-Size="14px" TabIndex="6">
                </dx:ASPxComboBox>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1) AND (prInformation.infType = 5)">
        </asp:SqlDataSource>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label6" runat="server" Text=":شرکت ها"></asp:Label>
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
            <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="B Yekan" Font-Size="13px" OnClick="ASPxButton1_Click" Text="ثبت نامه جدید" Theme="SoftOrange" Width="150px">
            </dx:ASPxButton>
        </div>
        <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourcePages" KeyFieldName="paId" RightToLeft="True" Width="100%">
            <SettingsPager PageSize="20">
            </SettingsPager>
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
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="5">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/Email-Reply-icon.png" NavigateUrl='<%# Eval("paProject", "~/Content/PageSooratPaperErsal.aspx?project={0}&type=1013") %>' Target="_parent"></asp:HyperLink>
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
            <asp:SqlDataSource ID="sourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbProjectPaper SET paAct = 0 WHERE (paId = @paId)" InsertCommand="INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paBody, paEdare) VALUES (@paShenase, @paNumber, @paDate, @paProject, 1, @paType, @paBody, @paEdare)" SelectCommand="SELECT paId, paShenase, paNumber,  paProject, paAct, paType, paBody,DimDate.PersianStr as paDate,  
paEdare=
case paEdare
when 1 then N'تایید'
when 2 then N'عدم تایید'
end
 FROM tbProjectPaper Left  Join DimDate On DimDate.GregorianDate = tbProjectPaper.paDate WHERE (paAct = 1) AND (paType = @paType) AND (paProject = @paProject)" UpdateCommand="UPDATE tbProjectPaper SET paShenase = @paShenase, paNumber = @paNumber, paBody = @paBody, paEdare = @paEdare WHERE (paId = @paId)">
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
                    <asp:ControlParameter ControlID="drpPeymankar" Name="paEdare" PropertyName="Value" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="paType" QueryStringField="type" />
                    <asp:QueryStringParameter DefaultValue="" Name="paProject" QueryStringField="project" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="paShenase" />
                    <asp:Parameter Name="paNumber" />
                    <asp:Parameter Name="paBody" />
                    <asp:Parameter Name="paEdare" />
                    <asp:Parameter Name="paId" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="HiddenField1" runat="server" />
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
        </div>

    </form>

</body>
</html>

