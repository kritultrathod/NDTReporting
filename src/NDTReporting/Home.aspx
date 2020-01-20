<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="NDTReporting.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" language="javascript">
        $(document).ready(function () { chkAjaxCallCounter(); });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
<%--        <a id="AdminModule" href="Module/Admin/LookUpPage.aspx" runat="server">Admin Page</a>
--%>        <%--<asp:Image ImageUrl="~/Images/NDT_512Silver.jpg" runat="server" />--%>
    </div>
    <div id="overlay" class="web_dialog_overlay">
    </div>
    <div id="dialog" class="web_dialog">
    </div>
    <%--<div>
    <asp:Panel ID="Panel1" BackImageUrl="~/Images/Splash.png" runat="server" 
        Height="77px" Width="203px">
    </asp:Panel>
    </div>--%>
</asp:Content>
