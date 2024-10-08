﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageProjectCheck.aspx.cs" Inherits="NewMellat.Content.PageProjectCheck" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript" src="/scripts/jquery-1.12.4.min.js"></script>
    
   <script type="text/javascript" src="/scripts/knockout-3.4.0.js"></script>
   <script type="text/javascript">
       function loadRestRequest(url, callback) {
           var async = true;
           var res = null;
           if (callback == null)
           {
               async = false;
               callback = function (data) {
                   res = data.value;
               }
           }
           $.ajax({
               url: url,
               type: "GET",
               async: async,
               headers: {
                   "accept": "application/json"
               },
               success: callback,
               error: function (error) {
                   alert(JSON.stringify(error));
               }
           });
           return res;
       }
       $(document).ready(function () {
          
       });
       var model
       function loadData()
       {
           var title = $('input[name$="TextBoxTitle"]').val();
           var hadaf = $('input[name$="TextBoxHadaf"]').val();
           if (title.length < 3 && hadaf.length < 3) {
               if (model != null) {
                   model.items().splice(0, model.items().length);
               }
               $('#acceptButton').hide();
               return;
           }
           debugger;
           var filter = "";
           if (title.length >= 3)
           {
               var ts = title.split(' ');
               filter = "substringof(%27" + ts.join("%27,Title) and substringof(%27") + "%27,Title)";
               
           }
           if (hadaf.length >= 3) {
               var hs = hadaf.split(' ');
               if (filter.length > 0)
                   filter += " and "
               filter += "substringof('" + hs.join("',Hadaf) and substringof('") + "',Hadaf)";

           }
           loadRestRequest("http://172.22.65.16:4581/odata/ViewProjectSearch?$top=50&$filter=" + filter, function (data) {
               debugger;
               if (model == null) {
                   model = new ViewModel(data.value);
                   ko.applyBindings(model);
                   $('#acceptButton').show();
               } else {
                   model.items().splice(0, model.items().length);
                   $.each(data.value, function (index, item) {
                       model.items.push(item);
                   });
               }
           });
       }
       var ViewModel = function (itms)
       {
           var self = this;
           self.items = ko.observableArray(itms);
           self.openAttach = function (data)
           {
               var oWnd = radopen("/content/PageAttach.aspx?Parent=" + data.Id + "&Type=1", "RadWindow1");
               oWnd.setSize(910, 500);
               oWnd.Center();
           }
       }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Resize, Minimize, Close, Move" Skin="Sunset">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
    <div dir="ltr" style="padding-top: 10px; padding-bottom: 3px">
        
        <div class="box box-danger" style=" padding-top: 9px;" align="right">
            <br />
            <br />
            <br />
            
            <table cellpadding="0" cellspacing="0" width="100%" align="right">
                <tr >

                    <td align="right">
                        <asp:TextBox ID="TextBoxHadaf" runat="server" CssClass="form-control" onkeyup="loadData();" Width="95%"></asp:TextBox>
                    </td>
                    <td width="12%">
                        <asp:Label ID="Label2" runat="server" Text=":هدف پروژه"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="form-control" onkeyup="loadData();" Width="95%"></asp:TextBox>
                    </td>
                    <td width="12%">
                        <asp:Label ID="Label1" runat="server" Text=":نام پروژه" ></asp:Label>
                    </td>
                     
                </tr>
                <tr>
                    <td colspan="4">
                        <table style="width:100%;text-align:right" >
                            <tr style="height:25px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:silver">
                                <th>
                                   
                                </th>
                                <th>
                                   هدف 
                                </th>
                                <th>
                                   نام درخواست
                                </th>
                                <th>
                                   ردیف
                                </th>
                                
                            </tr>
                            <tbody data-bind="foreach:items">

                                <tr style="height:25px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:silver">
                                    <td>
                                        <a href="#" data-bind="event: { click: function () { $parent.openAttach($data); return false; }}"><img src="/Content/images/icons/attachment-icon24.png" /></a>
                                    </td>
                                    <td data-bind="text: Hadaf"></td>
                                    <td data-bind="text: Title"></td>
                                    <td data-bind="text:$index()+1"></td>
                                    
                                    
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </table>
            <div style="width:100%" align="center">
                <input id="acceptButton" type="button" style="display:none;height:40px;font-size:15pt;" value="اطمینان دارم که پروژه من داخل موارد جستجو شده نیست" onclick="if (confirm('آیا مطمئن هستید')) { location.href= '/content/pagenewproject.aspx' }" />
            </div>
        </div>
    </div>
</asp:Content>
