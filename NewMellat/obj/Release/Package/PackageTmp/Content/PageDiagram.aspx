<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageDiagram.aspx.cs" Inherits="NewMellat.Content.PageDiagram" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
        .KadrQuick
{
            border: 1px solid #FFBA8C;
            background-color: #FFFFFF;
            padding: 5px;
            border-top-right-radius: 6px;
            border-bottom-right-radius: 6px;
            border-top-left-radius: 6px;
            border-bottom-left-radius: 6px;
            text-decoration: none;
            font-family: "b yekan";
            font-size: 13px;
        }
        .WidhtCell {
            padding: 2px;
            height: 50px;
            text-align: center;
            direction: ltr;
        }
        .left {
            font-family: tahoma;
            font-size: 12px;
            color: #663300;
            width: 200px;
            text-align: right;
            padding-right: 1px;
        }
        .right {
            font-family: "b yekan";
            font-size: 12px;
            color: #663300;
            width: 100px;
            text-align: right;
        }
        .KadrQuick2 {
            border: 1px solid #663300;
            background-color: #FFFFFF;
            padding: 5px;
            border-top-right-radius: 6px;
            border-bottom-right-radius: 6px;
            border-top-left-radius: 6px;
            border-bottom-left-radius: 6px;
            text-decoration: none;
            font-family: "b yekan";
            font-size: 13px;
        }
        .auto-style1 {
            font-family: tahoma;
            font-size: 12px;
            color: #663300;
            width: 200px;
            text-align: right;
            padding-right: 1px;
            height: 36px;
        }
        .auto-style2 {
            font-family: "b yekan";
            font-size: 12px;
            color: #663300;
            width: 100px;
            text-align: right;
            height: 36px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:hiddenfield ID="HiddenFieldLastState" runat="server"></asp:hiddenfield>
    <div align="center">
    
        <div align="center">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="WidhtCell">
                        <asp:Image ID="img1" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" />
                    </td>
                    <td class="WidhtCell">
                        <asp:SqlDataSource ID="source1" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbProjects.prId, tbProjects.prTitle, tbProjects.prAct, tbProjects.prRegDate, tbProjects.prRegUser, tbProjects.prVahed, tbProjects.prProjectType, tbProjects.prSanadType, tbProjects.prOlaviat, 
                         tbProjects.prPeymankar, tbProjects.status1, tbProjects.status2, tbProjects.status3, tbProjects.prStatus, tbProjects.prISEstelam, tbProjects.prIsMohtava, tbProjects.irIsAnalyz, tbProjects.prIsTarh, 
                         tbProjects.prIsEstelamMohtavayi, tbProjects.prEstelamIsSubmit, tbProjects.prIsErsalBeSherkat, tbProjects.prIsAnswerTadarokatPending, tbProjects.prTarhJalasePending, tbProjects.prPishnevisPending, 
                         tbProjects.prEstelamPending, prInformation.infTitle, tbProjectPaper.paType, tbProjectPaper.paAct, tbProjectPaper.paShenase, tbProjectPaper.paDate, prInformation_1.infTitle AS sanad
FROM            tbProjects INNER JOIN
                         prInformation ON tbProjects.prVahed = prInformation.infId INNER JOIN
                         tbProjectPaper ON tbProjects.prId = tbProjectPaper.paProject INNER JOIN
                         prInformation AS prInformation_1 ON tbProjects.prSanadType = prInformation_1.infId
WHERE        (tbProjects.prId = @prId) AND (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = 1)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="prId" QueryStringField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img2" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img2_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img3" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img3_Click" PostBackUrl="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img4" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img4_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label1" runat="server" Text="ثبت پروژه"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label10" runat="server" Text="طرح در کارگروه توسعه فرآیندهای جاری"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label11" runat="server" Text="مصوب"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label12" runat="server" Text="دریافت پروپوزال"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="prId" DataSourceID="source1" GridLines="None" OnDataBound="GridView1_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("infTitle") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label2" runat="server" Text=":متولی"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("sanad") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label3" runat="server" Text=":نوع سند"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label4" runat="server" Text=":شناسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label5" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="khId" DataSourceID="Source2" GridLines="None" PageSize="1" ShowHeader="False" OnDataBound="GridView2_DataBound" ShowHeaderWhenEmpty="True">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("khJalaseDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label21" runat="server" Text=":تاریخ جلسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("khJalaseNumber") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label23" runat="server" Text=":شماره جلسه"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT khJalaseNumber, khJalaseDate, khId FROM tbKhbregan WHERE (khProject = @khProject) AND (khAct = 1)" UpdateCommand="Update tbKhbregan Set khAct = 0 WHERE (khProject = @khProject)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="khProject" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="khProject" QueryStringField="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="mosId" DataSourceID="source3" GridLines="None" OnDataBound="GridView3_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label28" runat="server" Text='<%# Eval("mosOlaviat") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label29" runat="server" Text=":اولویت"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label30" runat="server" Text='<%# Eval("mosErsalDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label31" runat="server" Text=":مهلت ارسال پروپوزال"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1">
                                                        <asp:Label ID="Label32" runat="server" Text='<%# Eval("mosAmaliatiDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="auto-style2">
                                                        <asp:Label ID="Label33" runat="server" Text=":مهلت عملیاتی شدن"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label34" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label35" runat="server" Text=":متولی"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="source3" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbKhobreganMosavab.mosId, tbKhobreganMosavab.mosAct, tbKhobreganMosavab.mosKhob, tbKhobreganMosavab.mosShenase, tbKhobreganMosavab.mosNumber, tbKhobreganMosavab.mosDate, 
                         tbKhobreganMosavab.mosErsalDate, tbKhobreganMosavab.mosAmaliatiDate, tbKhobreganMosavab.mosbody, tbKhobreganMosavab.mosType, tbKhobreganMosavab.mosPropozal, 
                         tbKhobreganMosavab.mosOlaviat, tbKhobreganMosavab.mosProjectId, tbKhbregan.khProject, tbKhbregan.khAct
FROM            tbKhobreganMosavab INNER JOIN
                         tbKhbregan ON tbKhobreganMosavab.mosKhob = tbKhbregan.khId
WHERE        (tbKhbregan.khProject = @khProject) AND (tbKhobreganMosavab.mosAct = 1) AND (tbKhbregan.khAct = 1)"
                                
                                UpdateCommand="Update tbKhobreganMosavab Set mosAct=0 Where mosKhob in(Select khId from tbKhbregan Where khAct = 1 khProject = @khProject)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="khProject" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="khProject" QueryStringField="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="thId" DataSourceID="Source4" GridLines="None" OnDataBound="GridView4_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label36" runat="server" Text='<%# Eval("thPriceTolid") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label37" runat="server" Text=":مبلغ تولید"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label38" runat="server" Text='<%# Eval("thPricePosh") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label39" runat="server" Text=":مبلغ پشتیبانی"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label40" runat="server" Text='<%# Eval("thModatTolid") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label41" runat="server" Text=":مدت تولید"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label42" runat="server" Text='<%# Eval("thModatPosh") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label43" runat="server" Text=":مدت پشتیبانی"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source4" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbTarhPishnehadi.* FROM tbTarhPishnehadi WHERE (thProject = @thProject) and thAct=1"
                                UpdateCommand="Update tbTarhPishnehadi Set thAct=0 Where (thProject = @thProject)"
                                >
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="thProject" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="thProject" QueryStringField="id" />
                                </UpdateParameters>
                                
                            </asp:SqlDataSource>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img8" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img8_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img7" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img7_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img6" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img6_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img5" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img5_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label16" runat="server" Text="مصوب"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon2.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label15" runat="server" Text="طرح در کمیسیون نظارت"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon2.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label14" runat="server" Text="آنالیز قیمت "></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon2.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label13" runat="server" Text="استعلام پروپوزال"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView8" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataSourceID="s8" GridLines="None" OnDataBound="GridView8_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label72" runat="server" Text='<%# Eval("shBody") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label73" runat="server" Text=":شناسه صورتجلسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label74" runat="server" Text='<%# Eval("shStatus") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label75" runat="server" Text=":نتیجه صورتجلسه"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="s8" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString1 %>" SelectCommand="SELECT        tbHeyatNezarat.heProject, tbHeyatNezarat.heJalaseNumber, tbHeyatNezarat.heJalaseDate, tbHeyatNezarat.heIsElhaghie, tbHeyatNezarat.heAct, tbShenaseNumbers.shBody, tbShenaseNumbers.shStatus, 
                         tbHeyatNezarat.heId
FROM            tbHeyatNezarat INNER JOIN
                         tbShenaseNumbers ON tbHeyatNezarat.heId = tbShenaseNumbers.shHeyat
WHERE         (tbHeyatNezarat.heProject = @id)
" DeleteCommand="Delete from tbShenaseNumbers Where shHeyat in (Select heId From  tbHeyatNezarat Where heProject = @id and heAct=1)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataSourceID="s7" GridLines="None" OnDataBound="GridView7_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label64" runat="server" Text='<%# Eval("heJalaseNumber") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label65" runat="server" Text=":شماره جلسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label66" runat="server" Text='<%# Eval("heJalaseDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label67" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr><tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label166" runat="server" Text='<%# Eval("PersianStr") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label167" runat="server" Text=":تاریخ نامه"></asp:Label>
                                                    </td>
                                                </tr><tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label266" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label267" runat="server" Text=":شناسه نامه"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="s7" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT   top 1   heId,paShenase,paDate,DimDate.PersianStr,  heProject, heJalaseNumber, heJalaseDate, heIsElhaghie, heAct
FROM            tbHeyatNezarat Inner Join tbProjectPaper on paProject=heId and  paType = 150 
			Left Outer Join  DimDate on paDate =  GregorianDate
WHERE     (heProject = @prId)  " UpdateCommand="Update tbHeyatNezarat Set heAct=0 Where (heProject = @prId) and heAct =1">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="prId" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="prId" QueryStringField="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="paId" DataSourceID="Source6" GridLines="None" OnDataBound="GridView6_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label56" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label57" runat="server" Text=":شناسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label58" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label59" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source6" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbProjectPaper.paShenase, tbProjectPaper.paDate, tbProjectPaper.paType, tbProjectPaper.paMainProjectId, tbProjectPaper.paAct, tbProjectPaper.paId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thAct
FROM            tbProjectPaper INNER JOIN
                         tbTarhPishnehadi ON tbProjectPaper.paProject = tbTarhPishnehadi.thId
WHERE        (tbProjectPaper.paType = 9) AND (tbProjectPaper.paAct = 1) AND (tbTarhPishnehadi.thProject = @paMainProjectId)" UpdateCommand="update tbNazar Set nzAct = 0 where (tbNazar.nzType = 10) and NZPARENT in(SELECT paId FROM tbProjectPaper  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType = 8 )" DeleteCommand="Update tbProjectPaper Set tbProjectPaper.paAct = 0  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType = 9 and paAct = 1" InsertCommand="Update tbProjectPaper Set tbProjectPaper.paAct = 0  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType=10 and paAct = 1">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="paId" DataSourceID="Source5" GridLines="None" OnDataBound="GridView5_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label48" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label49" runat="server" Text=":شناسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label50" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label51" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source5" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbProjectPaper.paShenase, tbProjectPaper.paDate, tbProjectPaper.paType, tbProjectPaper.paMainProjectId, tbProjectPaper.paAct, tbProjectPaper.paId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thAct
FROM            tbProjectPaper INNER JOIN
                         tbTarhPishnehadi ON tbProjectPaper.paProject = tbTarhPishnehadi.thId
WHERE        (tbProjectPaper.paType = 8) AND (tbProjectPaper.paAct = 1) AND (tbTarhPishnehadi.thProject = @paMainProjectId) and tbTarhPishnehadi.thAct=1"
                                UpdateCommand="Update tbProjectPaper Set tbProjectPaper.paAct = 0  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType = 8 and paAct = 1">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <asp:ImageButton ID="img13" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img6_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <asp:ImageButton ID="img14" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png"  OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                    </td>
                    <td class="WidhtCell"></td>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick">
                        <asp:Label ID="Label111" runat="server" Text="پاسخ تدارکات"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell"></td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick">
                        <asp:Label ID="Label116" runat="server" Text="پاسخ شرکت"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView15" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="paId" DataSourceID="Source12" GridLines="None" OnDataBound="GridView15_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label112" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label113" runat="server" Text=":شناسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label114" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label115" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source12" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT        tbProjectPaper.paShenase, tbProjectPaper.paDate, tbProjectPaper.paType, tbProjectPaper.paMainProjectId, tbProjectPaper.paAct, tbProjectPaper.paId, tbTarhPishnehadi.thProject, tbTarhPishnehadi.thAct
FROM            tbProjectPaper INNER JOIN
                         tbTarhPishnehadi ON tbProjectPaper.paProject = tbTarhPishnehadi.thId
WHERE        (tbProjectPaper.paType = 10) AND (tbProjectPaper.paAct = 1) AND (tbTarhPishnehadi.thProject = @paMainProjectId)" UpdateCommand="update tbNazar Set nzAct = 0 where (tbNazar.nzType = 10) and NZPARENT in(SELECT paId FROM tbProjectPaper  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType = 8 )" DeleteCommand="Update tbProjectPaper Set tbProjectPaper.paAct = 0  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType = 10 and paAct = 1" InsertCommand="Update tbProjectPaper Set tbProjectPaper.paAct = 0  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType=10 and paAct = 1">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView16" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="nzId" DataSourceID="Source13" GridLines="None" OnDataBound="GridView16_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label117" runat="server" Text='<%# Eval("nzShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label118" runat="server" Text=":شناسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label119" runat="server" Text='<%# Eval("nzDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label120" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source13" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="Select tbNazar.* from tbNazar 
	inner join tbProjectPaper on tbNazar.nzParent = tbProjectPaper.paId
	Inner join tbNazar tbNazar_1 on tbNazar_1.nzId = tbProjectPaper.paProject
	inner join tbProjectPaper tbProjectPaper_1 on tbNazar_1.nzParent = tbProjectPaper_1.paId
	inner Join tbTarhPishnehadi on tbProjectPaper_1.paProject = tbTarhPishnehadi.thId

where tbNazar.nzType =12 and tbProjectPaper.paType = 50 and tbNazar_1.nzType =10 and tbProjectPaper_1.paType = 8 and tbTarhPishnehadi.thProject = @paMainProjectId" UpdateCommand="update tbNazar Set nzAct = 0 where (tbNazar.nzType = 10) and NZPARENT in(SELECT paId FROM tbProjectPaper  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType = 8 )" DeleteCommand="Update tbProjectPaper Set tbProjectPaper.paAct = 0  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType = 9 and paAct = 1" InsertCommand="Update tbProjectPaper Set tbProjectPaper.paAct = 0  Where paProject in (Select thId From tbTarhPishnehadi Where thProject = @paMainProjectId and thAct=1) and paType=10 and paAct = 1">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:QueryStringParameter Name="paMainProjectId" QueryStringField="id" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img12" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img12_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img9" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img9_Click" OnClientClick="return confirm('آیا مطمئن هستید');" />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img10" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img10_Click" OnClientClick="return confirm('آیا مطمئن هستید');"  />
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        <asp:ImageButton ID="img11" runat="server" ImageUrl="~/Content/images/icons/Button-Blank-Gray-icon24.png" OnClick="img11_Click" OnClientClick="return confirm('آیا مطمئن هستید');" style="height: 24px" />
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label106" runat="server" Text="کمیسیون معاملات"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image14" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label17" runat="server" Text="دریافت پیش نویس قرارداد"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image15" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label18" runat="server" Text="استعلام پیش نویس"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">
                        <asp:Image ID="Image16" runat="server" ImageUrl="~/Content/images/icons/Arrow-OutRight-icon.png" />
                    </td>
                    <td class="WidhtCell">
                        <div class="KadrQuick">
                        <asp:Label ID="Label19" runat="server" Text="قرارداد"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView14" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="ID" DataSourceID="Source11" GridLines="None" OnDataBound="GridView14_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label10712" runat="server" Text='<%# Eval("Vaziat") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label10813" runat="server" Text=":وضعیت"></asp:Label>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label2416" runat="server" Text='<%# Eval("PersianStr") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label12517" runat="server" Text=": تاریخ نامه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label12618" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label12719" runat="server" Text=":شناسه نامه"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source11" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT ID,Vaziat,DimDate_1.PersianStr JalaseDate,paShenase,paDate,DimDate.PersianStr From Commission Inner Join tbProjectPaper on paProject=Commission.ID and  paType = 151
			Left Outer Join  DimDate on paDate =  DimDate.GregorianDate 
			Left Outer Join  DimDate DimDate_1 on JalaseDate = DimDate.GregorianDate WHERE (ProjectId = @ghProject)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </SelectParameters>
                                 <DeleteParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView9" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="ghId" DataSourceID="Source7" GridLines="None" OnDataBound="GridView9_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label80" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label81" runat="server" Text=":شناسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label82" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label83" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source7" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbGharardad.*, tbProjectPaper.paType, tbProjectPaper.paAct, tbProjectPaper.paShenase, tbProjectPaper.paDate FROM tbGharardad INNER JOIN tbProjectPaper ON tbGharardad.ghId = tbProjectPaper.paProject WHERE (tbGharardad.ghProject = @ghProject) AND (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = 25)" UpdateCommand="Update tbProjectPaper Set paAct = 0 Where paProject in (Select Id From  tbGharardad Where ghProject = @ghProject) and paAct = 1 AND tbProjectPaper.paType = 25 ">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView12" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="ghId" DataSourceID="Source8" GridLines="None" OnDataBound="GridView12_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label100" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label101" runat="server" Text=":شناسه"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label102" runat="server" Text='<%# Eval("paDate") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label103" runat="server" Text=":تاریخ"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source8" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbGharardad.*, tbProjectPaper.paType, tbProjectPaper.paAct, tbProjectPaper.paShenase, tbProjectPaper.paDate FROM tbGharardad INNER JOIN tbProjectPaper ON tbGharardad.ghId = tbProjectPaper.paProject WHERE (tbGharardad.ghProject = @ghProject) AND (tbProjectPaper.paAct = 1) AND (tbProjectPaper.paType = 26)"
                                UpdateCommand="Update tbProjectPaper Set paAct = 0 Where paProject in (Select Id From  tbGharardad Where ghProject = @ghProject) and paAct = 1 AND tbProjectPaper.paType = 26 ">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                            <asp:SqlDataSource ID="Source10" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT prId, prBody FROM tbProjects WHERE (prId = @prId)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="prId" QueryStringField="id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView11" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="ghId" DataSourceID="Source9" GridLines="None" OnDataBound="GridView11_DataBound" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label92" runat="server" Text='<%# Eval("ghCode") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label93" runat="server" Text=":شماره قرارداد"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="Source9" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT tbGharardad.* FROM tbGharardad  Inner Join  tbTarhPishnehadi On tbTarhPishnehadi.thId = tbGharardad.ProposalId  where thAct =1 and (ghProject = @ghProject) " UpdateCommand="Update tbTarhPishnehadi Set thAct=0 Where (thProject = @ghProject)">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="" Name="ghProject" QueryStringField="id" />
                                </SelectParameters>
                                 <UpdateParameters>
                                    <asp:QueryStringParameter DefaultValue="" Name="ghProject" QueryStringField="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                        </td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top">
                        &nbsp;</td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick">
                        <asp:Label ID="Label12720" runat="server" Text="الحاقیه"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top" colspan="3">
                        <div class="KadrQuick">
                        <asp:Label ID="Label104" runat="server" Text="توضیحات"></asp:Label>
                        </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="WidhtCell" valign="top">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView110" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="EliD" DataSourceID="SqlDataSource110" GridLines="None"  PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center">
                                            <table align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label24333" runat="server" Text='<%# Eval("elGharardad") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label2533" runat="server" Text=":قرارداد"></asp:Label>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label26331" runat="server" Text='<%# Eval("elType") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label27332" runat="server" Text=": نوع"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label44333" runat="server" Text='<%# Eval("paShenase") %>'></asp:Label>
                                                    </td>
                                                    <td class="right">
                                                        <asp:Label ID="Label45334" runat="server" Text=":شناسه نامه"></asp:Label>
                                                    </td>
                                                </tr><tr>
                                                    <td class="left">
                                                        <asp:Label ID="Label44335" runat="server" Text='<%# Eval("PersianStr") %>'></asp:Label>
                                                    </td>
                                                    <td class="right"> 
                                                        <asp:Label ID="Label45336" runat="server" Text=":تاریخ نامه"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource110" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select top 1 ELiD, elGharardad,elType,paShenase,PersianStr from tbElhaghie 
inner Join tbTarhPishnehadi On elId = tbTarhPishnehadi.ElhaghieId  
left outer join tbProjectPaper On thId = paProject   
left outer join DimDate on GregorianDate = paDate
where elProject = @ghProject and paType = 74 order by paId desc ">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </SelectParameters>
                                 <DeleteParameters>
                                    <asp:QueryStringParameter Name="ghProject" QueryStringField="id" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </div></td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell" valign="top" colspan="3">
                        <div class="KadrQuick2">
                        <asp:GridView ID="GridView13" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" DataKeyNames="prId" DataSourceID="Source10" GridLines="None" PageSize="1" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div align="center" dir="rtl" style="text-align: justify">
                                            <asp:Label ID="Label105" runat="server" Text='<%# Eval("prBody") %>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Visible="False" />
                        </asp:GridView>
                            </div>
                    </td>
                    <td class="WidhtCell">&nbsp;</td>
                    <td class="WidhtCell">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
