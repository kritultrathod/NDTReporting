<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValGen.aspx.cs" Inherits="NDTReporting.ValGen"
    MasterPageFile="~/HomeMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/addrecord-script.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            
            InitializeValidation();
        });
    </script>
</asp:Content>
<asp:Content ID="Main" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table>
        <tr>
            <td>
                Person ID:
            </td>
            <td>
                &nbsp;<span style="color: red;">*</span>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="TxtPersonID" MaxLength="50" CssClass="{required:true, email: true, messages:{required:'Person ID is required!'}}"
                    runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Name:
            </td>
            <td>
                &nbsp;<span style="color: red;">*</span>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="TxtName" CssClass="{required:true, minlength: 2, maxlength: 10, messages:{required:'Name is required!',minlength:'Must be at least 2 characters long!',maxlength:'Must be less than 11 characters long!'}}"
                    runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Age:
            </td>
            <td>
                &nbsp;<span style="color: red;">*</span>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="TxtAge" CssClass="{required:true, number:true, messages:{required:'Age is required!'}}"
                    runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Kid Count:
            </td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="TxtKidCount" CssClass="{number:true, min:1, max: 20, messages:{number:'Invalid number!'}}"
                    runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Birth Date:
            </td>
            <td>
                &nbsp;<span style="color: red;">*</span>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="TxtBirthDate" CssClass="{required:true, date:true, messages:{required:'Birth Date is required!'}}"
                    runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Email Address:
            </td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="TxtEmailAddress" MaxLength="50" CssClass="{email:true}" runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Web Site:
            </td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="TxtWebSite" MaxLength="100" CssClass="{url:true}" runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Password:
            </td>
            <td>
                &nbsp;<span style="color: red;">*</span>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="TxtPassword" MaxLength="50" CssClass="{required:true, messages:{required:'Password is required!'}}"
                    runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Confirm Password:
            </td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="TxtConfirmPassword" MaxLength="50" CssClass="{equalTo:'#ContentPlaceHolder1_TxtPassword', messages:{equalTo:'Must be the same as the Password field!'}}"
                    runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
            <td colspan="2">
                <asp:Button ID="BtnAddRecord" Text="Add Record" runat="server" OnClick="BtnAddRecord_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/addrecord-script.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(function () {
            
            InitializeValidation();
        });
    </script>
</head>
<body>
    <form id="testForm" runat="server">
    <table>
	    <tr>
		    <td>Person ID:</td>
            <td>&nbsp;<span style="color: red;">*</span>&nbsp;</td>
		    <td><asp:TextBox ID="TxtPersonID" MaxLength="50" CssClass="{required:true, messages:{required:'Person ID is required!'}}" runat="server" /></td>
		    <td></td>
	    </tr>
	    <tr>
		    <td>Name:</td>
            <td>&nbsp;<span style="color: red;">*</span>&nbsp;</td>
		    <td><asp:TextBox ID="TxtName" CssClass="{required:true, minlength: 2, maxlength: 10, messages:{required:'Name is required!',minlength:'Must be at least 2 characters long!',maxlength:'Must be less than 11 characters long!'}}" runat="server" /></td>
		    <td></td>
	    </tr>
	    <tr>
		    <td colspan="2"></td>
		    <td colspan="2">
                <asp:Button ID="BtnAddRecord" Text="Add Record" runat="server" OnClick="BtnAddRecord_Click" />
            </td>
	    </tr>
    </table> 
    </form>
</body>
</html>
--%>