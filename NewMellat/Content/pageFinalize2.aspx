<%@ page language="C#" autoeventwireup="true" codebehind="pageFinalize2.aspx.cs" inherits="NewMellat.Content.pageFinalize2" %>

<%@ register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />

    <style>
        .cardCommon {
            background-color: #C5C3C3;
            border:solid 2px #DD4B39;
            border-radius:5px;
            width: 48%; 
            float: right; 
            margin: 8px;
        }
        .lbl {
        font-weight: bold;
    font-style: italic;
        }
    </style>
</head>
<body>

    <script src="../assets/js/jquery-1.8.2.min.js"></script>
    <script>
        $(document).ready(function () {
            var html = '';
            for (var i = 0; i < myData.length; i++) {
                var gh=""
                if(myData[i].ghCode&&myData[i].ghCode!='null'&&myData[i].ghCode!=null)
                    gh=`<a target="_blank" href="/Content/PageAttach.aspx?Parent=${myData[i].prId}&Type=8">${myData[i].ghCode}
                <img src="/Content/images/icons/attachment-icon24.png" alt="فایل قرارداد" height="36" width="36"/>
              </a>`;

                html+=`<div id="cardDiv${myData[i].prId}" class="card cardCommon" >
        <div class="card-body">
            
            <input type="hidden" id="hid${myData[i].prId}" value="${myData[i].prVahed}">
            <div class="card-text">
                 <div class="form-row">
                    <div class="form-group col-10">
                    <h5 class="card-title" style="min-height: 50px;">${myData[i].prTitle}</h5>
                    </div>
                  <div class="form-group col-2">
                    ${gh}
                </div>
                 
                </div>
        <div class="form-row">
                <div class="form-group col-4">
                  <label class="lbl">واحد متولی : </label>
                    <label>${myData[i].vahedTitle}</label>
                </div>
              <div class="form-group col-4">
                  <label class="lbl">ناظر فنی : </label>
                    <label>${myData[i].TechnicalSuvisorTitle}</label>
                </div>
              <div class="form-group col-4">
                  <label class="lbl">شرکت پیمانکار : </label>
                    <label>${myData[i].peymankarTitle}</label>
                </div>
                
                </div>
   <div class="form-row">
                <div class="form-group col-4">
                <label class="lbl">شناسه نامه : </label>
                    <label>${myData[i].paNumber}</label>
                </div>
</div>
   <hr style='border: 1px solid red; width:85%'>
            <div class="form-row">
                <div class="form-group col-7">
                    <label class="lbl"> آیا سامانه درحال حاضر مورد استفاده قرار می گیرد؟</label>
                    <select id="useSelect${myData[i].prId}" class="form-control">
                        <option value="1" selected>بله</option>
                        <option value="0">خیر</option>
                    </select>
                </div>
                             <div class="form-group col-5">
                    <label class="lbl">تعداد کاربران</label>
                    <input type="number" class="form-control" id="userCount${myData[i].prId}" style="margin-top: 25px!important" />
                </div>
            </div>
               

            <div class="form-row">
                <div class="form-group col-12">
                    <label class="lbl">توضیح در مورد سامانه</label>

                    <textarea class="form-control" id="description${myData[i].prId}"></textarea>
                </div>
            </div>
        </div>
<center>
        <input type="button" class="btn" style="background-color:#DD4B39;color: white;" value="ذخیره" id="saveBtn${myData[i].prId}"/>
</center>
    </div>
</div>`;
            }
            $('#div1111').html(html);

            $('.card-body input[type=button]').click(function(){
                var id=$(this).attr('id').replace("saveBtn",'');

                if(!$('#useSelect'+id).val()||!$('#description'+id).val()){
                    alert('وارد کردن تمامی فیلدها الزامی میباشد');

                }
                else{
                    var obj={prId:parseInt(id),
                        inUse:parseInt($('#useSelect'+id).val()),
                        userCount:parseInt($('#userCount'+id).val()),
                        depId:parseInt($('#hid'+id).val()),
                        desc:$('#description'+id).val(),
                        userName:userName
                    }
                    console.log(obj);
                    $.ajax({
                        type: "POST",
                        url: "pageFinalize2.aspx/InsertSurvey",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8"
                    }).then(function(a){
                        console.log(a)
                        if(a.d=="ok")
                        {
                            //  $('#cardDiv'+id).removeClass('cardCommon');
                            $('#cardDiv'+id).addClass('bg-success');
                            $('#cardDiv'+id).fadeOut(1500);
                        }
                    });
                }
            })
                
            
            $('.col-7 select').change(function(){
                var id=$(this).attr('id').replace("useSelect",'');
                if( $(this).attr('value')==0){
                    $('#userCount'+id).val(0);
                    $('#userCount'+id).prop( "disabled", true );
                }
                else
                {
                    $('#userCount'+id).prop( "disabled", false );
                    $('#userCount'+id).removeAttr('value');
                }
                // console.log(id , $(this).attr('value'));
            });
        });
    </script>
    <form id="form1" runat="server">
        <asp:literal runat="server" id="Lit1"></asp:literal>
        <div style="direction: rtl; text-align: right">
            <h3 class="alert" style="text-align: center;background-color:#DD4B39;color: white;">لطفا فرم نظر سنجی را برای پروژه/پروژه های زیر تکمیل نمایید .</h3>
            <hr />
            <div class="container" style="display: inline" id="div1111"></div>
        </div>
    </form>
</body>
</html>

