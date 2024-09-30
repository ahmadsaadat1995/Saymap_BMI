<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rpt_hosnVaTazamin.aspx.cs" Inherits="NewMellat.Content.rpt_hosnVaTazamin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../assets/DataTables/datatables.min.css" rel="stylesheet" />
   
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
     <div style="direction: rtl; text-align: right; margin: 15px;" id="myDiv">
        <h4 class="alert" style="text-align: center; background-color: #DD4B39; color: white;">گزارش حسن و تضامین  </h4>
        <hr />
        <asp:Literal runat="server" ID="lit1"></asp:Literal>
        

        <div class="container" style="margin-top: -20px; display: table;width: 95%;">
            <table id="div1111" class="table table-bordered table-striped" style="width: 95%!important;    float: right;"></table>
        </div>
          </div>

       <script src="../assets/DataTables/datatables.min.js"></script>
    <script>
        $(document).ready(function () {
            getData();

            function getData() {

                $.ajax({
                    url: "http://172.22.65.16:4581/SqlOData.svc/GetDataFromSP/" + username + "/dash_Hosn_tazamin",
                    type: "GET",
                    async: true,
                    headers: {
                        "accept": "application/json;odata=verbose",
                    },
                    success: function (data) {
                        var myData = JSON.parse(data).d.results;
                        //debugger;
                        for (var i = 0; i < myData.length; i++) {
                            myData[i].hosn = myData[i].hosn_count == 0 ? 'ندارد' : 'دارد';
                            myData[i].tazamin = myData[i].tazamin_count == 0 ? 'ندارد' : 'دارد';
                            //  var startDate = myData[i].startDate ? moment(myData[i].startDate, 'jYYYY/jMM/jDD') : '';
                            //  var endDate = myData[i].endDate ? moment(myData[i].endDate, 'jYYYY/jMM/jDD') : '';

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

                                    { data: 'hosn', title: 'استرداد حسن انجام کار' },
                                    { data: 'tazamin', title: 'استرداد تضامین' },
                            ],
                            "dom": 'lBfrtip',
                            buttons: [{
                                extend: 'excelHtml5',
                                text: 'Export to Excel',
                                title: 'گزارش حسن و تضامین -' + new Date().toLocaleString().replaceAll('/', '').replaceAll(',', '-').replaceAll(':', '').replaceAll(' ', ''),
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
                        //   $('#div1111_wrapper .row .col-md-6').addClass('col-md-4').removeClass('col-md-6');
                        //    document.getElementById("loader").style.display = "none";
                        document.getElementById("myDiv").style.display = "block";
                    },
                    error: function (error) {
                        alert(JSON.stringify(error));
                        //    document.getElementById("loader").style.display = "none";
                        //   document.getElementById("myDiv").style.display = "block";
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