<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageSooratEdit.aspx.cs" Inherits="NewMellat.Content.PageSooratEdit" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="id" RightToLeft="True" Theme="SoftOrange" Width="100%" Font-Names="B Yekan" OnRowCommand="ASPxGridView1_RowCommand" OnRowUpdated="ASPxGridView1_RowUpdated" OnRowUpdating="ASPxGridView1_RowUpdating" OnRowValidating="ASPxGridView1_RowValidating">
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsCommandButton>
                    <NewButton ButtonType="Image">
                        <Image IconID="actions_addfile_16x16">
                        </Image>
                    </NewButton>
                    <UpdateButton ButtonType="Image">
                        <Image IconID="save_save_16x16">
                        </Image>
                    </UpdateButton>
                    <CancelButton ButtonType="Image">
                        <Image IconID="actions_cancel_16x16">
                        </Image>
                    </CancelButton>
                    <EditButton ButtonType="Image">
                        <Image IconID="edit_edit_16x16">
                        </Image>
                    </EditButton>
                    <DeleteButton ButtonType="Image">
                        <Image IconID="edit_delete_16x16">
                        </Image>
                    </DeleteButton>
                </SettingsCommandButton>
                <SettingsLoadingPanel Text="در حال اجرا ..." />
                <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" />
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="نام پروژه" FieldName="ProjectName" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="شماره قرارداد" FieldName="ProjectGharardad" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="تاریخ شروع" FieldName="GharardadStart" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="تاریخ پایان" FieldName="GharardadEnd" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="عنوان تحویلی" FieldName="OnvanTahvili" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="قیمت" FieldName="Price" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="موعد تحویل" FieldName="MoedTahvili" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="موعد تحویل واقعی" FieldName="MoedTahviliReal" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="نوع قرارداد" FieldName="Gharardad" VisibleIndex="8">
                        <PropertiesComboBox DataSourceID="SqlDataSource2" TextField="infTitle" ValueField="infTitle">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="DELETE FROM tbSooratHesab WHERE (id = @id)"
                InsertCommand="INSERT INTO tbSooratHesab(prId,GharardadStart, GharardadEnd, OnvanTahvili, MoedTahvili, Price, ProjectName, ProjectGharardad, Gharardad, Nazer1, Nazer2, CompanyName, GharardadType, step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13,MoedTahviliReal) VALUES (@prId,@GharardadStart, @GharardadEnd, @OnvanTahvili, @MoedTahvili, @Price, @ProjectName, @ProjectGharardad, @Gharardad, @Nazer1, @Nazer2, @CompanyName, @GharardadType, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,@MoedTahviliReal)"
                SelectCommand="SELECT prId,ProjectName, ProjectGharardad, GharardadStart, GharardadEnd, OnvanTahvili, Price, MoedTahvili,MoedTahviliReal, id, Gharardad FROM tbSooratHesab WHERE (ProjectGharardad= @id)"
                UpdateCommand="UPDATE tbSooratHesab SET GharardadStart = @GharardadStart, GharardadEnd = @GharardadEnd, OnvanTahvili = @OnvanTahvili, MoedTahvili = @MoedTahvili, Price = @Price, Gharardad = @Gharardad,MoedTahviliReal=@MoedTahviliReal WHERE (id = @id)">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter Name="prId" QueryStringField="pr" />
                    <asp:Parameter Name="GharardadStart" />
                    <asp:Parameter Name="GharardadEnd" />
                    <asp:Parameter Name="OnvanTahvili" />
                    <asp:Parameter Name="MoedTahvili" />
                    <asp:Parameter Name="MoedTahviliReal" />
                    <asp:Parameter Name="Price" />
                    <asp:Parameter Name="ProjectName" />
                    <asp:QueryStringParameter Name="ProjectGharardad" QueryStringField="id" />
                    <asp:Parameter Name="Gharardad" />
                    <asp:QueryStringParameter Name="Nazer1" QueryStringField="n1" />
                    <asp:QueryStringParameter Name="Nazer2" QueryStringField="n2" />
                    <asp:QueryStringParameter Name="CompanyName" QueryStringField="com" />
                    <asp:QueryStringParameter Name="GharardadType" QueryStringField="gh" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="GharardadStart" />
                    <asp:Parameter Name="GharardadEnd" />
                    <asp:Parameter Name="OnvanTahvili" />
                    <asp:Parameter Name="MoedTahvili" />
                    <asp:Parameter Name="MoedTahviliReal" />
                    <asp:Parameter Name="Price" />
                    <asp:Parameter Name="Gharardad" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infTitle FROM            prInformation  WHERE        (infType = 20)"></asp:SqlDataSource>
    </form>
</body>
</html>
