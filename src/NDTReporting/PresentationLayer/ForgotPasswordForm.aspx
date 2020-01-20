<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordForm.aspx.cs"
    Inherits="NDTReporting.PresentationLayer.ForgotPasswordForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ForgotPassword</title>
    <link href="../CSS/style-web.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table class="TableValue" width="40%" border="1px">
        <tr>
            <td colspan="2" class="TDHeaderCell">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Reset Password Step I"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Email ID :
            </td>
            <td>
                <asp:TextBox ID="EmailIDTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmailIDTextBox"
                    ErrorMessage="Emailid Is Required" ValidationGroup="Group1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Mobile No :
            </td>
            <td >
                <asp:TextBox ID="MobileNumberTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MobileNumberTextBox"
                    ErrorMessage="Mobile No Is Required" ValidationGroup="Group1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Security Question :
            </td>
            <td >
                <asp:DropDownList ID="FSQDropDownList" runat="server" class="TextBox">
                    <asp:ListItem>What&#39;s Your Father Name?</asp:ListItem>
                    <asp:ListItem>What&#39;s Your Mother Name? </asp:ListItem>
                    <asp:ListItem>What&#39;s Your School Name?</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Security Answer :
            </td>
            <td >
                <asp:TextBox ID="FSATextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Group1"
                    ControlToValidate="FSATextBox" ErrorMessage="SecurityAnswerRequired">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="GoButton" runat="server"  class="classname" OnClick="GoButton_Click" Text="Go" validation=""
                    ValidationGroup="Group1" />
            </td>
            <td>
                <asp:Button ID="BackButton" runat="server"  class="classname" OnClick="BackButton_Click" Text="Back" />
            </td>
        </tr>
        <tr>
        <td colspan="2"><asp:Label ID="Rlblmsg" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
    </form>
</body>
</html>
