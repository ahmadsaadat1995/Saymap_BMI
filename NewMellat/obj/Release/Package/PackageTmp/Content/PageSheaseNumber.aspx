<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageSheaseNumber.aspx.cs" Inherits="NewMellat.Content.PageSheaseNumber" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div align="center">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AnimationType="Fade" EnableTheming="True" Theme="SoftOrange">
                            <Items>
                                <dx:ListEditItem Text="مصوب" Value="1" />
                                <dx:ListEditItem Text="رد" Value="2" />
                                <dx:ListEditItem Text="توقف" Value="3" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                    <td class="RightColumn">
                        <asp:Label ID="Label2" runat="server" Text=":نتیجه جلسه"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Theme="SoftOrange" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="RightColumn">
                        <asp:Label ID="Label1" runat="server" Text=":شناسه صورتجلسه"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
     <div align="center" style="padding: 9px">
         <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange">
         </dx:ASPxButton>
         </div>
    </div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourceShenas" RightToLeft="True" Width="100%" KeyFieldName="shId"><SettingsPager PageSize="20">
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
                <dx:GridViewDataTextColumn Caption="شناسه " VisibleIndex="3" FieldName="shBody">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نتیجه " VisibleIndex="4" FieldName="StatusText">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles></dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceShenas" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="DELETE FROM tbShenaseNumbers WHERE (shId = @shId)" InsertCommand="INSERT INTO tbShenaseNumbers(shHeyat, shBody, shStatus) VALUES (@shHeyat, @shBody, @shStatus)" SelectCommand="SELECT tbShenaseNumbers.*, Case shStatus When 1 Then N'مصوب' When 2 Then N'رد'Else N'توقف' End StatusText FROM tbShenaseNumbers WHERE (shHeyat = @id)" UpdateCommand="UPDATE tbShenaseNumbers SET shBody = @shBody, shStatus = @shStatus WHERE (shId = @shId)">
            <DeleteParameters>
                <asp:Parameter Name="shId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="shHeyat" QueryStringField="id" />
                <asp:ControlParameter ControlID="ASPxTextBox1" Name="shBody" PropertyName="Text" />
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="shStatus" PropertyName="Value" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="shBody" />
                <asp:Parameter Name="shStatus" />
                <asp:Parameter Name="shId" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
