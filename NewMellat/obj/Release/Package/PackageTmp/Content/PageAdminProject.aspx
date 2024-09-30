<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageAdminProject.aspx.cs" Inherits="NewMellat.Content.PageAdminProject" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div style="height: 55px" class="box box-danger" dir="ltr">
        <table cellpadding="0" cellspacing="0" align="right" style="height: 75px">
            <tr>
                <td align="right" width="250" class="LeftColumn">
                    <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text=" بارگذاری" Theme="SoftOrange" Width="140px"></dx:ASPxButton>

                </td>
                <td class="RightColumn">
                    &nbsp;</td>
                <td align="right" width="250" class="LeftColumn">
                                <dx:ASPxComboBox ID="drpUsers" runat="server" EnableTheming="True" Theme="SoftOrange" AnimationType="Fade" Font-Names="bbcnassim" Font-Size="15px" RightToLeft="True" DataSourceID="sourceUsers" TextField="UserName" ValueField="UserName" OnDataBound="drpUsers_DataBound" Font-Bold="False" TabIndex="3" OnSelectedIndexChanged="drpUsers_SelectedIndexChanged">
                                </dx:ASPxComboBox>
                                            </td>
                <td class="RightColumn">
                    <asp:Label ID="Label13" runat="server" Text=":نام کاربری"></asp:Label>
                </td>
            </tr>
            </table>
    </div>
    <div align="right" style="padding: 4px" class="box box-warning">
        <table>
            <tr>
                <td><dx:ASPxButton ID="ASPxButtonAll" runat="server"  Text="انتخاب همه" Theme="SoftOrange" OnClick="ASPxButtonAll_Click"  >
        </dx:ASPxButton></td>
                <td><dx:ASPxButton ID="ASPxButtonReverse" runat="server"  Text="عکس انتخاب ها" Theme="SoftOrange" OnClick="ASPxButtonReverse_Click"  >
        </dx:ASPxButton></td>
            </tr>
        </table>
         
        <dx:ASPxCheckBoxList ID="ASPxCheckBoxList1" runat="server" DataSourceID="sourcePeymankar" RepeatColumns="3" RepeatDirection="Horizontal" RightToLeft="True" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="100%" Font-Names="B Yekan" Font-Size="14px" Caption="لیست پیمانکاران">
            <CaptionSettings Position="Top" />
        </dx:ASPxCheckBoxList>
        </div>
    
    <div style="padding: 4px" class="box box-warning">
        <table>
            <tr>
                <td><dx:ASPxButton ID="ASPxButtonAll1" runat="server"  Text="انتخاب همه" Theme="SoftOrange" OnClick="ASPxButtonAll1_Click"  >
        </dx:ASPxButton></td>
                <td><dx:ASPxButton ID="ASPxButtonReverse1" runat="server"  Text="عکس انتخاب ها" Theme="SoftOrange" OnClick="ASPxButtonReverse1_Click"  >
        </dx:ASPxButton></td>
            </tr>
        </table>
         
        <dx:ASPxCheckBoxList ID="ASPxCheckBoxList2" runat="server" DataSourceID="sourceVahed" RepeatColumns="3" RepeatDirection="Horizontal" RightToLeft="True" TextField="infTitle" Theme="SoftOrange" ValueField="infId" Width="100%" Font-Names="B Yekan" Font-Size="14px" Caption="لیست ادارات">
            <CaptionSettings Position="Top" />
        </dx:ASPxCheckBoxList>
        <asp:CheckBox ID="CheckboxProjectList" runat="server" Text="لیست درخواست ها" ></asp:CheckBox>
        </div>
    <div align="center" style="padding: 8px" class="box box-success">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Width="140px">
        </dx:ASPxButton>
        <asp:SqlDataSource ID="sourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT UserName FROM aspnet_Users"></asp:SqlDataSource>
    </div>
    <div align="center" style="padding: 8px; font-family: tahoma; font-size: 12px;">
        <asp:Label ID="Label14" runat="server"></asp:Label>
    </div>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="prId" RightToLeft="True" Theme="SoftOrange" Width="100%" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" Font-Names="B Yekan">
            <Settings ShowGroupPanel="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="اداره / سازمان" FieldName="infTitle" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نام کاربری" FieldName="prCode" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="کد سیستمی" FieldName="prId" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="کد سیستمی اداره  / سازمان" FieldName="prId" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="DELETE FROM tbAdminProjects WHERE (prId = @prId)" InsertCommand="INSERT INTO tbAdminProjects(prProject, prCode, prType) VALUES (@prProject, @prCode, @prType)" SelectCommand="SELECT tbAdminProjects.prId, prInformation.infTitle, prInformation.infId, prInformation.infType, tbAdminProjects.prCode FROM tbAdminProjects INNER JOIN prInformation ON tbAdminProjects.prProject = prInformation.infId">
            <DeleteParameters>
                <asp:Parameter Name="prId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="prProject" />
                <asp:ControlParameter ControlID="drpUsers" Name="prCode" PropertyName="Value" />
                <asp:Parameter Name="prType" />
            </InsertParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>


</asp:Content>
