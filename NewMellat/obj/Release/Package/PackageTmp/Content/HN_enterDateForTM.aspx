<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="HN_enterDateForTM.aspx.cs" inherits="NewMellat.Content.HN_enterDateForTM" %>

<%@ register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/select2.css" rel="stylesheet" />
      <link rel="stylesheet" href="../assets/css/persian-datepicker.css"/>
 <style>
        #tbl1{
            width:50%;
        }
        #tbl1 td{
                
    border: solid 1px;
    padding: 7px;
        }
    </style>

</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <asp:literal runat="server" ID="lit1"></asp:literal>
     <script src="../assets/js/select2.js"></script>
<script src="../../assets/js/moment/moment.js"></script>
  <script src="../../assets/js/moment/moment-jalaali.js"></script>
    <script src="../assets/js/persian-date.min.js"></script>
  <script src="../assets/js/persian-datepicker.js"></script>
     <div>
        <label>جستجو پروژه </label>
        <select id="slc_projects" style="width: 500px;"></select>
        <input type="button" value="اعمال" id="btn_click"/>
    </div>
    <div id="container">
          <table id="tbl1" >
            <thead>
                <tr>
                    <td>عنوان فعالیت</td>  <%--<td>شناسه نامه</td>  <td>شماره نامه</td> --%> <td>تاریخ نامه موجود</td> <td>تاریخ نامه جدید</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                   <td>جلسه کارگروه</td>
                   <%-- <td>  <asp:TextBox runat="server" ID="letterShenase1"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo1"></asp:TextBox></td>
                         <td>  <cc1:persiancalendar id="letterDate1" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>--%>
                    <td><span id="lbl1"></span></td>
                    <td><input type="text" id="dtp1" class="dtp"/></td>
                </tr>
                <tr>
                    <td>ارسال سند نیازمندی ها</td>
                  <%--  <td>  <asp:TextBox runat="server" ID="letterShenase2"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo2"></asp:TextBox></td>--%>
                      <td><span id="lbl2"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate2" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>تایید سند نیازمندی ها</td>
                    <%--<td>  <asp:TextBox runat="server" ID="letterShenase3"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo3"></asp:TextBox></td>--%>
                      <td><span id="lbl3"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate3" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>طرح در جلسه کمیسون نظارت</td>
                  <%--  <td>  <asp:TextBox runat="server" ID="letterShenase4"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo4"></asp:TextBox></td>--%>
                      <td><span id="lbl4"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate4" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>ارسال پروپوزال اولیه</td>
                  <%--  <td>  <asp:TextBox runat="server" ID="letterShenase5"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo5"></asp:TextBox></td>--%>
                      <td><span id="lbl5"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate5" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>تایید پروپوزال</td>
                  <%--  <td>  <asp:TextBox runat="server" ID="letterShenase6"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo6"></asp:TextBox></td>--%>
                      <td><span id="lbl6"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate6" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>آنالیز قیمت</td>
                 <%--   <td>  <asp:TextBox runat="server" ID="letterShenase7"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo7"></asp:TextBox></td>--%>
                      <td><span id="lbl7"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate7" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>طرح در کمیسیون نظارت</td>
                   <%-- <td>  <asp:TextBox runat="server" ID="letterShenase8"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo8"></asp:TextBox></td>--%>
                      <td><span id="lbl8"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate8" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>ابلاغ به تدارکات</td>
                  <%--  <td>  <asp:TextBox runat="server" ID="letterShenase9"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo9"></asp:TextBox></td>--%>
                      <td><span id="lbl9"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate9" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>دریافت پیشنویس قرارداد</td>
                  <%--  <td>  <asp:TextBox runat="server" ID="letterShenase10"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo10"></asp:TextBox></td>--%>
                      <td><span id="lbl10"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate10" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>تایید پیشنویس قرارداد</td>
                    <%--<td>  <asp:TextBox runat="server" ID="letterShenase11"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo11"></asp:TextBox></td>--%>
                      <td><span id="lbl11"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate11" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
                <tr>
                    <td>دریافت اصل قرارداد</td>
                  <%--  <td>  <asp:TextBox runat="server" ID="letterShenase12"></asp:TextBox></td>
                    <td>  <asp:TextBox runat="server" ID="letterNo12"></asp:TextBox></td>--%>
                      <td><span id="lbl12"></span></td>
                    <td>  <cc1:persiancalendar id="letterDate12" runat="server" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar></td>
                </tr>
            </tbody>
        </table>
    </div>
    <script>
        $(document).ready(function () {
            $(".dtp").pDatepicker({
                format:'LL',
                initialValue:false});
            $.ajax({
                url: "http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/tbProjects? $select=t.prId,t.prTitle &$filter= t.prAct = 1 and t.prProjectStatus in(N'خاتمه یافته',N'در حال اجرا',N'متوقف')&$sort=t.prId desc ",
                type: "GET",
                async: true,
                headers: {
                    "accept": "application/json;odata=verbose",
                },
                success: function (data) {
                    var projects = JSON.parse(data).d.results;
                    var pHtml=projects.map(a=>(' <option value="'+a.prId+'">'+a.prId+' - '+a.prTitle+'</option>'));
                    $('#slc_projects').html(pHtml);
                    $('#slc_projects').select2({dir: "rtl"});
                    $('#slc_projects').val(1).trigger('change.select2');
                }
            })
            $("#btn_click").click(function(){
                $.ajax({
                    url: "http://172.22.65.16:4581/SqlOData.svc/GetData/rpt_Dates2?$filter=prId eq "+$('#slc_projects').val(),
                    type: "GET",
                    async: true,
                    headers: {
                        "accept": "application/json;odata=verbose",
                    },
                    success: function (data) {
                        var dt = JSON.parse(data).d.results[0];
                        $('#lbl1').text(moment(dt.paDateKhobregan).format('YYYY/MM/DD'))
                    }
                });
            });
        });
        </script>
</asp:content>