<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportLayout.aspx.cs" Inherits="NDTReporting.ReportLayout"
    MasterPageFile="~/HomeMaster.Master" %>

<asp:Content ID="Main" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Script/ReportLayout.js" />
        </Scripts>
    </asp:ScriptManager>
    <div class="container" id="container">
    </div>
    <asp:Label ID="lblTime" runat="server"></asp:Label>
</asp:Content>
