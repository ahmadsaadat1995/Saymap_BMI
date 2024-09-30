<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageSooratErsalSHerkat.aspx.cs" Inherits="NewMellat.Content.PageSooratErsalSHerkat" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">


        function loadDoc(parent) {

            var oWnd = radopen("PageSooratPaper.aspx?project=" + parent + "&Type=1005", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger">
    <dx:ASPxGridView runat="server" RightToLeft="True" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%" EnableTheming="True" ID="ASPxGridView1" DataSourceID="sourceInfo" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Font-Names="vazir" OnRowCommand="ASPxGridView1_RowCommand">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior EnableRowHotTrack="True" />
        <SettingsCommandButton>
            <ClearFilterButton ButtonType="Image">
                <Image IconID="filter_clearfilter_16x16">
                </Image>
            </ClearFilterButton>
        </SettingsCommandButton>
        <SettingsSearchPanel Visible="True" />
        <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات وارد نمایید" SearchPanelEditorNullText="جستجوی اطلاعات" />
        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="شماره قرارداد" VisibleIndex="2" FieldName="ProjectGharardad">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="عنوان تحویلی" VisibleIndex="5" FieldName="OnvanTahvili">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="مبلغ" VisibleIndex="6" FieldName="Price">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="7" Caption="شناسه نامه اعلام نظر ناظر" FieldName="paShenase" Width="50px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="تاریخ نامه  اعلام نظر ناظر" VisibleIndex="8" FieldName="paDate" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ارسال به شرکت" VisibleIndex="9">
                <DataItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/message-bubble-send-icon.png" NavigateUrl='<%# Eval("pishId","~/content/PageSooratPaper.aspx?project={0}&type=1005") %>' Target="_blank"></asp:HyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="ثبت نامه" VisibleIndex="10" >
                <DataItemTemplate>
                 <asp:ImageButton ID="ImageButtonLetter" runat="server" CommandName="letter" CommandArgument='<%# Container.DataItem %>'  ImageUrl="~/Content/images/icons/letter.png" Width="42px"/>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="نام پروژه" VisibleIndex="1" FieldName="ProjectName" Width="290px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="ناظر 1" FieldName="Nazer1" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="sourceInfo0" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="ناظر2" FieldName="Nazer2" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="sourceInfo0" TextField="infTitle" ValueField="infId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
           
            <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="71" Caption="نام ناظر2" FieldName="Nazer2Name" Visible="false">  </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="72" Caption="companyName" FieldName="companyName" Visible="false">  </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="73" Caption="Nazer1Name" FieldName="Nazer1Name" Visible="false">  </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="74" Caption="pishDore" FieldName="pishDore" Visible="false">  </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="75" Caption="paType" FieldName="paType" Visible="false">  </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="76" Caption="PaNumber" FieldName="paNumber" Visible="false">  </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn ShowInCustomizationForm="False" VisibleIndex="77" Caption="Gharardad" FieldName="Gharardad" Visible="false">  </dx:GridViewDataTextColumn>
              

        </Columns>
        <Styles>
            <Header HorizontalAlign="Center" Font-Names="vazir" Font-Size="13px">
            </Header>
            <Row Font-Names="vazir">
            </Row>
        </Styles>
    </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="لیست ارسال به شرکت" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>

    </div>
    <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbSooratHesab.ProjectName, tbSooratHesab.ProjectGharardad, tbSooratHesab.id, tbSooratHesab.Nazer1, tbSooratHesab.Nazer2, tbSooratHesab.OnvanTahvili,tbSooratHesab.Price, tbProjectPaper.paShenase,tbProjectPaper.paNumber , DimDate.PersianStr as paDate, tbProjectPaper.paAct, tbSooratPishNevis.pishId, tbProjectPaper.paType,tbSooratHesab.Gharardad,
		 prInformation.infTitle as companyName,n1.infTitle as Nazer1Name,n2.infTitle as Nazer2Name,tbSooratPishNevis.pishDore
            FROM tbSooratHesab INNER JOIN tbSooratPishNevis ON tbSooratHesab.id = tbSooratPishNevis.pishProject 
                                left JOIN  tbProjects ON tbSooratHesab.prId = tbProjects.prId
                               INNER JOIN tbProjectPaper ON tbSooratHesab.id = tbProjectPaper.paProject
							   inner Join prInformation on tbSooratHesab .CompanyName=prInformation.infId 
                               left Join prInformation n1 on tbSooratHesab .Nazer1=n1.infId 
							   left Join prInformation n2 on tbSooratHesab .Nazer2=n2.infId
                                Left  Join DimDate On DimDate.GregorianDate = tbProjectPaper.paDate 
            WHERE (tbProjectPaper.paType IN (1003, 1004)) AND (tbProjectPaper.paAct = 1) AND (tbSooratPishNevis.pishAct = 1) AND (tbProjectPaper.paEdare = 2) 
        and step4=0  and step5=0 and pishId not in (select tbProjectPaper.paProject from tbProjectPaper where paType=1005 and paAct=1  and pastatus=1)  and paid=(select top 1 paid from tbProjectPaper where paType in (1003,1004) and paAct=1 and paProject=tbSooratHesab.id order by paId desc) 
        and ((prVahed IN (SELECT prProject  FROM tbAdminProjects WHERE (prType = 3)  AND (prCode = @prCode)  )) 
		OR(TechnicalSuvisor IN (SELECT prProject  FROM tbAdminProjects  WHERE (prType = 3) AND (prCode = @prCode) ))) 
AND (prPeymankar IN (SELECT prProject FROM tbAdminProjects AS tbAdminProjects_1 WHERE (prType = 1)  AND (prCode = @prCode) )) ">
        <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
</asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo0" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT * FROM [prInformation]"></asp:SqlDataSource>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Animation="Fade" Behaviors="Close" Skin="Sunset">
        <Windows>
            <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
            </telerik:RadWindow>
            <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <div align="center" style="padding: 5px">
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton3_Click" />
    </div>
</asp:Content>
