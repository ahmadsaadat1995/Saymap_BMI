<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="abbreviation.aspx.cs" Inherits="NewMellat.Content.abbreviation" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .my-col{
            direction:ltr;
            margin-right:20px;
            font-family:'vazir';
            font-size:14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
           <td><asp:Label ID="Label1" runat="server" Text=":عنوان "></asp:Label></td>
           <td><dx:ASPxTextBox ID="txtName" runat="server" Theme="SoftOrange" Width="170px" RightToLeft="True" > </dx:ASPxTextBox></td>
           <td><asp:Label ID="Label3" runat="server" Text=":عنوان اختصاری "></asp:Label></td>
           <td><dx:ASPxTextBox ID="txtAbbr" runat="server" Theme="SoftOrange" Width="170px" RightToLeft="True" > </dx:ASPxTextBox></td>
            <td>
                 <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="B Yekan" Font-Size="13px" OnClick="ASPxButton1_Click" Text="ثبت نامه جدید" Theme="SoftOrange" Width="150px">
            </dx:ASPxButton>
            </td>
        </tr>
    </table>

    <br />

     <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="SoftOrange" AutoGenerateColumns="False" DataSourceID="sourcePages" KeyFieldName="Id" RightToLeft="True" Width="100%" >
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                   <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="1" Caption="id" FieldName="Id" >  </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان اختصاری" VisibleIndex="2" FieldName="Abbr">
                    <settings autofiltercondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان" FieldName="Name" VisibleIndex="3">
                    <settings autofiltercondition="Contains" />
                    </dx:GridViewDataTextColumn>
                     </Columns>

            <Styles>
                <Header Font-Names="B Yekan" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
          </dx:ASPxGridView>

    <asp:SqlDataSource ID="sourcePages" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="DELETE FROM [dbo].[AbbrNames]  WHERE id=@id" SelectCommand="select * from [dbo].[AbbrNames]" InsertCommand="INSERT INTO [dbo].[AbbrNames](Name,Abbr) values (@Name,@Abbr)" UpdateCommand="update [dbo].[AbbrNames] set Name=@Name,Abbr=@Abbr WHERE id=@id" >
         <DeleteParameters>
              <asp:Parameter Name="Id" />
         </DeleteParameters>
         <InsertParameters>
             <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" />
             <asp:ControlParameter ControlID="txtAbbr" Name="Abbr" PropertyName="Text" />
         </InsertParameters>
         <UpdateParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Abbr" />
              <asp:Parameter Name="Id" />
         </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
