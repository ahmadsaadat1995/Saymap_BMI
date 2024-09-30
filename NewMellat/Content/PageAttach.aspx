<%@ page language="C#" autoeventwireup="true" codebehind="PageAttach.aspx.cs" inherits="NewMellat.Content.PageAttach" %>

<%@ register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="/Scripts/jquery-1.12.4.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="attachHeader">
            <div>
                <table align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="LeftColumn">
                            <asp:fileupload id="FileUpload1" runat="server" />
                        </td>
                        <td class="RightColumn">
                            <asp:label id="Label1" runat="server" text=":انتخاب فایل"></asp:label>
                        </td>
                        <td align="right" width="200">
                            <asp:scriptmanager id="ScriptManager1" runat="server">
                        </asp:scriptmanager>
                            <dx:aspxtextbox id="ASPxTextBox1" runat="server" righttoleft="True" theme="SoftOrange" width="170px">
                        </dx:aspxtextbox>
                        </td>
                        <td class="RightColumn">
                            <asp:label id="Label2" runat="server" text=":عنوان فایل"></asp:label>
                        </td>
                    </tr>
                </table>
            </div>
            <div align="center" style="padding: 8px">
                <dx:aspxbutton id="ASPxButton1" runat="server" font-names="B Yekan" font-size="13px" onclick="ASPxButton1_Click" text="ثبت فایل جدید" theme="SoftOrange" width="150px">
            </dx:aspxbutton>
            </div>
        </div>
        <div>

            <asp:sqldatasource id="sourceFiles" runat="server" connectionstring="<%$ ConnectionStrings:NewMellatConnectionString %>" 
                selectcommand="SELECT fiId, fiAct, fiData, fiDate, fiParent, fiType, fiTitle FROM tbFiles WHERE (fiAct = 1) AND (fiParent = @fiParent) and fiType=@fiType" deletecommand="DELETE FROM tbFiles WHERE (fiId = @fiId)" insertcommand="INSERT INTO tbFiles(fiAct, fiData, fiDate, fiParent, fiType, fiTitle, fiExt) VALUES (1, @fiData, GetDate(), @fiParent, @fiType, @fiTitle, @fiExt)">
            <DeleteParameters>
                <asp:Parameter Name="fiId" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="FileUpload1" Name="fiData" PropertyName="FileBytes" />
                <asp:QueryStringParameter Name="fiParent" QueryStringField="Parent" />
                <asp:QueryStringParameter Name="fiType" QueryStringField="Type" />
                <asp:ControlParameter ControlID="ASPxTextBox1" Name="fiTitle" PropertyName="Text" />
                <asp:ControlParameter ControlID="FileUpload1" Name="fiExt" PropertyName="FileName" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="fiParent" QueryStringField="Parent" />
                <asp:QueryStringParameter Name="fiType" QueryStringField="Type" /> 
            </SelectParameters>
        </asp:sqldatasource>
            <dx:aspxgridview id="ASPxGridView1" runat="server" autogeneratecolumns="False" datasourceid="sourceFiles" enabletheming="True" keyfieldname="fiId" righttoleft="True" theme="SoftOrange" width="100%" onhtmldatacellprepared="ASPxGridView1_HtmlDataCellPrepared">
            <settingspager visible="False">
            </settingspager>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <DeleteButton ButtonType="Image">
                    <Image Url="~/Content/images/icons/Close-2-icon.png">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsText ConfirmDelete="آیا ردیف انتخابی حذف شود؟" EmptyDataRow="اطلاعات موجود نمی باشد" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="fiId" ReadOnly="True" VisibleIndex="1" Caption="کد سیستمی">
                    <editformsettings visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="fiDate" VisibleIndex="3" Caption="تاریخ ثبت">
                    <DataItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("fiDate") %>'></asp:Label>
                    </DataItemTemplate>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="دانلود فایل" ShowInCustomizationForm="True" VisibleIndex="4">
                    <DataItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Content/images/icons/attachment-icon24.png" Target="_blank"></asp:HyperLink>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("fiId") %>' />
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="عنوان فایل" FieldName="fiTitle" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:aspxgridview>
            <dx:aspxbutton id="ASPxButton2" runat="server" font-names="B Yekan" font-size="13px" onclick="ASPxButton2_Click" text="ایجاد سند چشم انداز کسب و کار" theme="SoftOrange" width="200px">
            </dx:aspxbutton>
        </div>
        <telerik:radnotification id="RadNotification1" runat="server" animation="Fade" font-names="B Yekan" font-size="15px" skin="Sunset">
    </telerik:radnotification>
    </form>

    <script>
        function getUrlVars() {
            var vars = {};
            var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
                vars[key] = value;
            });
            return vars;
        }


       // var urlParams = new URLSearchParams(window.location.search);
        if (getUrlVars()['Type'] != 1)
            $('#ASPxButton2').hide();
        else
            $('#ASPxButton2').show();

        if (parseInt(getUrlVars()['Type']) > 20 && parseInt(getUrlVars()['Type']) < 28)
            $('#attachHeader').hide();
        else
            $('#attachHeader').show();
    </script>
</body>
</html>
