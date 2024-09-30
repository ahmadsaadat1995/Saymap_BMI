<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="PageProjectList.aspx.cs" inherits="NewMellat.Content.PageProjectList" %>

<%@ register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function loadDoc(parent) {

            var oWnd = radopen("PageAttach.aspx?Parent=" + parent + "&Type=1", "RadWindow1");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }


        function loadDoc2(parent) {

            var oWnd = radopen("Pagepages.aspx?Project=" + parent + "&Type=1", "RadWindow2");
            oWnd.setSize(910, 500);
            oWnd.Center();
        }
        function loadDoc3(parent) {

            var oWnd = radopen("PageDiagram.aspx?id=" + parent, "RadWindow1");
            oWnd.setSize(950, 600);
            oWnd.Center();
        }


        function loadDoc4(parent) {

            var oWnd = radopen("pageBody.aspx?id=" + parent, "RadWindow3");
            oWnd.setSize(500, 250);
            oWnd.Center();
        }
        function loadDoc5(parent) {

            var oWnd = radopen("pageFinalize.aspx?id=" + parent, "RadWindow3");
            oWnd.setSize(800, 400);
            oWnd.Center();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-danger" align="center">
        <dx:aspxcheckboxlist id="chkColumns" runat="server" font-names="vazir" repeatcolumns="5" righttoleft="True" theme="SoftOrange" valuetype="System.String" width="100%">
            <Border BorderStyle="None" />
        </dx:aspxcheckboxlist>

    </div>
    <div class="box box-warning" align="center" style="padding: 2px">

        <table align="center" cellpadding="2" cellspacing="1">
            <tr>
                <td>
                    <asp:ImageButton ID="ImageButton4" runat="server" OnClick="ImageButton4_Click" ImageUrl="~/Content/images/refresh-icon.png" ToolTip="لود مجدد" /></td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/images/Select-icon.png" OnClick="ImageButton1_Click" ToolTip="انتخاب همه" />

                </td>



            </tr>
        </table>

    </div>
    <div class="box box-danger">
        <dx:aspxgridview id="ASPxGridView1" runat="server" theme="Office2010Silver" autogeneratecolumns="False" datasourceid="sourceProjects" keyfieldname="prId" righttoleft="True" width="100%" onhtmldatacellprepared="ASPxGridView1_HtmlDataCellPrepared" oncommandbuttoninitialize="ASPxGridView1_CommandButtonInitialize" onhtmlrowcreated="ASPxGridView1_HtmlRowCreated" ondatabound="ASPxGridView1_DataBound" onpageindexchanged="ASPxGridView1_PageIndexChanged" onprocesscolumnautofilter="ASPxGridView1_ProcessColumnAutoFilter" font-names="vazir">
            <SettingsEditing Mode="EditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" HorizontalScrollBarMode="Auto" ShowFilterRowMenu="True" />
            <SettingsBehavior ConfirmDelete="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <ClearFilterButton ButtonType="Image">
                    <Image IconID="filter_clearfilter_16x16">
                    </Image>
                </ClearFilterButton>
                <UpdateButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Actions-document-save-icon.png">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </CancelButton>
                <EditButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/edit-icon.png">
                    </Image>
                </EditButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="در حال اجرا..." />
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" GroupPanel="ستون مورد نظر جهت گروه بندی اطلاعات را وارد نمایید" SearchPanelEditorNullText="متن مورد جستجو را وارد نمایید" />
     <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" VisibleIndex="0" ShowEditButton="True" Caption="ویرایش">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="شماره شناسایی پروژه " FieldName="prFinalCode" ReadOnly="True" VisibleIndex="1" Width="150px">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان پروژه" FieldName="prTitle" VisibleIndex="2" Width="250px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="تاریخ ثبت" FieldName="prRegDate" VisibleIndex="3" Visible="False">
                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("prRegDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="کاربر ثبت کننده" FieldName="prRegUser" VisibleIndex="4" Visible="False">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="واحد متولی" FieldName="prVahed" VisibleIndex="5" Width="150px">
                    <PropertiesComboBox DataSourceID="sourceVahed" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="ناظر فنی" FieldName="TechnicalSuvisor" VisibleIndex="6" Width="150px">
                    <PropertiesComboBox DataSourceID="sourceVahed" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نوع پروژه" FieldName="prProjectType" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="sourceProjectType" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="نوع سند" FieldName="prSanadType" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="sourceSanad0" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="اولویت" FieldName="prOlaviat" VisibleIndex="9">
                    <PropertiesComboBox DataSourceID="sourceOlaviat" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="پیمانکار" FieldName="prPeymankar" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="sourcePeymankar" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ضمایم" VisibleIndex="11" ShowInCustomizationForm="False">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" ImageUrl="~/Content/images/icons/attachment-icon24.png" NavigateUrl='<%# Eval("prId","~/content/PageAttach.aspx?Parent={0}") %>'></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نامه ها" VisibleIndex="12" ShowInCustomizationForm="False">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("prId","~/content/PagePages.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="13" ShowInCustomizationForm="False" Caption="گردش کار">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Content/images/icons/diagram-icon.png" NavigateUrl='<%# Eval("prId","~/content/PageDiagram.aspx?id={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="توضیحات" VisibleIndex="14" ShowInCustomizationForm="False">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Content/images/icons/pencil-red-icon.png" NavigateUrl='<%# Eval("prId","~/content/pageBody.aspx?id={0}") %>' Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("prVahed") %>' />
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("prPeymankar") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شناسه نامه" FieldName="paShenase" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شماره نامه" FieldName="paNumber" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ نامه" FieldName="paDate" VisibleIndex="17">
                    <DataItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="آخرین وضعیت اجرا" FieldName="prProjectStatus" VisibleIndex="18">
                    <PropertiesComboBox DataSourceID="sourceLastStatus" TextField="infTitle" ValueField="infTitle">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="خلاصه درخواست" FieldName="prMainBody" VisibleIndex="19" Width="185px">
                    <Settings AutoFilterCondition="Contains" />
                    <DataItemTemplate>
                        <dx:ASPxMemo ID="ASPxMemo1" runat="server" EnableTheming="True" Height="60px" ReadOnly="True" RightToLeft="True" Text='<%# Eval("prMainBody") %>' Theme="SoftOrange" Width="160px">
                        </dx:ASPxMemo>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption=" مدیر پروژه" FieldName="prProjectManager" VisibleIndex="20">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شروع قرارداد تولید" VisibleIndex="21" FieldName="GharardadStartTolid" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پایان قرارداد تولید" FieldName="GharardadEndTolid" VisibleIndex="22" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شروع قرارداد پشتیبانی" VisibleIndex="23" FieldName="GharardadStartPosh" Width="125px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="پایان قرارداد پشتیبانی" FieldName="GharardadEndPosh" VisibleIndex="24" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان تحویل تولید" VisibleIndex="25" Width="120px">
                    <DataItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("prId") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#006600" GridLines="None" HorizontalAlign="Center" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="عنوان تحویل" SortExpression="OnvanTahvili">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OnvanTahvili") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div align="center">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("OnvanTahvili") %>'></asp:Label>
                                        </div>
                                        <div align="center" style="padding: 1px">
                                            ...............
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT  tbSooratHesab.OnvanTahvili, tbSooratHesab.MoedTahvili, tbSooratHesab.Price
FROM            tbSooratHesab INNER JOIN
                         tbGharardad ON tbSooratHesab.ProjectGharardad = tbGharardad.ghCode
WHERE        (tbGharardad.ghProject = @ghProject) AND (tbSooratHesab.Gharardad LIKE N'%تولید%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="ghProject" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ تولید" VisibleIndex="26" Width="120px">
                    <DataItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("prId") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#006600" GridLines="None" HorizontalAlign="Center" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="مبلغ" SortExpression="Price">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div align="center">
                                            <div align="right">
                                                <table align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="90">
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-right: 5px; padding-left: 5px" width="30">
                                                            <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Checked='<%# Bind("srCheck") %>' CheckState="Unchecked" ReadOnly="True" Theme="SoftOrange">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div align="center" style="padding: 1px">
                                            <asp:Label ID="Label7" runat="server" Text="..............."></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbSooratHesab.OnvanTahvili, tbSooratHesab.MoedTahvili, tbSooratHesab.Price, tbSooratHesab.srCheck FROM tbSooratHesab INNER JOIN tbGharardad ON tbSooratHesab.ProjectGharardad = tbGharardad.ghCode WHERE (tbGharardad.ghProject = @ghProject) AND (tbSooratHesab.Gharardad LIKE N'%تولید%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="ghProject" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="موعد تحویل تولید" VisibleIndex="27" Width="120px">
                    <DataItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("prId") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#006600" GridLines="None" HorizontalAlign="Center" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="موعد تحویل" SortExpression="MoedTahvili">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MoedTahvili") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div align="center">
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("MoedTahvili") %>'></asp:Label>
                                        </div>
                                        <div align="center" style="padding: 1px">
                                            ...............
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT  tbSooratHesab.OnvanTahvili, tbSooratHesab.MoedTahvili, tbSooratHesab.Price
FROM            tbSooratHesab INNER JOIN
                         tbGharardad ON tbSooratHesab.ProjectGharardad = tbGharardad.ghCode
WHERE        (tbGharardad.ghProject = @ghProject) AND (tbSooratHesab.Gharardad LIKE N'%تولید%')"> 
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="ghProject" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان تحویل پشتیبانی" VisibleIndex="28" Width="120px">
                    <DataItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("prId") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#CC3300" GridLines="None" HorizontalAlign="Center" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="عنوان تحویل" SortExpression="OnvanTahvili">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OnvanTahvili") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div align="center">
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("OnvanTahvili") %>'></asp:Label>
                                        </div>
                                        <div align="center" style="padding: 1px">
                                            ...............
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT  tbSooratHesab.OnvanTahvili, tbSooratHesab.MoedTahvili, tbSooratHesab.Price
FROM            tbSooratHesab INNER JOIN
                         tbGharardad ON tbSooratHesab.ProjectGharardad = tbGharardad.ghCode
WHERE        (tbGharardad.ghProject = @ghProject) AND (tbSooratHesab.Gharardad LIKE N'%پشتیبانی%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="ghProject" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ پشتیبانی" VisibleIndex="29" Width="120px">
                    <DataItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("prId") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#CC3300" GridLines="None" HorizontalAlign="Center" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div align="center">
                                            <div align="right">
                                                <table align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="90">
                                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-right: 5px; padding-left: 5px" width="30">
                                                            <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" Checked='<%# Bind("srCheck") %>' CheckState="Unchecked" ReadOnly="True" Theme="SoftOrange">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div align="center" style="padding: 1px">
                                            ...............
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbSooratHesab.OnvanTahvili, tbSooratHesab.MoedTahvili, tbSooratHesab.Price, tbSooratHesab.srCheck FROM tbSooratHesab INNER JOIN tbGharardad ON tbSooratHesab.ProjectGharardad = tbGharardad.ghCode WHERE (tbGharardad.ghProject = @ghProject) AND (tbSooratHesab.Gharardad LIKE N'%پشتیبانی%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="ghProject" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="موعد تحویل پشتیبانی" VisibleIndex="30" Width="120px">
                    <DataItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("prId") %>' Visible="False"></asp:Label>
                        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#CC3300" GridLines="None" HorizontalAlign="Center" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField HeaderText="MoedTahvili" SortExpression="MoedTahvili">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("MoedTahvili") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div align="center">
                                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("MoedTahvili") %>'></asp:Label>
                                        </div>
                                        <div align="center" style="padding: 1px">
                                            ...............
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT  tbSooratHesab.OnvanTahvili, tbSooratHesab.MoedTahvili, tbSooratHesab.Price
FROM            tbSooratHesab INNER JOIN
                         tbGharardad ON tbSooratHesab.ProjectGharardad = tbGharardad.ghCode
WHERE        (tbGharardad.ghProject = @ghProject) AND (tbSooratHesab.Gharardad LIKE N'%پشتیبانی%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="ghProject" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                   <dx:GridViewDataComboBoxColumn Caption="آخرین وضعیت قراردادی" FieldName="prSt" VisibleIndex="31">
                    <PropertiesComboBox AnimationType="Slide" DataSourceID="sourceSt" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="در حال اجرا" FieldName="prSt2" VisibleIndex="32">
                    <PropertiesComboBox DataSourceID="sourceSt0" TextField="infTitle" ValueField="infTitle">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="شماره قرارداد" FieldName="ghCode" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="وضعیت ریسک" FieldName="riskSt" VisibleIndex="34">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="ریسک‌ متصور‌نیست" Value="1" />
                            <dx:ListEditItem Text="ریسک B.V" Value="2" />
                            <dx:ListEditItem Text="ریسک پروپوزال" Value="3" />
                            <dx:ListEditItem Text="ریسک نهایی" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>


                <dx:GridViewDataTextColumn Caption="اختتام" VisibleIndex="41" ShowInCustomizationForm="False">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/Content/images/icons/pencil-red-icon.png" NavigateUrl='<%# Eval("prId","~/content/pageFinilize.aspx?id={0}") %>' Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("prId") %>' />

                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="الحاقیه" VisibleIndex="34" FieldName="ElType" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ عملیاتی شدن" VisibleIndex="35" FieldName="mosAmaliatiDate" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ SRS" VisibleIndex="36" FieldName="mosSRS" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="تاریخ ارسال پروپوزال" VisibleIndex="37" FieldName="mosErsalDate" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="درصد پیشرفت" VisibleIndex="38" FieldName="PercentComplete">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="سرویس مرتبط" FieldName="ServiceId" VisibleIndex="39">
                    <PropertiesComboBox DataSourceID="sourceServiceCatalog" TextField="Description" ValueField="ServiceId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="نسخه" VisibleIndex="40" FieldName="VersionNo">
                </dx:GridViewDataTextColumn>
                
                <dx:GridViewDataComboBoxColumn Caption="طرح مقابله با ریسک" VisibleIndex="130" FieldName="riskAgainst">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="دارد" Value="1" />
                            <dx:ListEditItem Text="ندارد" Value="0" />
                        </Items>
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="عنوان سناریو ریسک" VisibleIndex="131" FieldName="riskTitle">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="شرح سناریو ریسک" VisibleIndex="135" FieldName="riskDesc">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="بازه اجرای ریسک از" VisibleIndex="132" FieldName="riskStart">
                    <DataItemTemplate>
                        <asp:Label ID="Label112" runat="server" Text='<%# Eval("riskStart") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="بازه اجرای ریسک تا" VisibleIndex="133" FieldName="riskEnd">
                    <DataItemTemplate>
                        <asp:Label ID="Label116" runat="server" Text='<%# Eval("riskEnd") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                 <dx:GridViewDataTextColumn Caption="مبلغ قرارداد" VisibleIndex="99" FieldName="ghPrice">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="مبلغ پرداخت شده" VisibleIndex="99" FieldName="payPrice">
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataComboBoxColumn Caption="هدف استراتژیک بانک" FieldName="stratgyGoal" VisibleIndex="140">
                    <PropertiesComboBox DataSourceID="sourceStratgyGoal" TextField="infTitle" ValueField="infId">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="ماتریکس" VisibleIndex="100" FieldName="matrix">
                </dx:GridViewDataTextColumn>
       <%--  <dx:GridViewDataTextColumn Caption="سرویس کاتالوگ" VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Content/images/icons/Documents-icon24.png" NavigateUrl='<%# Eval("prId","~/content/PagePages.aspx?project={0}") %>' Target="_blank"></asp:HyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>--%>
            </Columns>
            <Styles>
                <Header Font-Names="vazir" Font-Size="13px" HorizontalAlign="Center">
                </Header>
                <Row HorizontalAlign="Center" Font-Names="vazir">
                </Row>
            </Styles>
        </dx:aspxgridview>
        <asp:SqlDataSource ID="sourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" DeleteCommand="UPDATE tbProjects SET prAct = 0 WHERE (prId = @prId)" SelectCommand="SELECT        prProjectManager, prId, prTitle, prAct, prRegDate, prRegUser, prVahed, prProjectType, prSanadType, prOlaviat, prPeymankar, status1, status2, status3, prStatus, prISEstelam, prIsMohtava, irIsAnalyz, prIsTarh, VersionNo,
                         prIsEstelamMohtavayi, prEstelamIsSubmit, prIsErsalBeSherkat, prIsAnswerTadarokatPending, prTarhJalasePending, prPishnevisPending, prEstelamPending, prKhobreganStatusMosavab, prTemp, prBody, prProjectStatus, TechnicalSuvisor,PercentComplete,
                         prMainBody,stratgyGoal,matrix,
                             (SELECT        TOP (1) paDate
                               FROM            tbProjectPaper
                               WHERE        (paType = 1) AND (paAct = 1) AND (paProject = tbProjects.prId)) AS paDate,
                             (SELECT        TOP (1) paShenase
                               FROM            tbProjectPaper AS tbProjectPaper_2
                               WHERE        (paType = 1) AND (paAct = 1) AND (paProject = tbProjects.prId)) AS paShenase,
							   (SELECT        TOP (1) paNumber
                               FROM            tbProjectPaper AS tbProjectPaper_1
                               WHERE        (paType = 1) AND (paAct = 1) AND (paProject = tbProjects.prId)) AS paNumber, prSt, prSt2, prFinalCode,
            
                              tbGharardad.ghCode,
							  tbSooratHesabTolid.GharardadStart GharardadStartTolid,
							  tbSooratHesabTolid.GharardadEnd GharardadEndTolid,
							  tbSooratHesabPosh.GharardadStart GharardadStartPosh,
							  tbSooratHesabPosh.GharardadEnd GharardadEndPosh,
							  tbSooratHesabEl.ElType ElType,ghId,
							  DimDate.PersianStr mosAmaliatiDate,
							  DimDate_1.PersianStr mosSRS,
							  DimDate_2.PersianStr mosErsalDate
                    ,riskAgainst,riskTitle,riskStart,riskEnd,riskDesc,riskSt
                    ,(select  isnull(sum(convert(bigint,gPricePosh))+sum(convert(bigint,gPriceTolid)),0) from tbTarhPishnehadi where tbTarhPishnehadi.thProject=tbProjects.prId  ) ghPrice
					,(select  isnull(sum(convert(bigint,replace(replace(replace(replace(Price,CHAR(9),''),CHAR(10),''),CHAR(13),''),CHAR(32),''))),0) from  [NewMellat].[dbo].[tbSooratHesab] left join tbProjectPaper on tbProjectPaper.paProject = tbSooratHesab.id   where tbSooratHesab.prId=tbProjects.prId and tbProjectPaper.paType = 1015) payPrice
            ,matrix
FROM            tbProjects 
				
				Left Outer Join (sELECT * fROM tbGharardad Where tbGharardad.IsElhaghie = 0 OR tbGharardad.IsElhaghie is null) tbGharardad On  tbGharardad.ghProject = tbProjects.prId

				Left Outer Join (Select ProjectGharardad, Max(GharardadStart) GharardadStart, Max(GharardadEnd) GharardadEnd from tbSooratHesab Where Gharardad LIKE N'%تولید%' Group by ProjectGharardad) as tbSooratHesabTolid On  tbSooratHesabTolid.ProjectGharardad = tbGharardad.ghCode
				Left Outer Join (Select ProjectGharardad, Max(GharardadStart) GharardadStart, Max(GharardadEnd) GharardadEnd from tbSooratHesab Where Gharardad LIKE N'%پشتیبانی%' Group by ProjectGharardad) as tbSooratHesabPosh On  tbSooratHesabPosh.ProjectGharardad = tbGharardad.ghCode
				Left Outer Join (Select ProjectGharardad,STUFF((select ', '  +Gharardad From tbSooratHesab Where ProjectGharardad = tbSooratHesabM.ProjectGharardad and Gharardad LIKE N'%الحاق%'  For XML Path(''),Type).value('(./text())[1]','NVarchar(Max)'),1,2,'') as ElType  from tbSooratHesab tbSooratHesabM Where Gharardad LIKE N'%الحاق%' Group by ProjectGharardad) as tbSooratHesabEl On  tbSooratHesabEl.ProjectGharardad = tbGharardad.ghCode
				 
				Left Outer Join  (select tbKhobreganMosavab.mosAmaliatiDate,tbKhobreganMosavab.mosSRS,tbKhobreganMosavab.mosErsalDate, tbKhbregan.khProject from  tbKhobreganMosavab inner join tbKhbregan  ON tbKhbregan.khId = tbKhobreganMosavab.mosKhob where tbKhobreganMosavab.mosAct =1) kh ON tbProjects.prId = kh.khProject 
				Left Outer Join DimDate On kh.mosAmaliatiDate = DimDate.GregorianStr
				Left Outer Join DimDate as DimDate_1 On kh.mosSRS = DimDate_1.GregorianStr
				Left Outer Join DimDate as DimDate_2 On kh.mosErsalDate = DimDate_2.GregorianStr
WHERE  
		(( tbGharardad.ghAct =1 and (tbGharardad.IsElhaghie = 0 OR tbGharardad.IsElhaghie is null)) OR tbGharardad.ghAct is null)  and
   ((prVahed IN
                             (SELECT        prProject
                               FROM            tbAdminProjects
                               WHERE        (prType = 3) 
							   AND (prCode = @prCode)
							   )) OR
            (TechnicalSuvisor IN
                             (SELECT        prProject
                               FROM            tbAdminProjects
                               WHERE        (prType = 3) 
							   AND (prCode = @prCode)
							   ))) AND (prPeymankar IN
                             (SELECT        prProject
                               FROM            tbAdminProjects AS tbAdminProjects_1
                               WHERE        (prType = 1) 
							   AND (prCode = @prCode)
							   )) AND (prAct = 1)
--							   and prId= 2404

ORDER BY prId DESC
"
            UpdateCommand="UPDATE tbProjects SET prTitle = @prTitle, prVahed = @prVahed, prProjectType = @prProjectType, prSanadType = @prSanadType, prOlaviat = @prOlaviat, prPeymankar = @prPeymankar, status1 = @status1, status2 = @status2, status3 = @status3, prProjectStatus = @prProjectStatus, prMainBody = @prMainBody, prProjectManager = @prProjectManager, prSt = @prSt, prSt2 = @prSt2, TechnicalSuvisor = @TechnicalSuvisor,PercentComplete = @PercentComplete,VersionNo = @VersionNo ,
              riskAgainst=@riskAgainst,riskTitle=@riskTitle,riskStart=@riskStart,riskEnd =@riskEnd,riskDesc =@riskDesc,riskSt=@riskSt WHERE (prId = @prId)">
            <DeleteParameters>
                <asp:Parameter Name="prId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="prCode" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="prTitle" />
                <asp:Parameter Name="prVahed" />
                <asp:Parameter Name="prProjectType" />
                <asp:Parameter Name="prSanadType" />
                <asp:Parameter Name="prOlaviat" />
                <asp:Parameter Name="prPeymankar" />
                <asp:Parameter Name="status1" />
                <asp:Parameter Name="status2" />
                <asp:Parameter Name="status3" />
                <asp:Parameter Name="prProjectStatus" />
                <asp:Parameter Name="prMainBody" />
                <asp:Parameter Name="prProjectManager" />
                <asp:Parameter Name="prSt" />
                <asp:Parameter Name="prSt2" />
                <asp:Parameter Name="TechnicalSuvisor" />
                <asp:Parameter Name="PercentComplete" />
                <asp:Parameter Name="VersionNo" />
                <asp:Parameter Name="ServiceId" />
                <asp:Parameter Name="prId" />
                <asp:Parameter Name="riskAgainst" />
                <asp:Parameter Name="riskTitle" />
                <asp:Parameter Name="riskStart" />
                <asp:Parameter Name="riskEnd" />
                 <asp:Parameter Name="riskDesc" />
		<asp:Parameter Name="riskSt"/>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceStratgyGoal" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.* FROM prInformation WHERE (infType = 13)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.* FROM prInformation"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceSt" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infAct = 1) AND (infType = 11)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceSt0" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infAct = 1) AND (infType = 12)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1)  AND (prInformation.infType = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceSanad" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceSanad0" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.* FROM prInformation WHERE (infType = 3)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceOlaviat" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prInformation.infId, prInformation.infTitle, tbAdminProjects.prProject, tbAdminProjects.prCode, tbAdminProjects.prType, tbAdminProjects.prId, prInformation.infType FROM prInformation INNER JOIN tbAdminProjects ON prInformation.infId = tbAdminProjects.prProject WHERE (prInformation.infAct = 1)  AND (prInformation.infType = 5)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceServiceCatalog" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT * From ServiceCatalog"></asp:SqlDataSource>
        <telerik:radwindowmanager id="RadWindowManager1" runat="server" animation="Fade" behaviors="Resize, Minimize, Close, Move" skin="Sunset">
            <Windows>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow1" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
                <telerik:RadWindow runat="server" NavigateUrl="RadWindow2" Animation="Fade" Behavior="Close" Behaviors="Close">
                </telerik:RadWindow>
            </Windows>
        </telerik:radwindowmanager>
        <asp:SqlDataSource ID="sourceProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="spSelectInfo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="infType" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceLastStatus" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infType = 9)"></asp:SqlDataSource>
    </div>
    <div align="center">
        <dx:aspxgridviewexporter id="ASPxGridViewExporter1" runat="server" filename="لیست پروژه ها" gridviewid="ASPxGridView1" landscape="True" paperkind="A4">
        </dx:aspxgridviewexporter>
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Content/images/icons/Excel-icon.png" OnClick="ImageButton3_Click" />
    </div>
    <script>
        $(document).ready(function () {
            var data = {
                'محب': 'سامانه مدیریت حساب های بانکی',
                'سینا': 'سامانه یکپارچه نیازهای آماری',
                'rba': 'risk based approach',
                'سیاح': 'سیستم یکپارچه اطلاعات حساب ها',
                'سیب': 'سامانه یکپارچه بازرسی',
                'سمت': 'سامانه مالی تحلیلی',
                'ساپ': 'سامانه ارتباط با پذیرنگان',
                'clm': 'customer lifecycle management',
                'mssp': 'management security service provide',
                'نما': 'نرم افزار مکانیزه آماری',
                'pam': 'Pluggable Authentication Modules',
                'گام': 'گواهی اعتباری مولد',
                'ngfs': 'Network of Central Banks and Supervisors for Greening the Financial System',
                'etf': 'Exchange Tradable Found',
                'مکنا': 'مرکز کنترل و نظارت اعتبارات',
                'babok': 'Business Analysis Body of Knowledge',
                'سنجش': 'سامانه نرم افزاری جامع شعب',
                'SSO': 'single sign-on',
                'سپام': 'سامانه پیام رسانی مالی الکترونیکی',
                'سمات': 'سپرده گذاری مرکزی اوراق بهادار و تسویه وجوه',
                'هریم': 'هدایت رمز یکبار مصرف'
            }
            setInterval(function () {
                $('.dxgvDataRow_Office2010Silver td:nth-child(2)').mouseup(function () {
                    console.log(window.getSelection().toString());
		var el=$(this)[0];
                    var selection = window.getSelection().toString();
		loadRestRequest("http://172.22.65.16:4581/SqlOData.svc/GetData/AbbrNames?$filter=Abbr = N'"+selection+"'",function(res){
		var result =JSON.parse(res).d.results;
		if(result.length==1)
                	el.title =result[0].Name;
                })

               // var result = data[selection];
                
            })}, 3000);
            $(document).tooltip();
        });
</script>
</asp:Content>
