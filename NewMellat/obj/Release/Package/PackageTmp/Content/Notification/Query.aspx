<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="Query.aspx.cs" inherits="NewMellat.Content.Notification.Query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-control {}
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <div dir="ltr" style="padding-top: 10px; padding-bottom: 3px">
         <div class="box box-danger" style="height: 328px; padding-top: 9px; top: 0px; left: 0px;" align="right">
             <table cellpadding="0" cellspacing="0" width="100%" align="right">
                <tr>
                    <td align="right">
                        <asp:TextBox ID="txtTitle1" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                    </td>
                    <td width="12%">
                        <asp:Label ID="Label1" runat="server" Text=":نام "></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td align="right">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"  Width="95%"></asp:TextBox>
                    </td>
                    <td width="12%">
                        <asp:Label ID="Label2" runat="server" Text=":نام فیلد تاریخ"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td align="right">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="MultiLine" Width="95%" Height="202px"></asp:TextBox>
                    </td>
                    <td width="12%">
                        <asp:Label ID="Label3" runat="server" Text=":پرس و جو"></asp:Label>
                    </td>
                </tr>
              </table>
         </div>
        
    

    
    </div>
    <div align="center" class="box box-success" style="padding-top: 12px; padding-bottom: 12px">
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-block btn-danger" Text="ثبت اطلاعات" OnClick="ASPxButton1_Click" Width="150px" ValidationGroup="g1" />
   </div>
</asp:content>
