<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageGharardad.aspx.cs" Inherits="NewMellat.Content.PageGharardad" %>

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

        function loadDoc(parent) {

            var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=25", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

        function loadDoc2(parent) {

            var oWnd = radopen("PageEstelamGharardad.aspx?id=" + parent + "&Type=26", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc3(parent) {

            var oWnd = radopen("PageGharardadEblagh.aspx?project=" + parent + "&Type=27&tp=1", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

        function loadDoc3(parent) {

            var oWnd = radopen("PageGharardadEblagh.aspx?project=" + parent + "&Type=27&tp=2", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc4(parent) {
            var oWnd = radopen("pagePages.aspx?project=" + parent + "&Type=30", "RadWindow3");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

        function loadDoc5(parent) {

            var oWnd = radopen("PageGharardadCode.aspx?thId=" + parent, "RadWindow1");
            oWnd.setSize(450, 250);
            oWnd.Center();
        }


        function loadDoc7(parent) {

            var oWnd = radopen("PageAttach.aspx?parent=" + parent + "&type=8", "RadWindow2");
            oWnd.setSize(900, 500);
            oWnd.Center();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    </div>
    <div class="box box-danger">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.* FROM prInformation WHERE (infType = 2)"></asp:SqlDataSource>
        <dx:aspxgridview id="ASPxGridView1" runat="server" theme="Office2010Silver" autogeneratecolumns="False" datasourceid="sourceGharadad" keyfieldname="ghId" righttoleft="True" width="100%" onhtmldatacellprepared="ASPxGridView1_HtmlDataCellPrepared" onrowcommand="ASPxGridView1_RowCommand" oncommandbuttoninitialize="ASPxGridView1_CommandButtonInitialize" font-names="vazir">
            <Settings ShowFilterRow="True" ShowGroupPanel="True"  HorizontalScrollBarMode="Auto"/>
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
                <dx:GridViewCommandColumn VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="نامه" VisibleIndex="3" Visible="False">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Content/images/icons/mp3tag-icon.png" ></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="استعلام" VisibleIndex="5">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" ImageUrl="~/Content/images/icons/missed-calls-icon.png"  Target="_blank"></asp:HyperLink><%--  <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("thId") %>' />
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("prVahed") %>' />--%>
                        <asp:HiddenField ID="h1" runat="server" Value='<%# Eval("ghId") %>' />
                        <asp:HiddenField ID="h2" runat="server" Value='<%# Eval("isElhaghie") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ابلاغ به تدارکات" VisibleIndex="6">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink7" runat="server" ImageUrl="~/Content/images/icons/edit-validated-icon.png"></asp:HyperLink>
                        <asp:HiddenField ID="h1" runat="server" Value='<%# Eval("ghId") %>' />
                        <asp:HiddenField ID="h2" runat="server" Value='<%# Eval("isElhaghie") %>' />
                        <asp:HiddenField ID="HiddenField3" runat="server"/>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="دریافت قرارداد" VisibleIndex="7">
                    <DataItemTemplate>
                        <div align="center" dir="ltr">
                            <table align="center" cellpadding="0" cellspacing="0" dir="rtl">
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="HyperLink8" runat="server" ImageUrl="~/Content/images/icons/check-icon.png" Target="_blank"></asp:HyperLink>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtG" runat="server" Theme="SoftOrange" Width="100px" Visible="False">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>-</td>
                                    <td>
                                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AnimationType="Fade" RightToLeft="True" Theme="SoftOrange" ValueType="System.String" Width="75px" Visible="False">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td style="padding-right: 3px">
                                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" Target="_blank"></asp:HyperLink>
                                    </td>
                                    <td style="padding-right: 3px">
                                        <asp:HyperLink ID="HyperLink9" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>

                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="h1" runat="server" Value='<%# Eval("ghId") %>' />
                            <asp:HiddenField ID="h2" runat="server" Value='<%# Eval("isElhaghie") %>' />
                            <asp:HiddenField ID="h3" runat="server" Value='<%# Eval("ProposalId") %>' />
                        </div>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نامه ها" VisibleIndex="8" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption=" پیش نویس قرارداد " VisibleIndex="4" ToolTip="دریافت پیش نویس قرارداد ">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/Content/images/icons/Mimetypes-document-seal-icon.png"  Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="h1" runat="server" Value='<%# Eval("ghId") %>' />
                        <asp:HiddenField ID="h2" runat="server" Value='<%# Eval("isElhaghie") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پروژه" FieldName="ProjectTitle" VisibleIndex="1" Width="260px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره قرارداد" FieldName="ghCode" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink10" runat="server" ImageUrl="~/Content/images/icons/refresh-icon.png"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="صورتحساب" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:HiddenField ID="h1" runat="server" Value='<%# Eval("ghId") %>' />
                        <asp:HiddenField ID="h2" runat="server" Value='<%# Eval("isElhaghie") %>' />
                        <asp:ImageButton ID="ImageButton15" runat="server" CommandName="soorat" ImageUrl="~/Content/images/icons/distributor-report-icon.png" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="وضعیت" VisibleIndex="12">
                    <DataItemTemplate>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/images/icons/Actions-redo-icon2.png" ToolTip='<%# Eval("ghCode") %>' Visible="False" />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نوع درخواست" FieldName="isElhaghieText" VisibleIndex="14">
                    
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ قرارداد تولید" FieldName="ghPriceTolid" VisibleIndex="17">
                    <PropertiesTextEdit DisplayFormatString="n0">
                    <MaskSettings Mask="n0" />
                        </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ قرارداد پشتیبانی" FieldName="ghPricePosh" VisibleIndex="18" >
                    <PropertiesTextEdit DisplayFormatString="n0">
                    <MaskSettings Mask="n0" />
                        </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ الزامات امنیتی" FieldName="PriceSecurity" VisibleIndex="19">
                    <PropertiesTextEdit DisplayFormatString="n0">
                    <MaskSettings Mask="n0" />
                        </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                             
                <dx:GridViewDataTextColumn Caption="نوع قرارداد" VisibleIndex="20">
                    <DataItemTemplate>
                        <asp:Label ID="Label8" runat="server"></asp:Label>
                        <asp:HiddenField ID="h2" runat="server" Value='<%# Eval("isElhaghie") %>' />
                        <asp:HiddenField ID="h3" runat="server" Value='<%# Eval("prId") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="شناسه" FieldName="ghId" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="وضعیت قراردادی" FieldName="StatusBeforeContract" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="PDate" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مهلت تاریخ نامه" FieldName="PDateMohlat" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="واحد متولی" FieldName="vahed" VisibleIndex="2" Width="55px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="3" Width="55px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شرکت" FieldName="peymankar" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نوع پروژه" FieldName="ProjectType" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نوع الحاقیه" FieldName="elType" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="اخرین وضعیت اجرا" FieldName="prProjectStatus" VisibleIndex="170">
                </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="ثبت نامه" VisibleIndex="50" >
                <DataItemTemplate>
                 <asp:ImageButton ID="ImageButtonLetter" runat="server" CommandName="letter" ImageUrl="~/Content/images/icons/letter.png" Width="42px"/>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="73" Caption="thId" FieldName="thId" Visible="false">  
            </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="74" Caption="vahedId" FieldName="vahedId" Visible="false">  
            </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="75" Caption="TechnicalSuvisorId" FieldName="TechnicalSuvisorId" Visible="false">  
            </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center">
                </Row>
            </Styles>
        </dx:aspxgridview>
        <asp:SqlDataSource ID="sourceGharadad" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbGharardad SET ghAct = 0 WHERE (ghId = @ghId)" SelectCommand="Select Gharardad.*, DimDate.PersianStr PDate,DimDateMohlat.PersianStr PDateMohlat
From(
SELECT distinct thProject as prId,tbProjects.prProjectStatus,thIsElhaghie as isElhaghie, Case When thIsElhaghie = 1  Then N'الحاقیه' Else N'پروپزال' End isElhaghieText , prInformation.infTitle as vahed, prInformation_3.infTitle as TechnicalSuvisor,
		prInformation_1.infTitle as peymankar,prInformation_2.infTitle as ProjectType, convert(nvarchar(max), tbProjects.prTitle)as ProjectTitle,
		tbGharardad.ghCode ,Cast(Isnull(tbTarhPishnehadi.gPricePosh,0) as bigint) ghPricePosh ,Cast(Isnull(tbTarhPishnehadi.gPriceTolid,0) as bigint) as ghPriceTolid,PriceSecurity , tbGharardad.ghType ,tbGharardad.ghId
		,thId,prVahed as vahedId,TechnicalSuvisor as TechnicalSuvisorId
		,IsNull(tbElhaghie.elType,'') elType,tbGharardad.ProposalId,Case When ghCode is not Null then N'نهایی' 
			When tbProjectPaper25.paId is null Then N'منتظر پیش نویس' 
			When tbNazar26.nzId is null Then N'منتظر پاسخ استعلام پیش نویس'
			When tbProjectPaper27.paId is not null Then N'منتظر ابلاغ' 
			Else '' End StatusBeforeContract,
	Case When ghCode is not Null then null 
			When tbProjectPaper25.paId is null Then tbProjectPaper20.paShenase 
			When tbNazar26.nzId is null Then tbProjectPaper26.paShenase
			When tbProjectPaper27.paId is not null Then tbProjectPaper27.paShenase 
			Else '' End paShenase,
	Case When ghCode is not Null then null 
			When tbProjectPaper25.paId is null Then tbProjectPaper20.paDate 
			When tbNazar26.nzId is null Then tbProjectPaper26.paDate
			When tbProjectPaper27.paId is not null Then tbProjectPaper27.paDate 
			Else null End paDate,
	Case When ghCode is not Null then null 
			When tbProjectPaper25.paId is null Then DATEADD(day, 14, tbProjectPaper20.paDate) 
			When tbNazar26.nzId is null Then DATEADD(day, 14, tbProjectPaper26.paDate)
			When tbProjectPaper27.paId is not null Then DATEADD(day, 14, tbProjectPaper27.paDate) 
			Else null End paDateMohlat


 from tbGharardad inner Join
 tbProjects On tbGharardad.ghProject = tbProjects.prId inner Join
 tbTarhPishnehadi On tbTarhPishnehadi.thId = tbGharardad.ProposalId Left outer JOIN
 tbElhaghie On tbTarhPishnehadi.ElhaghieId = tbElhaghie.elId Inner Join
 
 prInformation ON tbProjects.prVahed = prInformation.infId INNER JOIN
 prInformation as prInformation_1 ON tbProjects.prPeymankar = prInformation_1.infId INNER JOIN
 prInformation as prInformation_2 ON tbProjects.prProjectType = prInformation_2.infId Left Outer Join
 prInformation as prInformation_3 ON tbProjects.TechnicalSuvisor = prInformation_3.infId Left Outer Join
 (Select * from tbProjectPaper where paType =25 and paAct =1) tbProjectPaper25 On tbProjectPaper25.paProject = tbGharardad.ghId Left Outer Join
 (select * from tbProjectPaper Where paType =26 and paAct =1) tbProjectPaper26 On tbProjectPaper26.paProject = tbGharardad.ghId Left Outer Join
 (Select * from tbNazar where  nzStatus = 195 and nzAct =1) tbNazar26 On tbProjectPaper26.paId = tbNazar26.nzParent Left Outer Join
 (select * from tbProjectPaper Where paType =27 and paAct =1) tbProjectPaper27 On tbProjectPaper27.paProject = tbGharardad.ghId Left Outer Join 
 (select * from tbHeyatNezarat) tbHeyatNezarat On tbHeyatNezarat.ProposalId = tbGharardad.ProposalId Left Outer Join
 (Select * from tbProjectPaper where paType =20 and paAct =1) tbProjectPaper20 On tbProjectPaper20.paProject =  tbHeyatNezarat.heId
 ----Left Outer Join
 --tbProjectPaper On tbProjectPaper.paProject = tbGharardad.ghId 
 where   tbTarhPishnehadi.thAct=1  and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
  )
  Gharardad left outer Join DimDate ON Gharardad.paDate = DimDate.GregorianDate 
			left outer Join DimDate DimDateMohlat ON Gharardad.paDateMohlat = DimDateMohlat.GregorianDate 
">
            <DeleteParameters>
                <asp:Parameter Name="ghId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
        <div align="center" style="padding: 4px">
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton4_Click" />
            <dx:aspxgridviewexporter id="ASPxGridViewExporter1" runat="server" filename="قراردادها" gridviewid="ASPxGridView1" landscape="True">
            </dx:aspxgridviewexporter>
        </div>
        <asp:SqlDataSource ID="sourceSoorat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" InsertCommand="INSERT INTO tbSooratHesab(prId,ProjectName, ProjectGharardad, Nazer1,Nazer2, CompanyName) VALUES (@prId,@ProjectName, @ProjectGharardad, @Nazer1,@Nazer2, @CompanyName)" SelectCommand="SELECT TOP (1) ProjectName, ProjectGharardad, Nazer1, Nazer2, CompanyName, GharardadType, GharardadStart, GharardadEnd, Gharardad, Type, ElhaghieType, OnvanTahvili, MoedTahvili, Price, Vaziat, SoorathesbPrice, DoreErsali, ShomareNamePishnevisSoorathesab, TarikheNamePishnevisSoorathesab, ShenaseNamePishnevisSoorathesab, ShenaseEstelamPishSoorathesabNazer1, TarikheEstelamPishSoorathesabNazer1, MoedZamani1, ShenaseEstelamPishSoorathesabNazer2, TarikheEstelamPishSoorathesabNazer2, MoedZamani2, ShenaseAnswerNazerPishnevis, TarikheAnswerNazerPishnevis, ElamNazarAnswerNazerPishnevis, ShenaseAnswerNazerPishnevis2, TarikheAnswerNazerPishnevis2, ElamNazarAnswerNazerPishnevis2, ShenaseErsalTaeedNazer, TarikheErsalTaeedNazer, ShenaseErsalAdameTaeedNazer, TarikheErsalAdameTaeedNazer, MoedZamani3, ShenaseDaryaftAnswerPishnevis, TarikheDaryaftAnswerPishnevis, ShenaseEstelamMojadadNazer1, TarikheEstelamMojadadNazer1, MoedZamani4, ShenaseEstelamMojadadNazer2, TarikheEstelamMojadadNazer2, MoedZamani5, ShenaseAnswerMojadadNazer1, TarikheAnswerMojadadNazer1, ElamNazarAnswerMojadadNazer1, ShenaseAnswerMojadadNazer2, TarikheAnswerMojadadNazer2, ElamNazarAnswerMojadadNazer2, ShenaseNameSooratHesab, TarikhNameSooratHesab, YearSooratHesab, SomareSoorathesab, ShenaseSoorathesab, Vosool, ShenaseEstelamVahed, TarikheEstelamVahed, MoedEstelamVahed, ShenaseDaryaftAnswerNazer1, TarikheDaryaftAnswerNazer1, ElamNazarDaryaftAnswerNazer1, ShenaseDaryaftAnswerNazer2, TarikheDaryaftAnswerNazer2, ElamNazarDaryaftAnswerNazer2, SooratJalase, TarikheSooratJalase, ShenaseErsalBeSherkat, TarikheErsalBeSherkat, ShenaseDaryaftAnswerSHerkat, DateDaryaftAnswerSHerkat, EstelamMojadadVahed, EstelamMojadadVahedTarikh, ShenaseDaryaftMojaddVahed, VahedDaryaftMojaddVahed, ElamNazarDaryaftMojaddVahed, ShenaseErsalTadarokat, TarikheErsalTadarokat, ShenaseOdatTadarokat, TarikheOdatTadarokat, ShenaseErsalAzTadarokat, TarikheErsalAzTadarokat, ShenaseAnswerSherkatTadarokat, TarikheAnswerSherkatTadarokat, ShenaseErsalMojadad, TarikheErsalMojadad, shenasePeigiriEstelam, TarikhePeigiriEstelam, ShenaseErsalMali, TarikheErsalMali, BodyPapers, Body, id, step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13 FROM tbSooratHesab">
            <InsertParameters>
                <asp:Parameter Name="ProjectName" />
                <asp:Parameter Name="ProjectGharardad" />
                <asp:Parameter Name="Nazer1" />
                <asp:Parameter Name="Nazer2" />
                <asp:Parameter Name="CompanyName" />
                <asp:Parameter Name="prId" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)"></asp:SqlDataSource>
        <telerik:radnotification id="RadNotification1" runat="server" animation="Fade" font-names="vazir" font-size="15px" skin="Sunset">
    </telerik:radnotification>
        <telerik:radwindowmanager id="RadWindowManager1" runat="server" animation="Fade" behaviors="Close" skin="Sunset">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1">
                </telerik:RadWindow>
            </Windows>
        </telerik:radwindowmanager>
    </div>
    <script>
        $(document).ready(function () {
            setInterval(function () {
                $('#ContentPlaceHolder1_ASPxGridView1_DXMainTable tbody tr td:nth-child(17)').each(function (index, td) {
                    console.log(index);
                    var sib = $(this).parent().find('td:nth-child(18)')[0];
                    var sib2 = $(this).parent().find('td:nth-child(19)')[0];
                    var a = parseFloat(td.innerText.replace(/,/g, ''));
                    var b = parseFloat(sib.innerText.replace(/,/g, ''));
                    var d = isNaN(parseFloat(sib2.innerText.replace(/,/g, ''))) ? 0 : parseFloat(sib2.innerText.replace(/,/g, ''));

                    var c = a + b;

                    // console.log(d);
                    td.title = c.toLocaleString();
                    sib.title = c.toLocaleString();
                    sib2.title = c.toLocaleString();
                });
            }, 3000);

            $(document).tooltip();
        });
    </script>
</asp:Content>
