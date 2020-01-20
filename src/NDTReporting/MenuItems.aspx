<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HomeMaster.Master" CodeBehind="MenuItems.aspx.cs" Inherits="NDTReporting.MenuItems" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MenuItems</title>
    <%--<link rel="stylesheet" type="text/css" href="Css/style-web.css" />
    <%--<link rel="stylesheet" type="text/css" href="Css/Main.css" />--%>
    <%--<link href="Css/Menu.css" rel="stylesheet" type="text/css" />--%>
    <style type="text/css">
        .mattblacktabs
        {
            width: 100%;
            overflow: hidden;
            border-bottom: 0px solid black; /*bottom horizontal line that runs beneath tabs*/
        }
        
        .mattblacktabs ul
        {
            margin: 0;
            padding: 0;
            padding-left: 0px; /*offset of tabs relative to browser left edge*/
            font: bold 14px Verdana;
            list-style-type: none;
        }
        
        .mattblacktabs li
        {
            display: inline;
            margin: 0px;
        }
        
        .mattblacktabs li a
        {
          /*  float: right;*/
            display: block;
            text-decoration: none;
            margin: 0;
            padding: 0px 10px 0px 10px; /*padding inside each tab*/
            border-right: 8px solid white; /*right divider between tabs*/
            color: #666;
            background: #EEEEEE; /*background of tabs (default state)*/
        }
        
        .mattblacktabs li a:visited
        {
            color: black;
        }
        
        .mattblacktabs li a:hover, .mattblacktabs li.selected a
        {
            background: #e9e9e9; /*background of tabs for hover state, plus tab with "selected" class assigned to its LI */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mattblacktabs">
        <ul>
            <li><a>
                <asp:Menu ID="Menu1" Orientation="horizontal" runat="server" StaticEnableDefaultPopOutImage="false">
                </asp:Menu>
            </a></li>
        </ul>
    </div>
    </form>
</body>
</html>
