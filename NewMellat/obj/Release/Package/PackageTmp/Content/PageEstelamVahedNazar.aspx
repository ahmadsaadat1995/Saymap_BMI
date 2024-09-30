<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageEstelamVahedNazar.aspx.cs" Inherits="NewMellat.Content.PageEstelamVahedNazar" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #FFFFFF">
        <div>
    <div style="height: 250px">
    <table align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="LeftColumn">
                <dx:ASPxComboBox ID="drpVahed" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="100%" DataSourceID="sourceVahed" RightToLeft="True" TextField="infTitle" ValueField="infId" Font-Names="b yekan" Font-Size="14px" TabIndex="2"  ClientIDMode="Static" ForeColor="#333333" Height="17px">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	loadChk();
}" />
                        <Border BorderColor="#F8DF8E" />
                    </dx:ASPxComboBox></td>
            <td class="RightColumn">
                <asp:Label ID="Label13" runat="server" Text=":واحد"></asp:Label>
            </td>
            <td class="LeftColumn">
                <dx:ASPxComboBox ID="drpNazarType" runat="server" AnimationType="Fade" DataSourceID="sourceNazarType" RightToLeft="True" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Font-Names="B Yekan" Font-Size="13px" Width="250px">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="sourceNazarType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="6" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label1" runat="server" Text=":اعلام نظر"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtNumber" runat="server" Theme="SoftOrange" Width="250px">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label8" runat="server" Text=":شماره نامه"></asp:Label>
            </td>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtShenase" runat="server" Theme="SoftOrange" Width="250px">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label7" runat="server" Text=":شناسه نامه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">
                <cc1:PersianCalendar ID="PersianCalendar1" runat="server" Width="222px"></cc1:PersianCalendar>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label9" runat="server" Text=":تاریخ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">
                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Theme="SoftOrange" Width="250px">
                </dx:ASPxMemo>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label11" runat="server" Text=":توضیحات"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="250px" />
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label10" runat="server" Text=":ضمایم"></asp:Label>
            </td>
        </tr>
    </table>
</div>
    </div>
    <div align="center" style="padding: 6px">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Font-Names="B Yekan" Font-Size="13px" Width="150px">
        </dx:ASPxButton>
    </div>
    <div>
        <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1)  AND (prInformation.infType = 1)">
                        
                    </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceNazar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbNazar(nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate, nzStatus,nzMainProjectId) VALUES (1, @nzShenase, @nzNumber, @nzBody, 1, @nzParent, @nzDate, @nzStatus,@prVahed)" SelectCommand="SELECT nzId, nzAct, nzShenase, nzNumber, nzBody, nzType, nzParent, nzDate,Case When NzStatus = 195 Then 'OK' Else 'NotOk' end NStatus, Isnull(infTitle,'') Vahed FROM tbNazar left outer join prInformation on nzMainProjectId = infId WHERE (nzAct = 1) AND (nzParent = @id) AND (nzType = 1)" DeleteCommand="DELETE FROM tbNazar WHERE (nzId = @nzId)" UpdateCommand="UPDATE tbNazar SET nzShenase = @nzShenase, nzNumber = @nzNumber, nzBody = @nzBody WHERE (nzId = @nzId)">
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
                <asp:ControlParameter ControlID="drpVahed" Name="prVahed" PropertyName="Value" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nzShenase" />
                <asp:Parameter Name="nzNumber" />
                <asp:Parameter Name="nzBody" />
                <asp:Parameter Name="nzId" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourceNazar" KeyFieldName="nzId" RightToLeft="True" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
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
                <EditButton ButtonType="Image">
                </EditButton>
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
                <dx:GridViewDataTextColumn Caption="واحد" FieldName="Vahed" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره نامه" VisibleIndex="4" FieldName="nzNumber">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات" VisibleIndex="6" FieldName="nzBody">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="nzDate" VisibleIndex="5">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("nzDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="وضعیت" VisibleIndex="7" FieldName="NStatus">
                    <Settings AutoFilterCondition="Contains" />
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
        <div align="center">
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="پاسخ ها" GridViewID="ASPxGridView1" Landscape="True" PaperKind="A4">
        </dx:ASPxGridViewExporter>
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton3_Click" />
    </div>
    </form>
</body>
</html>
