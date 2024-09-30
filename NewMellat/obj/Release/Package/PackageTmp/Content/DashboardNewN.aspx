<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DashboardNewN.aspx.cs" Inherits="NewMellat.Content.DashboardNewN" %>

<%@ Register assembly="DevExpress.XtraCharts.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="/scripts/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/scripts/CommonFunctions-1.0.js"></script>
    <!-- Styles -->
<style>
.chartdiv {
  width: 100%;
  height: 300px;
}

</style>

<!-- Resources -->
<script src="/scripts/amcharts4/core.js"></script>
<script src="/scripts/amcharts4/charts.js"></script>
<script src="/scripts/amcharts4/themes/animated.js"></script>
<script src="/scripts/amcharts4/themes/material.js"></script>

<!-- Chart code -->
<script>
    $(document).ready(function () {
        //am4core.useTheme(am4themes_material);
        am4core.useTheme(am4themes_animated);
        debugger;
        chart1();
        
        chart2();

    }); // end am4core.ready()

    function chart1()
    {
        var res1 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/tbProjects?$select=prId,prTitle,prPeymankar&$filter=prStatus eq 0 and prAct = 1 and prProjectStatus = N'در حال اجرا'")).d.results;
        var res2 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardHeyatNezarat?$select=prId,prTitle,prPeymankar")).d.results;


        // Themes end

        // Create chart instance


        // Themes end

        // Create chart instance
        var chart = am4core.create("chartdiv1", am4charts.XYChart);
        //chart.scrollbarX = new am4core.Scrollbar();
        chart.rtl = true
        // Add data
        chart.data = [{
            "title": "کمیسیون خبرگان",
            "value": res1.length
        }, {
            "title": "کمیسیون نظارت",
            "value": res2.length
        }];
        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "title";
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.renderer.minGridDistance = 30;
        categoryAxis.renderer.labels.template.horizontalCenter = "center";
        categoryAxis.renderer.labels.template.verticalCenter = "bottom";
        //categoryAxis.renderer.labels.template.rotation = 210;
        categoryAxis.tooltip.disabled = true;
        categoryAxis.renderer.minHeight = 110;

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.renderer.minWidth = 50;

        // Create series
        var series = chart.series.push(new am4charts.ColumnSeries());
        series.sequencedInterpolation = true;
        series.dataFields.valueY = "value";
        series.dataFields.categoryX = "title";
        series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
        series.tooltip.rtl = true;
        series.columns.template.strokeWidth = 0;

        series.tooltip.pointerOrientation = "vertical";

        series.columns.template.column.cornerRadiusTopLeft = 10;
        series.columns.template.column.cornerRadiusTopRight = 10;
        series.columns.template.column.fillOpacity = 0.8;

        // on hover, make corner radiuses bigger
        var hoverState = series.columns.template.column.states.create("hover");
        hoverState.properties.cornerRadiusTopLeft = 0;
        hoverState.properties.cornerRadiusTopRight = 0;
        hoverState.properties.fillOpacity = 1;

        series.columns.template.adapter.add("fill", function (fill, target) {
            return chart.colors.getIndex(target.dataItem.index);
        });

        // Cursor
        chart.cursor = new am4charts.XYCursor();
    }
    function chart2()
    {
        var res1 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardAnalyzeTadarokat?$select= Delayed,Count(thId) ItemCount,Sum(Price) Price&$group=Delayed")).d.results;


        var res2 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardGharardadPishnevis?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed")).d.results;

        var res3 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardGharardadEblagh?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed")).d.results;

        var res4 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardSoratTadarokat?$select=Delayed,Count(Id) ItemCount,Sum(Price) Price&$group=Delayed")).d.results;

        // Themes begin
        am4core.useTheme(am4themes_animated);
        // Themes end

        // Create chart instance
        var chart = am4core.create("chartdiv2", am4charts.XYChart);

        // Add data
        chart.data = [{
            "title": "آنالیز قیمت",
            "itemCount": res1.length > 1 ? res1[0].ItemCount : (res1[0].Delayed ==0? res1[0].ItemCount:0),
            "delayedCount": res1.length > 1 ? res1[1].ItemCount : (res1[0].Delayed == 1 ? res1[0].ItemCount : 0),
            
        }, {
            "title": "پیش نویس قرارداد",
            "itemCount": res2.length > 1 ? res2[0].ItemCount : (res2[0].Delayed == 0 ? res2[0].ItemCount : 0),
            "delayedCount": res2.length > 1 ? res2[1].ItemCount : (res2[0].Delayed == 1 ? res2[0].ItemCount : 0),
        }, {
            "title": "ابلاغ قرارداد",
            "itemCount": res3.length > 1 ? res3[0].ItemCount : (res3[0].Delayed == 0 ? res3[0].ItemCount : 0),
            "delayedCount": res3.length > 1 ? res3[1].ItemCount : (res3[0].Delayed == 1 ? res3[0].ItemCount : 0),
        }
        , {
            "title": "پرداخت مالی",
            "itemCount": res4.length > 1 ? res4[0].ItemCount : (res4[0].Delayed == 0 ? res4[0].ItemCount : 0),
            "delayedCount": res4.length > 1 ? res4[1].ItemCount : (res4[0].Delayed == 1 ? res4[0].ItemCount : 0),
        }];

        // Create axes
        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "title";
        categoryAxis.title.text = "اداره کل تدارکات";
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.renderer.minGridDistance = 20;
        categoryAxis.renderer.cellStartLocation = 0.1;
        categoryAxis.renderer.cellEndLocation = 0.9;

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.min = 0;
        valueAxis.title.text = "تعداد";

        // Create series
        function createSeries(field, name, stacked) {
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueY = field;
            series.dataFields.categoryX = "title";
            series.name = name;
            series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
            series.stacked = stacked;
            series.columns.template.width = am4core.percent(95);
            series.tooltip.rtl = true;
        }

        createSeries("itemCount", "تعداد", false);
        createSeries("delayedCount", "تعداد با تاخیر", true);
        

        // Add legend
        chart.legend = new am4charts.Legend();

    }
    function chart3() {
        var res1 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardAnalyzeTadarokat?$select= Delayed,Count(thId) ItemCount,Sum(Price) Price&$group=Delayed")).d.results;


        var res2 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardGharardadPishnevis?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed")).d.results;

        var res3 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardGharardadEblagh?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed")).d.results;

        var res4 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardSoratTadarokat?$select=Delayed,Count(Id) ItemCount,Sum(Price) Price&$group=Delayed")).d.results;

        // Themes begin
        am4core.useTheme(am4themes_animated);
        // Themes end

        // Create chart instance
        var chart = am4core.create("chartdiv2", am4charts.XYChart);

        // Add data
        chart.data = [{
            "title": "آنالیز قیمت",
            "itemCount": res1.length > 1 ? res1[0].ItemCount : (res1[0].Delayed == 0 ? res1[0].ItemCount : 0),
            "delayedCount": res1.length > 1 ? res1[1].ItemCount : (res1[0].Delayed == 1 ? res1[0].ItemCount : 0),

        }, {
            "title": "پیش نویس قرارداد",
            "itemCount": res2.length > 1 ? res2[0].ItemCount : (res2[0].Delayed == 0 ? res2[0].ItemCount : 0),
            "delayedCount": res2.length > 1 ? res2[1].ItemCount : (res2[0].Delayed == 1 ? res2[0].ItemCount : 0),
        }, {
            "title": "ابلاغ قرارداد",
            "itemCount": res3.length > 1 ? res3[0].ItemCount : (res3[0].Delayed == 0 ? res3[0].ItemCount : 0),
            "delayedCount": res3.length > 1 ? res3[1].ItemCount : (res3[0].Delayed == 1 ? res3[0].ItemCount : 0),
        }
        , {
            "title": "پرداخت مالی",
            "itemCount": res4.length > 1 ? res4[0].ItemCount : (res4[0].Delayed == 0 ? res4[0].ItemCount : 0),
            "delayedCount": res4.length > 1 ? res4[1].ItemCount : (res4[0].Delayed == 1 ? res4[0].ItemCount : 0),
        }];

        // Create axes
        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "title";
        categoryAxis.title.text = "";
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.renderer.minGridDistance = 20;
        categoryAxis.renderer.cellStartLocation = 0.1;
        categoryAxis.renderer.cellEndLocation = 0.9;

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.min = 0;
        valueAxis.title.text = "تعداد";

        // Create series
        function createSeries(field, name, stacked) {
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueY = field;
            series.dataFields.categoryX = "title";
            series.name = name;
            series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
            series.stacked = stacked;
            series.columns.template.width = am4core.percent(95);
        }

        createSeries("itemCount", "تعداد", false);
        createSeries("delayedCount", "تعداد با تاخیر", true);


        // Add legend
        chart.legend = new am4charts.Legend();

    }
    function chart4() {
        var res1 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardAnalyzeTadarokat?$select= Delayed,Count(thId) ItemCount,Sum(Price) Price&$group=Delayed")).d.results;


        var res2 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardGharardadPishnevis?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed")).d.results;

        var res3 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardGharardadEblagh?$select=Delayed,Count(ghId) ItemCount,Sum(ghPrice) Price&$group=Delayed")).d.results;

        var res4 = JSON.parse(loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/DashboardSoratTadarokat?$select=Delayed,Count(Id) ItemCount,Sum(Price) Price&$group=Delayed")).d.results;

        // Themes begin
        am4core.useTheme(am4themes_animated);
        // Themes end

        // Create chart instance
        var chart = am4core.create("chartdiv2", am4charts.XYChart);

        // Add data
        chart.data = [{
            "title": "آنالیز قیمت",
            "itemCount": res1.length > 1 ? res1[0].ItemCount : (res1[0].Delayed == 0 ? res1[0].ItemCount : 0),
            "delayedCount": res1.length > 1 ? res1[1].ItemCount : (res1[0].Delayed == 1 ? res1[0].ItemCount : 0),

        }, {
            "title": "پیش نویس قرارداد",
            "itemCount": res2.length > 1 ? res2[0].ItemCount : (res2[0].Delayed == 0 ? res2[0].ItemCount : 0),
            "delayedCount": res2.length > 1 ? res2[1].ItemCount : (res2[0].Delayed == 1 ? res2[0].ItemCount : 0),
        }, {
            "title": "ابلاغ قرارداد",
            "itemCount": res3.length > 1 ? res3[0].ItemCount : (res3[0].Delayed == 0 ? res3[0].ItemCount : 0),
            "delayedCount": res3.length > 1 ? res3[1].ItemCount : (res3[0].Delayed == 1 ? res3[0].ItemCount : 0),
        }
        , {
            "title": "پرداخت مالی",
            "itemCount": res4.length > 1 ? res4[0].ItemCount : (res4[0].Delayed == 0 ? res4[0].ItemCount : 0),
            "delayedCount": res4.length > 1 ? res4[1].ItemCount : (res4[0].Delayed == 1 ? res4[0].ItemCount : 0),
        }];

        // Create axes
        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "title";
        categoryAxis.title.text = "";
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.renderer.minGridDistance = 20;
        categoryAxis.renderer.cellStartLocation = 0.1;
        categoryAxis.renderer.cellEndLocation = 0.9;

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.min = 0;
        valueAxis.title.text = "تعداد";

        // Create series
        function createSeries(field, name, stacked) {
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueY = field;
            series.dataFields.categoryX = "title";
            series.name = name;
            series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
            series.stacked = stacked;
            series.columns.template.width = am4core.percent(95);
        }

        createSeries("itemCount", "تعداد", false);
        createSeries("delayedCount", "تعداد با تاخیر", true);


        // Add legend
        chart.legend = new am4charts.Legend();

    }
</script>

    <div>
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
                                <div >
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceInfo" RightToLeft="True" Width="100%" Font-Names="vazir" Theme="Office2010Silver">
                                        <SettingsBehavior EnableRowHotTrack="True" />
                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="شماره شناسایی پروژه" FieldName="prFinalCode" VisibleIndex="0" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="عنوان پروژه" FieldName="prTitle" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="2">
                                                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="3">
                                                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="4">
                                                <PropertiesComboBox DataSourceID="SqlDataSource1" TextField="infTitle" ValueField="infId">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                        </Columns>
                                        <Styles>
                                            <Header Font-Bold="True" HorizontalAlign="Center">
                                            </Header>
                                            <Row HorizontalAlign="Center">
                                            </Row>
                                            <Cell HorizontalAlign="Center">
                                            </Cell>
                                        </Styles>
                                        <Border BorderStyle="None" />
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT TOP (5) prFinalCode, prTitle, prProjectType, prPeymankar, prVahed FROM tbProjects WHERE (prAct = 1) ORDER BY prId DESC"></asp:SqlDataSource>
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
                    <td   width="50%">  <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title"> اداره کل تدارکات</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div  style="height: 210px" align="center">

                                    <div class="chartdiv" id="chartdiv2"></div>

                                </div>
                            </div>
                        </div>
</td>
                    <td  style="padding-right: 10px" width="50%">  <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">PMO</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div  style="height: 210px" align="center">
                                    <div class="chartdiv" id="chartdiv1"></div>

                                </div>
                            </div>
                        </div>
</td>
                   
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td   width="50%">  <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">بانک</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div  style="height: 210px" align="center">

                                    <div class="chartdiv" id="chartdiv3"></div>

                                </div>
                            </div>
                        </div>
</td>
                    <td  style="padding-right: 10px" width="50%">  <div class="box box-warning">
                            <div class="box-header with-border">
                                <h3 class="box-title">مجموعه هلدینگ</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="box-body no-padding">
                                <div  style="height: 210px" align="center">
                                    <div class="chartdiv" id="chartdiv4"></div>

                                </div>
                            </div>
                        </div>
</td>
                   
                </tr>
            </table>
        </div>













    </div>
</asp:Content>
