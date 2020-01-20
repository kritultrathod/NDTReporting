<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0045)http://www.ndtreports.teamartha.com/Dragjson/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POCNDTReport</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="" ie="EmulateIE8" http-equiv="X-UA-Compatible">
    
    <link href="../CSS/style-web.css" rel="stylesheet" type="text/css" />
    <%--<link rel="stylesheet" type="text/css" href="2121_files/style-print.css" media="print"  />--%>
    
    <script src="../Script/Common/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="../Script/Common/jquery-ui-1.8.24.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $('#JobDescription .DivColumns').sortable({
                connectWith: '#JobDescription .DivColumns'
            })

//            $('.Sections').sortable({
//                connectWith: '.Sections'
//            })
        });

        function getItems(exampleNr) {
            var columns = [];
            $(exampleNr + ' div.DivColumns').each(function () {
                columns.push($(this).sortable('toArray').join(','));
            });
            var x = columns.join('|');
            alert(x);
            return x;
        }

        function renderItems(items) {
            var html = '';
            var columns = items.split('|');
            for (var c in columns) {
                html += '<div class="column left';
                if (c == 0) {
                    html += ' first';
                }
                html += '"><ul class="sortable-list">';
                if (columns[c] != '') {
                    var items = columns[c].split(',');
                    for (var i in items) {
                        html += '<li class="sortable-item" id="' + items[i] + '">Sortable item ' + items[i] + '</li>';
                    }
                }
                html += '</ul></div>';
            }
            $('#example-2-4-renderarea').html(html);
        }
 
    </script>
    <meta name="GENERATOR" content="MSHTML 8.00.6001.18702">
</head>
<body class="body">
    <form id="form1" runat="server"></form>
</body>
</html>
