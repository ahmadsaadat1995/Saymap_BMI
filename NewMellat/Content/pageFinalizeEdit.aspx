<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="pageFinalizeEdit.aspx.cs" inherits="NewMellat.Content.pageFinalizeEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="site.css" rel="stylesheet" type="text/css" />
      <style>
        .cardCommon {
            background-color: #C5C3C3;
            border:solid 2px #DD4B39;
            border-radius:5px;
            width: 48%; 
            float: right; 
            margin: 8px;
        }
        .lbl {
        font-weight: bold;
    font-style: italic;
        }
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
       <div class="container-fluid">
            <div class="form-row">
                <div class="form-group col-7">
                    <label class="lbl"> 2آیا سامانه درحال حاضر مورد استفاده قرار می گیرد؟</label>
                  <%--  <select id="useSelect" class="form-control">
                        <option value="1" selected>بله</option>
                        <option value="0">خیر</option>
                    </select>--%>
                    <asp:DropDownList runat="server" ID="useSelect" class="form-control">
                        <asp:ListItem Value="1">بله</asp:ListItem>
                        <asp:ListItem Value="0">خیر</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-5">
                    <label class="lbl">تعداد کاربران</label>
                   <%-- <input type="number" class="form-control" id="userCount" style="margin-top: 25px!important" />--%>
                    <asp:TextBox runat="server" class="form-control" ID="userCount"></asp:TextBox>
                </div>
            </div>
               

            <div class="form-row">
                <div class="form-group col-12">
                    <label class="lbl">توضیح در مورد سامانه</label>
                    <asp:TextBox runat="server" class="form-control" ID="description" Rows="5" TextMode="MultiLine"></asp:TextBox>
                 <%--   <textarea class="form-control" id="description"></textarea>--%>
                </div>
            </div>
        </div>
<center>
    <asp:Button runat="server" Text="ذخیره"  class="btn" style="background-color:#DD4B39;color: white;" value="" ID="saveBtn" OnClick="saveBtn_Click"></asp:Button>
     <%--   <input type="button" class="btn" style="background-color:#DD4B39;color: white;" value="ذخیره" id="saveBtn"/>--%>
</center>
   <%-- <script>
        $(document).ready(function () {
            loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/tbSurvey?$filter= id eq " + 1).done(function (res) {
                data = JSON.parse(res).d.results;
            });
        });
    </script>--%>
   
</asp:content>
