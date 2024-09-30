<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rpt_holdingReports.aspx.cs" Inherits="NewMellat.Content.rpt_holdingReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
       img {
            width: 120px;
            height: 160px;
        }
        .rpt-container a{
                display: table-caption;
        }
 .rpt-container {
               margin:60px;
        }
        .main-container{
            display: inline-flex;
        }

   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container" >
        <div class="rpt-container">
            <a href="./rpt_gharardad.aspx"  target="_blank">
                <img src='../assets/img/report-icon-1.png'></img>
                لیست اقلام داده قرارداد
            </a>
        </div>
        <div class="rpt-container">
            <a href="./rpt_sorat_delivery.aspx"  target="_blank">
                <img src='../assets/img/report-icon-2.png'></img>
                اقلام داده تحویلیها و تعهدات قرارداد
            </a>
        </div>
        <div class="rpt-container">
            <a href="./rpt_proposal.aspx"  target="_blank">
                <img src='../assets/img/report-icon-3.png'></img>
                گزارش پروپوزال ها
            </a>
        </div>
    </div>
</asp:Content>
