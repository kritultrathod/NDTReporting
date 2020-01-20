<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="NDTReporting.PresentationLayer.LoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
    </style>
</head>
<body>
    <form runat="server">
    <div id="container">
        <table align="right">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text="Username:" Font-Size="90%"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Group1"
                        ControlToValidate="EmailIDTextBox" ErrorMessage="" Font-Size="Small" Font-Italic="true">is required!</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;<asp:Label ID="Label2" runat="server" Text="Password:" Font-Size="90%"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Group1"
                        ControlToValidate="PasswordTextBox" ErrorMessage="" Font-Size="Small" Font-Italic="true">is required!</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Size="80%"></asp:Label>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="EmailIDTextBox"
                        ErrorMessage="* Please enter valid email address!" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})\s*"
                        ValidationGroup="Group1" Font-Size="80%"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:TextBox ID="EmailIDTextBox" runat="server" class="textBoxDiv"></asp:TextBox>
                    <br />
                </td>
                <td>
                    <asp:TextBox ID="PasswordTextBox" runat="server" class="textBoxDiv" 
                        TextMode="Password"></asp:TextBox>
                    <br />
                </td>
                <td>
                    <asp:Button ID="LogInButton" runat="server" Text="Log In" class="button" OnClick="LogInButton_Click"
                        ValidationGroup="Group1" CausesValidation="true" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:CheckBox ID="KeepmeloggedinCheckBox" runat="server" Text="Keep me signed in"
                        class="check" />
                </td>
               <%-- <td>
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PresentationLayer/ForgotPasswordForm.aspx"
                        class="MyLink" Font-Size="80%">Forgot your password?</asp:HyperLink>
                </td>--%>
            </tr>
        </table>
    </div>
    <div>
        <%--<table align="right" class="hyperlink1">
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PresentationLayer/Registration.aspx">Register</asp:HyperLink>
                    &nbsp;
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/PresentationLayer/LoginPage.aspx">About Us</asp:HyperLink>
                    &nbsp;
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/PresentationLayer/FeedbackForm.aspx">Contact Us</asp:HyperLink>
                </td>
            </tr>
        </table>--%>
        <%--    <table class="hyperlink3">
            <tr>
                <td>
                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>--%>
    </div>
    <div id="content">
        <asp:Label ID="Label3" runat="server" Text="Powered by : Artha"></asp:Label>
    </div>
    </form>
</body>
</html>
