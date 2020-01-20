<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/HomeMaster.Master" CodeBehind="EditTemplateGenerator.aspx.cs" Inherits="NDTReporting.EditTemplateGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Script/EditTemplateGenerator.js"></script>
    <script src="Scripts/addrecord-script.js" type="text/javascript"></script>
    <link href="CSS/style-web.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            
            InitializeTemplate();


        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                Template Name:<div class="RedFont">*</div>
            </td>
            <td>
                <input id="txtTemplateName" type="text"  onclick="return txtTemplateName_onclick()" />

            </td>
            <td>
                <input type="submit" id="btnSave" value="Save" onclick=" call(); return false;" class="classname" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">

        function txtTemplateName_onclick() {

        }

    </script>
    <%--<input type="submit" id="btnGetHtml" value="Get HTML" onclick="call();return false;" />--%>
    <div id="ModifyTemplate">
    </div>
</asp:Content>