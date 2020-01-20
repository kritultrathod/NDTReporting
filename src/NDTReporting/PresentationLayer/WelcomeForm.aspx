<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeForm.aspx.cs" Inherits="NDTReporting.PresentationLayer.WelcomeForm"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PresentationLayer/FeedbackForm.aspx">Feedback</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/RadiographicWeldReport.aspx">RadiographicWeldReport</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/RadiographicWeldReportView.aspx">RadiographicWeldReportView</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/TemplateGenerator.aspx">TemplateGenerator</asp:HyperLink>
        <br />
        <br />
        <asp:Button ID="SignOutButton" runat="server" BackColor="Black" ForeColor="White"
            Text="Sign Out" OnClick="SignOutButton_Click" />
    </div>
    </form>
</body>
</html>
