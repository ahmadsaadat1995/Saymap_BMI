<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rptProjectKhobregan.aspx.cs" Inherits="NewMellat.Content.rptProjectKhobregan" %>
<%@ Register assembly="DevExpress.XtraReports.v16.2.Web, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div align="center">

            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" width="14%">
                        <asp:Label ID="Label1" runat="server" Text="واحد متولی"></asp:Label>
                    </td>
                    <td align="right" width="36%">


                    <dx1:ASPxComboBox ID="drpVahed" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="95%" DataSourceID="sourceVahed" RightToLeft="True" TextField="infTitle" ValueField="infId" Font-Names="b yekan" Font-Size="14px" OnDataBound="drpVahed_DataBound" TabIndex="2" ClientIDMode="Static" ForeColor="#333333" AutoPostBack="True" OnSelectedIndexChanged="drpVahed_SelectedIndexChanged">
                   

                        <Border BorderColor="#F8DF8E" />
                    </dx1:ASPxComboBox>


                    </td>
                    <td align="left" width="14%">
                        <asp:Label ID="Label6" runat="server" Text=":شرکت پیمانکار"></asp:Label>
                    </td>
                                        <td align="right" width="36%">

<dx1:ASPxComboBox ID="drpPeymankar" runat="server" AnimationType="Fade" Theme="SoftOrange" Width="95%" DataSourceID="sourcePeymankar" RightToLeft="True" TextField="infTitle" ValueField="infId" Font-Names="B Yekan" Font-Size="14px" OnDataBound="drpPeymankar_DataBound" TabIndex="6" ForeColor="#333333">
                        <Border BorderColor="#F8DF8E" />
                    </dx1:ASPxComboBox>
                                        </td>

                </tr>
                <tr>
                    <td align="left" width="14%">
                        &nbsp;</td>
                    <td align="right" width="36%">


                        &nbsp;</td>
                    <td align="left" width="14%">
                        &nbsp;</td>
                                        <td align="right" width="36%">

                                            &nbsp;</td>

                </tr>
            </table>

        </div>
        <div>
            <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" Height="1100px" Theme="SoftOrange" Width="100%">
                <settingsreportviewer printusingadobeplugin="False" />
            </dx:ASPxDocumentViewer>
        </div>

        <div>
        <asp:SqlDataSource ID="sourcePeymankar" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 5)">
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="sourceVahed" runat="server" ConnectionString="<%$ ConnectionStrings:NewMellatConnectionString %>" SelectCommand="SELECT infId, infTitle, infType FROM prInformation WHERE (infAct = 1) AND (infType = 1)">
                    </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
