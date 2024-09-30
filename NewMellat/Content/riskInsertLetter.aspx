<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="riskInsertLetter.aspx.cs" Inherits="NewMellat.Content.riskInsertLetter" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="site.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/Scripts/jquery-1.12.4.min.js"></script>
 	<style>
.RightColumn{
	direction: ltr;
}
	
</style>
</head>
<body>
    <form id="form1" runat="server">
      <div align="center" dir="rtl">
    
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="RightColumn">
                    <asp:Label ID="Label2" runat="server" Text=":شماره نامه"></asp:Label>
                </td>
                <td>
                    <dx:ASPxTextBox ID="letterNo" runat="server" Theme="SoftOrange" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label3" runat="server" Text=":شناسه نامه"></asp:Label>
                </td>
                <td align="right">
                    <dx:ASPxTextBox ID="letterShenase" runat="server" Theme="SoftOrange" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label4" runat="server" Text=":تاریخ نامه"></asp:Label>
                </td>
                 <td align="right">
                <cc1:PersianCalendar ID="letterDate" runat="server" TabIndex="9"></cc1:PersianCalendar>
                </td>
                
            </tr>
            <tr>
                <td class="RightColumn">
                    <asp:Label ID="Label1" runat="server" Text=":ضمائم"></asp:Label>
                </td>
                 <td>
                    <telerik:radupload id="letterFile" runat="server" controlobjectsvisibility="RemoveButtons, AddButton" 
                                  maxfileinputscount="10" width="95%" >
                                <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                            </telerik:radupload>
                </td>
                <td class="RightColumn">
                    <asp:Label ID="Label5" runat="server" Text=":توضیحات"></asp:Label>
                </td>
                <td align="right" colspan="3">
                    <dx:ASPxTextBox ID="txtBody" runat="server" Theme="SoftOrange" Width="170px" RightToLeft="True">
                    </dx:ASPxTextBox>
                </td>
                
               
            </tr>
        </table>
    
    </div>
        <div align="center" style="padding: 8px">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <dx:ASPxButton ID="ASPxButton1" runat="server" Font-Names="B Yekan" Font-Size="13px" OnClick="ASPxButton1_Click" Text="ثبت نامه جدید" Theme="SoftOrange" Width="150px">
             <ClientSideEvents Click="function(s, e) { 
                        debugger;
                        
                 if($('#letterShenase_I').val() == ''||
                    $('#letterNo_I').val() == ''||
                    $('#letterDateinp').val() == ''){
                        alert('شناسه ، شماره ، تاریخ نامه الزامی است')
                         e.processOnServer =false;
                 }
                      
                  }" />
            </dx:ASPxButton>
        </div>
            <telerik:radnotification id="RadNotification1" runat="server" animation="Fade" font-names="B Yekan" font-size="15px" skin="Sunset">
    </telerik:radnotification>
    </form>
    <script>
        $('#letterDateinp').parent().css('display', 'inline-flex')
</script>
    <script type="text/javascript">

        function getRadWindow() {
            var oWindow = null;

            if (window.radWindow)
                oWindow = window.radWindow;
            else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow;

            return oWindow;
        }

        function clientClose(arg) {
            getRadWindow().close(arg);
        }

</script>
</body>
</html>
