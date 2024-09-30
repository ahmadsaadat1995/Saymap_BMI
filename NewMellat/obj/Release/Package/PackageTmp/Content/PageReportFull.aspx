<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageReportFull.aspx.cs" Inherits="NewMellat.Content.PageReportFull" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sourceProjects" EnableTheming="True" KeyFieldName="prId" RightToLeft="True" Theme="SoftOrange" Font-Names="b yekan">
            <SettingsDetail ShowDetailRow="True" />
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sourceEstelam0" EnableTheming="True" KeyFieldName="esId" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Theme="Aqua" Caption="استعلام واحد متولی" Visible="False" Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="esId" ReadOnly="True" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="esProject" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="esAct" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="esVahed" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="sourceKhobregan" EnableTheming="True" KeyFieldName="khId" OnBeforePerformDataSelect="ASPxGridView3_BeforePerformDataSelect" Theme="Aqua" Caption="طرح در جلسه خبرگان" Width="100%">
                        <SettingsDetail ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <div style="padding: 9px">
                                    <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" Caption="خبرگان مصوب شده" DataSourceID="sourceKhobregamMosavab" KeyFieldName="mosId" OnBeforePerformDataSelect="ASPxGridView4_BeforePerformDataSelect" Theme="Youthful" Width="100%">
                                        <SettingsDetail ShowDetailRow="True" />
                                        <SettingsEditing Mode="Batch">
                                        </SettingsEditing>
                                        <SettingsCommandButton>
                                            <NewButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/add-icon.png">
                                                </Image>
                                            </NewButton>
                                            <UpdateButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/Actions-document-save-icon.png">
                                                </Image>
                                            </UpdateButton>
                                            <CancelButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/Close-2-icon.png">
                                                </Image>
                                            </CancelButton>
                                        </SettingsCommandButton>
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="شناسه نامه ابلاغ" FieldName="mosShenase" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="شماره نامه ابلاغ" FieldName="mosNumber" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn Caption="تاریخ نامه ابلاغ" FieldName="mosDate" VisibleIndex="5">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataDateColumn Caption="تاریخ ارسال پروپوزال" FieldName="mosErsalDate" VisibleIndex="6">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataDateColumn Caption="تاریخ عملیاتی شدن پروپوزال" FieldName="mosAmaliatiDate" VisibleIndex="7">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn Caption="توضیحات" FieldName="mosbody" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="mosType" Visible="False" VisibleIndex="9">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="mosPropozal" Visible="False" VisibleIndex="10">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="mosOlaviat" VisibleIndex="11">
                                                <PropertiesComboBox DataSourceID="sourceOlaviat" TextField="infTitle" ValueField="infId">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </div>
                                <div style="padding: 9px">
                                    <dx:ASPxGridView ID="ASPxGridView5" runat="server" AutoGenerateColumns="False" Caption="لیست ردشدگان" DataSourceID="sourceKhobreganRad" EnableTheming="True" KeyFieldName="paId" OnBeforePerformDataSelect="ASPxGridView5_BeforePerformDataSelect" Theme="PlasticBlue" Width="100%">
                                        <SettingsCommandButton>
                                            <NewButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/add-icon.png">
                                                </Image>
                                            </NewButton>
                                            <UpdateButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/Actions-document-save-icon.png">
                                                </Image>
                                            </UpdateButton>
                                            <CancelButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/Close-2-icon.png">
                                                </Image>
                                            </CancelButton>
                                        </SettingsCommandButton>
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="شماره نامه" FieldName="paNumber" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="paDate" VisibleIndex="3">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn Caption="توضیحات" FieldName="paBody" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </div>
                                <div style="padding: 9px">
                                    <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" Caption="لیست متوقفین" DataSourceID="sourceKhobreganTavaghof" EnableTheming="True" KeyFieldName="paId" OnBeforePerformDataSelect="ASPxGridView6_BeforePerformDataSelect" Theme="SoftOrange" Width="100%">
                                        <SettingsCommandButton>
                                            <NewButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/add-icon.png">
                                                </Image>
                                            </NewButton>
                                            <UpdateButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/Actions-document-save-icon.png">
                                                </Image>
                                            </UpdateButton>
                                            <CancelButton ButtonType="Image">
                                                <Image Url="~/Content/images/icons/Close-2-icon.png">
                                                </Image>
                                            </CancelButton>
                                        </SettingsCommandButton>
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="شماره نامه" FieldName="paNumber" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn Caption="تاریخ نامه" FieldName="paDate" VisibleIndex="3">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn Caption="توضیحات" FieldName="paBody" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </div>
                                <div>
                                </div>
                                <div>
                                </div>
                            </DetailRow>
                        </Templates>
                        <SettingsEditing Mode="Batch">
                        </SettingsEditing>
                        <SettingsCommandButton>
                            <NewButton ButtonType="Image">
                                <Image Url="~/Content/images/icons/add-icon.png">
                                </Image>
                            </NewButton>
                            <UpdateButton ButtonType="Image">
                                <Image Url="~/Content/images/icons/Actions-document-save-icon.png">
                                </Image>
                            </UpdateButton>
                            <CancelButton ButtonType="Image">
                                <Image Url="~/Content/images/icons/Close-2-icon.png">
                                </Image>
                            </CancelButton>
                        </SettingsCommandButton>
                        <SettingsText EmptyDataRow="اطلاعات طرح در خبرگان موجود نمی باشد" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="khId" ReadOnly="True" VisibleIndex="1" Caption="کد سیستمی" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="khProject" VisibleIndex="2" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="khJalaseNumber" VisibleIndex="3" Caption="شماره جلسه">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="khJalaseDate" VisibleIndex="4" Caption="تاریخ جلسه">
                            </dx:GridViewDataDateColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>
            <SettingsPager PageSize="30">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior EnableRowHotTrack="True" />
            <SettingsSearchPanel Visible="True" />
            <SettingsText EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="درج متن جهت جستجو" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="prId" ReadOnly="True" VisibleIndex="1" Caption="کد سیستمی پروژه">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="prTitle" VisibleIndex="2" Caption="عنوان پروژه">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="status1" VisibleIndex="8" Caption="وضعیت1">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="status2" VisibleIndex="9" Caption="وضعیت2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="status3" VisibleIndex="10" Caption="وضعیت پروپوزال">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد" FieldName="prVahed" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="sourceVahed" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="sourceProjectType" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="sourceSanad" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="prOlaviat" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="sourceOlaviat" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="sourcePeymankar" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sourceEstelam0" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbEstelamVahed SET esAct = 1 WHERE (esId = @esId)" InsertCommand="INSERT INTO tbEstelamVahed(esProject, esAct, esVahed) VALUES (@esProject, 1, @esVahed)
