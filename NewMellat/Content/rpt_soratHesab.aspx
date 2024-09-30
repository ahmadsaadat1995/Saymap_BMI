<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rpt_soratHesab.aspx.cs" Inherits="NewMellat.Content.rpt_soratHesab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../assets/DataTables/datatables.min.css" rel="stylesheet" />
    <link href="assets/css/loading.css" rel="stylesheet" />
    <script src="../assets/js/moment.js"></script>
    <style>
        .dataTable {
            overflow-x: scroll;
        }

        #div_update {
            margin: 0 auto;
            display: table;
            /* margin-top: -5px; */
            border: solid 2px #DD4B39;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="loader"></div>
    <div style="direction: rtl; text-align: right; margin: 15px;" id="myDiv">
        <h4 class="alert" style="text-align: center; background-color: #DD4B39; color: white;">گزارش صورتحساب ها  </h4>
        <hr />
        <asp:Literal runat="server" ID="lit1"></asp:Literal>
        <div id="div_update">
            <asp:Label ID="Label1" runat="server" Text="داده ها هر روز ساعت 7 و 13 به صورت اتوماتیک به روز رسانی میشوند   " Style="font-weight: 700"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="به روز رسانی فوری" OnClick="btn1_Click" />
        </div>

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
                    url: "http://172.22.65.16:4581/SqlOData.svc/GetData2/" + username + "/rpt_sorathesab",
                    type: "GET",
                    async: true,
                    headers: {
                        "accept": "application/json;odata=verbose",
                    },
                    success: function (data) {
                        var myData = JSON.parse(data).d.results;
                        for (var i = 0; i < myData.length; i++) {
                            try {
                            var deliveryDate = myData[i].deliveryDate ? moment(myData[i].deliveryDate, 'jYYYY/jMM/jDD') : '';


                            var delay = "--";
                            if (myData[i].deliveryDateReal)
                                delay = moment(myData[i].deliveryDateReal, 'jYYYY/jMM/jDD').diff(deliveryDate, 'days');
                            else {
                                if (myData[i].step1 != 1) {
                                    var x = moment().diff(deliveryDate, 'days');
                                    if (x > 0)
                                        delay = x;
                                }
                            }
                            myData[i].delay = delay;
                            } catch (e) {

                            }
                            try {
                                myData[i].letterDate = myData[i].letterDate ? moment(myData[i].letterDate).format('jYYYY/jMM/jDD') : '';
                            } catch (e) {

                            }
                            try {
                                myData[i].pishLetterDate = moment(myData[i].pishLetterDate).format('jYYYY/jMM/jDD');
                            } catch (e) {

                            }

                            myData[i].penalty = myData[i].paDelay == 0 ? 'بدون جریمه' : myData[i].paDelay == 1 ? 'با جریمه' : '';
                        }
                        $('#div1111').DataTable({
                            data: myData,
                            scrollX: true,
                            "lengthMenu": [[10, 25, 50, 100], [10, 25, 50, 100]],
                            columns: [
                                    { width: "250px", data: 'projectName', title: 'نام پروژه' },
                                    { data: 'contractNo', title: 'شماره قرارداد' },
                                    { data: 'startDate', title: 'تاریخ شروع' },
                                    { data: 'endDate', title: 'تاریخ پایان' },
                                    { data: 'nazer1', title: 'ناظر1' },
                                    { data: 'nazer2', title: 'ناظر2' },
                                    { data: 'contractor', title: 'پیمانکار' },
                                    { data: 'contractType', title: 'نوع قرارداد' },
                                    { data: 'contractPrice', title: 'مبلغ' },
                                    { data: 'penalty', title: 'جریمه' },
                                    { data: 'deliveryTitle', title: 'عنوان تحویلی' },
                                    { data: 'deliveryDate', title: 'موعد تحویل' },
                                    { data: 'deliveryDateReal', title: 'موعد تحویل واقعی' },
                                    { data: 'delay', title: 'تاخییر' },
                                    { data: 'mechanism', title: 'مکانیزم' },
                                    { data: 'lastStatus', title: 'آخرین وضعیت' },
                                    { data: 'letterShenase', title: 'شناسه نامه ' },
                                    { data: 'letterDate', title: 'تاریخ نامه' },
                                    { data: 'pishLetterShenase', title: 'شناسه نامه پیش فاکتور' },
                                    { data: 'pishLetterDate', title: 'تاریخ نامه پیش فاکتور' },
                                    { data: 'priceplus', title: 'مبلغ با ارزش افزوده' },
                            ],
                            "dom": 'lBfrtip',
                            buttons: [{
                                extend: 'excelHtml5',
                                text: 'Export to Excel',
                                title: 'گزارش صورت حساب ها -' + new Date().toLocaleString().replaceAll('/', '').replaceAll(',', '-').replaceAll(':', '').replaceAll(' ', ''),
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
