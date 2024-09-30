<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="pageMosavabat.aspx.cs" Inherits="NewMellat.Content.pageMosavabat" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        

        function loadDoc(parent) {

            var oWnd = radopen("PageKhobPaper.aspx?project=" + parent + "&Type=101", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc2(parent) {

            var oWnd = radopen("PageKhobPaper.aspx?Project=" + parent + "&Type=102", "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

        function loadDoc3(parent) {

            var oWnd = radopen("PageKhobPaper.aspx?Project=" + parent + "&Type=303", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="box box-danger" align="center">
        <dx:ASPxCheckBoxList ID="chkColumns" runat="server" Font-Names="vazir" RepeatColumns="5" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="100%">
            <Border BorderStyle="None" />
        </dx:ASPxCheckBoxList>

    </div>
       <div class="box box-warning" align="center" style="padding: 2px">        

           <table align="center" cellpadding="2" cellspacing="1">
               <tr>
                   <td><asp:ImageButton ID="ImageButton4" runat="server" OnClick="ImageButton4_Click" ImageUrl="~/Content/images/refresh-icon.png" ToolTip="لود مجدد" /></td>
                   <td>
<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Content/images/Select-icon.png" OnClick="ImageButton2_Click" ToolTip="انتخاب همه" />

                   </td>
                   
               

               </tr>
           </table>

           </div>



        <div  class="box box-danger" >
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" RightToLeft="True" Theme="Office2010Silver" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Width="100%" KeyFieldName="mosId" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" OnRowCommand="ASPxGridView1_RowCommand" Font-Names="vazir" OnDataBound="ASPxGridView1_DataBound" OnPageIndexChanged="ASPxGridView1_PageIndexChanged" OnProcessColumnAutoFilter="ASPxGridView1_ProcessColumnAutoFilter">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" HorizontalScrollBarMode="Auto"  />
                    <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />

        <SettingsCommandButton>
            <EditButton ButtonType="Image">
                <Image Url="~/Content/images/icons/edit-icon.png">
                </Image>
            </EditButton>
        </SettingsCommandButton>
        <SettingsSearchPanel Visible="True" />
        <SettingsLoadingPanel Text="در حال اجرا..." />
        <SettingsText GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" Caption="ویرایش">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="شناسه" FieldName="mosShenase" VisibleIndex="6" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" />
                <DataItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("mosShenase") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="مهلت عملیاتی شدن" FieldName="mosAmaliatiDate" ShowInCustomizationForm="True" VisibleIndex="8">
                <Settings AllowAutoFilter="False" />
                <DataItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("mosAmaliatiDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="mosDate" ShowInCustomizationForm="True" VisibleIndex="7">
                <Settings AllowAutoFilter="False" />
                <DataItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("mosDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="نام پروژه" FieldName="prTitle" VisibleIndex="1" Width="200px">
                <settings autofiltercondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="4">
                <propertiescombobox datasourceid="sourceSanad" textfield="infTitle" valuefield="infId"></propertiescombobox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="شرکت" FieldName="prPeymankar" VisibleIndex="5">
                <propertiescombobox datasourceid="sourcePeymankar" textfield="infTitle" valuefield="infId"></propertiescombobox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="2">
                <propertiescombobox datasourceid="sourceVahed" textfield="infTitle" valuefield="infId"></propertiescombobox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataComboBoxColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="3">
                <propertiescombobox datasourceid="sourceVahed" textfield="infTitle" valuefield="infId"></propertiescombobox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="اتمام یافته" VisibleIndex="10">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/check-icon.png" NavigateUrl='<%# Eval("prId", "~/content/PageKhobPaper.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ادغام شده" VisibleIndex="11">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/mp3tag-icon.png" NavigateUrl='<%# Eval("prId", "~/content/PageKhobPaper.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="مهلت ارسال پروپوزال" FieldName="mosErsalDate" VisibleIndex="9">
                <PropertiesDateEdit DisplayFormatString="">
                </PropertiesDateEdit>
                <Settings AllowAutoFilter="False" />
                <DataItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("mosErsalDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="لغو شده" VisibleIndex="12">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:HyperLink ID="HyperLink111" runat="server" ImageUrl="~/Content/images/icons/wood-folder-icon.png" NavigateUrl='<%# Eval("prId", "~/content/PageKhobPaper.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="13">
                <PropertiesComboBox DataSourceID="sourceProjectType" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="آخرین وضعیت پروژه" FieldName="prProjectStatus" VisibleIndex="14">
                <PropertiesComboBox DataSourceID="sourceLastStatus" TextField="infTitle" ValueField="infTitle">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="prOlaviat" VisibleIndex="15">
                <PropertiesComboBox DataSourceID="sourceOlaviat" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            
            <dx:GridViewDataTextColumn Caption="مهلت ارسال srs" FieldName="mosSRS" VisibleIndex="17">
                <DataItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("mosSRS") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مهلت پاسخگویی به srs" FieldName="mosSRSanswer" VisibleIndex="18">
                <DataItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("mosSRSanswer") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="شماره جلسه " FieldName="khJalaseNumber" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="توضیحات  مصوب" FieldName="mosbody" VisibleIndex="20">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn Caption="تاریخ جلسه کمیسون" FieldName="meetingDate" ShowInCustomizationForm="True" VisibleIndex="21">
                <Settings AllowAutoFilter="False" />
                <DataItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("meetingDate") %>'></asp:Label>
                </DataItemTemplate>
            </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn Caption="شماره جلسه کمیسون " FieldName="meetingNumber" VisibleIndex="22" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataComboBoxColumn Caption="مصوبات کمیسون" FieldName="meetingResualt" VisibleIndex="23" ShowInCustomizationForm="True">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="لغو شده" Value="لغو شده" />
                            <dx:ListEditItem Text="متوقف" Value="متوقف" />
                            <dx:ListEditItem Text="سرویس جاری" Value="سرویس جاری" />
                            <dx:ListEditItem Text="ارسال پروپوزال" Value="ارسال پروپوزال" />
                            <dx:ListEditItem Text="همزمانی" Value="همزمانی" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
        </Styles>
    </dx:ASPxGridView>
            <asp:SqlDataSource ID="sourceLastStatus" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infType = 9)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT Cast(tbKhobreganMosavab.mosShenase as nvarchar) mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosAmaliatiDate, tbKhbregan.khAct, tbKhobreganMosavab.mosAct, tbKhbregan.khId, 
	tbKhbregan.khProject, tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosDate, tbKhobreganMosavab.mosPropozal, tbKhobreganMosavab.mosErsalDate, tbProjects.prTitle, 
	tbProjects.prVahed,tbProjects.TechnicalSuvisor, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, tbProjects.prPeymankar, tbProjects.prId, tbProjects.prProjectStatus, 
	tbKhobreganMosavab.mosSRS, tbKhobreganMosavab.mosSRSanswer, tbKhbregan.khJalaseNumber, tbKhobreganMosavab.mosbody 
        ,meetingDate,meetingNumber,meetingResualt
FROM tbProjects INNER JOIN tbKhbregan ON tbProjects.prId = tbKhbregan.khProject 
INNER JOIN tbKhobreganMosavab ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob 
Left Outer Join DimDate On tbKhobreganMosavab.mosAmaliatiDate = DimDate.GregorianStr
Left Outer Join DimDate as DimDate_1 On tbKhobreganMosavab.mosDate = DimDate_1.GregorianStr
Left Outer Join DimDate as DimDate_2 On tbKhobreganMosavab.mosErsalDate = DimDate_2.GregorianStr
WHERE (tbKhbregan.khAct = 1) AND (tbKhobreganMosavab.mosAct = 1) And tbProjects.prAct =1 
     and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) ))" UpdateCommand="UPDATE tbKhobreganMosavab SET mosShenase = @mosShenase, mosDate = @mosDate, mosErsalDate = @mosErsalDate, mosAmaliatiDate = @mosAmaliatiDate, mosSRS = @mosSRS, mosSRSanswer = @mosSRSanswer, mosBody = @mosBody,meetingDate=@meetingDate,meetingNumber=@meetingNumber,meetingResualt=@meetingResualt   WHERE (mosId = @mosId)">
        <UpdateParameters>
            <asp:Parameter Name="mosShenase" />
            <asp:Parameter Name="mosDate" />
            <asp:Parameter Name="mosErsalDate" />
            <asp:Parameter Name="mosAmaliatiDate" />
            <asp:Parameter Name="mosSRS" />
            <asp:Parameter Name="mosSRSanswer" />
            <asp:Parameter Name="mosBody" />
            <asp:Parameter Name="mosId" />
            <asp:Parameter Name="meetingDate" />
            <asp:Parameter Name="meetingNumber" />
            <asp:Parameter Name="meetingResualt" />
        </UpdateParameters>
        <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
</div>
<div align="center" style="padding: 7px">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton1_Click" />
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="گزارش پروژه ها" GridViewID="ASPxGridView1" Landscape="True" PaperKind="A4">
    </dx:ASPxGridViewExporter>
        <asp:SqlDataSource ID="sourceOlaviat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Close" Skin="Sunset">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
</div>
    <div>
        
                        <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>



        <asp:SqlDataSource ID="sourceSanad" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infType, infAct, infTitle FROM prInformation WHERE (infType = 3)">
        </asp:SqlDataSource>

         <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    

</asp:Content>
