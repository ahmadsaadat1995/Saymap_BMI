<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="HN_newProject.aspx.cs" Inherits="NewMellat.Content.HN_newProject" %>

<%@ Register Assembly="LavaControl" Namespace="LavaControl" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav-item {
            padding: 13px;
            color: #646567;
            font-weight: 500;
            font-size: 18px;
        }

        .selectedTab {
            border: solid 2px #DD4B39;
            border-bottom: none;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            padding-top: 3px;
            color: #eee;
            background-color: #dd4b39;
        }

        .nav-tabs {
            border-bottom: solid 2px #DD4B39;
        }

        #col11, #col12, #col13 {
            width: 33.33%;
        }

        input[title="برای باز کردن تقويم کليک نماييد"] {
            width: 61px;
            border: none;
            margin-top: -55px;
            left: 0px;
            position: absolute;
        }

        .wrapper {
            margin-top: -90px;
        }

        .reqControl {
            border: solid 1px red;
        }

        .caption {
            margin-top: 16px;
            background-color: #CDD3D6;
            border-radius: 7px;
            padding: 10px;
        }

        .matrix-box {
            display: inline-block;
            width: 250px;
            height: 250px;
            background-color: rgb(236, 240, 245);
            border: solid 1px black;
            margin: -3px;
            padding: 20px;
        }

        .matrix-container {
            margin-top: 65px;
             margin-right: 65px;
        }

        .matrix-labelDiv {
            font-size: 32px;
            text-align: center;
            vertical-align: middle;
            line-height: 200px;
        }

        .matrix-labelContainer {
            width: 500px;
            text-align: center;
        }

        .matrix-label {
            font-size: 16px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="assets/css/form.css" />
    <link rel="stylesheet" href="assets/fonts/material-icon/css/material-design-iconic-font.min.css" />
    <script src="../assets/highchart/highcharts.js"></script>
    <script src="../assets/highchart/highcharts-more.js"></script>
    <script src="../assets/highchart/modules/solid-gauge.js"></script>
    <script src="../../assets/js/bootstrap.js"></script>
    <div dir="rtl">
        <asp:HiddenField ID="HF_CurrentUser" runat="server" />
        <asp:HiddenField ID="HF_Risk" runat="server" />
        <asp:HiddenField ID="HF_Risk_Value" runat="server" />
        <nav>
            <div class="nav nav-tabs" id="nav-tab">
                <a class="nav-item nav-link" id="nav-main-tab">عملیات پروژه</a>
                <a class="nav-item nav-link" id="nav-risk-tab">ریسک</a>
                <a class="nav-item nav-link" id="nav-team-tab">تیم پروژه </a>
                <a class="nav-item nav-link" id="nav-doc-tab">تاییده سند</a>
                <a class="nav-item nav-link" id="nav-detail-tab">جزئیات طرح</a>
                <a class="nav-item nav-link" id="nav-benefit-tab">عواید</a>
                <a class="nav-item nav-link" id="nav-matrix-tab">ماتریکس</a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <div class="" id="nav-main">
                <div class="main">
                    <div class="container">
                        <div class="signup-content">

                            <div class="signup-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="address">عنوان پروژه :</label>
                                        <asp:TextBox runat="server" ID="prTitle"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="state">نوع درخواست :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="reqType" DataSourceID="reqTypeDS" DataTextField="infTitle" DataValueField="infId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="reqTypeDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM prInformation WHERE (infAct = 1) AND (infType =10)"></asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">واحد درخواست کننده :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="vahed" DataSourceID="vahedDS" DataTextField="infTitle" DataValueField="infId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="vahedDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1) AND (tbAdminProjects.prCode = @prCode) AND (prInformation.infType = 1) And (prType =2)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="" Name="prCode" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">ناظر فنی :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="nazer">
                                                <asp:ListItem Value="null">ندارد</asp:ListItem>
                                                <asp:ListItem Value="354">اداره کل آمار و فرآوری داده</asp:ListItem>
                                                <asp:ListItem Value="19">اداره کل زیر ساخت و نرم افزار</asp:ListItem>
                                                <asp:ListItem Value="355">اداره کل امنیت اطلاعات</asp:ListItem>

                                            </asp:DropDownList>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="state">نوع پروژه :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="prType" DataSourceID="prTypeDS" DataTextField="infTitle" DataValueField="infId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="prTypeDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM prInformation WHERE (infAct = 1) AND (infType =2)"></asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="city">شرکت پیمانکار :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="peymankar" DataSourceID="peymankarDS" DataTextField="infTitle" DataValueField="infId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="peymankarDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1) AND (tbAdminProjects.prCode = @prCode) AND (prInformation.infType = 5)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="" Name="prCode" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">نوع سند :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="sanadType" DataSourceID="sanadTypeDS" DataTextField="infTitle" DataValueField="infId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="sanadTypeDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM prInformation WHERE (infAct = 1) AND (infType =3) order by infId desc"></asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row " id="row1">
                                    <div class="form-group" id="col11">
                                        <label for="city">شناسه نامه صورتجلسه کمیته راهبری مشتری مداری :</label>
                                        <asp:TextBox runat="server" ID="letterShenase1"></asp:TextBox>
                                    </div>
                                    <div class="form-group" id="col13">
                                        <label for="city">شماره قرارداد قبلی :</label>
                                        <asp:TextBox runat="server" ID="prevContractNo"></asp:TextBox>
                                    </div>
                                    <div class="form-group" id="col12">
                                        <label for="city">تاریخ نامه صورتجلسه کمیته راهبری مشتری مداری :</label>
                                        <%--  <asp:TextBox runat="server" ID="letterDate"></asp:TextBox>--%>
                                        <cc1:PersianCalendar ID="letterDate1" runat="server" TabIndex="9" Width="88%" BorderColor="#F8DF8E"></cc1:PersianCalendar>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="state">اولویت :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="olaviat" DataSourceID="olaviatTypeDS" DataTextField="infTitle" DataValueField="infId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="olaviatTypeDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM prInformation WHERE (infAct = 1) AND (infType =4)"></asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">سرویس مرتبط :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="ServiceCatalog" DataSourceID="ServiceCatalogDS" DataTextField="Description" DataValueField="ServiceId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="ServiceCatalogDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select null as ServiceId,N'ندارد' as Description union SELECT ServiceId, Description FROM ServiceCatalog"></asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>ضمائم:</label>
                                        <%--  <asp:FileUpload runat="server" ID="FileUpload1" ViewStateMode="Enabled"></asp:FileUpload>--%>
                                        <telerik:RadUpload ID="RadUpload1" runat="server" ControlObjectsVisibility="RemoveButtons, AddButton" MaxFileInputsCount="10" Width="95%">
                                            <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                                        </telerik:RadUpload>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">شناسه نامه :</label>
                                        <asp:TextBox runat="server" ID="letterShenase"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">شماره نامه :</label>
                                        <asp:TextBox runat="server" ID="letterNo"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">تاریخ نامه :</label>
                                        <%--  <asp:TextBox runat="server" ID="letterDate"></asp:TextBox>--%>
                                        <cc1:PersianCalendar ID="letterDate" runat="server" TabIndex="9" Width="88%" BorderColor="#F8DF8E"></cc1:PersianCalendar>
                                    </div>
                                </div>
                                <fieldset id="app_fieldset">
                                    <legend>تاییدیه سند </legend>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="caption" id="app1_label"></label>
                                        </div>
                                        <div class="form-group">
                                            <label for="city">شماره نامه :</label>
                                            <asp:TextBox runat="server" ID="app1_letterNo"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="city">تاریخ نامه :</label>
                                            <%--  <asp:TextBox runat="server" ID="letterDate"></asp:TextBox>--%>
                                            <cc1:PersianCalendar ID="app1_letterDate" runat="server" TabIndex="9" Width="88%" BorderColor="#F8DF8E"></cc1:PersianCalendar>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="caption" id="app2_label"></label>
                                        </div>
                                        <div class="form-group">
                                            <label for="city">شماره نامه :</label>
                                            <asp:TextBox runat="server" ID="app2_letterNo"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="city">تاریخ نامه :</label>
                                            <%--  <asp:TextBox runat="server" ID="letterDate"></asp:TextBox>--%>
                                            <cc1:PersianCalendar ID="app2_letterDate" runat="server" TabIndex="9" Width="88%" BorderColor="#F8DF8E"></cc1:PersianCalendar>
                                        </div>
                                    </div>
                                    <div class="form-row" id="app_row3" style="display: none">
                                        <div class="form-group">
                                            <label class="caption" id="app3_label"></label>
                                        </div>
                                        <div class="form-group">
                                            <label for="city">شماره نامه :</label>
                                            <asp:TextBox runat="server" ID="app3_letterNo"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="city">تاریخ نامه :</label>
                                            <%--  <asp:TextBox runat="server" ID="letterDate"></asp:TextBox>--%>
                                            <cc1:PersianCalendar ID="app3_letterDate" runat="server" TabIndex="9" Width="88%" BorderColor="#F8DF8E"></cc1:PersianCalendar>
                                        </div>
                                    </div>
                                    <div style="color: #EC3E29;">
                                        <h4>در صورتی که درخواست فوق منجر به طراحی و تولید محصول جدید گردد، کلیه هزینه هاى مترتب در دفاتر حسابداري مربوط به بودجه ساليانه آن واحد محترم ثبت مى گردد.
                                        </h4>
                                    </div>
                                </fieldset>
                                <div class="form-submit">
                                    <%-- <input type="button" value="لغو" class="submit" id="close" />--%>
                                    <asp:HiddenField ID="hf_app" runat="server" />
                                    <input type="button" value="ثبت" class="submit" onclick="mainBtnClick()" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="" id="nav-risk">
                <div class="main">
                    <div class="container">
                        <div class="signup-content">
                            <div class="signup-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label>طبقه ریسک :</label>
                                        <select id="riskFloor1" class="riskFloor"></select>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">عنوان سناریو ریسک :</label>
                                        <select id="riskTitle1" class="riskTitle"></select>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">کد سناریو ریسک :</label>
                                        <label id="riskCode1"></label>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label>مصادیق ریسک : </label>
                                        <input type="text" id="riskDesc1" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label>مالک ریسک :</label>
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label for="city">شرکت پیمانکار :</label>
                                                <select id="riskCompany1"></select>
                                            </div>
                                            <div class="form-group">
                                                <label for="city">واحد درخواست کننده :</label>
                                                <select id="riskUnit1"></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label>شدت پیامد سناریو ریسک :</label>
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label for="city">اختلال حیاتی</label>
                                                <select class="riskConsequences" id="riskConsequences11">
                                                    <option value="0">انتخاب کنید </option>
                                                    <option value="20">خیلی کم </option>
                                                    <option value="40">کم</option>
                                                    <option value="60">متوسط</option>
                                                    <option value="80">زیاد</option>
                                                    <option value="100">خیلی زیاد</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="city">اختلال غیرحیاتی</label>
                                                <select class="riskConsequences" id="riskConsequences12">
                                                    <option value="0">انتخاب کنید </option>
                                                    <option value="20">خیلی کم </option>
                                                    <option value="40">کم</option>
                                                    <option value="60">متوسط</option>
                                                    <option value="80">زیاد</option>
                                                    <option value="100">خیلی زیاد</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="city">قوانین و مقررات</label>
                                                <select class="riskConsequences" id="riskConsequences13">
                                                    <option value="0">انتخاب کنید </option>
                                                    <option value="20">خیلی کم </option>
                                                    <option value="40">کم</option>
                                                    <option value="60">متوسط</option>
                                                    <option value="80">زیاد</option>
                                                    <option value="100">خیلی زیاد</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="city">مالی</label>
                                                <select class="riskConsequences" id="riskConsequences14">
                                                    <option value="0">انتخاب کنید </option>
                                                    <option value="20">خیلی کم </option>
                                                    <option value="40">کم</option>
                                                    <option value="60">متوسط</option>
                                                    <option value="80">زیاد</option>
                                                    <option value="100">خیلی زیاد</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="city">رفاه/ایمنی نیروی انسانی</label>
                                                <select class="riskConsequences" id="riskConsequences15">
                                                    <option value="0">انتخاب کنید </option>
                                                    <option value="20">خیلی کم </option>
                                                    <option value="40">کم</option>
                                                    <option value="60">متوسط</option>
                                                    <option value="80">زیاد</option>
                                                    <option value="100">خیلی زیاد</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="city">شهرت/رضایت مشتری</label>
                                                <select class="riskConsequences" id="riskConsequences16">
                                                    <option value="0">انتخاب کنید </option>
                                                    <option value="20">خیلی کم </option>
                                                    <option value="40">کم</option>
                                                    <option value="60">متوسط</option>
                                                    <option value="80">زیاد</option>
                                                    <option value="100">خیلی زیاد</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div id="riskConsequences-chart1"></div>
                                <div class="form-submit">

                                    <input type="button" value="ثبت ریسک" class="submit" onclick="newRiskBtn()" />
                                </div>
                                <div class="form-row" id="riskTableContainer">
                                    <div class="form-group">
                                        <label>ریسک های ذخیره شده</label>
                                        <div class="form-row">
                                            <div class="form-group">
                                                <table id="riskTable">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-submit">
                                    <input type="button" value="بازگشت" class="submit" onclick="setTabVisible('nav-main')" />
                                    <input type="button" value="ثبت" class="submit" onclick="RiskBtnClick()" /><%--setTabVisible('nav-team')--%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="" id="nav-team">
                <div class="main">
                    <div class="container">
                        <div class="signup-content">
                            <div class="signup-form">
                                <div class="form-row">
                                    <i class="zmdi zmdi-plus-circle zmdi-hc-4x" style="color: green; margin-right: 95%" onclick="addTeam()"></i>
                                </div>
                                <div class="form-row">
                                    <table class="table table-striped table-bordered" id="tblTeam">
                                        <thead>
                                            <tr>
                                                <td>نقش</td>
                                                <td>نام ونام خانوادگی</td>
                                                <td>نام واحد</td>
                                                <td>تلفن</td>
                                                <td>نشانی پست الکترونیکی</td>
                                                <td></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-select">
                                                        <select title="teamRole">

                                                            <option value="1">مدیر پروژه</option>
                                                            <option value="2">عضو تیم</option>
                                                            <option value="3">عضو تیم برون سازمانی</option>
                                                        </select>
                                                        <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" title="teamName" /></td>
                                                <td>
                                                    <div class="form-select">
                                                        <select id="teamVahed0" title="teamVahed"></select><span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" title="teamTell" /></td>
                                                <td>
                                                    <input type="text" title="teamEmail" /></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="form-submit">
                                    <input type="button" value="بازگشت" class="submit" onclick="setTabVisible('nav-risk')" />
                                    <input type="button" value="ثبت" class="submit" onclick="teamBtnClick()" />
                                    <asp:HiddenField ID="hfTeam" runat="server" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="" id="nav-doc">
                <div class="main">
                    <div class="container">
                        <div class="signup-content">
                            <div class="signup-form">
                                <div class="form-row">
                                    <i class="zmdi zmdi-plus-circle zmdi-hc-4x" style="color: green; margin-right: 95%" onclick="addDoc()"></i>
                                </div>
                                <div class="form-row">
                                    <table class="table table-striped table-bordered" id="tblDoc">
                                        <thead>
                                            <tr>
                                                <td>نقش</td>
                                                <td>نام ونام خانوادگی</td>
                                                <td>سمت</td>
                                                <td>تاریخ</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-select">
                                                        <select title="docRole">
                                                            <option value="1">تهیه کننده</option>
                                                            <option value="2">تصویب کننده</option>
                                                        </select><span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" title="docName" /></td>
                                                <td>
                                                    <input type="text" title="docPosition" /></td>
                                                <td>
                                                    <input type="text" title="docDate" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="form-submit">
                                    <input type="button" value="بازگشت" class="submit" onclick="setTabVisible('nav-team')" />
                                    <input type="button" value="ثبت" class="submit" onclick="docBtnClick()" />
                                    <asp:HiddenField ID="hfDoc" runat="server" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="" id="nav-detail">
                <div class="main">
                    <div class="container">
                        <div class="signup-content">
                            <div class="signup-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">خلاصه طرح :</label>
                                        <asp:TextBox runat="server" ID="prDetail"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">هدف طرح :</label>
                                        <asp:TextBox runat="server" ID="prGoal"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">هدف استراتژیک بانک :</label>
                                        <div class="form-select">
                                            <asp:DropDownList runat="server" ID="stratgyGoal" DataSourceID="stratgyGoalDS" DataTextField="infTitle" DataValueField="infId"></asp:DropDownList>
                                            <asp:SqlDataSource ID="stratgyGoalDS" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM prInformation WHERE (infAct = 1) AND (infType =13)"></asp:SqlDataSource>
                                            <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">ضرورت :</label>
                                        <asp:TextBox runat="server" ID="prRequire"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">اطلاعات رقبا :</label>
                                        <input type="checkbox" id="chbRaghib" style="display: inline; width: 30px" class="chbBox" />
                                        <span style="display: inline">محصول یا خدمت مشابه در سایر بانک ها وجود دارد</span>
                                        <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtRaghib" class="hn_hide" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">علت درخواست طرح :</label>
                                        <div>
                                            <input type="checkbox" id="chbChera1" style="display: inline; width: 30px" class="chbBox" />
                                            <span style="display: inline">الزام قانونی از سوی مراجع بالا دستی</span>
                                            <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtChera1" class="hn_hide" />
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbChera2" style="display: inline; width: 30px" class="chbBox" />
                                            <span style="display: inline">لزوم تکمیل سبد محصولات بانک</span>
                                            <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtChera2" class="hn_hide" />
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbChera3" style="display: inline; width: 30px" class="chbBox" />
                                            <span style="display: inline">تسهیل کننده فرایند ها</span>
                                            <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtChera3" class="hn_hide" />
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbChera4" style="display: inline; width: 30px" class="chbBox" />
                                            <span style="display: inline">سایر موارد</span>
                                            <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtChera4" class="hn_hide" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <input type="checkbox" id="chbHamposh" style="display: inline; width: 30px" class="chbBox" />
                                        <label style="display: inline">همپوشانی یا شباهت با سایر محصولات و خدمات موجود :</label>
                                        <div id="txtHamposh" class="hn_hide">
                                            <div>
                                                <span style="display: inline">با کدام محصول/خدمات و به چه میزانی همپوشانی دارد؟</span>
                                                <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtHamposh1" />
                                            </div>
                                            <div>
                                                <span style="display: inline">دلایل الزام تعریف محصول </span>
                                                <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtHamposh2" />
                                            </div>
                                            <div>
                                                <span style="display: inline">آیا امکان اجرای طرح مذکور با استفاده از محصول یا خدمات مشابه وجود دارد؟</span>
                                                <input type="text" placeholder="لطفا توضیحات را وارد کنید" id="txtHamposh3" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="time">زمان دسترسی :</label>
                                        <select id="time">
                                            <option value="1">7*24</option>
                                            <option value="2">ساعت اداری</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="noavary">نوآوری :</label>
                                        <select id="noavary">
                                            <%-- <option value="0">انتخاب کنید </option>--%>
                                            <option value="20">خیلی کم </option>
                                            <option value="40">کم</option>
                                            <%--  <option value="60">متوسط</option>--%>
                                            <option value="80">زیاد</option>
                                            <option value="100">خیلی زیاد</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="cost">هزینه :</label>
                                        <select id="cost">
                                            <%-- <option value="0">انتخاب کنید </option>--%>
                                            <option value="20">خیلی کم </option>
                                            <option value="40">کم</option>
                                            <%--  <option value="60">متوسط</option>--%>
                                            <option value="80">زیاد</option>
                                            <option value="100">خیلی زیاد</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="">کانال ارائه خدمت :</label>
                                        <div>
                                            <input type="checkbox" id="chbCanal1" style="display: inline; width: 30px" class="chbBox Canal" />
                                            <span style="display: inline">شعبه</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbCanal2" style="display: inline; width: 30px" class="chbBox Canal" />
                                            <span style="display: inline">موبایل</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbCanal3" style="display: inline; width: 30px" class="chbBox Canal" />
                                            <span style="display: inline">اینترنت</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbCanal4" style="display: inline; width: 30px" class="chbBox Canal" />
                                            <span style="display: inline">پوز</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbCanal5" style="display: inline; width: 30px" class="chbBox Canal" />
                                            <span style="display: inline">ATM</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbCanal6" style="display: inline; width: 30px" class="chbBox Canal" />
                                            <span style="display: inline">Cashless</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-submit">
                                    <input type="button" value="بازگشت" class="submit" onclick="setTabVisible('nav-doc')" />
                                    <input type="button" value="ثبت" class="submit" onclick="detailsBtnClick()" />
                                    <asp:HiddenField ID="hfDetails" runat="server" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="" id="nav-benefit">
                <div class="main">
                    <div class="container">
                        <div class="signup-content">
                            <div class="signup-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="city">عواید مالی طرح :</label>
                                        <div>
                                            <input type="checkbox" id="chbMali1" style="display: inline; width: 30px" />
                                            <span style="display: inline">سودآوری</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbMali2" style="display: inline; width: 30px" />
                                            <span style="display: inline">کاهش هزینه ها</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbMali3" style="display: inline; width: 30px" />
                                            <span style="display: inline">ایجاد ارزش افزوده</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbMali4" style="display: inline; width: 30px" />
                                            <span style="display: inline">حفظ و جذب منابع</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbMali5" style="display: inline; width: 30px" />
                                            <span style="display: inline">کاهش مطالبات</span>
                                        </div>
                                        <div>
                                            <span style="display: inline">پیشبینی عواید مالی</span>
                                            <input type="text" id="txtMali6" style="display: inline; width: 200px" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">عواید غیر مالی طرح :</label>
                                        <div>
                                            <input type="checkbox" id="chbNoMali1" style="display: inline; width: 30px" />
                                            <span style="display: inline">خلق ارزش برای مشتری</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbNoMali2" style="display: inline; width: 30px" />
                                            <span style="display: inline">خلق ارزش برای بانک</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbNoMali3" style="display: inline; width: 30px" />
                                            <span style="display: inline">ایجاد فرصت رقابتی </span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbNoMali4" style="display: inline; width: 30px" />
                                            <span style="display: inline">بهبود فرآیند داخلی</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbNoMali5" style="display: inline; width: 30px" />
                                            <span style="display: inline">تکمیل سبد محصول</span>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="chbNoMali6" style="display: inline; width: 30px" />
                                            <span style="display: inline">جذب مشتریان جدید</span>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-submit">
                                    <input type="button" value="بازگشت" class="submit" onclick="setTabVisible('nav-detail')" />
                                    <input type="button" value="ثبت" class="submit" onclick="benefitBtnClick()" />

                                    <asp:HiddenField ID="hfBenefit" runat="server" />
                                    <asp:HiddenField ID="hfMatrix" runat="server" />
                                </div>


                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="" id="nav-matrix">
                <div class="main">
                    <div class="container">
                        <div class="signup-content">
                            <div class="signup-form">
                                <div class="form-row">
                                    <div class="matrix-container">
                                        <div class="matrix-labelContainer">
                                            <label for="" class="matrix-label" style="position: absolute; right: 291px; top: 20px;">ریسک</label>
                                        </div>
                                        <div class="matrix-labelContainer">
                                            <label for="" class="matrix-label" style="position: absolute; right: 65px; top: 55px;">خیلی کم </label>
                                            <label for="" class="matrix-label" style="position: absolute; right: 215px; top: 55px;">کم</label>

                                            <label for="" class="matrix-label" style="position: absolute; right: 365px; top: 55px;">زیاد</label>
                                            <label for="" class="matrix-label" style="position: absolute; right: 485px; top: 55px;">خیلی زیاد</label>
                                        </div>
                                        <div class="matrix-labelContainer">

                                            <label for="" class="matrix-label" style="position: absolute; right: 670px; top: 306px">نوآوری</label>
                                        </div>
                                        <div class="matrix-labelContainer">

                                            <label for="" class="matrix-label" style="position: absolute; right: 0px; top: 306px">مضامین</label>
                                        </div>
                                        <div class="matrix-labelContainer">
                                            <label for="" class="matrix-label" style="position: absolute; right: 570px;">خیلی زیاد </label>
                                            <label for="" class="matrix-label" style="position: absolute; right: 570px; top: 210px">زیاد</label>
                                        </div>
                                        <div class="matrix-box" id="matrixBox1">
                                            <div class="matrix-labelDiv">
                                                اولویت بندی
                                            </div>

                                        </div>

                                        <div class="matrix-box" id="matrixBox2">
                                            <div class="matrix-labelDiv">
                                                موشکافی
                                            </div>
                                        </div>
                                        <br>
                                        <div class="matrix-labelContainer">
                                            <label for="" class="matrix-label" style="position: absolute; right: 570px; top: 380px">کم </label>
                                            <label for="" class="matrix-label" style="position: absolute; right: 570px; top: 540px">کم خیلی</label>
                                        </div>
                                        <div class="matrix-box" id="matrixBox3">
                                            <div class="matrix-labelDiv">
                                                ملاحظه کاری
                                            </div>
                                        </div>
                                        <div class="matrix-box" id="matrixBox4">
                                            <div class="matrix-labelDiv">
                                                اجتناب
                                            </div>
                                        </div>
                                         <div class="matrix-labelContainer">
        <label for="" class="matrix-label" style="position: absolute; right: 290px; top: 578px;">هزینه </label>
         </div>
                                    </div>

                                </div>
                                <div class="form-submit">
                                    <input type="button" value="بازگشت" class="submit" onclick="setTabVisible('nav-benefit')" />
                                    <asp:Button runat="server" class="submit" Text="ثبت نهایی" OnClick="btn1_Click" ></asp:Button><%--OnClientClick="return benefitBtnClick()"--%>

                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var teamCounter = 0;
        var vahedOptions = '';
        var riskBaseInfo=[];
        var chartSpeed ;
        var fHtml='',companyHtml='',unitHtml='';
        $(document).ready(function () {

            chartSpeed = Highcharts.chart('riskConsequences-chart1',
               {
                   yAxis: {
                       stops: [
                          [0.2, '#33FF6E'], // green
                          [0.4, '#6DFF33'], // green
                          [0.6, '#FFE133'], // yellow
                          [0.8, '#FF6333'], // yellow
                          [1.0, '#FF3933'] // #fc0320
                       ],
                       lineWidth: 0,
                       tickWidth: 0,
                       minorTickInterval: null,
                       tickAmount: 2,
                       title: {
                           y: -70
                       },
                       labels: {
                           y: 16
                       },
                       min: 0,
                       max: 100,
                       title: {
                           text: 'سطح ریسک'
                       }
                   },

                   credits: {
                       enabled: false
                   },

                   series: [{
                       name: '',
                       data: [0],
                       dataLabels: {
                           format:''
                           //'<div style="text-align:center">' +
                           //'<span style="font-size:25px">{y}</span><br/>' +
                           //'<span style="font-size:12px;opacity:0.4">km/h</span>' +
                           //'</div>'
                       },
                       tooltip: {
                           valueSuffix: ''
                       }
                   }],

                   chart: {
                       type: 'solidgauge'
                   },

                   title: null,

                   pane: {
                       center: ['50%', '85%'],
                       size: '100%',
                       startAngle: -90,
                       endAngle: 90,
                       background: {
                           backgroundColor:
                               Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
                           innerRadius: '60%',
                           outerRadius: '100%',
                           shape: 'arc'
                       }
                   },

                   exporting: {
                       enabled: false
                   },

                   tooltip: {
                       enabled: false
                   },

                   // the value axis
               
                   plotOptions: {
                       solidgauge: {
                           dataLabels: {
                               y: 5,
                               borderWidth: 0,
                               useHTML: true
                           }
                       }
                   }
               });
            $('.riskConsequences').change(e=>{
                // if (chartSpeed) {
                var point = chartSpeed.series[0].points[0];
            //var  oldVal=point.y;
            var vals=[],w_vals=[];
            vals[0]=$('#riskConsequences11').val();
            vals[1]=$('#riskConsequences12').val();
            vals[2]=$('#riskConsequences13').val();
            vals[3]=$('#riskConsequences14').val();
            vals[4]=$('#riskConsequences15').val();
            vals[5]=$('#riskConsequences16').val();

            w_vals[0]=vals[0]*28;
            w_vals[1]=vals[1]*19;
            w_vals[2]=vals[2]*15;
            w_vals[3]=vals[3]*4;
            w_vals[4]=vals[4]*10;
            w_vals[5]=vals[5]*24;

            var max=Math.max(...w_vals)
           const index = w_vals.indexOf(max);
           
            point.update(parseFloat( vals[index]));
            var oldRiskValue= $("#HF_Risk_Value").val()?$("#HF_Risk_Value").val():0;
            if(vals[index]>oldRiskValue)
                $("#ContentPlaceHolder1_HF_Risk_Value").val( vals[index]);
           
        })
        function findRistTitle(floor){
            var titles=riskBaseInfo.filter(a=>a.floor==floor);
            var Html=titles.map(a=>(' <option value="'+a.id+'">'+a.title+'</option>'));
            return '<option value="0">انتخاب کنید</option>'+Html;
        }
        function findRistCode(id){
            if(id>0){
                var item=riskBaseInfo.find(a=>a.id==id);                
                return item.code;
            }
            else
                return '';
        }
        $.ajax({
            url: "http://172.22.65.16:4581/SqlOData.svc/GetData/prInformation?$filter=infAct= 1",
            type: "GET",
            async: true,
            headers: {
                "accept": "application/json;odata=verbose",
            },
            success: function (data) {
                var d= JSON.parse(data).d.results;
                var unit=d.filter(a=>a.infType==1);
                var company=d.filter(a=>a.infType==5);
                unitHtml=unit.map(a=>(' <option value="'+a.infId+'">'+a.infTitle+'</option>'));
                companyHtml=company.map(a=>(' <option value="'+a.infId+'">'+a.infTitle+'</option>'));
                $('#riskOwner1').html(companyHtml);
                $('#riskCompany1').html( companyHtml);
                $('#riskUnit1').html( unitHtml);
            }});
        $.ajax({
            url: "http://172.22.65.16:4581/SqlOData.svc/GetData/risk_baseInfo ",
            type: "GET",
            async: true,
            headers: {
                "accept": "application/json;odata=verbose",
            },
            success: function (data) {
                riskBaseInfo = JSON.parse(data).d.results;
                var floors=riskBaseInfo.map(item => item.floor).filter((value, index, self) => self.indexOf(value) === index)
                fHtml=floors.map(a=>(' <option value="'+a+'">'+a+'</option>'));
                $('#riskFloor1').html('<option value="0">انتخاب کنید</option>'+fHtml);
                $('.riskFloor').change(function(e){
                    var indx=e.target.id.replace('riskFloor','');
                    console.log(indx);
                    $('#riskTitle1').html( findRistTitle(e.target.value));
                });

                $('.riskTitle').change(function(e){                    
                    var indx=e.target.id.replace('riskTitle','');
                    //console.log(indx);
                    //debugger;
                    $('#riskCode1').html( findRistCode(e.target.value));
                       
                });
            }
        })

        $('.cal_input').attr('readonly','readonly');
        setTabVisible('nav-main');
        var users = ['m.khanahmadi','a.hadimanesh','abdolahi.eh','m.teymour','m.mosayebi','abedini','mosavi'];
        if (users.indexOf($('#ContentPlaceHolder1_HF_CurrentUser').val().toLowerCase())<0)
            $('#ContentPlaceHolder1_sanadType').children("option[value='181']").hide();


        $('#ContentPlaceHolder1_prType').change(function () {
            val = $(this).val();
            if (val == 87) {
                $('#app_fieldset').show();
                $('#app1_label').text('اداره کل برنامه ریزی و نظارت اعتباری');
                $('#app2_label').text('اداره کل سازمان و بهبود روشها');
                $('#app_row3').hide();
            }
            else if (val == 88) {
                $('#app_fieldset').show();
                $('#app2_label').text('اداره کل بانکداری شخصی و بهبود تجربه مشتری');
                $('#app1_label').text('اداره کل سازمان و بهبود روشها');
                $('#app_row3').hide();
            }
            else if (val == 204) {
                $('#app_fieldset').show();
                $('#app2_label').text('اداره کل بانکداری شخصی و بهبود تجربه مشتری');
                $('#app1_label').text('اداره کل سازمان و بهبود روشها');
                $('#app_row3').hide();
            }
            else if (val == 290) {
                $('#app_fieldset').show();
                $('#app_row3').show();
                $('#app1_label').text('اداره کل امور ارزی شعب');
                $('#app2_label').text('اداره کل بین الملل');
                $('#app3_label').text('اداره کل برنامه ریزی و نظارت اعتباری');                   
            }
            else if (val == 291) {
                $('#app_fieldset').show();
                $('#app_row3').show();
                $('#app1_label').text('اداره کل امور ارزی شعب');
                $('#app2_label').text('اداره کل بین الملل');
                $('#app3_label').text('اداره کل برنامه ریزی و نظارت اعتباری');
            }
            else {
                $('#app_fieldset').hide();
            }
        });
        $("#ContentPlaceHolder1_prType").val($("#ContentPlaceHolder1_prType option:first").val()) .trigger('change');;
        $('#ContentPlaceHolder1_vahed option').each(function () {
            vahedOptions += ' <option value="' + this.value + '">' + this.text + '</option>';
        });
        $('#teamVahed0').html(vahedOptions);
        //  $('#row1').hide();
        // $('#col11').hide();
        // $('#col12').hide();
        $('#col13').hide();
        $('#ContentPlaceHolder1_sanadType').change(function () {
            val = $(this).val();
            $('#row1').hide();
            $('#col11').hide();
            $('#col12').hide();
            $('#col13').hide();

            if (val == 413) {
                $('#row1').show();
                $('#col13').show();
            }
            else if (val == 414) {
                $('#row1').show();
                $('#col11').show();
                $('#col12').show();
            }

        })
        $(".chbBox").change(function () {
            var inputName = this.id.replace('chb', 'txt');
            if (this.checked)
                $('#' + inputName).show();
            else
                $('#' + inputName).hide();
        });
        $('.hn_hide').hide();
        })
        function setTabVisible(tabName) {
          
            $('#nav-tabContent').children().each(function () {
                var e = $(this)[0];
                if (e.id != tabName) {
                    $(this).hide();
                    $('#' + e.id + '-tab').removeClass('selectedTab');
                } else {
                    $(this).show();
                    $('#' + e.id + '-tab').addClass('selectedTab');
                }
            });
        }
        function mainBtnClick() {
            $.when(
            loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/tbprojects?$select=prTitle&$filter= cast([prTitle] as nvarchar(max)) eq '" + $('#ContentPlaceHolder1_prTitle').val() + "'"), loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/tbProjectPaper?$select=paShenase,paNumber&$filter= paShenase eq '" + $('#ContentPlaceHolder1_letterShenase').val() + "' or paNumber eq '" + $('#ContentPlaceHolder1_letterNo').val() + "'")).done(function (p, l) {

                var pp = JSON.parse(p).d.results;
                var ll = JSON.parse(l).d.results;

                var returnValue = true;
                var message = '';
                if (pp.length != 0) {
                    $('#ContentPlaceHolder1_prTitle').addClass('reqControl');
                    returnValue = false;
                    message += '\n' + 'پروژه ای با این عنوان قبلا درسیستم ذخیره شده است';
                }
                if (ll.length != 0) {
                    $('#ContentPlaceHolder1_letterShenase').addClass('reqControl');
                    $('#ContentPlaceHolder1_letterNo').addClass('reqControl');
                    returnValue = false;
                    message += '\n' + 'پروژه ای با این شناسه/ شماره نامه قبلا درسیستم ذخیره شده است';
                }

                if (!$('#ContentPlaceHolder1_prTitle').val()) {
                    $('#ContentPlaceHolder1_prTitle').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_prTitle').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_vahed').val()) {
                    $('#ContentPlaceHolder1_vahed').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_vahed').removeClass('reqControl'); }

                if (!$('#ctl00_ContentPlaceHolder1_RadUpload1file0').val()) {
                    $('#ctl00_ContentPlaceHolder1_RadUpload1').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ctl00_ContentPlaceHolder1_RadUpload1').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_letterShenase').val()) {
                    $('#ContentPlaceHolder1_letterShenase').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_letterShenase').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_letterNo').val()) {
                    $('#ContentPlaceHolder1_letterNo').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_letterNo').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_letterDateinp').val()) {
                    $('#ContentPlaceHolder1_letterDateinp').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_letterDateinp').removeClass('reqControl'); }

                if ($('#ContentPlaceHolder1_sanadType').val() == 413 && !$('#ContentPlaceHolder1_prevContractNo').val()) {
                    $('#ContentPlaceHolder1_prevContractNo').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_prevContractNo').removeClass('reqControl'); }

                if ($('#ContentPlaceHolder1_sanadType').val() == 414 && !$('#ContentPlaceHolder1_letterShenase1').val()) {
                    $('#ContentPlaceHolder1_letterShenase1').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_letterShenase1').removeClass('reqControl'); }

                if ($('#ContentPlaceHolder1_sanadType').val() == 414 && !$('#ContentPlaceHolder1_letterDate1inp').val()) {
                    $('#ContentPlaceHolder1_letterDate1inp').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_letterDate1inp').removeClass('reqControl'); }

                /////////////////////////////////////////////////////////
                if (!$('#ContentPlaceHolder1_app1_letterNo').is(":hidden") && !$('#ContentPlaceHolder1_app1_letterNo').val()) {
                    $('#ContentPlaceHolder1_app1_letterNo').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_app1_letterNo').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_app1_letterDateinp').is(":hidden") && !$('#ContentPlaceHolder1_app1_letterDateinp').val()) {
                    $('#ContentPlaceHolder1_app1_letterDateinp').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_app1_letterDateinp').removeClass('reqControl'); }


                if (!$('#ContentPlaceHolder1_app2_letterNo').is(":hidden") && !$('#ContentPlaceHolder1_app2_letterNo').val()) {
                    $('#ContentPlaceHolder1_app2_letterNo').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_app2_letterNo').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_app2_letterDateinp').is(":hidden") && !$('#ContentPlaceHolder1_app2_letterDateinp').val()) {
                    $('#ContentPlaceHolder1_app2_letterDateinp').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_app2_letterDateinp').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_app3_letterNo').is(":hidden") && !$('#ContentPlaceHolder1_app3_letterNo').val()) {
                    $('#ContentPlaceHolder1_app3_letterNo').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_app3_letterNo').removeClass('reqControl'); }

                if (!$('#ContentPlaceHolder1_app3_letterDateinp').is(":hidden") && !$('#ContentPlaceHolder1_app3_letterDateinp').val()) {
                    $('#ContentPlaceHolder1_app3_letterDateinp').addClass('reqControl');
                    returnValue = false;
                }
                else { $('#ContentPlaceHolder1_app3_letterDateinp').removeClass('reqControl'); }




                if (returnValue) {
                    var data = [];
                    if (!$('#ContentPlaceHolder1_app1_letterNo').is(":hidden")) {
                        data.push({
                            dep: $('#app1_label').text(),
                            letterNo: $('#ContentPlaceHolder1_app1_letterNo').val(),
                            letterDate: $('#ContentPlaceHolder1_app1_letterDateinp').val()
                        })
                    }
                    if (!$('#ContentPlaceHolder1_app2_letterNo').is(":hidden")) {
                        data.push({
                            dep: $('#app2_label').text(),
                            letterNo: $('#ContentPlaceHolder1_app2_letterNo').val(),
                            letterDate: $('#ContentPlaceHolder1_app2_letterDateinp').val()
                        })
                    }
                    if (!$('#ContentPlaceHolder1_app3_letterNo').is(":hidden")) {
                        data.push({
                            dep: $('#app3_label').text(),
                            letterNo: $('#ContentPlaceHolder1_app3_letterNo').val(),
                            letterDate: $('#ContentPlaceHolder1_app3_letterDateinp').val()
                        })
                    }
                    $('#ContentPlaceHolder1_hf_app').val(JSON.stringify(data));
                    setTabVisible('nav-risk');

                }
                else {
                    if (message)
                        alert(message);
                }
            })

        }
        var risks=[];
        function newRiskBtn(){

            var returnValue = true;
            var message = '';

            if (!$('#riskFloor1').val()) {
                $('#riskFloor1').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskFloor1').removeClass('reqControl'); }

            if (!$('#riskTitle1').val()) {
                $('#riskTitle1').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskTitle1').removeClass('reqControl'); }

            if (!$('#riskDesc1').val()) {
                $('#riskDesc1').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskDesc1').removeClass('reqControl'); }

            if (!$('#riskCompany1').val()) {
                $('#riskCompany1').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskCompany1').removeClass('reqControl'); }

            if (!$('#riskUnit1').val()) {
                $('#riskUnit1').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskUnit1').removeClass('reqControl'); }
            
            if (!$('#riskConsequences11').val()) {
                $('#riskConsequences11').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskConsequences11').removeClass('reqControl'); }
            if (!$('#riskConsequences12').val()) {
                $('#riskConsequences12').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskConsequences12').removeClass('reqControl'); }
            if (!$('#riskConsequences13').val()) {
                $('#riskConsequences13').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskConsequences13').removeClass('reqControl'); }
            if (!$('#riskConsequences14').val()) {
                $('#riskConsequences14').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskConsequences14').removeClass('reqControl'); }
            if (!$('#riskConsequences15').val()) {
                $('#riskConsequences15').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskConsequences15').removeClass('reqControl'); }
            if (!$('#riskConsequences16').val()) {
                $('#riskConsequences16').addClass('reqControl');
                returnValue = false;
            }
            else { $('#riskConsequences16').removeClass('reqControl'); }

            if(returnValue){
                var point = chartSpeed.series[0].points[0];
                risks.push({riskFloor:$('#riskFloor1').val(),
                    riskTitle:$('#riskTitle1').val(),
                    riskCode:$('#riskCode1').text(),
                    riskDesc:$('#riskDesc1').val(),
                    riskUnit:$('#riskUnit1').val(),
                    riskCompany:$('#riskCompany1').val(),
                    riskConsequences1:$('#riskConsequences11').val(),
                    riskConsequences2:$('#riskConsequences12').val(),
                    riskConsequences3:$('#riskConsequences13').val(),
                    riskConsequences4:$('#riskConsequences14').val(),
                    riskConsequences5:$('#riskConsequences15').val(),
                    riskConsequences6:$('#riskConsequences16').val(),
                    riskConsequencesChart:point.y
                })
           
                //  console.log(point);
                //add data to table
                $("#riskTable").append("<tr><td>"+$('#riskDesc1').val()+"</td></tr>");
                //empty inputs
                $('#riskFloor1').val('');
                $('#riskTitle1').val('');
                $('#riskCode1').text('');
                $('#riskDesc1').val('');
                $('#riskUnit1').val('');
                $('#riskCompany1').val('');
                $('#riskConsequences11').val('');
                $('#riskConsequences12').val('');
                $('#riskConsequences13').val('');
                $('#riskConsequences14').val('');
                $('#riskConsequences15').val('');
                $('#riskConsequences16').val('');
                point.update(0);
            }
            else {
               
                alert('لطفا موارد الزامی را پر کنید');
            }
            
        }

        function RiskBtnClick(){
            if (risks.length>0) {
                $('#ContentPlaceHolder1_HF_Risk').val(JSON.stringify(risks));
                setTabVisible('nav-team');
            }
            else{
                $('#riskFloor1').addClass('reqControl');
                $('#riskTitle1').addClass('reqControl');
               
                $('#riskDesc1').addClass('reqControl');;
                $('#riskUnit1').addClass('reqControl');;
                $('#riskCompany1').addClass('reqControl');
                $('#riskConsequences11').addClass('reqControl');
                $('#riskConsequences12').addClass('reqControl');
                $('#riskConsequences13').addClass('reqControl');
                $('#riskConsequences14').addClass('reqControl');
                $('#riskConsequences15').addClass('reqControl');
                $('#riskConsequences16').addClass('reqControl');
                
                alert('لطفا موارد الزامی را پر کنید');
            }
        }
        function addTeam() {
            teamCounter++;
            $('#tblTeam tbody').append('<tr><td><div class="form-select"><select title="teamRole"><option value="1">مدیر پروژه</option><option value="2">عضو تیم</option><option value="3">عضو تیم برون سازمانی</option></select><span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span></div></td><td><input type="text" title="teamName" /></td><td><div class="form-select"><select title="teamVahed">' + vahedOptions + '</select><span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span></div></td><td><input type="text" title="teamTell" /></td><td><input type="text" title="teamEmail" /></td><td></td></tr>');
        }
        function teamBtnClick() {
            var data = [];
            var returnValue = true;
            $('#tblTeam tbody tr').each(function (i) {
                var roleId = $(this).find('[title="teamRole"]').val();
                var role = $(this).find('[title="teamRole"] option:selected').text();
                var vahedId = $(this).find('[title="teamVahed"]').val();
                var vahed = $(this).find('[title="teamVahed"] option:selected').text();
                var tell = $(this).find('[title="teamTell"]').val();
                var email = $(this).find('[title="teamEmail"]').val();
                var name = $(this).find('[title="teamName"]').val();

                if ($('#ContentPlaceHolder1_sanadType').val() != 181) {
                    if (!name) {
                        returnValue = false;
                        $(this).find('[title="teamName"]').addClass('reqControl');
                    }
                    else { $(this).find('[title="teamName"]').removeClass('reqControl'); }
                    if (!tell) {
                        returnValue = false;
                        $(this).find('[title="teamTell"]').addClass('reqControl');
                    }
                    else { $(this).find('[title="teamTell"]').removeClass('reqControl'); }
                }
                if (returnValue)

                    data.push({
                        role: role,
                        roleId: roleId,
                        name: name,
                        vahedId: vahedId,
                        vahed: vahed,
                        tell: tell,
                        email: email
                    })
            });
            if (returnValue) {
                $('#ContentPlaceHolder1_hfTeam').val(JSON.stringify(data));
                setTabVisible('nav-doc');
            }
            //  else
            //     alert('لطفا مولرد الزامی را پر کنید');
        }

        function addDoc() {

            $('#tblDoc tbody').append('<tr><td><div class="form-select"><select title ="docRole"><option value="1">تهیه کننده</option><option value="2">تصویب کننده</option></select><span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span></div></td><td><input type="text" title="docName"/></td><td><input type="text" title="docPosition"/></td><td><input type="text" title="docDate"/></td></tr>');
        }
        function docBtnClick() {
            var data = []; var returnValue = true;
            

            $('#tblDoc tbody tr').each(function () {
                if ($('#ContentPlaceHolder1_sanadType').val() != 181) {
                    var name = $(this).find('[title="docName"]').val(),
                                position = $(this).find('[title="docPosition"]').val(),
                                date = $(this).find('[title="docDate"]').val();
                    if (!name) {
                        returnValue = false;
                        $(this).find('[title="docName"]').addClass('reqControl');
                    }
                    else { $(this).find('[title="docName"]').removeClass('reqControl'); }
                    if (!position) {
                        returnValue = false;
                        $(this).find('[title="docPosition"]').addClass('reqControl');
                    }
                    else { $(this).find('[title="docPosition"]').removeClass('reqControl'); }
                    //   if (!date) {
                    //      returnValue = false;
                    //      $(this).find('[title="docDate"]').addClass('reqControl');
                    //     }
                    //    else { $(this).find('[title="docDate"]').removeClass('reqControl'); }
                }
                if (returnValue)
                    data.push({
                        role: $(this).find('[title="docRole"]').val(),
                        role : $(this).find('[title="docRole"] option:selected').text(),
                        name: name,
                        position: position,
                        date: date
                    })
            });
            if (returnValue) {
                $('#ContentPlaceHolder1_hfDoc').val(JSON.stringify(data));
                setTabVisible('nav-detail');
            }
        }
        function detailsBtnClick() {
            var returnValue = true;
            if ($('#ContentPlaceHolder1_sanadType').val() != 181) {
                var ctrlPrDetail = $('#ContentPlaceHolder1_prDetail');
                if (!ctrlPrDetail.val()) { ctrlPrDetail.addClass('reqControl'); returnValue = false; }
                else { ctrlPrDetail.removeClass('reqControl'); }

                var ctrlPrGoal = $('#ContentPlaceHolder1_prGoal');
                if (!ctrlPrGoal.val()) { ctrlPrGoal.addClass('reqControl'); returnValue = false; }
                else { ctrlPrGoal.removeClass('reqControl'); }

                var ctrlPrRequire = $('#ContentPlaceHolder1_prRequire');
                if (!ctrlPrRequire.val()) { ctrlPrRequire.addClass('reqControl'); returnValue = false; }
                else { ctrlPrRequire.removeClass('reqControl'); }


                if ($('#chbChera1').is(':checked') && !$('#txtChera1').val()) { $('#txtChera1').addClass('reqControl'); returnValue = false; }
                else { $('#txtChera1').removeClass('reqControl'); }
                if ($('#chbChera2').is(':checked') && !$('#txtChera2').val()) { $('#txtChera2').addClass('reqControl'); returnValue = false; }
                else { $('#txtChera2').removeClass('reqControl'); }
                if ($('#chbChera3').is(':checked') && !$('#txtChera3').val()) { $('#txtChera3').addClass('reqControl'); returnValue = false; }
                else { $('#txtChera3').removeClass('reqControl'); }
                if ($('#chbChera4').is(':checked') && !$('#txtChera4').val()) { $('#txtChera4').addClass('reqControl'); returnValue = false; }
                else { $('#txtChera4').removeClass('reqControl'); }
                if ($('#chbRaghib').is(':checked') && !$('#txtRaghib').val()) { $('#txtRaghib').addClass('reqControl'); returnValue = false; }
                else { $('#txtRaghib').removeClass('reqControl'); }
                if ($('#chbHamposh').is(':checked') && !$('#txtHamposh1').val()) { $('#txtHamposh1').addClass('reqControl'); returnValue = false; }
                else { $('#txtHamposh1').removeClass('reqControl'); }
                if ($('#chbHamposh').is(':checked') && !$('#txtHamposh2').val()) { $('#txtHamposh2').addClass('reqControl'); returnValue = false; }
                else { $('#txtHamposh2').removeClass('reqControl'); }
                if ($('#chbHamposh').is(':checked') && !$('#txtHamposh3').val()) { $('#txtHamposh3').addClass('reqControl'); returnValue = false; }
                else { $('#txtHamposh3').removeClass('reqControl'); }
            }
            // var x=$('.canal:checkbox:checked').siblings().text();
          
            var data = {
                prDetail: $('#ContentPlaceHolder1_prDetail').val(),
                prRequire: $('#ContentPlaceHolder1_prRequire').val(),
                Raghib: $('#chbRaghib').is(':checked'),
                RaghibDesc: $('#txtRaghib').val(),
                Chera1: $('#chbChera1').is(':checked'),
                Chera1Desc: $('#txtChera1').val(),
                Chera2: $('#chbChera2').is(':checked'),
                Chera2Desc: $('#txtChera2').val(),
                Chera3: $('#chbChera3').is(':checked'),
                Chera3Desc: $('#txtChera3').val(),
                Chera4: $('#chbChera4').is(':checked'),
                Chera4Desc: $('#txtChera4').val(),
                Hamposh: $('#chbHamposh').is(':checked'),
                Hamposh1: $('#txtHamposh1').val(),
                Hamposh2: $('#txtHamposh2').val(),
                Hamposh3: $('#txtHamposh3').val(),
                Time:$('#time').val(),
                Noavary:$('#noavary').val(),
                Cost:$('#cost').val(),
                Canal:$('.Canal:checkbox:checked').siblings().map(function() { return $(this).text(); }).get().join()
            };
            if (returnValue) {
                $('#ContentPlaceHolder1_hfDetails').val(JSON.stringify(data));
                setTabVisible('nav-benefit');
            }
        }
        function benefitBtnClick() {
            if ($('#nav-benefit input[type="checkbox"]').is(':checked')) {
                var data = {

                    Mali1: $('#chbMali1').is(':checked'),
                    Mali2: $('#chbMali2').is(':checked'),
                    Mali3: $('#chbMali3').is(':checked'),
                    Mali4: $('#chbMali4').is(':checked'),
                    Mali5: $('#chbMali5').is(':checked'),
                    Mali6: $('#txtMali6').val(),
                    NoMali1: $('#chbNoMali1').is(':checked'),
                    NoMali2: $('#chbNoMali2').is(':checked'),
                    NoMali3: $('#chbNoMali3').is(':checked'),
                    NoMali4: $('#chbNoMali4').is(':checked'),
                    NoMali5: $('#chbNoMali5').is(':checked'),
                    NoMali6: $('#chbNoMali6').is(':checked'),

                };

                $('#ContentPlaceHolder1_hfBenefit').val(JSON.stringify(data));
               

                var risk=risks[0].riskConsequencesChart;
                var noavary=parseInt(JSON.parse(  $('#ContentPlaceHolder1_hfDetails').val()).Noavary);
                var cost=parseInt(JSON.parse(  $('#ContentPlaceHolder1_hfDetails').val()).Cost);
                var mazamin=parseInt($('#ContentPlaceHolder1_stratgyGoal').val());
                var matrix="";
                //موشکافی
                if(risk>=80 && noavary>=80 &&cost>=80 && mazamin!=457){
                    matrix='موشکافی';
                    $('#matrixBox2').css('background-color', '#DD4B39');
                }
                    //اولویت بندی
                else if(risk<80 && noavary>=80 &&cost<80 && mazamin!=457){
                    $('#matrixBox1').css('background-color', '#DD4B39');
                    matrix='اولویت بندی';
                }
                //اجتناب
                if(risk>=80 && noavary<80 &&cost>=80 && mazamin==457){
                    $('#matrixBox4').css('background-color', '#DD4B39');
                    matrix='اجتناب';
                }
                //ملاحظه کاری
                if(risk<80 && noavary<80 &&cost<80 && mazamin==457){
                    matrix='ملاحظه کاری';
                    $('#matrixBox3').css('background-color', '#DD4B39');
                }
                $('#ContentPlaceHolder1_hfMatrix').val(matrix);
                setTabVisible('nav-matrix')
            }
           
            else {
                alert("تکمیل حداقل یک گزینه الزامی میباشد");
                //e.preventDefault();
                return false;
            }
        }
    </script>

</asp:Content>
