<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="HN_DashReport.aspx.cs" inherits="NewMellat.Content.HN_DashReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/datatables.min.css" />

    <style>
        .cardCommon {
            background-color: #C5C3C3;
            border: solid 2px #DD4B39;
            border-radius: 5px;
            width: 48%;
            float: right;
            margin: 8px;
        }

        .lbl {
            font-weight: bold;
            font-style: italic;
        }

        #btnExport {
            margin-bottom: -49px;
            margin-right: 95%;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:literal runat="server" id="Lit1"></asp:literal>
    <script src="../assets/js/jquery-1.8.2.min.js"></script>
    <script src="../assets/js/datatables.min.js"></script>
    <script src="../assets/js/moment.js"></script>
 
    <div style="direction: rtl; text-align: right; margin: 15px;">
        <h4 class="alert" style="text-align: center; background-color: #DD4B39; color: white;" id="hn_header"></h4>
        <hr />

        <div class="container" style="display: inline">
            <table id="div1111" class="table table-bordered table-striped" style="width: 95%!important"></table>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            for (var i = 0; i < myData.length; i++) {
                myData[i].shMohlat = myData[i].mohlat ? moment(myData[i].mohlat).format('jYYYY/jMM/jDD') : '';
                var diff=myData[i].mohlat?moment().diff(moment(myData[i].mohlat), 'days'):0
                myData[i].diff = diff>0?diff:'---';
            }
            var columns = [
                     { data: 'prTitle', title: 'عنوان پروژه' },
                     { data: 'paShenase', title: 'شناسه نامه ' },
                     { data: 'paDate', title: 'تاریخ نامه ' },
                     { data: 'peymankar', title: 'پیمانکار' },
                     { data: 'vahed', title: 'واحد متولی' }];

            function getParameterByName(name) {
                url = window.location.href;
                name = name.replace(/[\[\]]/g, '\\$&');
                var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                    results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, ' '));
            }
            const enName = getParameterByName('en');
            var pageTitle = '';
            switch (enName) {
                case "HeyatNezarat":
                    pageTitle = "کارگروه توسعه فرآیندهای جاری";
                    break;
                case "commission":
                    pageTitle = "کمیسیون نظارت";
                    break;
                case "AnalyzeTadarokat":
                    pageTitle = "آنالیز قیمت ";
                    break;
                case "GharardadPishnevis":
                    pageTitle = "پیش نویس قرارداد";
                    break;
                case "GharardadEblagh":
                    pageTitle = "ابلاغ قرارداد";
                    break;
                case "SoratTadarokat":
                    pageTitle = "پرداخت مالی";
                    break;

                case "Proposal":
                    pageTitle = "پروپوزال";
                    break;
                case "ProposalEslahi":
                    pageTitle = "پروپوزال اصلاحی";
                    break;
                case "TahvilProje":
                    pageTitle = "تحویل پروژه";
                    break;
                case "SherkatAnswer1":
                    pageTitle = "صورتحساب اصلاحی";
                    break;
                case "SherkatAnswer2":
                    pageTitle = "حسن انجام کار و استرداد تضامین";
                    break;
                case "NazerPorpozal":
                    pageTitle = "پاسخ گویی به پروپوزال";
                    break;
                case "NazerPishnevis":
                    pageTitle = "تایید پیش نویس قرارداد";
                    break;
                case "NazerAnswer1":
                    pageTitle = "پاسخ گویی به وضعیت صورتحساب";
                    break;
                case "NazerAnswer2":
                    pageTitle = "پاسخ گویی به وضعیت حسن انجام کار و تضامین و مفاصا";
                    break;


            }
            $('#hn_header').text(pageTitle);

            if (enName != "HeyatNezarat" && enName != "commission") {
                columns.push({ data: 'shMohlat', title: 'موعد تحویل' });
                columns.push({ data: 'diff', title: 'تاخیر' });
            }
            if (enName == "NazerAnswer2" || enName == "NazerAnswer1" || enName == "SherkatAnswer2" || enName == "SherkatAnswer1") {
                columns.push({ data: 'OnvanTahvili', title: 'عنوان تحویلی' });
              
            }
            $('#div1111').DataTable({
                data: myData,
                "lengthMenu": [[-1, 10, 25, 50], ['همه', 10, 25, 50]],
                columns: columns

                , language: {
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


        });
    </script>
</asp:Content>
