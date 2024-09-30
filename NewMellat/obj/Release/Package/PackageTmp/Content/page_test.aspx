<%@ page language="C#" autoeventwireup="true" codebehind="page_test.aspx.cs"
    masterpagefile="~/Site2.Master" inherits="NewMellat.Content.page_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link rel="stylesheet" href="../assets/css/test.css" />
    <link href="../assets/highchart/css/highcharts.css" rel="stylesheet" />
    <link href="assets/css/loading.css" rel="stylesheet" />

</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
   
     <script src="../assets/highchart/highcharts.js"></script>
    <div id="loader"></div>
    <div style="direction: rtl; text-align: right; margin: 15px;" id="div_main" class="container-fluid">

        <asp:literal runat="server" id="lit1"></asp:literal>
        <div class="row">

            <div class="box-info searchBox">

                <span>سال : </span>
                <select id="slct_year" style="width: 100px;">
                     <option value="1401" selected>1401</option>
                    <option value="1400">1400</option>
                    <option value="1399">1399</option>
                    <option value="1398">1398</option>
                    <option value="1397">1397</option>
                    <option value="1396">1396</option>
                    <option value="1395">1395</option>
                    <option value="1394">1394</option>
                    <option value="-1">همه</option>
                </select>
                <span>واحد سازمانی : </span>
                <select id="slct_vahed" style="width: 300px;"></select>
                <span>شرکت : </span>
                <select id="slct_company">
                    <option value="-1" selected>همه شرکت ها</option>
                    <option value="164">شرکت بهسازان ملت</option>
                    <option value="165">شرکت مهندسی سیستم یاس ارغوانی</option>
                    <option value="166">شرکت به پرداخت ملت</option>
                    <option value="167">شرکت مهندسی صنایع یاس ارغوانی</option>
                    <option value="169">شرکت زیرساخت امن خدمات تراکنشی</option>
                    <option value="168">گروه فناوران هوشمند بهسازان فردا</option>
                    <option value="172">شرکت مهندسی نرم افزار شقایق</option>

                </select>
                <input type="button" value="اعمال فیلتر" id="btn_filter" />
            </div>
        </div>


        <div class="row">
            <div class="col">
                <div class="timeline">
                    <div class="timeline__event timeline__event--type1">
                        <div class="timeline__event__icon ">
                            <i class="lni-cake"></i>
                            <div class="timeline__event__date">
                                8 روز
                            </div>
                        </div>
                        <div class="timeline__event__content ">
                            <div class="timeline__event__title">
                                سند تصویر کلی کسب و کار
                            </div>
                            <div class="timeline__event__description">
                                <p id="projectCount"></p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type2">
                        <div class="timeline__event__icon">
                            <i class="lni-burger"></i>
                            <div class="timeline__event__date">
                                21 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                                کارگروه توسعه فرایند های جاری
                            </div>
                            <div class="timeline__event__description">
                                <p id="khobreganCount"></p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type3">
                        <div class="timeline__event__icon">
                            <i class="lni-slim"></i>
                            <div class="timeline__event__date">
                                15 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                                سند نیازمندی ها
                            </div>
                            <div class="timeline__event__description">
                                 <p id="sanadCount"></p>
                            </div>

                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type4">
                        <div class="timeline__event__icon">
                            <i class="lni-cake"></i>
                            <div class="timeline__event__date">
                                51 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                                کمیسیون نظارت بر پروژه های توسعه و فن آوری
                            </div>
                            <div class="timeline__event__description">
                                <p>
                                    <p>
                                        تعداد کل جلسه ها: 84
                                <br />
                                        تعداد درخواست های دارای تاخیر : 34
                                    </p>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type5">
                        <div class="timeline__event__icon">
                            <i class="lni-burger"></i>
                            <div class="timeline__event__date">
                                14 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                              پروپوزال
                            </div>
                            <div class="timeline__event__description">
                                 <p id="proposalCount"></p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type6">
                        <div class="timeline__event__icon">
                            <i class="lni-slim"></i>
                            <div class="timeline__event__date">
                                9 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                              آنالیز قیمت
                            </div>
                            <div class="timeline__event__description">
                                <p>
                                    <p>
                                        تعداد کل جلسه ها: 84
                                <br />
                                        تعداد درخواست های دارای تاخیر : 34
                                    </p>
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type7">
                        <div class="timeline__event__icon">
                            <i class="lni-cake"></i>
                            <div class="timeline__event__date">
                                14 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                                کمیسیون نظارت بر پروژه های توسعه و فن آوری
                            </div>
                            <div class="timeline__event__description">
                                <p>
                                    <p>
                                        تعداد کل جلسه ها: 84
                                <br />
                                        تعداد درخواست های دارای تاخیر : 34
                                    </p>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type8">
                        <div class="timeline__event__icon">
                            <i class="lni-burger"></i>
                            <div class="timeline__event__date">
                                21 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                                کارگروه توسعه فرایند های جاری
                            </div>
                            <div class="timeline__event__description">
                                <p>
                                    تعداد کل جلسه ها: 84
                            <br />
                                    تعداد درخواست های دارای تاخیر : 34
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline__event timeline__event--type9">
                        <div class="timeline__event__icon">
                            <i class="lni-slim"></i>
                            <div class="timeline__event__date">
                                15 روز
                            </div>
                        </div>
                        <div class="timeline__event__content">
                            <div class="timeline__event__title">
                                سند نیازمندی ها
                            </div>
                            <div class="timeline__event__description">
                                <p>
                                    <p>
                                        تعداد کل جلسه ها: 84
                                <br />
                                        تعداد درخواست های دارای تاخیر : 34
                                    </p>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div id='type1' class="typ row">
                    <div class="col1" style="width: 100%">
                        <div class="box-info">
                            <div class="box-info-header type1_main">
                              
                                  <p id="slc_chart-lable"></p>
                              
                                <select id="slc_chart" >
                                   
                                </select>
                            </div>
                            <div class="box-info-body">
                                 <div class='charsts' id="chart_1"></div>
                                 <div class='charsts' id="chart_2"></div>
                                 <div class='charsts' id="chart_3"></div>
                                 <div class='charsts' id="chart_4"></div>
                                 <div class='charsts' id="chart_5"></div> 
                                 <div class='charsts' id="chart_6"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div id='type2' class="typ row">
                    <div class="col1" style="width: 100%">
                        <div class="box-info">
                            <div class="box-info-header type2_main">
                              
                                  <p> جلسات به تفکیک</p>
                              
                               
                            </div>
                            <div class="box-info-body">
                                 <div class='charsts' id="lvl2_chart_1"></div>
                                 <%--<div class='charsts' id="lvl2_chart_2"></div>
                                 <div class='charsts' id="lvl2_chart_3"></div>
                                 <div class='charsts' id="lvl2_chart_4"></div>
                                 <div class='charsts' id="lvl2_chart_5"></div> 
                                 <div class='charsts' id="lvl2_chart_6"></div>--%>
                            </div>

                        </div>
                    </div>
                </div>
                <div id='type3' class="typ row">
                    <div class="col1" style="width: 100%">
                        <div class="box-info">
                            <div class="box-info-header type3_main">
                              
                                  <p> تعداد به تفکیک حالت</p>
                              
                               
                            </div>
                            <div class="box-info-body">
                                 <div class='charsts' id="lvl3_chart_1"></div>
                                 <%--<div class='charsts' id="lvl2_chart_2"></div>
                                 <div class='charsts' id="lvl2_chart_3"></div>
                                 <div class='charsts' id="lvl2_chart_4"></div>
                                 <div class='charsts' id="lvl2_chart_5"></div> 
                                 <div class='charsts' id="lvl2_chart_6"></div>--%>
                            </div>

                        </div>
                    </div>
                </div>
                <div id='type5' class="typ row">
                    <div class="col1" style="width: 100%">
                        <div class="box-info">
                            <div class="box-info-header type5_main">
                              
                                  <p> تعداد به تفکیک وضعیت</p>
                              
                               
                            </div>
                            <div class="box-info-body">
                                 <div class='charsts' id="lvl5_chart_1"></div>
                                 <%--<div class='charsts' id="lvl2_chart_2"></div>
                                 <div class='charsts' id="lvl2_chart_3"></div>
                                 <div class='charsts' id="lvl2_chart_4"></div>
                                 <div class='charsts' id="lvl2_chart_5"></div> 
                                 <div class='charsts' id="lvl2_chart_6"></div>--%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <script>
        var projects = [], vaheds = [], filter = '&$filter=1 eq 1',type='type1';
        
        var project_chart_data=[[],[],[],[],[],[]];
        function setFilter(){
            var year= $('#slct_year').val(),
                peymankar=$('#slct_company').val(),
                vahed=$('#slct_vahed').val();

            var f = '';
            if (year && year != -1)
                f += ' and PersianYearInt eq ' + year;
            if (peymankar && peymankar != -1)
                f += ' and p.prPeymankar eq ' + peymankar;
            if (vahed && vahed != -1)
                f += ' and p.prVahed eq ' + vahed;
            if (f)
                filter += f;
        }
        function getVaheds()
        {
            if (!username)
                window.location.href = 'http://172.22.65.16:1983/';

            var v=  loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/VW_Vahed?$select=infId,infTitle&$filter= prCode eq '" + username + "'");
                vaheds = JSON.parse(v).d.results;
                vaheds.unshift({infId:-1,infTitle:'همه واحد ها',Code:-1});
                var vahedHtml=vaheds.map(a=>(' <option value="'+a.infId+'">'+a.infTitle+'</option>'));
                $('#slct_vahed').html(vahedHtml);
            
        }
        function getData(){
            setFilter();
            switch(type){
                case "type1":
                    getProject();
                    break;
                case "type2":
                    getKhobregan();
                    break;
               
                case "type5":
                    getProposal();
                    break;
            }
        }
        function getProject(){
            if (!username)
                window.location.href = 'http://172.22.65.16:1983/';

            $('.charsts').hide();
            
            $('#chart_1').show();

            var p= loadRestRequest(filter ? "http://172.22.65.16:4581/SqlOData.svc/GetData2/" + username + "/vw_dash2_projects" + filter.replace('&', '?') + "&$sort=p.prId desc " : "http://172.22.65.16:4581/SqlOData.svc/GetData2/" + username + "/vw_dash2_projects");
                projects = JSON.parse(p).d.results;
                $("#projectCount").html("تعداد کل پروژه ها:"+projects.length);
                $('#slc_chart-lable').html('  پروژه ها به تفکیک ');
                $("#slc_chart").show();
                $("#slc_chart").html(` <option value="0" selected>نوع پروژه</option>
                                       <option value="1">واحد متولی</option>
                                       <option value="2">شرکت</option>                               
                                       <option value="3">نوع سند</option>
                                       <option value="4">اولویت</option>`);


                for (var i = 0; i < projects.length; i++) {
                    var itm1=project_chart_data[0].find(a=>a.name===projects[i].prProjectType);
                    if(!itm1){
                        project_chart_data[0].push({name:projects[i].prProjectType,y:1});
                    }
                    else
                        itm1.y+=1;                  
                    ///////////////////////////////////////////////////////////////////////
                    var itm2=project_chart_data[1].find(a=>a.name===projects[i].prVahedTitle);
                    if(!itm2){
                        project_chart_data[1].push({name:projects[i].prVahedTitle,y:1});
                    }
                    else
                        itm2.y+=1;
                    ///////////////////////////////////////////////////////////////////////
                    var itm3=project_chart_data[2].find(a=>a.name===projects[i].prPeymankarTitle);
                    if(!itm3){
                        project_chart_data[2].push({name:projects[i].prPeymankarTitle,y:1});
                    }
                    else
                        itm3.y+=1;
                    ///////////////////////////////////////////////////////////////////////
                    var itm4=project_chart_data[3].find(a=>a.name===projects[i].prSanadTypeTitle);
                    if(!itm4){
                        project_chart_data[3].push({name:projects[i].prSanadTypeTitle,y:1});
                    }
                    else
                        itm4.y+=1;
                    ///////////////////////////////////////////////////////////////////////
                    var itm5=project_chart_data[4].find(a=>a.name===projects[i].prOlaviatTitle);
                    if(!itm5){
                        project_chart_data[4].push({name:projects[i].prOlaviatTitle,y:1});
                    }
                    else
                        itm5.y+=1;
                }

                /////////////////////////////////////////////////////
                //chart_project1
                /////////////////////////////////////////////////////                        
                $('#chart_1').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: { text: ''},
                    tooltip: { pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' , shared: true, useHTML: true},
                    accessibility: {point: {valueSuffix: '%'}},
                    plotOptions: { pie: {dataLabels: {enabled: true,format: '<b>{point.y}</b>', distance: -40,style: {fontWeight: 'bold',color: 'white' }}, showInLegend: true} },                 
                    series: [{
                        type: 'pie',
                        name: '',
                        innerSize: '30%',
                        data: project_chart_data[0]
                    }]
                });
                $('#chart_2').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: { text: ''},
                    tooltip: { pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' , shared: true, useHTML: true},
                    accessibility: {point: {valueSuffix: '%'}},
                    plotOptions: { pie: {dataLabels: {enabled: true,format: '<b>{point.y}</b>', distance: -40,style: {fontWeight: 'bold',color: 'white' }}, showInLegend: true} },                 
                    series: [{
                        type: 'pie',
                        name: '',
                        innerSize: '30%',
                        data: project_chart_data[1]
                    }]
                });
                $('#chart_3').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: { text: ''},
                    tooltip: { pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' , shared: true, useHTML: true},
                    accessibility: {point: {valueSuffix: '%'}},
                    plotOptions: { pie: {dataLabels: {enabled: true,format: '<b>{point.y}</b>', distance: -40,style: {fontWeight: 'bold',color: 'white' }}, showInLegend: true} },                 
                    series: [{
                        type: 'pie',
                        name: '',
                        innerSize: '30%',
                        data: project_chart_data[2]
                    }]
                });
                $('#chart_4').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: { text: ''},
                    tooltip: { pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' , shared: true, useHTML: true},
                    accessibility: {point: {valueSuffix: '%'}},
                    plotOptions: { pie: {dataLabels: {enabled: true,format: '<b>{point.y}</b>', distance: -40,style: {fontWeight: 'bold',color: 'white' }}, showInLegend: true} },                 
                    series: [{
                        type: 'pie',
                        name: '',
                        innerSize: '30%',
                        data: project_chart_data[3]
                    }]
                });
                $('#chart_5').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: { text: ''},
                    tooltip: { pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' , shared: true, useHTML: true},
                    accessibility: {point: {valueSuffix: '%'}},
                    plotOptions: { pie: {dataLabels: {enabled: true,format: '<b>{point.y}</b>', distance: -40,style: {fontWeight: 'bold',color: 'white' }}, showInLegend: true} },                 
                    series: [{
                        type: 'pie',
                        name: '',
                        innerSize: '30%',
                        data: project_chart_data[4]
                    }]
                });
                document.getElementById("loader").style.display = "none";
                document.getElementById("div_main").style.display = "block";
            
        }
        function getKhobregan(){
            if (!username)
                window.location.href = 'http://172.22.65.16:1983/';
          
            
            $('#lvl2_chart_1').show();

            $.when( loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/VW_newDash_khob1?"+filter), 
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/VW_newDash_khob2?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_khob3?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/VW_newDash_khob4?"+filter)
                    ).done(function (r1, r2,r3,r4) {
                       
                        var total=JSON.parse(r1).d.results.map(a=>a.khJalaseDate).filter((item, i, ar) => ar.indexOf(item) === i) ;

                        var rad=JSON.parse(r2).d.results.filter(a=>a.paType==70).length;    
                        var tav=JSON.parse(r2).d.results.filter(a=>a.paType==4).length;
                        var ejra=JSON.parse(r3).d.results.length;
                        var mosavab=JSON.parse(r4).d.results.length;

                        $("#khobreganCount").html("تعداد کل جلسات:"+total.length+"<br/> تعداد کل دستور جلسات مطرح شده: "+(rad+tav+ejra+mosavab));

                        data = [{name:'مصوب',y:mosavab},{name:'رد',y:rad},{name:'توقف',y:tav},{name:'دستور جلسات باقی مانده',y:ejra}];
                        $('#lvl2_chart_1').highcharts({
                            chart: {
                                plotBackgroundColor: null,
                                plotBorderWidth: 0,
                                plotShadow: false
                            },
                            title: { text: ''},
                            tooltip: { pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' , shared: true, useHTML: true},
                            accessibility: {point: {valueSuffix: '%'}},
                            plotOptions: { pie: {dataLabels: {enabled: true,format: '<b>{point.y}</b>', distance: -40,style: {fontWeight: 'bold',color: 'white' }}, showInLegend: true} },                 
                            series: [{
                                type: 'pie',
                                name: '',
                                innerSize: '30%',
                                data: data
                            }]
                        });
                    });
        }
        function getSanad(){
            if (!username)
                window.location.href = 'http://172.22.65.16:1983/';
            $('.charsts').hide();
            
            $('#lvl3_chart_1').show();

            $.when( loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad2?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad1?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad3?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad4?"+filter)
                    ).done(function (r1, r2,r3,r4) {
                       
                        var total=JSON.parse(r1).d.results.length;

                        var ersalshode=JSON.parse(r2).d.results.length;    
                        var montazerErsal=JSON.parse(r3).d.results.length;
                        var xx=JSON.parse(r4).d.results;
                        var montazerPasokh=xx.filter(a=>a.nzStatus==null).length;
                        var montazerEslah=xx.filter(a=>a.nzStatus==196).length;
                        var taeedShode=xx.filter(a=>a.nzStatus==195).length;
                        $("#sanadCount").html("تعداد کل سند نیازمندی های مستلزم ارسال:"+total);

                        data = [ersalshode,montazerErsal,montazerPasokh,montazerEslah,taeedShode];
                        $('#lvl3_chart_1').highcharts({
                            chart: {
                                type: 'column'
                            },
                            title: {
                                text: ''
                            },
                            subtitle: {
                                text: ''
                            },
                            xAxis: {
                                categories: [
                                    'ارسال شده',
                                    'منتظر ارسال',
                                    'منتظر پاسخ',
                                    'منتظر اصلاح',
                                    'تایید شده'
                                ],
                                crosshair: true
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'تعداد سند'
                                }
                            },
                            tooltip: {
                               
                                shared: true,
                                useHTML: true
                            },
                            plotOptions: {
                                column: {
                                    pointPadding: 0.2,
                                    borderWidth: 0
                                }
                            },
                            series: [{
                                name: '',
                                data: data                          
                            }]
                        });
                    });
        }
        function getProposal(){
            if (!username)
                window.location.href = 'http://172.22.65.16:1983/';
            $('.charsts').hide();
            
            $('#lvl5_chart_1').show();

            $.when( loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad2?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad1?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad3?"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/VW_newDash_sanad4?"+filter)
                    ).done(function (r1, r2,r3,r4) {
                       
                        var total=JSON.parse(r1).d.results.length;

                        var ersalshode=JSON.parse(r2).d.results.length;    
                        var montazerErsal=JSON.parse(r3).d.results.length;
                        var xx=JSON.parse(r4).d.results;
                        var montazerPasokh=xx.filter(a=>a.nzStatus==null).length;
                        var montazerEslah=xx.filter(a=>a.nzStatus==196).length;
                        var taeedShode=xx.filter(a=>a.nzStatus==195).length;
                        $("#sanadCount").html("تعداد کل سند نیازمندی های مستلزم ارسال:"+total);

                        data = [ersalshode,montazerErsal,montazerPasokh,montazerEslah,taeedShode];
                        $('#lvl3_chart_1').highcharts({
                            chart: {
                                type: 'column'
                            },
                            title: {
                                text: ''
                            },
                            subtitle: {
                                text: ''
                            },
                            xAxis: {
                                categories: [
                                    'ارسال شده',
                                    'منتظر ارسال',
                                    'منتظر پاسخ',
                                    'منتظر اصلاح',
                                    'تایید شده'
                                ],
                                crosshair: true
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'تعداد سند'
                                }
                            },
                            tooltip: {
                               
                                shared: true,
                                useHTML: true
                            },
                            plotOptions: {
                                column: {
                                    pointPadding: 0.2,
                                    borderWidth: 0
                                }
                            },
                            series: [{
                                name: '',
                                data: data                          
                            }]
                        });
                    });
        }
        $(document).ready(function () {
            $('.typ').css("display","none");
            $('#type1').css("display","block");
            getVaheds();
            //getData(1400);
            getData();
          

            $('#btn_filter').click(function(){
                document.getElementById("loader").style.display = "block";
                document.getElementById("div_main").style.display = "none";
                getData();
            })

            $('.timeline__event').click(function(){
                var x=$(this).attr('class').split('--')[1];
                type=x;

                $('.typ').css("display","none");
                $('#'+x).css("display","block");

                $('.box-info-header').attr('class','box-info-header');
                $('.box-info-header').addClass(x+'_main');
                getData();
            })

            $('#slc_chart').change(function(){
              
                $('.charsts').hide();
                var i=parseInt($(this).val())+1;
                $('#chart_'+i).show();
            })
        });
    </script>

</asp:content>
