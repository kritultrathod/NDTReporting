<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchReport.aspx.cs" Inherits="NDTReporting.WebForm1"
    MasterPageFile="~/HomeMaster.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    
</asp:Content>
<asp:Content ID="Main" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Script/Json/json2.js" />
            <asp:ScriptReference Path="~/Script/SearchReport.js" />
        </Scripts>
    </asp:ScriptManager>
    <div>
        Select TestReport Number:
        <select id="selectTestReportNumber" onchange="GetReportsById()">
        </select>
    </div>
    <div id="ListingData">
    </div>
</asp:Content>
