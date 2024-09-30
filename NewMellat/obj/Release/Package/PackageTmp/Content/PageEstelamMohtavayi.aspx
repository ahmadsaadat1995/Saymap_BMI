<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageEstelamMohtavayi.aspx.cs" Inherits="NewMellat.Content.PageEstelamMohtavayi" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.State" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">


        function loadDoc7(parent) {

            var oWnd = radopen("PageAttach.aspx?Parent=" + parent + "&Type=7", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }



        function loadDoc(parent) {

            var oWnd = radopen("PageEdarat.aspx?project=" + parent + "&Type=8", "RadWindow1");
            oWnd.setSize(1050, 600);
            oWnd.Center();
        } function loadDoc2(parent) {

            var oWnd = radopen("../Pagepages2.aspx?project=" + parent + "&Type=9", "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc3(parent) {

            var oWnd = radopen("PageAnswerAnalyz.aspx?project=" + parent + "&Type=10", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }
        function loadDoc4(parent) {

            var oWnd = radopen("Pagepages.aspx?project=" + parent + "&Type=11", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

        function loadDoc5(parent) {

            var oWnd = radopen("Pagepages.aspx?project=" + parent + "&Type=91", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }



        function loadDoc6(parent) {

            var oWnd = radopen("Pagepages.aspx?project=" + parent + "&Type=92", "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="box box-danger">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Office2010Silver" AutoGenerateColumns="False"
            DataSourceID="sourceMohtava0" KeyFieldName="thId" RightToLeft="True" Width="100%"
            OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize"
            Font-Names="vazir" OnRowCommand="ASPxGridView1_RowCommand">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="استعلام" VisibleIndex="6">
                    <DataItemTemplate>
                        <div align="center" dir="rtl">
                            <table align="right" cellpadding="2" cellspacing="0" dir="ltr">
                                <tr>
                                    <td>
                                        <asp:Image ID="img3" runat="server" ImageUrl="~/Content/images/icons/email-alert-icon.png" ToolTip="ارسال به شرکت" Width="25px" />
                                    </td>
                                    <td width="25">
                                        <asp:Image ID="img2" runat="server" ImageUrl="~/Content/images/icons/email-receive-icon.png" ToolTip="پاسخ استعلام" />
                                    </td>
                                    <td width="25">
                                        <asp:Image ID="img1" runat="server" ImageUrl="~/Content/images/icons/email-send-icon.png" ToolTip="استعلام" />
                                    </td>
                                    <td width="25">
                                        <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Content/images/icons/mp3tag-icon.png" NavigateUrl='<%# Eval("thId", "~/content/PageEdarat.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Eval("thId") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تدارکات - آنالیز قیمت" VisibleIndex="15" Visible="False">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" ImageUrl="~/Content/images/icons/message-bubble-send-icon.png" NavigateUrl='<%# Eval("thId", "~/content/PagePages2.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("thId") %>' />
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("prVahed") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption=" پاسخ تدارکات - آنالیز قیمت" VisibleIndex="7" Visible="False">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink7" runat="server" ImageUrl="~/Content/images/icons/message-bubble-show-icon.png" NavigateUrl='<%# Eval("thId","~/content/PageAnswerAnalyz.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("thId") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ضمایم" VisibleIndex="9">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png" Target="_blank" NavigateUrl='<%# Eval("thId", "~/content/PageAttach.aspx?Parent={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نامه ها" VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("thId","~/content/PagePages.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ارسال به شرکت" VisibleIndex="8" Visible="False">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/Content/images/icons/Mimetypes-document-seal-icon.png" NavigateUrl='<%# Eval("thId","~/content/PagePages.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="انصراف" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" ImageUrl="~/Content/images/icons/missed-calls-icon.png" NavigateUrl='<%# Eval("thId","~/content/PagePages.aspx?project={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="12">
                    <DataItemTemplate>
                        <table align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:HyperLink ID="HyperLink8" runat="server" ImageUrl="~/Content/images/icons/refresh-icon.png"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نوع درخواست" FieldName="thIsElhaghie" VisibleIndex="13">
                    <DataItemTemplate>
                        <asp:Label ID="Label6" runat="server" Font-Names="vazir" Font-Size="12px" ForeColor="#006600" Text="الحاقیه" Visible='<%# Eval("thIsElhaghie") %>'></asp:Label>
                        <asp:Label ID="Label7" runat="server" Font-Names="vazir" Font-Size="12px" ForeColor="#003366" Text="پروپوزال" Visible='<%# !(bool)Eval("thIsElhaghie") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="4">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ" FieldName="paPDate" VisibleIndex="5">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:Label ID="Label33" runat="server" Text='<%# Eval("paPDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="شرکت" FieldName="prPeymankar" VisibleIndex="14">
                    <PropertiesComboBox DataSourceID="sourcePeymankar" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="پروژه" FieldName="prTitle" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ثبت نامه" VisibleIndex="50">
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImageButtonLetter" runat="server" CommandName="letter" ImageUrl="~/Content/images/icons/letter.png" Width="42px" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="79" Caption="ghEdate" FieldName="ghEdate" Visible="false"></dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="78" Caption="ghSdate" FieldName="ghSdate" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="77" Caption="Nazer1Name" FieldName="Nazer1Name" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="78" Caption="Nazer2Name" FieldName="Nazer2Name" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="79" Caption="paDate0" FieldName="paDate0" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="76" Caption="paNumber0" FieldName="paNumber0" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="75" Caption="companyName" FieldName="companyName" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="74" Caption="SanadTypeName" FieldName="SanadTypeName" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="73" Caption="prId" FieldName="prId" Visible="false"></dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="72" Caption="thId" FieldName="thId" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="71" Caption="paType" FieldName="paType" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="70" Caption="paNumber" FieldName="paNumber" Visible="false"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="آخرین وضعیت اجرا" FieldName="prProjectStatus" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <div>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infType, infAct, infTitle FROM prInformation WHERE (infType = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceMohtava" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbTarhPishnehadi SET thAct = 0 WHERE (thId = @thId)" SelectCommand="SELECT tbTarhPishnehadi.thId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thYear, tbTarhPishnehadi.thHajmTolid, tbTarhPishnehadi.thHajmPosh, tbTarhPishnehadi.thPriceTolid, tbTarhPishnehadi.thPricePosh, tbTarhPishnehadi.thModatTolid, tbTarhPishnehadi.thModatPosh, tbTarhPishnehadi.thAct, tbTarhPishnehadi.thMekanizmPosh, tbTarhPishnehadi.thMekanizmtolid, tbProjects.prVahed, tbProjects.prIsMohtava, tbProjects.irIsAnalyz FROM tbTarhPishnehadi INNER JOIN tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId WHERE (tbTarhPishnehadi.thAct = 1) AND (tbProjects.irIsAnalyz = 0) AND (tbProjects.prIsMohtava = 0)   ORDER BY tbTarhPishnehadi.thId DESC">
            <DeleteParameters>
                <asp:Parameter Name="thId" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceMohtava0" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbTarhPishnehadi SET thAct = 0 WHERE (thId = @thId)" SelectCommand="SELECT        tbTarhPishnehadi.thId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thYear, tbProjects.prPeymankar, tbTarhPishnehadi.thIsElhaghie, tbTarhPishnehadi.thHajmTolid, tbTarhPishnehadi.thHajmPosh, 
                         tbTarhPishnehadi.thPriceTolid, tbTarhPishnehadi.thPricePosh, tbTarhPishnehadi.thModatTolid, tbTarhPishnehadi.thModatPosh, tbTarhPishnehadi.thAct, tbTarhPishnehadi.thMekanizmPosh, tbTarhPishnehadi.thMekanizmtolid, tbProjects.prId, 
                         tbProjects.prVahed,tbProjects.TechnicalSuvisor, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbTarhPishnehadi.thIsCancle, tbProjects.prTitle
						 ,tbProjectPaper.paNumber,DimDate.PersianStr paPDate,tbProjectPaper.paShenase ,tbProjectPaper.paType
		,((SELECT TOP (1) DimDate.PersianStr FROM tbProjectPaper Left Outer Join DimDate On DimDate.GregorianDate = tbProjectPaper.paDate  WHERE (paType = 1) AND (paAct = 1) AND (paProject = tbProjects.prId))) AS paDate0
        ,(SELECT TOP (1) paNumber FROM tbProjectPaper AS tbProjectPaper_1  WHERE (paType = 1) AND (paAct = 1) AND (paProject = tbProjects.prId)) AS paNumber0
		, prInformation.infTitle as companyName,n1.infTitle as Nazer1Name,n2.infTitle as Nazer2Name,n3.infTitle as SanadTypeName,tbProjects.prProjectStatus
		,(select min(GharardadStart)  FROM [NewMellat].[dbo].[tbSooratHesab]  where ProjectGharardad =(select top 1 ghcode from tbGharardad where ghProject=tbTarhPishnehadi.thProject)  and Gharardad in(N'تولید',N'پشتیبانی')) as ghSdate
		,(select max(GharardadEnd)  FROM [NewMellat].[dbo].[tbSooratHesab]  where ProjectGharardad =(select top 1 ghcode from tbGharardad where ghProject=tbTarhPishnehadi.thProject)  and Gharardad in(N'تولید',N'پشتیبانی')) as ghEdate

FROM            tbTarhPishnehadi INNER JOIN tbProjects ON tbTarhPishnehadi.thProject = tbProjects.prId
				--Left Outer Join tbProjectPaper On tbProjectPaper.paProject = tbTarhPishnehadi.thId 
left  Join(select * from tbProjectPaper )as tbProjectPaper on tbProjectPaper.paId=(select top 1 paId from tbProjectPaper where paType in(73,74) and paAct = 1 and paProject= tbTarhPishnehadi.thId order by paDate desc)
				Left Outer Join DimDate On DimDate.GregorianDate = tbProjectPaper.paDate
				left Join prInformation on tbProjects .prPeymankar=prInformation.infId 
                left Join prInformation n1 on tbProjects .prVahed=n1.infId 
				left Join prInformation n2 on tbProjects .TechnicalSuvisor=n2.infId 
				left Join prInformation n3 on tbProjects .prSanadType=n3.infId 
WHERE       ( ((tbTarhPishnehadi.thAct = 1) AND (tbProjects.prIsMohtava = 0) AND (tbProjects.prEstelamIsSubmit = 1) AND (tbTarhPishnehadi.thIsCancle = 0) And (tbTarhPishnehadi.thIsEstelamPaper=0) and tbProjectPaper.paType = 73  and tbProjectPaper.paAct = 1) 
OR       
                 ((tbTarhPishnehadi.thAct = 1) AND   (tbProjects.prIsMohtava = 0) AND (tbTarhPishnehadi.thIsCancle = 0) and tbTarhPishnehadi.thIsElhaghie =1 And (tbTarhPishnehadi.thIsEstelamPaper=0) and tbProjectPaper.paType = 74  and tbProjectPaper.paAct = 1) )
				 and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
ORDER BY tbTarhPishnehadi.thId DESC">
            <DeleteParameters>
                <asp:Parameter Name="thId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectProjects" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
    </div>
</asp:Content>
