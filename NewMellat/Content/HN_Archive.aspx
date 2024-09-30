<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="HN_Archive.aspx.cs" inherits="NewMellat.Content.HN_Archive" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .col {
            width: 20%;
            display: inline-block;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="../assets/css/select2.css" rel="stylesheet" />
        <script src="../assets/js/select2.js"></script>
    <asp:HiddenField ID="hf1" runat="server" />
    <asp:literal runat="server" ID="Lit1"></asp:literal>
     <asp:literal runat="server" ID="Lit2"></asp:literal>
    <div class="container-fluid" dir="rtl">
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label>متولی</label>
                    <select class='form-control' id="vahedSelect">
                    </select>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label>شرکت</label>
                    <select class='form-control' id="companySelect">
                    </select>
                </div>
            </div>
            <div class="col" style="    width: 40%;">
                <div class="form-group">
                    <label> پروژه</label>
                    <select class='form-control' id="projectSelect">
                    </select>
                </div>
            </div>
            <div class="col" style="    width: 10%;">
                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="مشاهده" OnClick="Button1_Click" />
                  
                </div>
            </div>
            
        </div>
    </div>
   
    <div >
         <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  RightToLeft="True" Theme="SoftOrange" Width="100%" >
            <settingspager visible="False">
            </settingspager>
          
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" />
            <Columns>
              
                <dx:GridViewDataTextColumn FieldName="type" ReadOnly="True" VisibleIndex="0" Caption="نوع فایل">
                    <editformsettings visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="date" VisibleIndex="2" Caption="تاریخ ثبت">
                   
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="دانلود فایل" ShowInCustomizationForm="True" VisibleIndex="3">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png" Target="_blank" NavigateUrl='<%# Eval("url") %>'></asp:HyperLink>
                      
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان فایل" FieldName="title" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
               
            </Columns>
        </dx:ASPxGridView>
  <%--      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="date" HeaderText="تاریخ"></asp:BoundField>
            </Columns>
        </asp:GridView>--%>
       
    </div>
    <script>
        
       $(document).ready(function () {
           
           server_vahed.unshift({infId:0,infTitle:'انتخاب همه'});
           server_peymankar.unshift({infId:0,infTitle:'انتخاب همه'});
           var orgProjects=server_projects;
           var projects=server_projects;
           projects.unshift({prId:0,prTitle:'انتخاب کنید'});

           $("#vahedSelect").select2({
               data: server_vahed.map(a=>({id:a.infId,text:a.infTitle}))
           })
           $("#companySelect").select2({
               data: server_peymankar.map(a=>({id:a.infId,text:a.infTitle}))
           })

           $("#projectSelect").select2({
               data: projects.map(a=>({id:a.prId,text:a.ghCode?a.prTitle+"*"+a.ghCode:a.prTitle}))
           })

           $("#vahedSelect").change(function(){  
               if( $(this).val() !=0){          
                   var xx=orgProjects.filter(a=>a.prVahed== $(this).val());
                   xx.unshift({prId:0,prTitle:'انتخاب کنید'});
                   $("#projectSelect").select2('destroy').empty().select2({
                       data: xx.map(a=>({id:a.prId,text:a.ghCode?a.prTitle+"*"+a.ghCode:a.prTitle}))
                   })
               }
           })
           $("#companySelect").change(function(){  
               if( $(this).val() !=0){                 
                   var xx=orgProjects.filter(a=>a.prPeymankar== $(this).val());
                   xx.unshift({prId:0,prTitle:'انتخاب کنید'});
                   $("#projectSelect").select2('destroy').empty().select2({
                       data: xx.map(a=>({id:a.prId,text:a.ghCode?a.prTitle+"*"+a.ghCode:a.prTitle}))
                   })
               }
           })

           $('#ContentPlaceHolder1_Button1').click(function(){
               if( $("#projectSelect").val() !=0){      
                   $('#ContentPlaceHolder1_hf1').val($("#projectSelect").val());
               }
               else return false;
           })

       });
    </script>
  
</asp:Content>
