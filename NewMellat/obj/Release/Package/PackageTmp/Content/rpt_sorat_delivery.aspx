﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rpt_sorat_delivery.aspx.cs" Inherits="NewMellat.Content.rpt_sorat_delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../assets/DataTables/datatables.min.css" rel="stylesheet" />
    <link href="assets/css/loading.css" rel="stylesheet" />
    <script src="../assets/js/moment.js"></script>
    <style>
        .dataTable {
            overflow-x: scroll;
        }

       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="loader"></div>
    <div style="direction: rtl; text-align: right; margin: 15px;" id="myDiv">
        <h4 class="alert" style="text-align: center; background-color: #DD4B39; color: white;">گزارش اقلام داده تحویلیها و تعهدات قرارداد  </h4>
        <hr />
        <asp:Literal runat="server" ID="lit1"></asp:Literal>
       
        <div class="container" style="margin-top: -20px; display: table;">
            <table id="div1111" class="table table-bordered table-striped" style="width: 95%!important"></table>
        </div>

    </div>

    <script src="../assets/DataTables/datatables.min.js"></script>
    <script>
        $(document).ready(function () {
            getData();

            function showLoading() {
                document.getElementById("loader").style.display = "block";
                document.getElementById("myDiv").style.display = "none";
            }

            function getData() {
                showLoading();
                $.ajax({
                    url: "http://172.22.65.16:4581/SqlOData.svc/GetData2/" + username + "/VW_rpt_soorat_delivery",
                    type: "GET",
                    async: true,
                    headers: {
                        "accept": "application/json;odata=verbose",
                    },
                    success: function (data) {
                        var myData = JSON.parse(data).d.results;
                        for (var i = 0; i < myData.length; i++) {
                         
                            try {
                                myData[i].pishLetterDate = moment(myData[i].pishLetterDate).format('jYYYY/jMM/jDD');
                            } catch (e) {

                            }

                            try {
                                myData[i].approved_date = moment(myData[i].approved_date).format('jYYYY/jMM/jDD');
                            } catch (e) {

                            }
                            try {
                                myData[i].paid_date = moment(myData[i].paid_date).format('jYYYY/jMM/jDD');
                            } catch (e) {

                            }
                            try {
                                var x = myData[i].priceplus / myData[i].contractPrice * 100;
                                if (x && x != Infinity)
                                    myData[i].percent = x.toFixed(2);
                                else
                                    myData[i].percent = "--";
                            } catch (e) {

                            }
                        }
                        $('#div1111').DataTable({
                            data: myData,
                            scrollX: true,
                            "lengthMenu": [[10, 25, 50, 100], [10, 25, 50, 100]],
                            columns: [
                                    { width: "250px", data: 'projectName', title: 'نام پروژه' },
                                    { data: 'contractNo', title: 'شماره قرارداد' },
                                   
                                    { data: 'nazer1', title: 'متولی' },
                                   
                                    { data: 'deliveryTitle', title: 'عنوان تحویلی' },
                                    { data: 'deliveryDate', title: 'موعد تحویل' },
                                    { data: 'deliveryDateReal', title: 'زمان تحویل واقعی' },
                                    { data: 'priceplus', title: 'مبلغ صورتحساب' },
                                    { data: 'empty', title: 'مبلغ دریافت شده' },

                                    { data: 'lastStatus', title: 'وضعیت صورتحساب' },
                                    { data: 'pishLetterDate', title: 'تاریخ ارسال صورتحساب' },
                                    { data: 'approved_date', title: 'تاریخ تایید صورتحساب' },
                                    { data: 'paid_date', title: 'تاریخ وصول صورتحساب' },
                                    { data: 'empty', title: 'تعداد دفعات اصلاح صورتحساب' },
                                    { data: 'percent', title: '% از کل قرارداد' },
                            ],
                            "dom": 'lBfrtip',
                            buttons: [{
                                extend: 'excelHtml5',
                                text: 'Export to Excel',
                                title: 'گزارش اقلام داده تحویلیها و تعهدات قرارداد -' + new Date().toLocaleString().replaceAll('/', '').replaceAll(',', '-').replaceAll(':', '').replaceAll(' ', ''),
                                download: 'open',
                                orientation: 'landscape',
                                exportOptions: {
                                    columns: ':visible'
                                }
                            }],
                            language: {
                                "sEmptyTable": "هیچ داده‌ای در جدول وجود ندارد",
                                "sInfo": "نمایش _START_ تا _END_ از _TOTAL_ ردیف",
                                "sInfoEmpty": "نمایش 0 تا 0 از 0 ردیف",
                                "sInfoFiltered": "(فیلتر شده از _MAX_ ردیف)",
                                "sInfoPostFix": "",
                                "sInfoThousands": ",",
                                "sLengthMenu": "نمایش _MENU_ ردیف",
                                "sLoadingRecords": "در حال بارگزاری...",
                                "sProcessing": "در حال پردازش...",
                                "sSearch": "جستجو:",
                                "sZeroRecords": "رکوردی با این مشخصات پیدا نشد",
                                "oPaginate": {
                                    "sFirst": "برگه‌ی نخست",
                                    "sLast": "برگه‌ی آخر",
                                    "sNext": "بعدی",
                                    "sPrevious": "قبلی"
                                },
                                "oAria": {
                                    "sSortAscending": ": فعال سازی نمایش به صورت صعودی",
                                    "sSortDescending": ": فعال سازی نمایش به صورت نزولی"
                                }
                            }
                        });
                        $('#div1111_wrapper .row .col-md-6').addClass('col-md-4').removeClass('col-md-6');
                        document.getElementById("loader").style.display = "none";
                        document.getElementById("myDiv").style.display = "block";
                    },
                    error: function (error) {
                        alert(JSON.stringify(error));
                        document.getElementById("loader").style.display = "none";
                        document.getElementById("myDiv").style.display = "block";
                    }
                });
            }

        });


        String.prototype.replaceAll = function (search, replacement) {
            var target = this;
            return target.replace(new RegExp(search, 'g'), replacement);
        };

    </script>

</asp:Content>
