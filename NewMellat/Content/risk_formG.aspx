<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="risk_formG.aspx.cs" Inherits="NewMellat.Content.risk_formG" %>
<%@ register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
         function loadDoc7(parent) {
             var oWnd = radopen("PageAttach.aspx?Parent=" + parent + "&Type=29&tyExt=27,26,25,24,23,22,21", "RadWindow1");
             oWnd.setSize(910, 500);
             oWnd.Center();
         }

      </script>
    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Office2010Silver" AutoGenerateColumns="False" DataSourceID="source1" 
              OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared"
            KeyFieldName="thId" RightToLeft="True" Width="100%"  Font-Names="vazir">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
           
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
              
                 <dx:GridViewDataTextColumn Caption="پروژه" FieldName="prTitle" VisibleIndex="1" Width="300px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="شماره قرارداد" FieldName="ghCode" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                 <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="sourcePeymankar" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="آخرین وضعبت" FieldName="statusName" VisibleIndex="6">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="ضمایم" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png" Target="_blank" NavigateUrl='<%# Eval("projectId", "~/content/PageAttach.aspx?Parent={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="letterShenase" VisibleIndex="7">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره نامه" FieldName="letterNo" VisibleIndex="8">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="letterDate" VisibleIndex="9">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
             <%-- <dx:GridViewDataTextColumn Caption="مهلت" FieldName="deadline" VisibleIndex="10">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>--%>
                
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton1_Click" />
          <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="گزارش پروژه ها" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>
    </div>

      <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infType, infAct, infTitle FROM prInformation WHERE (infType = 1)">
      </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)">
        </asp:SqlDataSource>
     <asp:SqlDataSource ID="source1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="
         select r.*,g.ghCode ,prTitle,prPeymankar,TechnicalSuvisor,prVahed
                ,CASE WHEN status=1 THEN N'تهیه گزارش اولیه'
	      WHEN status=2 THEN N'ارزش گذاری سناریو و پاسخ مالک'
		  WHEN status=3 THEN N'تحلیل سناریو ریسک'
		  WHEN status=4 THEN N'اتمام- ریسک قابل پذیرش'
		  WHEN status=5 THEN N'ارسال RTP'
		  WHEN status=6 THEN N'اخذ تاییدیه از کمیته ریسک عملیاتی'
		  WHEN status=7 THEN N'اتمام'
          WHEN status=8 THEN N'عودت برای اصلاح'
END as statusName,
         	(select top 1 paShenase from tbProjectPaper where paProject=p.prId and paType>=200 and paType<210 order by paId desc) as letterShenase,
		(select top 1 paNumber from tbProjectPaper where paProject=p.prId and paType>=200 and paType<210 order by paId desc) as letterNo,
		(select top 1 d.PersianStr from tbProjectPaper as pp Left Join DimDate as d On d.GregorianDate = pp.paDate where paProject=p.prId and paType>=200 and paType<210 order by paId desc) as letterDate
		
from risk_form1 as r left join tbProjects as p on p.prId=r.projectId
					 left join tbGharardad as g on p.prId=g.ghProject
					
where ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) ">
           <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
        </asp:SqlDataSource>
     <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Close" Skin="Sunset" OnClientClose ="clientClose">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow3">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
     <script>
         function clientClose() {
             location.reload();
         }
         </script>
</asp:Content>
