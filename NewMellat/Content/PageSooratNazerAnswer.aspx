<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageSooratNazerAnswer.aspx.cs" Inherits="NewMellat.Content.PageSooratNazerAnswer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">


        function loadDoc(parent) {

            var oWnd = radopen("PageSooratNazerPaper.aspx?project=" + parent + "&Type=1003", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc2(parent) {

            var oWnd = radopen("PageSooratNazerPaper.aspx?Project=" + parent + "&Type=1004", "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }



    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger">
        <dx:ASPxGridView runat="server" RightToLeft="True" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%" EnableTheming="True" ID="ASPxGridView1" DataSourceID="sourceNazer" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" KeyFieldName="id" OnHtmlRowCreated="ASPxGridView1_HtmlRowCreated" OnPageIndexChanged="ASPxGridView1_PageIndexChanged" Font-Names="vazir">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" HorizontalScrollBarMode="Auto" />
            <SettingsBehavior EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <ClearFilterButton ButtonType="Image">
                    <Image IconID="filter_clearfilter_16x16">
                    </Image>
                </ClearFilterButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا ..." />
            <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات وارد نمایید" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True" Width="20px"></dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="شماره قرارداد" VisibleIndex="3" FieldName="ProjectGharardad">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="عنوان تحویلی" VisibleIndex="6" FieldName="OnvanTahvili">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="مبلغ" VisibleIndex="7" FieldName="Price">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="8" Caption="شناسه نامه استعلام" FieldName="paShenase">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه استعلام" VisibleIndex="9" FieldName="paDate">
                    <Settings AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ ناظر 1" VisibleIndex="10" Width="65px">
                    <Settings AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/Actions-tab-new-icon.png" NavigateUrl='<%# Eval("Id", "~/content/PageSooratNazerPaper.aspx?project={0}&type=1003") %>' Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Nazer1") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نام پروژه" VisibleIndex="2" FieldName="ProjectName" Width="200px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر 1" FieldName="Nazer1" VisibleIndex="4" Width="70px">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر 2" FieldName="Nazer2" VisibleIndex="5" Width="70px">
                    <PropertiesComboBox DataSourceID="sourceInfo" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ ناظر 2" VisibleIndex="11" Width="65px">
                    <Settings AutoFilterCondition="Contains" />
                    <DataItemTemplate>

                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/Actions-tab-new-icon.png" NavigateUrl='<%# Eval("Id", "~/content/PageSooratNazerPaper.aspx?project={0}&type=1004") %>' Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("Nazer2") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پیگیری" VisibleIndex="12" Width="45px">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("id", "~/content/pagesooratpaper.aspx?project={0}&type=1050") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="کد سیستمی" FieldName="id" VisibleIndex="1" Width="70px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="شرکت" FieldName="CompanyName" VisibleIndex="13">
                    <PropertiesComboBox AnimationType="Fade" DataSourceID="sourcePeymankar" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="مهلت تحویل" VisibleIndex="14" FieldName="paDate2">
                    <DataItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("paDate2") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پاسخ" VisibleIndex="15" Width="40px">
                    <DataItemTemplate>
                        <asp:Image ID="img1" runat="server" ImageUrl="~/Content/images/icons/3.png" />
                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("id") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نامه های پیگیری" VisibleIndex="16" Width="135px">
                    <DataItemTemplate>
                        <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Eval("id") %>' />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="paShenase" HeaderText="شناسه" SortExpression="paShenase">
                                <HeaderStyle Width="75px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="تاریخ" SortExpression="paDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("paDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("paDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle Font-Names="vazir" />
                            <RowStyle Font-Names="vazir" HorizontalAlign="Center" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT paShenase, paDate, paType FROM tbProjectPaper WHERE (paAct = 1) AND (paProject = @project) AND (paType = 1050)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField4" DefaultValue="" Name="project" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>

            <Styles>
                <Header HorizontalAlign="Center" Font-Names="vazir" Font-Size="13px"></Header>
                <Row Font-Names="vazir">
                </Row>
            </Styles>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="sourceNazer" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand= "SELECT tbSooratPishNevis.pishId, tbSooratPishNevis.pishPrice, tbSooratPishNevis.pishPricePlus, tbSooratPishNevis.pishSooratHesab, tbSooratPishNevis.pishHours, tbSooratPishNevis.pishDore,  
                         tbSooratPishNevis.pishType, tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.MoedTahvili, tbSooratHesab.Price, tbSooratHesab.OnvanTahvili, tbSooratHesab.Nazer1, 
                         tbSooratHesab.Nazer2, tbSooratHesab.id, tbSooratHesab.CompanyName,tbSooratHesab.Price,
						  (select top 1 tbProjectPaper.paShenase from tbProjectPaper where paProject=tbSooratHesab.id order by tbProjectPaper.paId desc) as paShenase,(SELECT        TOP (1) DimDate.PersianStr
                               FROM            tbProjectPaper INNER JOIN
                                                         DimDate ON DATEADD(day, 14, tbProjectPaper.paDate) = DimDate.GregorianDate
                               WHERE        (tbProjectPaper.paProject = tbSooratHesab.id) order by tbProjectPaper.paId desc) AS paDate2,(SELECT        TOP (1) DimDate.PersianStr
                               FROM            tbProjectPaper INNER JOIN
                                                         DimDate ON tbProjectPaper.paDate = DimDate.GregorianDate
                               WHERE        (tbProjectPaper.paProject = tbSooratHesab.id) order by tbProjectPaper.paId desc) as paDate
FROM tbSooratPishNevis INNER JOIN tbSooratHesab ON tbSooratPishNevis.pishProject = tbSooratHesab.id 
                         left JOIN  tbProjects ON tbSooratHesab.prId = tbProjects.prId
						 Left Outer jOIN  (Select Max(paShenase) paShenase,Max(paDate) paDate,DATEADD(day,14,Max(paDate)) paDate2,paProject From  tbProjectPaper Where paType = 1001 Group by paProject) PPaper_1001 On PPaper_1001.paProject = tbSooratHesab.id
						 Left Outer jOIN  (Select Max(paShenase) paShenase,Max(paDate) paDate,DATEADD(day,14,Max(paDate)) paDate2,paProject From  tbProjectPaper Where paType = 1002 Group by paProject) PPaper_1002 On PPaper_1002.paProject = tbSooratHesab.id
						 Left Outer jOIN  (Select Max(paShenase) paShenase,Max(paDate) paDate,DATEADD(day,14,Max(paDate)) paDate2,paProject From  tbProjectPaper Where paType = 1050 Group by paProject) PPaper_1050 On PPaper_1050.paProject = tbSooratHesab.id
						 Left Outer jOIN  DimDate as DimDate_1001 on PPaper_1001.paDate = DimDate_1001.GregorianDate 
						 Left Outer jOIN  DimDate as DimDate_1002 on PPaper_1002.paDate = DimDate_1002.GregorianDate
						 Left Outer jOIN  DimDate as DimDate_1050 on PPaper_1001.paDate = DimDate_1050.GregorianDate
						 Left Outer jOIN  DimDate as DimDate_1001_2 on PPaper_1001.paDate2 = DimDate_1001_2.GregorianDate 
						 Left Outer jOIN  DimDate as DimDate_1002_2 on PPaper_1002.paDate2 = DimDate_1002_2.GregorianDate
						 Left Outer jOIN  DimDate as DimDate_1050_2 on PPaper_1001.paDate2 = DimDate_1050_2.GregorianDate   
WHERE        (tbSooratPishNevis.pishAct = 1) AND (tbSooratPishNevis.pishIsNazer = 1)  and tbSooratHesab.step1 =1 and tbSooratHesab.step2 =1 and  tbSooratHesab.step3 = 0  and tbSooratHesab.step4 =0 and tbSooratHesab.step5 =0 and  tbSooratHesab.step6 = 0 and  id not in (select paProject from tbProjectPaper where paProject=tbSooratHesab.id and paAct=1 and paType in (1003,1004) and paEdare=1 )

 and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) 
"><SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
        <telerik:radwindowmanager id="RadWindowManager1" runat="server" animation="Fade" behaviors="Close" skin="Sunset">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
            </Windows>
        </telerik:radwindowmanager>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="لیست پاسخ ناظر" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>

    </div>
    <div align="center" style="padding: 5px">
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton3_Click" />
    </div>
</asp:Content>
