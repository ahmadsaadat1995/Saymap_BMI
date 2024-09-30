<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardHN.aspx.cs" Inherits="NewMellat.Content.DashboardHN" MasterPageFile="~/Site2.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../assets/highchart/css/highcharts.css" rel="stylesheet" />
     <link href="assets/css/loading.css" rel="stylesheet" />
    <script src="../assets/highchart/highcharts.js"></script>
    <asp:Literal runat="server" ID="lit1"></asp:Literal>
     <script>
         var data=[],vaheds=[];
         function getData(peymankar,vahed){
             var f='',filter='';
             if(peymankar && peymankar!=-1)
                 f+=' and p.prPeymankar eq '+peymankar;
             if(vahed &&vahed!=-1)
                 f+=' and p.prVahed eq '+vahed;
             if(f)
                 filter='&$filter=1 eq 1'+f;
  if(!username)
window.location.href ='http://172.22.65.16:1983/';
             $.when(
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/VW_Vahed?$select=infId,infTitle&$filter= prCode eq '"+username+"'")   ,

                   loadRestRequest(filter?"http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/vw_dash_table"+filter.replace('&','?')+"&$sort=p.prId desc ": "http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/vw_dash_table?$sort=p.prId desc"), 
                   
                     loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/tbProjects? $select=t.prId,t.prTitle,t.prPeymankar&$filter=t.prStatus eq 0 and t.prAct = 1 and t.prProjectStatus = N'در حال اجرا' "+f),
                     loadRestRequest ("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardHeyatNezarat? $select=t.prId,t.prTitle,t.prPeymankar"+filter),
                    
                     loadRestRequest ("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardAnalyzeTadarokat?$select=Delayed,Count(thId) ItemCount,Sum(Price) Price&$group=Delayed"+filter),
                     loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardGharardadPishnevis?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardGharardadEblagh?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardSoratTadarokat?$select=Delayed,Count(Id) ItemCount,Sum(Price) Price&$group=Delayed"+filter),

                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardSanadNeyazmandi?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardProposal?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardProposalEslahi?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardPortotype?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardTahvilProje?$select=Delayed,Count(*) ItemCount,Sum(Price) Price&$group=Delayed"+filter),
                    loadRestRequest(filter?"http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardSherkatAnswer"+filter.replace('&','?')  :"http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardSherkatAnswer"),
           
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardNazerNeyaz?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardNazerPortotype?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardNazerPorpozal?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardNazerPishnevis?$select=Delayed,Count(*) ItemCount&$group=Delayed"+filter),
                    loadRestRequest(filter?"http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardNazerAnswer"+filter.replace('&','?')  : "http://172.22.65.16:4581/SqlOData.svc/GetData2/"+username+"/DashboardNazerAnswer")

                     ).done(function (v01, v11, v21,v22 ,v31, v32,v33,v34,v41,v42,v43,v44,v45,v46  ,v51, v52,v53,v54,v55 ) {
                         data=[];
                         vaheds= JSON.parse(v01).d.results;
                         data.push({code:'11',data: JSON.parse(v11).d.results});
                         data.push({code:'21',data: JSON.parse(v21).d.results});
                         data.push({code:'22',data: JSON.parse(v22).d.results});
                         data.push({code:'31',data: JSON.parse(v31).d.results});
                         data.push({code:'32',data: JSON.parse(v32).d.results});
                         data.push({code:'33',data: JSON.parse(v33).d.results});
                         data.push({code:'34',data: JSON.parse(v34).d.results});
                         data.push({code:'41',data: JSON.parse(v41).d.results});
                         data.push({code:'42',data: JSON.parse(v42).d.results});
                         data.push({code:'43',data: JSON.parse(v43).d.results});
                         data.push({code:'44',data: JSON.parse(v44).d.results});
                         data.push({code:'45',data: JSON.parse(v45).d.results});
                         data.push({code:'46',data: JSON.parse(v46).d.results});
                         // data.push({code:'47',data: JSON.parse(v47).d.results});
                         data.push({code:'51',data: JSON.parse(v51).d.results});
                         data.push({code:'52',data: JSON.parse(v52).d.results});
                         data.push({code:'53',data: JSON.parse(v53).d.results});
                         data.push({code:'54',data: JSON.parse(v54).d.results});
                         data.push({code:'55',data: JSON.parse(v55).d.results});
                         // data.push({code:'56',data: JSON.parse(v56).d.results});

                         table1();
                         chart1();
                         chart2();
                         chart4();
                         chart3();
   document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
                     });
         }

         
         $(document).ready(function () {
             getData();
             vaheds.unshift({infId:-1,infTitle:'همه واحد ها',Code:-1});
             var vahedHtml=vaheds.map(a=>(' <option value="'+a.infId+'">'+a.infTitle+'</option>'));
             $('#slct_vahed').html(vahedHtml);
             $('#btn_filter').click(function(){
document.getElementById("loader").style.display = "block";
  document.getElementById("myDiv").style.display = "none";
                 getData($('#slct_company').val(),$('#slct_vahed').val())
               
             })

             Highcharts.setOptions({
                 lang: {
                     decimalPoint: '.',
                     thousandsSep: ','
                 }
             });

         });
         function table1() {
             var res = data.find(a=>a.code==11).data.slice(0,5);
             
             var html = '';
             for (var i = 0; i < res.length; i++) {
                 
                html+=`<tr><td>${res[i].prFinalCode}</td><td>${res[i].prTitle}</td><td>${res[i].prProjectType}</td><td>${res[i].prPeymankarTitle}</td><td>${res[i].prVahedTitle}</td></tr>`; 
             }
             $('#tblproject tbody').html(html);
         }
         function chart1() {
             var res1 = data.find(a=>a.code==21).data;
           
             
             var res2 = data.find(a=>a.code==22).data;
//var URLs={'0':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=KhobreganPending&tab=1',
//	  '1':'http://172.22.65.16:1983/content/PageHeyatNezarat.aspx'};
           
             var URLs={'0':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=commission&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
                 '1':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=HeyatNezarat&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val()}
            
             Highcharts.chart('chart1', {
                 chart: {
                    type: 'column',
 	
                 },
                 title: {
                     text: ''
                 },
                 subtitle: {
                     text: ''
                 },
                 xAxis: {
                     type: 'category',
                     labels: {
                         rotation: 0,
                         style: {
                             fontSize: '11px',
                             fontFamily: 'B Titr'
                         }
                     }
                 },
                 yAxis: {
                     min: 0,
                     title: {
                         text: 'تعداد جلسات'
                     }
                 },
 plotOptions: {
        series: {
            cursor: 'pointer',
            point: {
                events: {
                    click: function () {
                       // alert('Category: ' + this.category + ', value: ' + this.y);
			var URL=URLs[this.category];
			if(URL)
				window.open(URL, '_blank');
                    }
                }
            }
        }
    },
                 legend: {
                     enabled: false
                 },
                 tooltip: {
                     enabled:false
                     //  pointFormat: 'Population in 2017: <b>{point.y:.1f} millions</b>'
                 },
                 series: [{
                     name: 'تعداد',
                     data: [
                        ['کارگروه توسعه فرآیندهای جاری', res1.length],
                         ['کمیسیون نظارت', res2.length]
                     ],
                     color:'#890989',
                     dataLabels: {
                         enabled: true,
                         rotation: 0,
                         color: '#FFFFFF',
                         inside:true,
                         format: '{point.y:.0f}', // one decimal
                         y: 10, // 10 pixels down from the top
                         style: {
                             fontSize: '13px',
                             fontFamily: 'B Titr'
                         }
                     }
                 }]
             });



         }      
         function chart2()
         {
             var res1 = data.find(a=>a.code==31).data;
             var res2 = data.find(a=>a.code==32).data;
             var res3 =  data.find(a=>a.code==33).data;
             var res4 = data.find(a=>a.code==34).data;
            
             res1Delayed=res1.find(a=>a.Delayed==1);
             res1NotDelayed=res1.find(a=>a.Delayed==0);

             res2Delayed=res2.find(a=>a.Delayed==1);
             res2NotDelayed=res2.find(a=>a.Delayed==0);

             res3Delayed=res3.find(a=>a.Delayed==1);
             res3NotDelayed=res3.find(a=>a.Delayed==0);

             res4Delayed=res4.find(a=>a.Delayed==1);
             res4NotDelayed=res4.find(a=>a.Delayed==0);

	//var URLs={'0':'http://172.22.65.16:1983/content/PageEstelamStep6.aspx',
	// 	  '1':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=WaitingPishnevis&tab=2',
	//	  '2':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=GharardadEblagh&tab=2',
	//	  '3':'http://172.22.65.16:1983/content/PageSooratMali.aspx'};
             var URLs={'0':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=AnalyzeTadarokat&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
                 '1':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=GharardadPishnevis&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
                 '2':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=GharardadEblagh&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
                 '3':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=SoratTadarokat&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val()}
          
 var nbItems= {"آنالیز قیمت":res1Delayed?res1Delayed.Price.toLocaleString():0,
                 //"پیش نویس قرارداد":res2Delayed?res2Delayed.Price.toLocaleString():0,
                 //  "ابلاغ قرارداد":res3Delayed?res3Delayed.Price.toLocaleString():0,
                 "پرداخت مالی":res4Delayed?res4Delayed.Price.toLocaleString():0};
            
             Highcharts.chart('chartdiv2', {
                 chart: {
                     type: 'column'
                 },
                 title: {
                     text: ''
                 },
                //  colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],
                 xAxis: {
                     categories: [ "آنالیز قیمت","پیش نویس قرارداد","ابلاغ قرارداد", "پرداخت مالی"],
                     labels: {
                         rotation: 0,
                         style: {
                             fontSize: '11px',
                             fontFamily: 'B Titr'
                         }
                     }
                
                 },
                 yAxis: {
                     min: 0,
                     title: {
                         text: 'تعداد'
                     },
                     style: {
                         fontSize: '11px',
                         fontFamily: 'B Titr'
                     },
                     stackLabels: {
                         enabled: true,
                         style: {
                             fontSize: '13px',
                             fontFamily: 'B Titr',
                             fontWeight: 'bold',
                             color: ( // theme
                                 Highcharts.defaultOptions.title.style &&
                                 Highcharts.defaultOptions.title.style.color
                             ) || 'gray'
                         }
                     }
                 },
                 legend: {
                     layout: 'horizontal',
  itemStyle: {
fontSize: '12px',
                            fontFamily: 'B Titr'
},
                     align: 'center',
                     verticalAlign: 'bottom',
                 },
                 tooltip: {
                     formatter: function() {
                         if(nbItems[this.x])
                            return'<b>جمع مبلغ دارای تاخیر </b> <br/><center>' + nbItems[this.x]+"</center>";
                         else return false;
                     },
                     shared: true,
                     useHTML: true
                 },
                 plotOptions: {
                     column: {
                         stacking: 'normal',
                         dataLabels: {
                             enabled: true,
                             fontSize: '13px',
                             fontFamily: 'B Titr',
                         }
                    },
		   series: {
           		 cursor: 'pointer',
            			point: {
             		   events: {
                  	  click: function () {
                       // alert('Category: ' + this.category + ', value: ' + this.y);
			var URL=URLs[this.x];
			if(URL)
				window.open(URL, '_blank');
                    }
                }
            }
                     }
                 },
                 series: [{
                     name: 'سر رسید نشده',
                     dataLabels: {
                         enabled: true,
                       
                         color: '#FFFFFF',
                         inside:true,
                         format: '{point.y:.0f}', // one decimal
                         //  y: 10, // 10 pixels down from the top
                         style: {
                             fontSize: '13px',
                             fontFamily: 'B Titr'
                         }
                     },
                     data:[res1NotDelayed?res1NotDelayed.ItemCount:0,
                           res2NotDelayed?res2NotDelayed.ItemCount:0,
                           res3NotDelayed?res3NotDelayed.ItemCount:0,
                           res4NotDelayed?res4NotDelayed.ItemCount:0],
color:'#cdfd35',
                 }, {
                     name: 'دارای تاخیر',
                     dataLabels: {
                         enabled: true,
                       
                         color: '#FFFFFF',
                         inside:true,
                         format: '{point.y:.0f}', // one decimal
                         //  y: 10, // 10 pixels down from the top
                         style: {
                             fontSize: '13px',
                             fontFamily: 'B Titr'
                         }
                     },
                     data:[res1Delayed?res1Delayed.ItemCount:0,
                         res2Delayed?res2Delayed.ItemCount:0,
                         res3Delayed?res3Delayed.ItemCount:0,
                         res4Delayed?res4Delayed.ItemCount:0]
                
               ,color:'#cc0099'
                 }]
             });
         }
         function chart4()
         {
             var res1 = data.find(a=>a.code==41).data;
             var res2 = data.find(a=>a.code==42).data;
             var res3 = data.find(a=>a.code==43).data;
             var res4 = data.find(a=>a.code==44).data;
             var res5 = data.find(a=>a.code==45).data;
             var res7Tmp=[],res6Tmp=[],res7=[],res6=[];
             data.find(a=>a.code==46).data.forEach(a=>{
                 a.Price=parseFloat(a.Price);
            if(a.Gharardad=='استرداد-تضامین' || a.Gharardad=='استرداد-حسن انجام کار'||a.Gharardad=='استرداد-مفصا حساب')
             {   res7Tmp.push(a);}
         else
         {  res6Tmp.push(a);}
         });
            
         var sumDelayed=0,sum=0,countDelayed=0,count=0;
         res7Tmp.forEach(a=>{
             if(a.Delayed==0){
                 sum+=a.Price; 
         count+=1;
         }
         else{
             sumDelayed+=a.Price;
             countDelayed+=1;
         }
         });
         res7.push({Delayed:0,ItemCount:count,Price:sum});
         res7.push({Delayed:1,ItemCount:countDelayed,Price:sumDelayed});
        
         sumDelayed=0,sum=0,countDelayed=0,count=0;
         res6Tmp.forEach(a=>{
             if(a.Delayed==0){
                 sum+=a.Price; 
         count+=1;
         }
         else{
             sumDelayed+=a.Price;
             countDelayed+=1;
         }
         });
         res6.push({Delayed:0,ItemCount:count,Price:sum});
         res6.push({Delayed:1,ItemCount:countDelayed,Price:sumDelayed});


         res1Delayed=res1.find(a=>a.Delayed==1);
         res1NotDelayed=res1.find(a=>a.Delayed==0);

         res2Delayed=res2.find(a=>a.Delayed==1);
         res2NotDelayed=res2.find(a=>a.Delayed==0);

         res3Delayed=res3.find(a=>a.Delayed==1);
         res3NotDelayed=res3.find(a=>a.Delayed==0);

         res4Delayed=res4.find(a=>a.Delayed==1);
         res4NotDelayed=res4.find(a=>a.Delayed==0);

         res5Delayed=res5.find(a=>a.Delayed==1);
         res5NotDelayed=res5.find(a=>a.Delayed==0);

         res6Delayed=res6.find(a=>a.Delayed==1);
         res6NotDelayed=res6.find(a=>a.Delayed==0);

         res7Delayed=res7.find(a=>a.Delayed==1);
         res7NotDelayed=res7.find(a=>a.Delayed==0);

		//var URLs={'1':'http://172.22.65.16:1983/content/PageEstelamStep4.aspx',
	 	//  '3':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=SooratHesabWaitAnswerCompany&tab=2',
		//  '4':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=SooratHesabWaitAnswerCompany&tab=2'};
         var URLs={'0':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=Proposal&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
             '1':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=ProposalEslahi&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
             '2':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=TahvilProje&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
             '3':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=SherkatAnswer1&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
             '4':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=SherkatAnswer2&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val()}
         var nbItems= {
             //  "تحویل پروژه":res5Delayed?res5Delayed.Price.toLocaleString():0,
             "صورتحساب اصلاحی":res6Delayed?res6Delayed.Price.toLocaleString():0,
             "حسن انجام کار و استرداد تضامین":res7Delayed?res7Delayed.Price.toLocaleString():0};
            
         Highcharts.chart('chartdiv4', {
             chart: {
                 type: 'column'
             },
             title: {
                 text: ''
             },
 
             xAxis: {
                //    categories: ["سند نیازمندی ها",  "پروپوزال","پروپوزال اصلاحی", "پروتوتایپ","تحویل پروژه","صورتحساب اصلاحی","حسن انجام کار و استرداد تضامین"],
 categories: [  "پروپوزال","پروپوزال اصلاحی","تحویل پروژه","صورتحساب اصلاحی","حسن انجام کار و استرداد تضامین"],
                 labels:{
 
             rotation: 0,
             shared: true,
             useHTML: true,
             style: {
     
                         textOverflow: 'allow',
                         width:'110px',
                         fontSize: '11px',
                         fontFamily: 'B Titr',
  
                         }
	
                 }
                
         },
         yAxis: {
                 min: 0,
                 title: {
                 text: 'تعداد'
                 },
             stackLabels: {
                     enabled: true,
                     style: {
                     fontSize: '13px',
                     fontFamily: 'B Titr',
                     fontWeight: 'bold',
                     color: ( // theme
                         Highcharts.defaultOptions.title.style &&
                         Highcharts.defaultOptions.title.style.color
                     ) || 'gray'
                     }
             }
         },
         legend: {
                 layout: 'horizontal',
 itemStyle: {
fontSize: '12px',
                            fontFamily: 'B Titr'
},
                 align: 'center',
                 verticalAlign: 'bottom',
                 },
         tooltip: {
                 formatter: function() {
                     if(nbItems[this.x])
                       		 return '<b>جمع مبلغ دارای تاخیر </b> <br/><center>' + nbItems[this.x]+"</center>";
                     else return false;
            
                 },
                 shared: true,
                 useHTML: true
         },
         plotOptions: {
                 column: {
                     stacking: 'normal',
                     dataLabels: {
                         enabled: true
                     }
                    },
		   series: {
           		 cursor: 'pointer',
            			point: {
             		   events: {
                  	  click: function () {
                       // alert('Category: ' + this.category + ', value: ' + this.y);
			var URL=URLs[this.x];
			if(URL)
				window.open(URL, '_blank');
                    }
                }
            }
                 }
         },
         series: [{
             name: 'سر رسید نشده',
             dataLabels: {
                 enabled: true,
                       
                 color: '#FFFFFF',
                 inside:true,
                 format: '{point.y:.0f}', // one decimal
                 //  y: 10, // 10 pixels down from the top
                 style: {
                     fontSize: '13px',
                     fontFamily: 'B Titr'
                 }
             },
                    data:[//res1NotDelayed?res1NotDelayed.ItemCount:0,
                   res2NotDelayed?res2NotDelayed.ItemCount:0,
                   res3NotDelayed?res3NotDelayed.ItemCount:0,
                         // res4NotDelayed?res4NotDelayed.ItemCount:0,
                   res5NotDelayed?res5NotDelayed.ItemCount:0,
                   res6NotDelayed?res6NotDelayed.ItemCount:0,
                   res7NotDelayed?res7NotDelayed.ItemCount:0],
color:'#cdfd35',
         }, {
             name: 'دارای تاخیر',
             dataLabels: {
                 enabled: true,
                       
                 color: '#FFFFFF',
                 inside:true,
                 format: '{point.y:.0f}', // one decimal
                 //  y: 10, // 10 pixels down from the top
                 style: {
                     fontSize: '13px',
                     fontFamily: 'B Titr'
                 }
             },
                    data:[//res1Delayed?res1Delayed.ItemCount:0,
                   res2Delayed?res2Delayed.ItemCount:0,
                   res3Delayed?res3Delayed.ItemCount:0,
                         // res4Delayed?res4Delayed.ItemCount:0,
                   res5Delayed?res5Delayed.ItemCount:0,
                   res6Delayed?res6Delayed.ItemCount:0,
                   res7Delayed?res7Delayed.ItemCount:0]
                   
               ,color:'#cc0099'
         }]
         });
         }
         function chart3()
         {
             var res1 = data.find(a=>a.code==51).data;
             var res2 = data.find(a=>a.code==52).data;
             var res3 = data.find(a=>a.code==53).data;
             var res4 = data.find(a=>a.code==54).data;
             var res5Tmp=[],res6Tmp=[],res5=[],res6=[];
             data.find(a=>a.code==55).data.forEach(a=>{
                 a.Price=parseFloat(a.Price);
            if(a.Gharardad=='استرداد-تضامین' || a.Gharardad=='استرداد-حسن انجام کار'||a.Gharardad=='استرداد-مفصا حساب')
             {   res6Tmp.push(a);}
         else
         {  res5Tmp.push(a);}
         });
            
         var sumDelayed=0,sum=0,countDelayed=0,count=0;
         res5Tmp.forEach(a=>{
             if(a.Delayed==0){
                 sum+=a.Price; 
         count+=1;
         }
         else{
             sumDelayed+=a.Price;
             countDelayed+=1;
         }
         });
         res5.push({Delayed:0,ItemCount:count,Price:sum});
         res5.push({Delayed:1,ItemCount:countDelayed,Price:sumDelayed});
        
         sumDelayed=0,sum=0,countDelayed=0,count=0;
         res6Tmp.forEach(a=>{
             if(a.Delayed==0){
                 sum+=a.Price; 
         count+=1;
         }
         else{
             sumDelayed+=a.Price;
             countDelayed+=1;
         }
         });
         res6.push({Delayed:0,ItemCount:count,Price:sum});
         res6.push({Delayed:1,ItemCount:countDelayed,Price:sumDelayed});
           

         res1Delayed=res1.find(a=>a.Delayed==1);
         res1NotDelayed=res1.find(a=>a.Delayed==0);

         res2Delayed=res2.find(a=>a.Delayed==1);
         res2NotDelayed=res2.find(a=>a.Delayed==0);

         res3Delayed=res3.find(a=>a.Delayed==1);
         res3NotDelayed=res3.find(a=>a.Delayed==0);

         res4Delayed=res4.find(a=>a.Delayed==1);
         res4NotDelayed=res4.find(a=>a.Delayed==0);

         res5Delayed=res5.find(a=>a.Delayed==1);
         res5NotDelayed=res5.find(a=>a.Delayed==0);

         res6Delayed=res6.find(a=>a.Delayed==1);
         res6NotDelayed=res6.find(a=>a.Delayed==0);

	//var URLs={'0':'http://172.22.65.16:1983/content/PageEstelamStep2.aspx',
	// 	  '1':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=WaitingEstelamAnswers&tab=2',
	//	  '2':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=SooratHesabWaitAnswerNazer&tab=2',
         //	  '3':'http://172.22.65.16:1983/Content/Reports/ReportLoader.aspx?act=SooratHesabWaitAnswerNazer&tab=2'};

         var URLs={'0':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=NazerPorpozal&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
             '1':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=NazerPishnevis&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
             '2':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=NazerAnswer1&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val(),
             '3':'http://172.22.65.16:1983/content/HN_DashReport.aspx?en=NazerAnswer2&f1='+ $('#slct_company').val()+'&f2='+$('#slct_vahed').val()}
         var nbItems= {
             "پاسخ گویی به وضعیت صورتحساب":res5Delayed?res5Delayed.Price.toLocaleString():0,
                "پاسخ گویی به وضعیت حسن انجام کار و تضامین و مفاصا":res6Delayed?res6Delayed.Price.toLocaleString():0};
            
         Highcharts.chart('chartdiv3', {
             chart: {
                 type: 'column'
             },
             title: {
                 text: ''
             },

             xAxis: {
                   // categories: ["پاسخ گویی به سند نیازمندی ها", "پاسخ گویی به پروتوتایپ","پاسخ گویی به پروپوزال","تایید پیش نویس قرارداد","پاسخ گویی به وضعیت صورتحساب","پاسخ گویی به وضعیت حسن انجام کار و تضامین و مفاصا"],
 categories: ["پاسخ گویی به پروپوزال","تایید پیش نویس قرارداد","پاسخ گویی به وضعیت صورتحساب","پاسخ گویی به وضعیت حسن انجام کار و تضامین و مفاصا"],
                 labels:{
             rotation: 0,
             shared: true,
             useHTML: true,
             style: {
     
                         textOverflow: 'allow',
                         width:'110px',
                         fontSize: '11px',
                         fontFamily: 'B Titr',
                         }
                 } 
         },
         yAxis: {
                 min: 0,
                 title: {
                 text: 'تعداد'
                 },
             stackLabels: {
                     enabled: true,
                     style: {
                     fontSize: '13px',
                     fontFamily: 'B Titr',
                     fontWeight: 'bold',
                     color: ( // theme
                         Highcharts.defaultOptions.title.style &&
                         Highcharts.defaultOptions.title.style.color
                     ) || 'gray'
                     }
             }
         },
         legend: {
                 layout: 'horizontal',
 itemStyle: {
fontSize: '12px',
                            fontFamily: 'B Titr'
},
                 align: 'center',
                 verticalAlign: 'bottom',
  
                 },
         tooltip: {
                 formatter: function() {
                     if(nbItems[this.x])
                            return'<b>جمع مبلغ دارای تاخیر </b> <br/><center>' + nbItems[this.x]+"</center>";
                     else return false;
                 },
                 shared: true,
                 useHTML: true
         },
         plotOptions: {
                 column: {
                     stacking: 'normal',
                     dataLabels: {
                         enabled: true
                     }
                    },
		   series: {
           		 cursor: 'pointer',
            			point: {
             		   events: {
                  	  click: function () {
                       // alert('Category: ' + this.category + ', value: ' + this.y);
			var URL=URLs[this.x];
			if(URL)
				window.open(URL, '_blank');
                    }
                }
            }
                 }
         },
         series: [{
             name: 'سر رسید نشده',
             dataLabels: {
                 enabled: true,
                       
                 color: '#FFFFFF',
                 inside:true,
                 format: '{point.y:.0f}', // one decimal
                 //  y: 10, // 10 pixels down from the top
                 style: {
                     fontSize: '13px',
                     fontFamily: 'B Titr'
                 }
             },
                    data:[//res1NotDelayed?res1NotDelayed.ItemCount:0,
                          //res2NotDelayed?res2NotDelayed.ItemCount:0,
                   res3NotDelayed?res3NotDelayed.ItemCount:0,
                   res4NotDelayed?res4NotDelayed.ItemCount:0,
                   res5NotDelayed?res5NotDelayed.ItemCount:0,
                   res6NotDelayed?res6NotDelayed.ItemCount:0],
color:'#cdfd35',
         }, {
             name: 'دارای تاخیر',
             dataLabels: {
                 enabled: true,
                       
                 color: '#FFFFFF',
                 inside:true,
                 format: '{point.y:.0f}', // one decimal
                 //  y: 10, // 10 pixels down from the top
                 style: {
                     fontSize: '13px',
                     fontFamily: 'B Titr'
                 }
             },
                    data:[//res1Delayed?res1Delayed.ItemCount:0,
                          //res2Delayed?res2Delayed.ItemCount:0,
                   res3Delayed?res3Delayed.ItemCount:0,
                   res4Delayed?res4Delayed.ItemCount:0,
                   res5Delayed?res5Delayed.ItemCount:0,
                   res6Delayed?res6Delayed.ItemCount:0]
                   
               ,color:'#cc0099'
         }]
         });
         }
    </script>

