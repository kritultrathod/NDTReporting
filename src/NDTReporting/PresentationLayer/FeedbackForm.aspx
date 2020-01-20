<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackForm.aspx.cs" Inherits="NDTReporting.PresentationLayer.FeedbackForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Feedback Page</title>
    <link href="../CSS/style-web.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table class="TableValue" border="1px" width="40%">
        <tr>
            <td colspan="2" class="TDHeaderCell">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" Text="Feedback"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label><br />
                <asp:Label ID="lblmsg1" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Email ID :
            </td>
            <td>
                <asp:TextBox ID="EmailIDTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmailIDTextBox"
                    ErrorMessage="RequiredFieldValidator" ValidationGroup="grp1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Company Name :
            </td>
            <td>
                <asp:TextBox ID="CompanyNameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CompanyNameTextBox"
                    ErrorMessage="RequiredFieldValidator" ValidationGroup="grp1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Comments :
            </td>
            <td>
                <asp:TextBox ID="CommentsTextBox" runat="server" TextMode="MultiLine" BackColor="White"
                    ForeColor="Black"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                New Features Required :
            </td>
            <td>
                <asp:TextBox ID="NewFeatureTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Types Of NDT Performed :
            </td>
            <td>
                <asp:TextBox ID="TypesOfNDTTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="SendMailButton" runat="server" class="classname" Text="Send Mail"
                    OnClick="SendMailButton_Click" ValidationGroup="grp1" />
            </td>
            <td>
                <asp:Button ID="LogOutButton" runat="server" class="classname" Text="Cancel" OnClick="LogOutButton_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
