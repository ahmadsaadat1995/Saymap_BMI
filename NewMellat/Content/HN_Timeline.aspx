<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="HN_Timeline.aspx.cs" inherits="NewMellat.Content.HN_Timeline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/select2.css" rel="stylesheet" />
    <style>
        .highcharts-credits {
            display: none;
        }
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <asp:literal runat="server" ID="lit1"></asp:literal>
    <script src="../assets/highchart/highcharts-gantt.js"></script>
    <script src="../assets/js/select2.js"></script>
   <script src="../assets/js/moment/moment.js"></script>
	<script src="../assets/js/moment/moment-jalaali.js"></script>
    <div>
        <label>جستجو پروژه </label>
        <select id="slc_projects" style="width: 500px;"></select>
        <input type="button" value="اعمال" id="btn_click"/>
    </div>

    <div id="container"></div>
    <script>
        $(document).ready(function () {
            function convertToTimespan(date,add){
                if(!date)
                    return;  
                var m=moment(date);
                if(add)
                    m=moment(date).add(add, 'days');
                return m.unix()*1000;
            }
           
            if (!username)
                window.location.href = 'http://172.22.65.16:1983/';
            $.ajax({
                url: "http://172.22.65.16:4581/SqlOData.svc/GetData2/" + username + "/tbProjects? $select=t.prId,t.prTitle &$filter= t.prAct = 1 and t.prProjectStatus in(N'خاتمه یافته',N'در حال اجرا',N'متوقف')&$sort=t.prId desc ",
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
                        var cat= [ 'طرح در کارگروه', 'ارسال سند نیازمندی ها','تایید سند نیازمندی ها', 'طرح در جلسه کمیسون نظارت',
                             'ارسال پروپوزال اولیه', 'تایید پروپوزال', 'آنالیز قیمت', 'طرح در کمیسیون نظارت','ابلاغ به تدارکات',
                             'دریافت پیشنویس قرارداد', 'تایید پیشنویس قرارداد','دریافت اصل قرارداد'];
                       
                        var data=[];
                        if(dt.paDate){
                            var start=moment(dt.paDate).unix()*1000,
                                planM=moment(dt.paDate).add(8, 'days'),
                                endM=moment(dt.paDateKhobregan);
                            var duration=moment.duration(endM.diff(moment(dt.paDate))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:0,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:0,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:8});
                                data.push({ y:0,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.paDate &&dt.paDateKhobregan)
                            data.push({ y:0,start:moment(dt.paDateKhobregan).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.paDateKhobregan){
                            var start=moment(dt.paDateKhobregan).unix()*1000,
                                planM=moment(dt.mosSRS),
                                endM=moment(dt.sendSRS1);
                            var duration=moment.duration(endM.diff(moment(dt.paDateKhobregan))).asDays();

                            if(dt.mosSRS&&!endM.isSameOrBefore(planM,'day'))
                            {
                                data.push({ y:1,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:moment.duration(planM.diff(moment(dt.paDateKhobregan))).asDays()});
                                data.push({ y:1,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }                              
                            else
                                data.push({ y:1,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                        }
                        if(!dt.paDateKhobregan &&dt.sendSRS1)
                            data.push({ y:1,start:moment(dt.sendSRS1).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ///////////////////////////////////////////////////////////////
                        if(dt.sendSRS1){
                            var start=moment(dt.sendSRS1).unix()*1000,
                                planM=moment(dt.sendSRS1).add(21, 'days'),
                                endM=moment(dt.answerSRSLast);
                            var duration=moment.duration(endM.diff(moment(dt.sendSRS1))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:2,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:2,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:21});
                                data.push({ y:2,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.sendSRS1 &&dt.answerSRSLast)
                            data.push({ y:2,start:moment(dt.answerSRSLast).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.answerSRSLast){
                            var start=moment(dt.answerSRSLast).unix()*1000,
                                planM=moment(dt.answerSRSLast).add(15, 'days'),
                                endM=moment(dt.commissionMeetingDate);
                            var duration=moment.duration(endM.diff(moment(dt.answerSRSLast))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:3,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:3,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:15});
                                data.push({ y:3,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.answerSRSLast &&dt.commissionMeetingDate)
                            data.push({ y:3,start:moment(dt.commissionMeetingDate).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.commissionMeetingDate){
                            var start=moment(dt.commissionMeetingDate).unix()*1000,
                                planM=moment(dt.mosErsalDate),
                                endM=moment(dt.sendProposal1);
                            var duration=moment.duration(endM.diff(moment(dt.commissionMeetingDate))).asDays();

                            if(dt.mosErsalDate&&!endM.isSameOrBefore(planM,'day'))
                            {
                                data.push({ y:4,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:moment.duration(endM.diff(moment(dt.commissionMeetingDate))).asDays()});
                                data.push({ y:4,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }                              
                            else
                                data.push({ y:4,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                        }
                        if(!dt.commissionMeetingDate &&dt.sendProposal1)
                            data.push({ y:4,start:moment(dt.sendProposal1).unix()*1000 ,milestone:true,color:'#FF0000'});
                        /////////////////////////////////////////////////////////////// 
                        if(dt.sendProposal1){
                            var start=moment(dt.sendProposal1).unix()*1000,
                                planM=moment(dt.sendProposal1).add(51, 'days'),
                                endM=moment(dt.answerProposalLast);
                            var duration=moment.duration(endM.diff(moment(dt.sendProposal1))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:5,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:5,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:51});
                                data.push({ y:5,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.sendProposal1 &&dt.answerProposalLast)
                            data.push({ y:5,start:moment(dt.answerProposalLast).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.answerProposalLast){
                            var start=moment(dt.answerProposalLast).unix()*1000,
                                planM=moment(dt.answerProposalLast).add(14, 'days'),
                                endM=moment(dt.analizGhametApprove);
                            var duration=moment.duration(endM.diff(moment(dt.answerProposalLast))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:6,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:6,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:14});
                                data.push({ y:6,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.answerProposalLast &&dt.analizGhametApprove)
                            data.push({ y:6,start:moment(dt.analizGhametApprove).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.analizGhametApprove){
                            var start=moment(dt.analizGhametApprove).unix()*1000,
                                planM=moment(dt.analizGhametApprove).add(9, 'days'),
                                endM=moment(dt.comisionNezarat);
                            var duration=moment.duration(endM.diff(moment(dt.analizGhametApprove))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:7,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:7,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:9});
                                data.push({ y:7,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.analizGhametApprove &&dt.comisionNezarat)
                            data.push({ y:7,start:moment(dt.comisionNezarat).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.comisionNezarat){
                            var start=moment(dt.comisionNezarat).unix()*1000,
                                planM=moment(dt.comisionNezarat).add(14, 'days'),
                                endM=moment(dt.eblaghTadarokat);
                            var duration=moment.duration(endM.diff(moment(dt.comisionNezarat))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:8,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:8,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:14});
                                data.push({ y:8,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.comisionNezarat &&dt.eblaghTadarokat)
                            data.push({ y:8,start:moment(dt.eblaghTadarokat).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.eblaghTadarokat){
                            var start=moment(dt.eblaghTadarokat).unix()*1000,
                                planM=moment(dt.eblaghTadarokat).add(14, 'days'),
                                endM=moment(dt.daryaftPishnevis);
                            var duration=moment.duration(endM.diff(moment(dt.eblaghTadarokat))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:9,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:9,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:14});
                                data.push({ y:9,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.eblaghTadarokat &&dt.daryaftPishnevis)
                            data.push({ y:9,start:moment(dt.daryaftPishnevis).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.daryaftPishnevis){
                            var start=moment(dt.daryaftPishnevis).unix()*1000,
                                planM=moment(dt.daryaftPishnevis).add(3, 'days'),
                                endM=moment(dt.taeedPishnevis);
                            var duration=moment.duration(endM.diff(moment(dt.daryaftPishnevis))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:10,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:10,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:3});
                                data.push({ y:10,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.daryaftPishnevis &&dt.taeedPishnevis)
                            data.push({ y:10,start:moment(dt.taeedPishnevis).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                        if(dt.taeedPishnevis){
                            var start=moment(dt.taeedPishnevis).unix()*1000,
                                planM=moment(dt.taeedPishnevis).add(7, 'days'),
                                endM=moment(dt.daryaftGharardad);
                            var duration=moment.duration(endM.diff(moment(dt.taeedPishnevis))).asDays();

                            if(endM.isSameOrBefore(planM,'day'))
                                data.push({ y:11,start:start,end: endM.unix()*1000,color:'#85C1E9',duration:duration});
                            else{
                                data.push({ y:11,start:start,end: planM.unix()*1000,color:'#85C1E9',duration:7});
                                data.push({ y:11,start:planM.unix()*1000,end: endM.unix()*1000,color:'#2E86C1',duration:duration});
                            }
                        }
                        if(!dt.taeedPishnevis &&dt.daryaftGharardad)
                            data.push({ y:11,start:moment(dt.daryaftGharardad).unix()*1000 ,milestone:true,color:'#FF0000'});
                        ////////////////////////////////////////////////////////////////
                         
                        // data.push({ y:0,start:convertToTimespan(dt.paDate),end: convertToTimespan(dt.paDate,8),color:'#85C1E9'});
                        // data.push({ y:0,start:convertToTimespan(dt.paDate,8),end: convertToTimespan(dt.paDateKhobregan),color:'#2E86C1'});
                        //data.push({ y:1,start:convertToTimespan(dt.paDateKhobregan),end: convertToTimespan(dt.sendSRS1)});
                        // data.push({ y:2,start:convertToTimespan(dt.sendSRS1),end: convertToTimespan(dt.answerSRSLast)});
                        // data.push({ y:3,start:convertToTimespan(dt.answerSRSLast),end: convertToTimespan(dt.commissionMeetingDate)});
                        // data.push({ y:4,start:convertToTimespan(dt.commissionMeetingDate),end: convertToTimespan(dt.sendProposal1)});
                      //  data.push({ y:5,start:convertToTimespan(dt.sendProposal1),end: convertToTimespan(dt.answerProposalLast)});
                      //  data.push({ y:6,start:convertToTimespan(dt.answerProposalLast),end: convertToTimespan(dt.analizGhametApprove)});
                      //  data.push({ y:7,start:convertToTimespan(dt.analizGhametApprove),end: convertToTimespan(dt.comisionNezarat)});
                      //  data.push({ y:8,start:convertToTimespan(dt.comisionNezarat),end: convertToTimespan(dt.eblaghTadarokat)});
                      //  data.push({ y:9,start:convertToTimespan(dt.eblaghTadarokat),end: convertToTimespan(dt.eblaghTadarokat)});
                       // data.push({ y:10,start:convertToTimespan(dt.eblaghTadarokat),end: convertToTimespan(dt.daryaftPishnevis)});
                       // data.push({ y:11,start:convertToTimespan(dt.daryaftPishnevis),end: convertToTimespan(dt.taeedPishnevis)});
                      //  data.push({ y:12,start:convertToTimespan(dt.taeedPishnevis),end: convertToTimespan(dt.daryaftGharardad)});
                        
                           
                        moment.locale('fa');

                        Highcharts.dateFormats = {
                            'a': function(ts) {
                                return moment(ts).format('dddd')
                            },
                            'A': function(ts) {
                                return moment(ts).format('dddd')
                            },
                            'd': function(ts) {
                                return moment(ts).format('DD')
                            },
                            'e': function(ts) {
                                return moment(ts).format('D')
                            },
                            'b': function(ts) {
                                return moment(ts).format('MMMM')
                            },
                            'B': function(ts) {
                                return moment(ts).format('MMMM')
                            },
                            'm': function(ts) {
                                return moment(ts).format('MM')
                            },
                            'y': function(ts) {
                                return moment(ts).format('YY')
                            },
                            'Y': function(ts) {
                                return moment(ts).format('YYYY')
                            },
                            'W': function(ts) {
                                return moment(ts).format('ww')
                            }
                        };

                        series[0].data.forEach(a=>{
                            if(!a.start) {delete a.start; a.milestone= true ;a.color='#FF0000'}
                            if(!a.end) {delete a.end;a.milestone= true;a.color='#FF0000'}
            })

            var chart= Highcharts.ganttChart('container', {
                title: { text: ''},
                xAxis: {reversed: true},
                yAxis: {opposite: true,type: 'category',categories: cat,},
                tooltip: {
                    formatter: function() {
                        var f=this.x? moment(this.x).format('jYYYY/jMM/jDD'):'';
                        var r= this.x2? moment(this.x2).format('jYYYY/jMM/jDD'):'';
                        return f+ '<b> - </b>'+r +"<br/>"+this.point.duration +" روز";
                    }
                },
                series: [{
                    name: 'Project 1',
                    data:DataTransfer}]
            });
            chart.redraw();
        }
        })
        })

        })

        

    </script>
</asp:content>
