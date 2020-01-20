<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="NDTReporting.PresentationLayer.Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../CSS/style-web.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/style-print.css" media="print" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="TableValue" width="40%" border="1px">
            <tr>
                <td class="TDHeaderCell" colspan="2">
                    <asp:Label ID="SignUpLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="Sign Up Here"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblmsg1" runat="server" ForeColor="#006600"></asp:Label>
                    <asp:Label ID="lblmsg2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Email ID :
                </td>
                <td>
                    <asp:TextBox ID="REmailIDTextbox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Group2"
                        ControlToValidate="REmailIDTextbox" ErrorMessage="Emailid Is Required">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="REmailIDTextbox"
                        ErrorMessage="Input valid email address!" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})\s*"
                        ValidationGroup="Group2"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password :
                </td>
                <td>
                    <asp:TextBox ID="RPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Group2"
                        ControlToValidate="RPasswordTextBox" ErrorMessage="Password Is Required">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="RPasswordTextBox" ErrorMessage="Password length must be between 6 to 12 characters"
                        ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{7,10}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password :
                </td>
                <td>
                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Group2"
                        ControlToValidate="ConfirmPasswordTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="Group2"
                        ControlToCompare="RPasswordTextBox" ControlToValidate="ConfirmPasswordTextBox"
                        ErrorMessage="Your passwords do not match up!"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Company Name :
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Your Name :
                </td>
                <td>
                    <asp:TextBox ID="RNameTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Group2"
                        ControlToValidate="RNameTextBox" ErrorMessage="Name Is Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile No :
                </td>
                <td>
                    <asp:TextBox ID="RMobileNOTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Group2"
                        ControlToValidate="RMobileNOTextBox" ErrorMessage="Mobile No Is Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Security Question :
                </td>
                <td>
                    <asp:DropDownList ID="SQDropDownList" runat="server">
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
                <td>
                    <asp:TextBox ID="SATextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Group2"
                        ControlToValidate="SATextBox" ErrorMessage="SecurityAnswer Is Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="RSignUpButton" runat="server" class="classname" Text="Sign Up" OnClick="RSignUpButton_Click"
                        ValidationGroup="Group2" CausesValidation="true" />
                </td>
                <td>
                    <asp:Button ID="RCancelButton" runat="server" class="classname" Text="Back" OnClick="RCancelButton_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
