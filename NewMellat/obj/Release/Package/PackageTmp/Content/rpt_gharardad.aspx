<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rpt_gharardad.aspx.cs" Inherits="NewMellat.Content.rpt_gharardad" %>
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
        <h4 class="alert" style="text-align: center; background-color: #DD4B39; color: white;">گزارش لیست اقلام داده قرارداد  </h4>
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
                    url: "http://172.22.65.16:4581/SqlOData.svc/GetData2/" + username + "/VW_rpt_gharardad",
                    type: "GET",
                    async: true,
                    headers: {
                        "accept": "application/json;odata=verbose",
                    },
                    success: function (data) {
                        var myData = JSON.parse(data).d.results;
                        for (var i = 0; i < myData.length; i++) {

                            try {
                                myData[i].totalPrice = myData[i].ghPriceTolid + myData[i].ghPricePosh;
                      
                            } catch (e) {

                            }

                        }
                        $('#div1111').DataTable({
                            data: myData,
                            scrollX: true,
                            "lengthMenu": [[10, 25, 50, 100], [10, 25, 50, 100]],
                            columns: [
                                    { width: "250px", data: 'prTitle', title: 'نام پروژه' },
                                    { data: 'ghCode', title: 'شماره قرارداد' },
                                    { data: 'vahed', title: 'متولی' },

                                    { data: 'tolidSatrtDate', title: 'تاریخ شروع تولید' },
                                    { data: 'tolidEndDate', title: 'تاریخ پایان تولید' },
                                    { data: 'empty', title: 'تاریخ پایان تولید تمدید شده' },
                                    { data: 'tamdidCount', title: 'تعداد دفعات تمدید' },
                                    { data: 'ghPriceTolid', title: 'مبلغ قرارداد تولید' },
                                    { data: 'ghPricePosh', title: 'مبلغ قرارداد پشتیبانی' },
                                    { data: 'totalPrice', title: 'مجموع مبلغ قرارداد' },
                                    { data: 'poshSatrtDate', title: 'تاریخ شروع پشتیبانی' },
                                    { data: 'poshEndDate', title: 'تاریخ پایان پشتیبانی' },
                                    { data: 'empty', title: 'تاریخ شروع تمدید شده پشتیبانی' },
                                    { data: 'empty', title: 'تاریخ پایان تمدید شده پشتیبانی' },
                                    { data: 'PercentComplete', title: 'درصد پیشرفت' },
                                    { data: 'tahviliCount', title: 'تعداد تعهدات و تحویلی ها' },
                                    { data: 'prProjectStatus', title: 'وضعیت اجرایی' },
                                    { data: 'empty', title: 'درصد پیشرفت مالی تایید شده' },
                            ],
                            "dom": 'lBfrtip',
                            buttons: [{
                                extend: 'excelHtml5',
                                text: 'Export to Excel',
                                title: 'گزارش لیست اقلام داده قرارداد -' + new Date().toLocaleString().replaceAll('/', '').replaceAll(',', '-').replaceAll(':', '').replaceAll(' ', ''),
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