SELECT @esId = SCOPE_IDENTITY()" SelectCommand="SELECT esId, esProject, esAct, esVahed FROM tbEstelamVahed WHERE (esAct = 1) AND (esProject = @prId) ORDER BY esId DESC">
            <DeleteParameters>
                <asp:Parameter Name="esId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="drpProjects" Name="esProject" PropertyName="Value" />
                <asp:Parameter Name="esVahed" />
                <asp:Parameter Name="esId" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="prId" SessionField="prId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceKhobregan" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbKhbregan SET khAct = 0 WHERE (khId = @khId)" InsertCommand="INSERT INTO tbKhbregan(khProject, khAct, khJalaseNumber, khJalaseDate) VALUES (@khProject, 1, @khJalaseNumber, @khJalaseDate)" SelectCommand="SELECT khId, khProject, khAct, khJalaseNumber, khJalaseDate, khStatus FROM tbKhbregan WHERE (khAct = 1) AND (khProject = @prId) ORDER BY khId DESC" UpdateCommand="UPDATE tbKhbregan SET khJalaseNumber = @khJalaseNumber, khJalaseDate = @khJalaseDate WHERE (khId = @khId)">
            <DeleteParameters>
                <asp:Parameter Name="khId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="khProject" SessionField="prId" />
                <asp:Parameter Name="khJalaseNumber" />
                <asp:Parameter Name="khJalaseDate" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="prId" SessionField="prId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="khJalaseNumber" />
                <asp:Parameter Name="khJalaseDate" />
                <asp:Parameter Name="khId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prId, prTitle, prVahed, prProjectType, prSanadType, prOlaviat, prPeymankar, status1, status2, status3, prStatus, prISEstelam, prIsMohtava, irIsAnalyz, prIsTarh FROM tbProjects WHERE (prAct = 1)"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="infType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceSanad" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceOlaviat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceKhobreganRad" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbProjectPaper.* FROM tbProjectPaper WHERE (paAct = 1) AND (paType = 3) AND (paProject = @khId)" InsertCommand="INSERT INTO tbProjectPaper(paShenase, paNumber, paDate, paProject, paAct, paType, paBody) VALUES (@paShenase, @paNumber, @paDate, @khId, 1, 3, @paBody)" UpdateCommand="UPDATE tbProjectPaper SET paShenase = @paShenase, paNumber = @paNumber, paDate = @paDate, paBody = @paBody WHERE (paId = @paId)">
            <InsertParameters>
                <asp:Parameter Name="paShenase" />
                <asp:Parameter Name="paNumber" />
                <asp:Parameter Name="paDate" />
                <asp:SessionParameter Name="khId" SessionField="khId" />
                <asp:Parameter Name="paBody" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="khId" SessionField="khId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="paShenase" />
                <asp:Parameter Name="paNumber" />
                <asp:Parameter Name="paDate" />
                <asp:Parameter Name="paBody" />
                <asp:Parameter Name="paId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceKhobreganTavaghof" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbProjectPaper.*, paProject AS Expr1 FROM tbProjectPaper WHERE (paAct = 1) AND (paType = 4) AND (paProject = @khId)">
            <SelectParameters>
                <asp:SessionParameter Name="khId" SessionField="khId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceKhobregamMosavab" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT mosId, mosAct, mosKhob, mosShenase, mosNumber, mosDate, mosErsalDate, mosAmaliatiDate, mosbody, mosType, mosPropozal, mosOlaviat FROM tbKhobreganMosavab WHERE (mosAct = 1) AND (mosKhob = @khId)" InsertCommand="INSERT INTO tbKhobreganMosavab(mosAct, mosKhob, mosShenase, mosNumber, mosDate, mosErsalDate, mosAmaliatiDate, mosbody, mosOlaviat, mosType) VALUES (1, @khId, @mosShenase, @mosNumber, @mosDate, @mosErsalDate, @mosAmaliatiDate, @mosbody, @mosOlaviat, 1)" UpdateCommand="UPDATE tbKhobreganMosavab SET mosKhob = @mosKhob, mosShenase = @mosShenase, mosNumber = @mosNumber, mosDate = @mosDate, mosErsalDate = @mosErsalDate, mosAmaliatiDate = @mosAmaliatiDate, mosbody = @mosbody, mosOlaviat = @mosOlaviat WHERE (mosId = @mosId)">
            <InsertParameters>
                <asp:SessionParameter Name="khId" SessionField="khId" />
                <asp:Parameter Name="mosShenase" />
                <asp:Parameter Name="mosNumber" />
                <asp:Parameter Name="mosDate" />
                <asp:Parameter Name="mosErsalDate" />
                <asp:Parameter Name="mosAmaliatiDate" />
                <asp:Parameter Name="mosbody" />
                <asp:Parameter Name="mosOlaviat" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="khId" SessionField="khId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="mosKhob" />
                <asp:Parameter Name="mosShenase" />
                <asp:Parameter Name="mosNumber" />
                <asp:Parameter Name="mosDate" />
                <asp:Parameter Name="mosErsalDate" />
                <asp:Parameter Name="mosAmaliatiDate" />
                <asp:Parameter Name="mosbody" />
                <asp:Parameter Name="mosOlaviat" />
                <asp:Parameter Name="khId" />
                <asp:Parameter Name="mosId" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div>
    </div>
</asp:Content>
