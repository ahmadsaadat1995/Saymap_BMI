<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageSooratEstelamMojadad.aspx.cs" Inherits="NewMellat.Content.PageSooratEstelamMojadad" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.dxgvControl_SoftOrange
{
	border: 4px Solid #d3d3d3;
	font: 12px Tahoma, Geneva, sans-serif;
	background-color: #F9F9F9;
	color: Black;
	cursor: default;
}
.dxgvTable_SoftOrange
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxgvTable_SoftOrange
{
	background-color: White;
	border-width: 0;
	border-collapse: separate!important;
	overflow: hidden;
    font-size: 1.08em;
}
.dxgvHeader_SoftOrange
{
	cursor: pointer;
	white-space: nowrap;
	padding: 5px 8px 6px;
	border: 1px dotted #5c5c5c;
	background-color: #969696;
	overflow: hidden;
	font-weight: normal;
	text-align: left;
}

.dxbButton_SoftOrange
{
	color: #FFFFFF;
	font: 12px Tahoma, Geneva, sans-serif;
	border: 1px solid #cb4b31;
	background: #EF643C url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.SoftOrange.Editors.edtButtonBack.gif")%>') repeat-x top;
	padding: 1px;
}
.dxbButtonSys /*Bootstrap correction*/
{
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
}
.dxbButtonSys
{
	cursor: pointer;
	display: inline-block;
	text-align: center;
	white-space: nowrap;
}
.dxgvDataRow_SoftOrange
{
	background-color: #f8f8f8;
}
.dxgvCommandColumn_SoftOrange
{
	padding: 2px;
}

.dxgvPagerBottomPanel_SoftOrange
{
	padding-top: 2px;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <dx:ASPxGridView runat="server" RightToLeft="True" AutoGenerateColumns="False" Theme="SoftOrange" Width="100%" EnableTheming="True" ID="ASPxGridView1"><Columns>
<dx:GridViewCommandColumn ShowNewButtonInHeader="True" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewCommandColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="شماره قرارداد" VisibleIndex="2"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="ناظر" VisibleIndex="3"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="تحویلی" VisibleIndex="4"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="5" Caption="شماره صورتحساب"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="شناسه نامه پاسخ شرکت" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="نام پروژه" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="تاریخ نامه شرکت" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
</Columns>

<Styles>
<Header HorizontalAlign="Center" Font-Names="B Yekan" Font-Size="13px"></Header>
</Styles>
</dx:ASPxGridView>

                </div>
</asp:Content>