<div id="loader"></div>

    <div style="display:none;" id="myDiv" class="animate-bottom">

        <div>
          <table align="right" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <div class="box box-info">
                            <div class="box-header with-border">

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div style="text-align: center;font-size: 16px;margin: 10px;">
                                    <span> واحد سازمانی : </span>
                                    <select id="slct_vahed" style="width: 300px;"></select>
                                     <span> شرکت : </span>
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
                                    <input type="button" value="اعمال فیلتر" id="btn_filter"/>
                                </div>
                            </div>
                         </div>
                    </td>
                 </tr>
              </table>
   </div>
        
        <div>
            <table align="right" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <div class="box box-success">
                            <div class="box-header with-border">
                                <h3 class="box-title">جدید ترین درخواست ها</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div>
                                    <table class="table table-bordered" id="tblproject">
                                        <thead>
                                            <tr>
                                                <th>شماره شناسایی پروژه</th>
                                                <th>عنوان پروژه</th>
                                                <th>نوع پروژه</th>
                                                <th>پیمانکار</th>
                                                <th>واحد متولی</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>


                    </td>

                </tr>
            </table>
        </div>


        <div>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="50%">
                        <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">اداره کل تدارکات</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div align="center">

                                    <div class="chartdiv" id="chartdiv2" style="height: 210px"></div>

                                </div>
                            </div>
                        </div>
                    </td>
                    <td style="padding-right: 10px" width="50%">
                        <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">PMO</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div align="center">
                                    <div class="chartdiv" id="chart1" style="height: 210px"></div>

                                </div>
                            </div>
                        </div>
                    </td>

                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="50%">
                        <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">ناظرین پروژه ها</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div align="center">

                                    <div class="chartdiv" id="chartdiv3" style="height: 210px"></div>

                                </div>
                            </div>
                        </div>
                    </td>
                    <td style="padding-right: 10px" width="50%">
                        <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">مجموعه هلدینگ</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div  align="center">
                                    <div class="chartdiv" id="chartdiv4" style="height: 210px"></div>

                                </div>
                            </div>
                        </div>
                    </td>

                </tr>
            </table>
        </div>

    </div>

</asp:Content>
