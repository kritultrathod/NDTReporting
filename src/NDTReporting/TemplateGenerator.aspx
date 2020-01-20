<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true"
    CodeBehind="TemplateGenerator.aspx.cs" Inherits="NDTReporting.TemplateGenerator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Script/TemplateGenerator.js"></script>
    <script src="Scripts/addrecord-script.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.core.js"></script>
    <script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.mouse.js"></script>
    <script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery/jquery.ui.sortable.js"></script>
    <script type="text/javascript" src="http://www.eslinstructor.net/demo/swappable/jquery.ui.swappable.js"></script>
    <link href="CSS/style-web.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            InitializeTemplate();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overlay" class="web_dialog_overlay">
    </div>
    <div id="dialog" class="web_dialog">
        <table style='width: 100%; height: 100%;' class='TableValue'>
            <tr>
                <td style='width: 100%;' colspan="2" class='TDHeader'>
                    Test Type
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="padding-left: 15px;">
                    <b>Select Test Type</b>
                </td>
                <td style="padding-left: 15px;">
                    <select id="cmbTest">
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input id="Button1" type="button" value="Display" class="classname" onclick="Display();" />
                    <a href="#" id="btnClose" class="classname">Close</a>
                </td>
            </tr>
        </table>
    </div>
    <table style="width: 100%">
        <tr>
            <td style="width: 110px">
                Template Name:<div class="RedFont">
                    *</div>
            </td>
            <td style="width: 250px">
                <input id="txtTemplateName" type="text" class="TDFieldCell" />
            </td>
            <td style="text-align: left">
                <input type="submit" id="btnSave" value="Save" onclick="call(); return false;" class="classname" />
            </td>
        </tr>
    </table>
    <div id="ModifyTemplate">
    </div>
</asp:Content>
