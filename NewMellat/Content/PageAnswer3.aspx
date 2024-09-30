<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageAnswer3.aspx.cs" Inherits="NewMellat.Content.PageAnswer3" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2018.1.117.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        <link href="site.css" rel="stylesheet" type="text/css" />


    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    <div style="background-color: #FFFFFF">
        <div>
    </div>
    <div>
        <asp:SqlDataSource ID="sourceNazar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbNazar(nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus) VALUES (1, @nzShenase, @nzNumber, @nzBody, 90, @nzParent, @nzDate, @nzStatus)" SelectCommand="SELECT nzId, nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus FROM tbNazar WHERE (nzAct = 1) AND (nzParent = @id) AND (nzType = @nzType)" DeleteCommand="DELETE FROM tbNazar WHERE (nzId = @nzId)">
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
                <asp:QueryStringParameter Name="nzType" QueryStringField="type" />
            </SelectParameters>
        </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="sourceNazarType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="6" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourceNazar" KeyFieldName="nzId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnRowCommand="ASPxGridView1_RowCommand">
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
                <dx:GridViewDataComboBoxColumn Caption="وضعیت" FieldName="nzStatus" VisibleIndex="1" Visible="False">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="6">
                    <DataItemTemplate>
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("nzStatus") %>' />
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/add-icon.png" NavigateUrl='<%# Eval("nzId", "~/content/PageAnswer4.aspx?project={0}&type=4001") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عدم تایید" VisibleIndex="8" Visible="False">
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("nzId") %>' CommandName="nok" ImageUrl="~/Content/images/icons/missed-calls-icon.png" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تایید" VisibleIndex="7" Visible="False">
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("nzId") %>' CommandName="ok" ImageUrl="~/Content/images/icons/check-icon.png" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn Caption="ارسال به شرکت" VisibleIndex="50" >
                <DataItemTemplate>
                 <asp:ImageButton ID="ImageButtonLetter" runat="server" CommandName="letter1" ImageUrl="~/Content/images/icons/letter.png" Width="42px"/>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn Caption="ارسال به ناظر" VisibleIndex="51" >
                <DataItemTemplate>
                 <asp:ImageButton ID="ImageButton3" runat="server" CommandName="letter2" ImageUrl="~/Content/images/icons/letter.png" Width="42px"/>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="73" Caption="nzId" FieldName="nzId" Visible="false">  
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

