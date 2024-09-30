<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageEd.aspx.cs" Inherits="NewMellat.Content.PageEd" %>

<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="sourceInfo" GridLines="None" ShowHeader="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="LeftColumn">
                                    <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" AnimationType="Fade" RightToLeft="True" Theme="SoftOrange" Width="180px" TextField="Gharardad" Value='<%# Bind("GharardadType") %>' ValueField="Gharardad" SelectedIndex="0">
                                        <Items>
                                            <dx:ListEditItem Text="مقطوع" Value="مقطوع" />
                                            <dx:ListEditItem Text="کاست پلاس" Value="کاست پلاس" />
                                            <dx:ListEditItem Text="مقطوع و کاست پلاس" Value="مقطوع و کاست پلاس" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="RightColumn">
                                    <asp:Label ID="Label1" runat="server" Text=":testنوع قرارداد"></asp:Label>
                                </td>
                                <td align="right">
                                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" EnableTheming="True" RightToLeft="True" Text='<%# Bind("ProjectName") %>' Theme="SoftOrange" Width="180px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="RightColumn">
                                    <asp:Label ID="Label2" runat="server" Text=":نام پروژه"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LeftColumn">
                                    <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" AnimationType="Fade" RightToLeft="True" Theme="SoftOrange" Width="180px" DataSourceID="sourceNazer2" TextField="infTitle" Value='<%# Bind("Nazer2") %>' ValueField="infId">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="RightColumn">
                                    <asp:Label ID="Label4" runat="server" Text=":ناظر2"></asp:Label>
                                </td>
                                <td align="right">
                                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AnimationType="Fade" RightToLeft="True" Theme="SoftOrange" Width="180px" DataSourceID="sourceNazer" TextField="infTitle" Value='<%# Bind("Nazer1") %>' ValueField="infId">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="RightColumn">
                                    <asp:Label ID="Label3" runat="server" Text=":ناظر1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LeftColumn">
                                    <dx:ASPxComboBox ID="ASPxComboBox5" runat="server" AnimationType="Fade" RightToLeft="True" Theme="SoftOrange" Width="180px" DataSourceID="sourceCompany" TextField="infTitle" Value='<%# Bind("CompanyName") %>' ValueField="infId">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="RightColumn">
                                    <asp:Label ID="Label5" runat="server" Text=":نام شرکت"></asp:Label>
                                </td>
                                <td align="right">
                                    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" EnableTheming="True" RightToLeft="True" Text='<%# Bind("ProjectGharardad") %>' Theme="SoftOrange" Width="180px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="RightColumn">
                                    <asp:Label ID="Label7" runat="server" Text=":شماره قرارداد "></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="LeftColumn">&nbsp;</td>
                                <td class="RightColumn">&nbsp;</td>
                                <td class="LeftColumn">&nbsp;</td>
                                <td class="RightColumn">&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT top 1 ProjectName, ProjectGharardad, Nazer1, Nazer2, CompanyName, GharardadType, id FROM tbSooratHesab WHERE (ProjectGharardad = @ProjectGharardad)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProjectGharardad" QueryStringField="code" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sourceNazer" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infType = 1) AND (infAct = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceNazer2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT 0 as infId, N'انتخاب کنید' as infTitle UNION ALL  SELECT infId, infTitle FROM prInformation WHERE (infType = 1) AND (infAct = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle FROM prInformation WHERE (infType = 5) AND (infAct = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="select distinct(Gharardad) from tbSooratHesab where Gharardad is not null"></asp:SqlDataSource>
    
    </div>
        <div a align="center" style="padding: 7px">
            <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ثبت تغییرات" Theme="SoftOrange" Width="150px">
            </dx:ASPxButton>
        </div>
        <div align="center" style="font-family: 'b yekan'; color: #006600">
            <asp:Label ID="Label6" runat="server"></asp:Label></div>
    </form>
</body>
</html>
