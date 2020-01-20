<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadiographicWeldReportViewer.aspx.cs" Inherits="NDTReporting.RadiographicWeldReportViewer" MasterPageFile="~/HomeMaster.Master" %>

<asp:Content ID="Head" runat="server" ContentPlaceHolderID="head">
    <script language="javascript" type="text/javascript">
        //Load Session values into js variables
        {
            
            var ssnReportId = '<%=Session["ReportId"] %>';
            var ssnTemplateId = '<%=Session["TemplateId"] %>';
            var ssnAction = '<%=Session["Action"] %>';
        }
    </script>
</asp:Content>
<asp:Content ID="Main" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <script src="Script/RadiographicWeldReportViewer.js" type="text/javascript"></script>
    <div style="text-align: right;">
        <asp:Button ID="btnAuthorize" runat="server" Text="Authorize" ToolTip="Authorize this template." CssClass="PDFExportBtn" OnClick="btnAuthorize_Click" />
        <asp:Button ID="btnExport" runat="server" Text="Export PDF" OnClick="btnExport_Click" CssClass="PDFExportBtn" />
    </div>
    <div class="container" id="container">
    </div>
    <input id="txtTemplate" type="hidden" runat="server" clientidmode="Static" />
</asp:Content>
