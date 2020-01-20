<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="EditReport.aspx.cs" Inherits="NDTReporting.EditReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src="Script/Createreport.js" type="text/javascript"></script>
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
                    <input id="Button1" type="button" value="Display" class="classname" onclick="DisplayEditReportList();" />
                    <a href="#" id="btnClose" class="classname">Close</a>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
