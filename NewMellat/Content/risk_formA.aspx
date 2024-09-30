<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="risk_formA.aspx.cs" inherits="NewMellat.Content.risk_formA" %>

<%@ register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ register assembly="LavaControl" namespace="LavaControl" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/form.css" />
    <style>
        .chbBox input {
            display: inline-block;
            width: 30px;
        }

        .chbBox label {
            display: inline-block;
        }

        input[title="برای باز کردن تقويم کليک نماييد"] {
            width: 61px;
            border: none;
            margin-top: -45px;
            left: 0px;
            position: absolute;
        }
        .wrapper{
                margin-top: -90px;
        }
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
     <asp:HiddenField runat="server" ID="hdf1"></asp:HiddenField>
     <asp:HiddenField runat="server" ID="hdf2"></asp:HiddenField>
     <asp:Panel ID="Panel1" runat="server" DefaultButton="ASPxButton1"> 
        <div align="center">
        <div align="right" class="box box-danger" style="padding-top: 9px; height: 53px;">
            <table align="center" cellpadding="0" cellspacing="0" width="100%" dir="ltr">
                <tr>
                    <td  width="36%" align="right">
                        <asp:TextBox ID="RadTextBox2" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                    </td>
                    <td width="14%">
                        <asp:Label ID="Label15" runat="server" Text=":شماره قرارداد "></asp:Label>
                    </td>
                    <td  width="36%" align="right">
                        <asp:TextBox ID="RadTextBox1" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
                    </td>
                    <td  width="14%">
                        <asp:Label ID="Label16" runat="server" Text=":نام پروژه"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
</div>
        <div align="center" style="padding: 9px" class="box box-success">
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="جستجوی اطلاعات" Theme="SoftOrange" Width="150px" Font-Names="vazir" OnClick="ASPxButton1_Click">

            </dx:ASPxButton>
