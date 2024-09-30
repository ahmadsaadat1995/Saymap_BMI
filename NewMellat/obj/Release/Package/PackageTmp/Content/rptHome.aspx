<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="rptHome.aspx.cs" inherits="NewMellat.Content.rptHome" %>

<%@ register assembly="DevExpress.Dashboard.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 360px;
            max-width: 800px;
            margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #ebebeb;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }

        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
    </style>
      <link href="assets/css/loading.css" rel="stylesheet" />
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <script src="../assets/highchart/highcharts.js"></script>
    <script src="../assets/highchart/modules/heatmap.js"></script>
    <script src="../assets/js/moment/moment.js"></script>
	<script src="../assets/js/moment/moment-jalaali.js"></script>
  <div id="loader"></div>

    <div style="display:none;" id="myDiv" class="animate-bottom">
    <div class="row">

            <div class="box-info searchBox">

                <span>سال : </span>
                <select id="slct_year" style="width: 100px;">
                    <option value="1400" selected>1400</option>
                    <option value="1399">1399</option>
                    <option value="1398">1398</option>
                    <option value="1397">1397</option>
                    <option value="1396">1396</option>
                    <option value="1395">1395</option>
                    <option value="1394">1394</option>
                   <%-- <option value="-1">همه</option>--%>
                </select>              
                <input type="button" value="اعمال فیلتر" id="btn_filter" />
            </div>
        </div>
     <div class="row">
      <div id="container"></div>
         </div>
        </div>
    <script>
        $(document).ready(function () {
            var xx = [], dt =[];
            $('#btn_filter').click(function(){
                calcData();
            })
            function preparData(field,code){
                var obj={};
                var dt0 = dt.filter(a=>a[field]==code);               
                var step1Delay=dt0.filter(a=>moment(a.paDate).jYear()==$('#slct_year').val()&&moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days'),'day'));
                var step2Delay=dt0.filter(a=>moment(a.paDateKhobregan).jYear()==$('#slct_year').val()&&moment(a.sendSRS1).isAfter(moment(a.mosSRS),'day'));
                var step3Delay=dt0.filter(a=>moment(a.sendSRS1).jYear()==$('#slct_year').val()&&moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days'),'day'));
                var step4Delay=dt0.filter(a=>moment(a.answerSRSLast).jYear()==$('#slct_year').val()&&moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days'),'day'));
                var step5Delay=dt0.filter(a=>moment(a.commissionMeetingDate).jYear()==$('#slct_year').val()&&moment(a.sendProposal1).isAfter(moment(a.mosErsalDate),'day'));
                var step6Delay=dt0.filter(a=>moment(a.sendProposal1).jYear()==$('#slct_year').val()&&moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days'),'day'));
                var step7Delay=dt0.filter(a=>moment(a.answerProposalLast).jYear()==$('#slct_year').val()&&moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days'),'day'));
                var step8Delay=dt0.filter(a=>moment(a.analizGhametApprove).jYear()==$('#slct_year').val()&&moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days'),'day'));
                var step9Delay=dt0.filter(a=>moment(a.comisionNezarat).jYear()==$('#slct_year').val()&&moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days'),'day'));
                var step10Delay=dt0.filter(a=>moment(a.eblaghTadarokat).jYear()==$('#slct_year').val()&&moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days'),'day'));
                var step11Delay=dt0.filter(a=>moment(a.daryaftPishnevis).jYear()==$('#slct_year').val()&&moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days'),'day'));
                var step12Delay=dt0.filter(a=>moment(a.taeedPishnevis).jYear()==$('#slct_year').val()&&moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days'),'day'));
               
                obj.all=dt0;
                obj.step0=step1Delay;
                obj.step1=step2Delay;
                obj.step2=step3Delay;
                obj.step3=step4Delay;
                obj.step4=step5Delay;
                obj.step5=step6Delay;
                obj.step6=step7Delay;
                obj.step7=step8Delay;
                obj.step8=step9Delay;
                obj.step9=step10Delay;
                obj.step10=step11Delay;
                obj.step11=step12Delay;

                // obj.allLen=dt0.length;
                obj.step0DelayP=Math.round((step1Delay.length/dt0.length*100)* 10) / 10;
                obj.step1DelayP=Math.round((step2Delay.length/dt0.length*100)* 10) / 10;
                obj.step2DelayP=Math.round((step3Delay.length/dt0.length*100)* 10) / 10;
                obj.step3DelayP=Math.round((step4Delay.length/dt0.length*100)* 10) / 10;
                obj.step4DelayP=Math.round((step5Delay.length/dt0.length*100)* 10) / 10;
                obj.step5DelayP=Math.round((step6Delay.length/dt0.length*100)* 10) / 10;
                obj.step6DelayP=Math.round((step7Delay.length/dt0.length*100)* 10) / 10;
                obj.step7DelayP=Math.round((step8Delay.length/dt0.length*100)* 10) / 10;
                obj.step8DelayP=Math.round((step9Delay.length/dt0.length*100)* 10) / 10;
                obj.step9DelayP=Math.round((step10Delay.length/dt0.length*100)* 10) / 10;
                obj.step10DelayP=Math.round((step11Delay.length/dt0.length*100)* 10) / 10;
                obj.step11DelayP=Math.round((step12Delay.length/dt0.length*100)* 10) / 10;
                return obj;
            }

            $.ajax({
                url: "http://172.22.65.16:4581/SqlOData.svc/GetData/rpt_Dates2",
                type: "GET",
                async: true,
                headers: {
                    "accept": "application/json;odata=verbose",
                },
                success: function (data) {
                    dt = JSON.parse(data).d.results;
                    calcData();
                    document.getElementById("loader").style.display = "none";
                    document.getElementById("myDiv").style.display = "block";
                }//succes
            });//ajax
            function calcData(){
                xx = []
                xx.push(preparData("prPeymankar",164));
                xx.push(preparData("prPeymankar",165));
                xx.push(preparData("prPeymankar",166));
                xx.push(preparData("prPeymankar",167));
                xx.push(preparData("prPeymankar",169));
                xx.push(preparData("prPeymankar",168));
                xx.push(preparData("prPeymankar",172));
                //// "164" شرکت بهسازان ملت
                //var dt0 = dt.filter(a=>a.prPeymankar==164);
                //var dt0step1Delay=dt0.filter(a=>moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days')),'day');
                //var dt0step2Delay=dt0.filter(a=>moment(a.sendSRS1).isAfter(moment(a.mosSRS)),'day');
                //var dt0step3Delay=dt0.filter(a=>moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days')),'day');
                //var dt0step4Delay=dt0.filter(a=>moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days')),'day');
                //var dt0step5Delay=dt0.filter(a=>moment(a.sendProposal1).isAfter(moment(a.mosErsalDate)),'day');
                //var dt0step6Delay=dt0.filter(a=>moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days')),'day');
                //var dt0step7Delay=dt0.filter(a=>moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days')),'day');
                //var dt0step8Delay=dt0.filter(a=>moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days')),'day');
                //var dt0step9Delay=dt0.filter(a=>moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days')),'day');
                //var dt0step10Delay=dt0.filter(a=>moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days')),'day');
                //var dt0step11Delay=dt0.filter(a=>moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days')),'day');
                //var dt0step12Delay=dt0.filter(a=>moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days')),'day');

                //// "165" شرکت مهندسی سیستم یاس ارغوانی
                //var dt1 = dt.filter(a=>a.prPeymankar==165);
                //var dt1step1Delay=dt1.filter(a=>moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days')),'day');
                //var dt1step2Delay=dt1.filter(a=>moment(a.sendSRS1).isAfter(moment(a.mosSRS)),'day');
                //var dt1step3Delay=dt1.filter(a=>moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days')),'day');
                //var dt1step4Delay=dt1.filter(a=>moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days')),'day');
                //var dt1step5Delay=dt1.filter(a=>moment(a.sendProposal1).isAfter(moment(a.mosErsalDate)),'day');
                //var dt1step6Delay=dt1.filter(a=>moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days')),'day');
                //var dt1step7Delay=dt1.filter(a=>moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days')),'day');
                //var dt1step8Delay=dt1.filter(a=>moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days')),'day');
                //var dt1step9Delay=dt1.filter(a=>moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days')),'day');
                //var dt1step10Delay=dt1.filter(a=>moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days')),'day');
                //var dt1step11Delay=dt1.filter(a=>moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days')),'day');
                //var dt1step12Delay=dt1.filter(a=>moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days')),'day');

                //// "166" شرکت به پرداخت ملت
                //var dt2 = dt.filter(a=>a.prPeymankar==166);
                //var dt2step1Delay=dt2.filter(a=>moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days')),'day');
                //var dt2step2Delay=dt2.filter(a=>moment(a.sendSRS1).isAfter(moment(a.mosSRS)),'day');
                //var dt2step3Delay=dt2.filter(a=>moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days')),'day');
                //var dt2step4Delay=dt2.filter(a=>moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days')),'day');
                //var dt2step5Delay=dt2.filter(a=>moment(a.sendProposal1).isAfter(moment(a.mosErsalDate)),'day');
                //var dt2step6Delay=dt2.filter(a=>moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days')),'day');
                //var dt2step7Delay=dt2.filter(a=>moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days')),'day');
                //var dt2step8Delay=dt2.filter(a=>moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days')),'day');
                //var dt2step9Delay=dt2.filter(a=>moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days')),'day');
                //var dt2step10Delay=dt2.filter(a=>moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days')),'day');
                //var dt2step11Delay=dt2.filter(a=>moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days')),'day');
                //var dt2step12Delay=dt2.filter(a=>moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days')),'day');

                //// "167" شرکت مهندسی صنایع یاس ارغوانی
                //var dt3 = dt.filter(a=>a.prPeymankar==167);
                //var dt3step1Delay=dt3.filter(a=>moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days')),'day');
                //var dt3step2Delay=dt3.filter(a=>moment(a.sendSRS1).isAfter(moment(a.mosSRS)),'day');
                //var dt3step3Delay=dt3.filter(a=>moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days')),'day');
                //var dt3step4Delay=dt3.filter(a=>moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days')),'day');
                //var dt3step5Delay=dt3.filter(a=>moment(a.sendProposal1).isAfter(moment(a.mosErsalDate)),'day');
                //var dt3step6Delay=dt3.filter(a=>moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days')),'day');
                //var dt3step7Delay=dt3.filter(a=>moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days')),'day');
                //var dt3step8Delay=dt3.filter(a=>moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days')),'day');
                //var dt3step9Delay=dt3.filter(a=>moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days')),'day');
                //var dt3step10Delay=dt3.filter(a=>moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days')),'day');
                //var dt3step11Delay=dt3.filter(a=>moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days')),'day');
                //var dt3step12Delay=dt3.filter(a=>moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days')),'day');

                //// "168" گروه فناوران هوشمند بهسازان فردا
                //var dt5 = dt.filter(a=>a.prPeymankar==168);
                //var dt5step1Delay=dt5.filter(a=>moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days')),'day');
                //var dt5step2Delay=dt5.filter(a=>moment(a.sendSRS1).isAfter(moment(a.mosSRS)),'day');
                //var dt5step3Delay=dt5.filter(a=>moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days')),'day');
                //var dt5step4Delay=dt5.filter(a=>moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days')),'day');
                //var dt5step5Delay=dt5.filter(a=>moment(a.sendProposal1).isAfter(moment(a.mosErsalDate)),'day');
                //var dt5step6Delay=dt5.filter(a=>moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days')),'day');
                //var dt5step7Delay=dt5.filter(a=>moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days')),'day');
                //var dt5step8Delay=dt5.filter(a=>moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days')),'day');
                //var dt5step9Delay=dt5.filter(a=>moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days')),'day');
                //var dt5step10Delay=dt5.filter(a=>moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days')),'day');
                //var dt5step11Delay=dt5.filter(a=>moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days')),'day');
                //var dt5step12Delay=dt5.filter(a=>moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days')),'day');

                //// "169" شرکت زیرساخت امن خدمات تراکنشی
                //var dt4 = dt.filter(a=>a.prPeymankar==169);
                //var dt4step1Delay=dt4.filter(a=>moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days')),'day');
                //var dt4step2Delay=dt4.filter(a=>moment(a.sendSRS1).isAfter(moment(a.mosSRS)),'day');
                //var dt4step3Delay=dt4.filter(a=>moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days')),'day');
                //var dt4step4Delay=dt4.filter(a=>moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days')),'day');
                //var dt4step5Delay=dt4.filter(a=>moment(a.sendProposal1).isAfter(moment(a.mosErsalDate)),'day');
                //var dt4step6Delay=dt4.filter(a=>moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days')),'day');
                //var dt4step7Delay=dt4.filter(a=>moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days')),'day');
                //var dt4step8Delay=dt4.filter(a=>moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days')),'day');
                //var dt4step9Delay=dt4.filter(a=>moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days')),'day');
                //var dt4step10Delay=dt4.filter(a=>moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days')),'day');
                //var dt4step11Delay=dt4.filter(a=>moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days')),'day');
                //var dt4step12Delay=dt4.filter(a=>moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days')),'day');

                //// "172" شرکت مهندسی نرم افزار شقایق
                //var dt6 = dt.filter(a=>a.prPeymankar==172);
                //var dt6step1Delay=dt6.filter(a=>moment(a.paDateKhobregan).isAfter(moment(a.paDate).add(8, 'days')),'day');
                //var dt6step2Delay=dt6.filter(a=>moment(a.sendSRS1).isAfter(moment(a.mosSRS)),'day');
                //var dt6step3Delay=dt6.filter(a=>moment(a.answerSRSLast).isAfter(moment(a.sendSRS1).add(21, 'days')),'day');
                //var dt6step4Delay=dt6.filter(a=>moment(a.commissionMeetingDate).isAfter(moment(a.answerSRSLast).add(15, 'days')),'day');
                //var dt6step5Delay=dt6.filter(a=>moment(a.sendProposal1).isAfter(moment(a.mosErsalDate)),'day');
                //var dt6step6Delay=dt6.filter(a=>moment(a.answerProposalLast).isAfter(moment(a.sendProposal1).add(51, 'days')),'day');
                //var dt6step7Delay=dt6.filter(a=>moment(a.analizGhametApprove).isAfter(moment(a.answerProposalLast).add(14, 'days')),'day');
                //var dt6step8Delay=dt6.filter(a=>moment(a.comisionNezarat).isAfter(moment(a.analizGhametApprove).add(9, 'days')),'day');
                //var dt6step9Delay=dt6.filter(a=>moment(a.eblaghTadarokat).isAfter(moment(a.comisionNezarat).add(14, 'days')),'day');
                //var dt6step10Delay=dt6.filter(a=>moment(a.daryaftPishnevis).isAfter(moment(a.eblaghTadarokat).add(14, 'days')),'day');
                //var dt6step11Delay=dt6.filter(a=>moment(a.taeedPishnevis).isAfter(moment(a.daryaftPishnevis).add(3, 'days')),'day');
                //var dt6step12Delay=dt6.filter(a=>moment(a.daryaftGharardad).isAfter(moment(a.taeedPishnevis).add(7, 'days')),'day');

                var xCat=['طرح در کارگروه', 'ارسال سند نیازمندی ها', 'تایید سند نیازمندی ها', 'طرح در جلسه کمیسون نظارت',
                                 'ارسال پروپوزال اولیه', 'تایید پروپوزال', 'آنالیز قیمت', 'طرح در کمیسیون نظارت', 'ابلاغ به تدارکات',
                                 'دریافت پیشنویس قرارداد', 'تایید پیشنویس قرارداد', 'دریافت اصل قرارداد'];
                var yCat=['شرکت بهسازان ملت', 'شرکت مهندسی سیستم یاس ارغوانی', 'شرکت به پرداخت ملت', 'شرکت مهندسی صنایع یاس ارغوانی', 'شرکت زیرساخت امن خدمات تراکنشی', 'گروه فناوران هوشمند بهسازان فردا', 'شرکت مهندسی نرم افزار شقایق'];
                var data=[];
                for (var i = 0; i < xCat.length; i++) {
                    for (var j = 0; j < yCat.length; j++) {
                        data.push([i,j,(xx[j]["step"+i+"DelayP"])])
                    }
                }

                function getPointTooltip(point){
                    return "<p>تعداد درخواست ها : <b>"+xx[point.y]["all"].length+"</b></p>"+
                        "<p>تعداد درخواست دارای تاخیر : <b>"+xx[point.y]["step"+point.x].length+"</b></p>";
                }
                //function getPointCategoryName(point, dimension) {
                //    var series = point.series,
                //        isY = dimension === 'y',
                //        axis = series[isY ? 'yAxis' : 'xAxis'];
                //    return axis.categories[point[isY ? 'y' : 'x']];
                //}

                Highcharts.chart('container', {

                    chart: {
                        type: 'heatmap',
                        marginTop: 40,
                        marginBottom: 120,
                        plotBorderWidth: 1
                    },


                    title: {
                        text: 'درصد تاخیر '
                    },

                    xAxis: {
                        labels: { rotation: -30 },
                        categories: xCat,
                        reversed: true
                    },

                    yAxis: {
                        categories: yCat,
                        title: null,
                        reversed: true, opposite: true
                    },

                    //accessibility: {
                    //    point: {
                    //        descriptionFormatter: function (point) {
                    //            var ix = point.index + 1,
                    //                xName = getPointCategoryName(point, 'x'),
                    //                yName = getPointCategoryName(point, 'y'),
                    //                val = point.value;
                    //            return ix + '. ' + xName + ' sales ' + yName + ', ' + val + '.';
                    //        }
                    //    }
                    //},

                    colorAxis: {
                        min: 0,
                        minColor: '#FFFFFF',
                        maxColor: Highcharts.getOptions().colors[0]
                    },

                    legend: {
                        align: 'right',
                        layout: 'vertical',
                        margin: 0,
                        verticalAlign: 'top',
                        y: 25,
                        symbolHeight: 280
                    },

                    tooltip: {
                        useHTML: true,
                        formatter: function () {
                            return getPointTooltip(this.point) ;
                        }
                    },

                    series: [{
                        name: 'Sales per employee',
                        borderWidth: 1,
                        data: data//[[0, 0, 10], [0, 1, 19], [0, 2, 8], [0, 3, 24], [0, 4, 67], [0, 5, 24], [0, 6, 67],
                        //[1, 0, 92], [1, 1, 58], [1, 2, 78], [1, 3, 117], [1, 4, 48], [1, 5, 24], [1, 6, 67],
                        //[2, 0, 35], [2, 1, 15], [2, 2, 123], [2, 3, 64], [2, 4, 52], [2, 5, 24], [2, 6, 67],
                        //[3, 0, 72], [3, 1, 132], [3, 2, 114], [3, 3, 19], [3, 4, 16], [3, 5, 24], [3, 6, 67],
                        //[4, 0, 38], [4, 1, 5], [4, 2, 8], [4, 3, 117], [4, 4, 115], [4, 5, 24], [4, 6, 67],
                        //[5, 0, 88], [5, 1, 32], [5, 2, 12], [5, 3, 6], [5, 4, 120], [5, 5, 24], [5, 6, 67],
                        //[6, 0, 13], [6, 1, 44], [6, 2, 88], [6, 3, 98], [6, 4, 96], [6, 5, 24], [6, 6, 67],
                        //[7, 0, 31], [7, 1, 1], [7, 2, 82], [7, 3, 32], [7, 4, 30], [7, 5, 24], [7, 6, 67],
                        //[8, 0, 85], [8, 1, 97], [8, 2, 123], [8, 3, 64], [8, 4, 84], [8, 5, 24], [8, 6, 67],
                        //[9, 0, 47], [9, 1, 114], [9, 2, 31], [9, 3, 48], [9, 4, 91], [9, 5, 24], [9, 6, 67],
                        //[10, 0, 47], [10, 1, 114], [10, 2, 31], [10, 3, 48], [10, 4, 101], [10, 5, 24], [10, 6, 67],
                        //[11, 0, 47], [11, 1, 114], [11, 2, 31], [11, 3, 48], [11, 4, 111], [11, 5, 24], [11, 6, 67]
                        //]
                        ,
                        dataLabels: {
                            enabled: true,
                            color: '#000000'
                        }
                    }],

                    responsive: {
                        rules: [{
                            condition: {
                                maxWidth: 500
                            },
                            chartOptions: {
                                yAxis: {
                                    labels: {
                                        formatter: function () {
                                            return this.value.charAt(0);
                                        }
                                    }
                                }
                            }
                        }]
                    }
                });//chart options
            }
        });//document.ready
    </script>
</asp:content>
