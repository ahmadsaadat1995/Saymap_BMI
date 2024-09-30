<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateResponseDeadlineSupervisor.aspx.cs" Inherits="NewMellat.UpdateResponseDeadlineSupervisor" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="site.css" rel="stylesheet" type="text/css" />
    <link href="BootStrapTheme/dist/css/AdminLTE.css" rel="stylesheet" />
</head>
<body>
    <form id="updateResponseForm" runat="server">
      <div align="center" class="box box-danger">
        <table align="center" cellpadding="0" cellspacing="0">
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
            <tr>
                <td align="right">
                    &nbsp;</td>
                <td class="RightColumn">
                    &nbsp;</td>
                <td class="LeftColumn">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="170px" />
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label6" runat="server" Text=":ضمیمه"></asp:Label>
                </td>
            </tr>
        </table>

     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="red" runat="server" ControlToValidate="txtShenase"  ErrorMessage="شناسه نامه خالی می باشد" ValidationGroup="g11"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PersianCalendar1"  ErrorMessage="تاریخ ارسالی خالی می باشد" ValidationGroup="g11" ForeColor="red"></asp:RequiredFieldValidator>
                
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtShenase0"  ErrorMessage="شماره نامه خالی می باشد" ValidationGroup="g11" ForeColor="red"></asp:RequiredFieldValidator>
    </div>
      <div align="center" style="padding: 8px" class="box box-success">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            <dx:ASPxButton ID="btn_SaveNewPaper" runat="server" Font-Names="B Yekan" Font-Size="13px" OnClick="SaveNewPaper" Text="ثبت نامه جدید" Theme="SoftOrange" Width="150px" ValidationGroup="g11">
            </dx:ASPxButton>
        </div>
      <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView2" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourcePages" KeyFieldName="paId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Font-Names="b yekan">
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
                <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="MohlatDate" VisibleIndex="3">
                    <settings allowautofilter="False" />
                    <EditFormSettings Visible="False" />
                    <dataitemtemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("MohlatDate") %>'></asp:Label>
                    </dataitemtemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات" FieldName="paBody" VisibleIndex="4">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ضمیمه" VisibleIndex="5">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/attachment-icon.png" Target="_blank" Visible="False"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("paId") %>' />
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
            <asp:SqlDataSource ID="sourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbProjectPaper SET paAct = 0 WHERE (paId = @paId)" 
                InsertCommand="INSERT INTO tbProjectPaper(paShenase, paNumber,paDate, paProject, paAct, paType, paBody, paEdare,paStatus,MohlatDate)
                 VALUES (@paShenase, @paNumber,@paDate,@paProject, 1, @paType, @paBody, @paEdare,1,@MohlatDate)
SELECT @paId = SCOPE_IDENTITY()" SelectCommand="SELECT paId, paShenase, paNumber,  paProject, paAct, paType, paBody,DimDate.PersianStr as MohlatDate,  
paEdare=
case paEdare
when 1 then N'تایید'
when 2 then N'عدم تایید'
end
 FROM tbProjectPaper Left  Join DimDate On DimDate.GregorianDate = tbProjectPaper.MohlatDate WHERE (paAct = 1) AND (paType = @paType) AND (paProject = @paProject) Order By MohlatDate desc" UpdateCommand="UPDATE tbProjectPaper SET paShenase = @paShenase, paNumber = @paNumber, paBody = @paBody, paEdare = @paEdare WHERE (paId = @paId)" OnInserted="sourcePages_Inserted">
                <DeleteParameters>
                    <asp:Parameter Name="paId" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtShenase" Name="paShenase" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtShenase0" Name="paNumber" PropertyName="Text" />
                    <asp:Parameter Name="MohlatDate" Type="DateTime" />
                    <asp:QueryStringParameter Name="paProject" QueryStringField="project" />
                    <asp:QueryStringParameter Name="paType" QueryStringField="type" />
                    <asp:ControlParameter ControlID="txtBody" Name="paBody" PropertyName="Text" />
                    <asp:Parameter Name="paEdare" />
                    <asp:Parameter Direction="Output" Name="paId" Type="Int32" />
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
            <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
