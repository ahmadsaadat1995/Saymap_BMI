<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagePropozalFirst.aspx.cs" Inherits="NewMellat.Content.PagePropozalFirst" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 50px">
        <table align="right" cellpadding="0" cellspacing="0">
            <tr>
                <td class="LeftColumn">
                    <dx:ASPxTextBox ID="txtGharardadCode" runat="server" RightToLeft="True" Theme="SoftOrange" Width="250px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label2" runat="server" Text=":شماره قرارداد"></asp:Label>
                </td>
                <td class="LeftColumn">
                    <dx:ASPxComboBox ID="drpProject" runat="server" AnimationType="Fade" DataSourceID="sourceProjects" Font-Names="B Yekan" Font-Size="13px" OnDataBound="drpProject_DataBound" RightToLeft="True" TextField="prTitle" Theme="SoftOrange" ValueField="prId" Width="250px">
                    </dx:ASPxComboBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label1" runat="server" Text=":نام پروژه"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div align="center" style="padding: 8px">
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="جستجو" Theme="SoftOrange" Width="150px">
        </dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceProject" EnableTheming="True" KeyFieldName="prId" OnRowCommand="ASPxGridView1_RowCommand" RightToLeft="True" Theme="SoftOrange" Width="100%">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <Settings ShowGroupPanel="True" />
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا ..." />
            <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر را انتخاب نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="کد سیستمی" FieldName="prId" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان پروژه" FieldName="prTitle" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات قرارداد" FieldName="ghBody" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="کد قرارداد" FieldName="ghCode" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("prId") %>' CommandName="n" ImageUrl="~/Content/images/icons/pencil-red-icon.png" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" HorizontalAlign="Center">
                </Header>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceProject" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbProjects.prId, tbProjects.prTitle, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.prStatus, tbProjects.prBody, tbGharardad.ghBody, tbGharardad.ghCode FROM tbProjects LEFT OUTER JOIN tbGharardad ON tbProjects.prId = tbGharardad.ghProject WHERE (tbProjects.prAct = 1)
and (prId=@prId or @prId=-1) 
and (ghCode like N'%' + @code + '%' or @code='-1')">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpProject" Name="prId" PropertyName="Value" />
                <asp:ControlParameter ControlID="txtGharardadCode" Name="code" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.* FROM prInformation"></asp:SqlDataSource>
    </div>
    <div align="center" style="padding: 7px">
        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sourceTarh" EnableTheming="True" KeyFieldName="thId" RightToLeft="True" Theme="RedWine" Visible="False" Width="100%">
            <Columns>
                <dx:GridViewDataTextColumn Caption="حجم نفرماه تولید" FieldName="thHajmTolid" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="حجم نفرماه پشتیبانی" FieldName="thHajmPosh" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ تولید" FieldName="thPriceTolid" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ پشتیبانی" FieldName="thPricePosh" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مدت تولید" FieldName="thModatTolid" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مدت پشتیبانی" FieldName="thModatPosh" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" HorizontalAlign="Center">
                </Header>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceTarh" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbTarhPishnehadi.* FROM tbTarhPishnehadi WHERE (thProject = @project) AND (thAct = 1)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="project" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" EnableTheming="True" RightToLeft="True" Theme="SoftOrange" Visible="False" Width="100%">
            <Columns>
                <dx:GridViewDataTextColumn Caption="تحویلی های مرحله تولید" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="موعد تحویل" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ثبت صورتحساب" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="B Yekan" HorizontalAlign="Center">
                </Header>
            </Styles>
        </dx:ASPxGridView>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
    <div>
                <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prId, prTitle, prStatus, prSanadType FROM tbProjects WHERE (prAct = 1) "></asp:SqlDataSource>
    </div>
</asp:Content>
