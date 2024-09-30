<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageAbbr.aspx.cs" Inherits="NewMellat.Content.PageAbbr" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="LavaControl" Namespace="LavaControl" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function RefreshParentPage()//function in parent page
        {
            document.location.reload();
        }


        function loadDoc(parent) {

            var oWnd = radopen("PageSheaseNumber.aspx?id=" + parent, "RadWindow1");
            oWnd.setSize(710, 400);
            oWnd.Center();
        }


        function loadDoc2(parent) {
            var oWnd = radopen("PageCommissionMosavab.aspx?id=" + parent, "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc3(parent) {

            var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=20", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc4(parent) {

            var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=21", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }




        function loadDoc5(parent) {

            var oWnd = radopen("PageAttach.aspx?Parent=" + parent + "&Type=1001", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <div style="height: 100px; padding-top: 9px;" dir="ltr" class="box box-danger">
                <table align="right" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right">
                    <asp:TextBox ID="TextBoxAbbr" runat="server" style="text-align: right;" CssClass="form-control" Width="95%"></asp:TextBox>
                        </td>
                        <td class="RightColumn">
                            <asp:Label ID="Label12" runat="server" Text=":خلاصه"></asp:Label>
                        </td>
                        <td align="right" style="padding-top: 4px">
                    <asp:TextBox ID="TextBoxName" style="text-align: right;" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                        </td>
                        <td class="RightColumn">
                            <asp:Label ID="Label13" runat="server" Text=":نام کامل"></asp:Label>
                        </td>
                    </tr>
                    </table>
            </div>
        </div>
    </div>
    <div align="center" style="padding: 8px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="vazir" Font-Size="13px" Text="ثبت اطلاعات" Theme="SoftOrange" Width="150px" OnClick="ASPxButton1_Click">
        </dx:ASPxButton>
        
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Office2010Silver" AutoGenerateColumns="False" DataSourceID="sourceAbbr" RightToLeft="True" Width="100%"  KeyFieldName="Id"  Font-Names="vazir">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <UpdateButton ButtonType="Image">
                    <Image IconID="save_save_16x16office2013">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image IconID="edit_delete_16x16" ToolTip="انصراف">
                    </Image>
                </CancelButton>
                <EditButton ButtonType="Image">
                    <Image IconID="edit_edit_16x16">
                    </Image>
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="نام کامل " VisibleIndex="1" FieldName="Name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="خلاصه " VisibleIndex="2" FieldName="Abbr">
                </dx:GridViewDataTextColumn>
                
                
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceAbbr" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO AbbrNames (Name, Abbr)
VALUES (@Name, @Abbr) " SelectCommand="SELECT * from AbbrNames" DeleteCommand="Delete from AbbrNames WHERE (Id = @Id)" UpdateCommand="UPDATE AbbrNames SET Name = @Name, Abbr=@Abbr WHERE (Id = @Id)" >
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <InsertParameters>
                
                <asp:ControlParameter ControlID="TextBoxName" Name="Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBoxAbbr" Name="Abbr" PropertyName="Text" />
               
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Abbr" />
                <asp:Parameter Name="Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="vazir" Font-Size="15px" Skin="Sunset">
        </telerik:RadNotification>
        
        <asp:HiddenField ID="HiddenField2" runat="server" />
       <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Close" Skin="Sunset">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
       
    </div>
</asp:Content>