</div>

     </asp:Panel>
    <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
    <div style="padding: 9px" class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" EnableTheming="True" 
            OnRowCommand="ASPxGridView4_RowCommand" RightToLeft="True" Theme="Office2010Silver" Width="100%" KeyFieldName="id" 
            Font-Names="vazir">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <ClearFilterButton ButtonType="Image">
                    <Image IconID="actions_cancel_16x16">
                    </Image>
                </ClearFilterButton>
                <UpdateButton ButtonType="Image">
                    <Image IconID="actions_save_16x16devav">
                    </Image>
                </UpdateButton>
                <EditButton ButtonType="Image">
                    <Image IconID="edit_edit_16x16">
                    </Image>
                </EditButton>
                <DeleteButton ButtonType="Image">
                    <Image IconID="edit_delete_16x16">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" Width="60px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="نام پروژه" FieldName="prTitle" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره قرارداد" FieldName="ghCode" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
               
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر" FieldName="TechnicalSuvisor" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نام شرکت" FieldName="prPeymankar" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn VisibleIndex="7">
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("prId") %>' CommandName="dt" ImageUrl="~/Content/images/icons/image-edit-icon.png" Width="65px"/>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
               
            </Columns>
            <Styles>
                <Header Font-Names="vazir" HorizontalAlign="Center" VerticalAlign="Middle">
                </Header>
                <Row Font-Names="vazir">
                </Row>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <asp:Panel ID="Panel2" runat="server" > 

    <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                     <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" HeaderText="اطلاعات پروژه" ShowCollapseButton="false" Theme="SoftOrange" Width="100%" Style="margin-top: 30px;">
                        <HeaderStyle Font-Names="vazir" HorizontalAlign="Right" />
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                             <div align="right" class="box box-danger">
                              <div class="form-row">
                         <div class="form-group">
                             <label for="city">عنوان پروژه :</label>
                             <asp:Label ID="lbTitle" runat="server"></asp:Label>
                         </div>
                         <div class="form-group">
                             <label for="city">شماره قرارداد :</label>
                              <asp:Label ID="lbContractNo" runat="server"></asp:Label>
                         </div>
                                    </div>
                                    <div class="form-row">
                         <div class="form-group">
                             <label for="city">واحد متولی :</label>
                              <asp:Label ID="lbVahed" runat="server"></asp:Label>
                         </div>
                          <div class="form-group">
                           <label for="city">ناظر :</label>
                               <asp:Label ID="lbNazer" runat="server"></asp:Label>
                        </div>
                                   <div class="form-group">
                           <label for="city">شرکت :</label>
                                <asp:Label ID="lbCompany" runat="server"></asp:Label>
                        </div>
                    </div>

                            </div>
                            </dx:PanelContent>
                        </PanelCollection>
                     </dx:ASPxRoundPanel>
                     <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="" ShowCollapseButton="false" Theme="SoftOrange" Width="100%" Style="margin-top: 30px;">
                        <HeaderStyle Font-Names="vazir" HorizontalAlign="Right" />
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                             <div align="right" class="box box-danger">
                                 <div class="form-row">
                        <div class="form-group chbBox">
                            <asp:CheckBox runat="server" ID="chb1" Text='پروفایل حفاظتی'></asp:CheckBox>
                              <telerik:radupload id="RadUpload1" runat="server" controlobjectsvisibility="RemoveButtons, AddButton" 
                                  maxfileinputscount="10" width="95%" style="display:none">
                                <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                            </telerik:radupload>
                        </div>
                        <div class="form-group chbBox">
                            <asp:CheckBox runat="server" ID="chb2" Text='شناسنامه توصیفی'></asp:CheckBox>
                             <telerik:radupload id="RadUpload2" runat="server" controlobjectsvisibility="RemoveButtons, AddButton" 
                                  maxfileinputscount="10" width="95%" style="display:none">
                                <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                            </telerik:radupload>
                                    </div>
                        <div class="form-group chbBox">
                            <asp:CheckBox runat="server" ID="chb3" Text='لیست دارایی ها'></asp:CheckBox>
                             <telerik:radupload id="RadUpload3" runat="server" controlobjectsvisibility="RemoveButtons, AddButton" 
                                  maxfileinputscount="10" width="95%" style="display:none">
                                <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                            </telerik:radupload>
                        </div>
                         <div class="form-group chbBox">
                            <asp:CheckBox runat="server" ID="chb4" Text='ارزش گذاری اولیه'></asp:CheckBox>
                              <telerik:radupload id="RadUpload4" runat="server" controlobjectsvisibility="RemoveButtons, AddButton" 
                                  maxfileinputscount="10" width="95%" style="display:none">
                                <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                            </telerik:radupload>
                        </div>
                         </div>
                             </div>
                            </dx:PanelContent>
                        </PanelCollection>
                     </dx:ASPxRoundPanel>
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="اطلاعات نامه" ShowCollapseButton="false" Theme="SoftOrange" Width="100%" Style="margin-top: 30px;">
                        <HeaderStyle Font-Names="vazir" HorizontalAlign="Right" />
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                             <div align="right" class="box box-danger">
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
                             <cc1:persiancalendar id="letterDate" runat="server" tabindex="9" width="88%" bordercolor="#F8DF8E"></cc1:persiancalendar>
                         </div>
                          <div class="form-group">
                           <label for="city">ضمائم :</label>
                              <telerik:radupload id="letterFile" runat="server" controlobjectsvisibility="RemoveButtons, AddButton" 
                                  maxfileinputscount="10" width="95%" >
                                <Localization Add="جدید" Clear="پاک کردن" Delete="حذف" Remove="حذف" Select="انتخاب فایل" />
                            </telerik:radupload>
                        </div>
                    </div>

                            </div>
                            </dx:PanelContent>
                        </PanelCollection>
                     </dx:ASPxRoundPanel>
                     </div>
                 </div>
             </div>
         </div>
         <div align="center" style="padding: 9px" class="box box-success">
                <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text="ثبت اطلاعات" Theme="SoftOrange" Width="150px" ValidationGroup="gg1">
                    <ClientSideEvents Click="function(s, e) { 
                        debugger;
                        var error=false,message=''
                        
                         
                            if($('#ContentPlaceHolder1_ASPxRoundPanel2_chb1')[0].checked )
                                if($('#ctl00_ContentPlaceHolder1_ASPxRoundPanel2_RadUpload1file0').val() == ''){
                                     error=true;
                                     message='مستندات لازم برای پروفایل حفاظتی را وارد نمایید'
                                }
                            if($('#ContentPlaceHolder1_ASPxRoundPanel2_chb2')[0].checked )
                                if($('#ctl00_ContentPlaceHolder1_ASPxRoundPanel2_RadUpload2file0').val() == ''){
                                     error=true;
                                     message='مستندات لازم برای شناسنامه توصیفی را وارد نمایید'
                                }        
                            if($('#ContentPlaceHolder1_ASPxRoundPanel2_chb3')[0].checked )
                                if($('#ctl00_ContentPlaceHolder1_ASPxRoundPanel2_RadUpload3file0').val() == ''){
                                     error=true;
                                     message='مستندات لازم برای لیست دارایی ها را وارد نمایید'
                                }
                            if($('#ContentPlaceHolder1_ASPxRoundPanel2_chb4')[0].checked )
                                if($('#ctl00_ContentPlaceHolder1_ASPxRoundPanel2_RadUpload4file0').val() == ''){
                                     error=true;
                                     message='مستندات لازم برای ارزش گذاری اولیه را وارد نمایید'
                                }
                          
                        if($('#ContentPlaceHolder1_ASPxRoundPanel1_letterShenase').val() == ''||
                            $('#ContentPlaceHolder1_ASPxRoundPanel1_letterNo').val() == ''||
                            $('#ContentPlaceHolder1_ASPxRoundPanel1_letterDate').val() == ''){
                             error=true;
                             message='شناسه ، شماره ، تاریخ نامه الزامی است'
                        }
                        
                       
                        if(error){
                         alert(message)
                         e.processOnServer = !error;           
                         }
                        else{
                         var msg=xx();
                        $('#ContentPlaceHolder1_hdf2').val(msg);
                        if(msg){
                            var text = `تمامى مستندات به جز سند ${msg} دريافت نشده أست`;
                           if (confirm(text) == true) {
                              
                              } else {
                                e.processOnServer = false;
                              }
                        }
                        }
                        }" />
                </dx:ASPxButton>
             </div>
          </asp:Panel>

    <script>
        function xx() {
            return $(".chbBox input:checkbox:not(:checked)").siblings('label').map(function () {
                return $(this).text();
            }).get().join(" , ");
        }
        $(".chbBox input").change(function () {
            if (this.checked) {
                $(this).siblings('div').css('display', 'block')
            }
            else {
                $(this).siblings('div').css('display', 'none')
            }
        });
    </script>
</asp:content>
