<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageCommissionMosavab.aspx.cs" Inherits="NewMellat.Content.PageCommiossionMosavab" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="cc1" Namespace="LavaControl" Assembly="LavaControl" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2018.1.117.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 376px;
        }
        .auto-style2 {
            font-family: "b yekan";
            font-size: 14px;
            color: #444444;
            text-decoration: none;
            font-style: normal;
            vertical-align: middle;
            text-align: right;
            padding-left: 2px;
            width: 200px;
            height: 33px;
        }
        .auto-style3 {
            font-family: "b yekan";
            font-size: 16px;
            color: #444444;
            text-decoration: none;
            font-style: normal;
            vertical-align: middle;
            text-align: left;
            padding-left: 2px;
            width: 150px;
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div>
    <div style="height: 360px">
    <table align="center" cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td class="LeftColumn">&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager></td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtNumber" runat="server" Theme="SoftOrange" Width="250px" Font-Names="B Yekan" Font-Size="13px" Height="25px" TabIndex="4">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label8" runat="server" Text=":شماره نامه"></asp:Label>
            </td>
            <td class="LeftColumn">
                <dx:ASPxTextBox ID="txtShenase" runat="server" Theme="SoftOrange" Width="250px" Font-Names="B Yekan" Font-Size="13px" Height="25px" TabIndex="3">
                </dx:ASPxTextBox>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label7" runat="server" Text=":شناسه نامه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">
                <asp:Label ID="Label29" runat="server"></asp:Label>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label28" runat="server" Text=":مهلت ارسال پیش نویس قرارداد"></asp:Label>
            </td>
            <td class="LeftColumn">
                <div align="center">
                    <table align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/sync-icon.png" OnClick="ImageButton1_Click" />
                            </td>
                            <td>
                <cc1:PersianCalendar ID="PersianCalendar1" runat="server" Width="200px" TabIndex="5"></cc1:PersianCalendar>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label9" runat="server" Text=":تاریخ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="LeftColumn">&nbsp;</td>
            <td class="RightColumn">&nbsp;</td>
            <td class="LeftColumn">
                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Theme="SoftOrange" Width="250px" Font-Names="B Yekan" Font-Size="13px" TabIndex="6" RightToLeft="True">
                </dx:ASPxMemo>
            </td>
            <td class="RightColumn">
                <asp:Label ID="Label11" runat="server" Text=":توضیحات"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="250px" TabIndex="7" Visible="False" />
            </td>
            <td class="auto-style3">
                <asp:Label ID="Label10" runat="server" Text=":ضمایم" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>
    </div>
    <div align="center" style="padding: 6px">
        <table>
            <tr>
                <td>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton2_Click" Text="رد" Theme="SoftOrange" Font-Names="B Yekan" Font-Size="13px" Width="150px" TabIndex="8">
                    </dx:ASPxButton>
        
                </td>
                <td>

                    <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton1_Click" Text="تایید" Theme="SoftOrange" Font-Names="B Yekan" Font-Size="13px" Width="150px" TabIndex="8">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
        
        <asp:SqlDataSource ID="sourcePaper" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="spInsertPaper" InsertCommandType="StoredProcedure" SelectCommand="SELECT TOP (1) infId FROM prInformation">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtShenase" Name="paShenase" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtNumber" Name="paNumber" PropertyName="Text" Type="String" />
                <asp:Parameter DbType="Date" DefaultValue="" Name="paDate" />
                <asp:QueryStringParameter Name="paProject" QueryStringField="id"  />
                <asp:Parameter Name="paType" Type="Int32" DefaultValue="82" />
                <asp:ControlParameter ControlID="ASPxMemo1" Name="paBody" PropertyName="Text" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    <telerik:RadNotification ID="RadNotification1" runat="server" Animation="Fade" Font-Names="B Yekan" Font-Size="15px" Skin="Sunset">
    </telerik:RadNotification>
                <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectProjects" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sourceFile" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbFiles(fiAct, fiData, fiDate, fiParent, fiType, fiTitle, fiExt) VALUES (1, @fiData, GetDate(), @fiParent, 2, @fiTitle, @fiExt)" SelectCommand="SELECT TOP (1) fiId, fiAct, fiData, fiDate, fiParent, fiType FROM tbFiles">
        <InsertParameters>
            <asp:ControlParameter ControlID="FileUpload1" Name="fiData" PropertyName="FileBytes" />
            <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="fiParent" PropertyName="Value" />
            <asp:ControlParameter ControlID="drpProjects" Name="fiTitle" PropertyName="Value" />
            <asp:ControlParameter ControlID="FileUpload1" Name="fiExt" PropertyName="FileName" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="B Yekan" Font-Size="15px" ForeColor="Red" ValidationGroup="g1" DisplayMode="List" />
    </div>
    <div>
       
        <asp:SqlDataSource ID="sourceNezaratMosavab" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbHeyatNezaratMosavab SET hmAct = 0 WHERE (hmId = @hmId)" InsertCommand="INSERT INTO tbHeyatNezaratMosavab(hmAct, hmPriceTolid, hmPricePosh, hmDateTolid, hmDatePosh, hmGharardadType, hmVahedType, hmNezarat, hmMainProjectId) VALUES (1, @hmPriceTolid, @hmPricePosh, @hmDateTolid, @hmDatePosh, @hmGharardadType, @hmVahedType, @hmNezarat, @hmMainProjectId)
SELECT @hmId = SCOPE_IDENTITY()" SelectCommand="SELECT tbHeyatNezaratMosavab.* FROM tbHeyatNezaratMosavab WHERE (hmAct = 1)" OnInserted="sourceNezaratMosavab_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="hmId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtPriceTolid" Name="hmPriceTolid" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtPricePosh" Name="hmPricePosh" PropertyName="Text" />
                <asp:Parameter Name="hmDateTolid" />
                <asp:Parameter Name="hmDatePosh" />
                <asp:ControlParameter ControlID="drpGharardad" Name="hmGharardadType" PropertyName="Value" />
                <asp:ControlParameter ControlID="drpVahed" Name="hmVahedType" PropertyName="Value" />
                <asp:QueryStringParameter Name="hmNezarat" QueryStringField="id" />
                <asp:Parameter Name="hmMainProjectId" />
                <asp:Parameter Direction="Output" Name="hmId" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceEstelam" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbEstelamVahed SET esAct = 1 WHERE (esId = @esId)" InsertCommand="INSERT INTO tbEstelamVahed(esProject, esAct, esVahed) VALUES (@esProject, 1, @esVahed)
SELECT @esId = SCOPE_IDENTITY()" SelectCommand="SELECT esId, esProject, esAct, esVahed FROM tbEstelamVahed WHERE (esAct = 1) ORDER BY esId DESC">
            <DeleteParameters>
                <asp:Parameter Name="esId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="drpProjects" Name="esProject" PropertyName="Value" />
                <asp:Parameter Name="esVahed" />
                <asp:Parameter Name="esId" Direction="Output" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Close">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
    </form>
</body>
</html>
