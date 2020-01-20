<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPasswordForm.aspx.cs"
    Inherits="NDTReporting.PresentationLayer.ResetPasswordForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link href="../CSS/style-web.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table class="TableValue" width="40%" border="1px">
        <tr>
            <td colspan="2" class="TDHeaderCell">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Reset Password Step II"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Reset Password :
            </td>
            <td>
                <asp:TextBox ID="ResetPasswordTextBox" runat="server" Width="148px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ResetPasswordTextBox"
                    ErrorMessage="Name CanNot Be Blank" ValidationGroup="Group1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Confirm Reset Password :
            </td>
            <td>
                <asp:TextBox ID="ConfrimResetPasswordTextBox" runat="server" TextMode="Password"
                    Width="149px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ConfrimResetPasswordTextBox"
                    ErrorMessage="Reset Password CanNot Be Blank" ValidationGroup="Group1">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="ResetPasswordTextBox"
                    ControlToValidate="ConfrimResetPasswordTextBox" ValidationGroup="Group1" ErrorMessage="Your Password Do Not Match Up!"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="SendButton" runat="server" class="classname" OnClick="SendButton_Click1"
                    Text="Reset" ValidationGroup="Group1" />
            </td>
            <td>
                <asp:Button ID="LogInButton" runat="server" class="classname" OnClick="LogInButton_Click"
                    Text="Log In" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmsg" runat="server" ForeColor="#006600"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblmsg1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
