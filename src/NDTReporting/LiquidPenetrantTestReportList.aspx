<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="LiquidPenetrantTestReportList.aspx.cs" Inherits="NDTReporting.LiquidPenetrantTestReportList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="Script/LiquidPenetrantTestReportList.js"></script>
    <script type="text/javascript" src="Script/Json/json2.js"></script>
    
    <div id="ListingData">
    </div>
    <%--<a href="#" id="btnShowModal">Print</a>--%>
    <div id="overlay" class="web_dialog_overlay">
    </div>
    
    <div id="dialog" class="web_dialog">
        <table style='width: 100%; height: 100%;' class='TableValue'>
            <tr>
                <td style='width: 100%;' colspan="2" class='TDHeader'>
                    Report Templates
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="padding-left: 15px;">
                    <b>Select Template </b>
                </td>
                <td style="padding-left: 15px;">
                    <select id="cmbTemplate">
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
                    <input id="Button1" type="button" value="Print" class="classname" onclick="Print();" />
                    <a href="#" id="btnClose" class="classname">Close</a>
                </td>
            </tr>
        </table>
    </div>
    <input id="txtHiddenReportId" type="hidden" />
</asp:Content>
