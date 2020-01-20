<%@ Page Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="UltrasonicTestReportViewer.aspx.cs" Inherits="NDTReporting.UltrasonicTestReportViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        //Load Session values into js variables
        {
            
            var ssnReportId = '<%=Session["ReportId"] %>';
            var ssnTemplateId = '<%=Session["TemplateId"] %>';
            var ssnAction = '<%=Session["Action"] %>';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Script/UltrasonicTestReportViewer.js" type="text/javascript"></script>
    <div style="text-align: right;">
        <asp:Button ID="btnAuthorize" runat="server" Text="Authorize" ToolTip="Authorize this template." CssClass="PDFExportBtn" OnClick="btnAuthorize_Click" />
        <asp:Button ID="btnExport" runat="server" Text="Export PDF" OnClick="btnExport_Click" CssClass="PDFExportBtn" />
    </div>
    <div class="container" id="container">
    </div>
    <input id="txtTemplate" type="hidden" runat="server" clientidmode="Static" />
</asp:Content>
