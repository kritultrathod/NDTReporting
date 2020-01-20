{
    //TODO: KTR - Changed for Edit template
    var handler = "SearchReport.ashx";
    var handlerRep = "TemplateEditHandler.ashx";
    var ReportID = 0;

    var myRadiographicWeldsTestResults1 = [];
    var datatype = "json";
    var empty = "";
    var SubTestId = 0;

}
{
    $(document).ready(function () {
        
        SubTestId = getParameterByName("SubTestId");
        $(".PrintReport").live('click', function (e) {
            var id = $(this).attr('id');
            $("#txtHiddenReportId").val(id);
            ShowDialog(true);
            e.preventDefault();
        });
        $("#btnClose").click(function (e) {
            HideDialog();
            e.preventDefault();
        });
        GetTemplateNames();

    });

    function GetTemplateNames() {
        
        var req = new TemplateParams(0, SubTestId, 'All'); //Authorize: send SubTestId to get all available templates for Test Type
        DoAjaxCall(handler, "TemplateNameView", "GetTemplateNames", "", datatype, JSON.stringify(req));
    }

    function TemplateNameView(data, message) {
        
        var str = "<table style='width: 100%;' class='TableValue'> <tr> <td colspan='8' class='TDHeader'> <b>Template List</b> </td> </tr> <tr> <td class='TDHeaderCell'> ReportTemplateName </td> <td class='TDHeaderCell' style='width:5%'>Delete</td><td class='TDHeaderCell' style='width:5%'>Edit</td></tr>";

        for (var i = 0; i < data.length; i++) {
            str += "<tr>";
            str += "<td class='TDFieldCell'>" + data[i].TemplateName + "</td>";
            str += "<td class='TDFieldCell'><a href='javascript:void(0)' class='classname' onclick='DeleteTemplate(" + data[i].TemplateID + ")'>Delete</a></td>";
            str += "<td class='TDFieldCell'><a href='javascript:void(0)' class='classname' onclick='EditRadiographicWeldTemplate(" + data[i].TemplateID + ")'>Edit</a></td>";
            str += "</tr>";
        }
        str += "</table>";
        $('#ListingData').html(str);
    }
    function DeleteTemplate(TemplateId) {
        if (confirm("Are you sure you want to delete the record?")) {
        
            DoAjaxCall(handlerRep, "DeleteTemplateSucess", "deleteRadiographictemplate", TemplateId, datatype, empty);
        }
    }
    function DeleteTemplateSucess(data, message) {
        alert(message);
        GetTemplateNames();

    }
    function EditRadiographicWeldTemplate(TemplateID) {
        //TODO: KTR - Changed for Edit template
        window.location.href = "TemplateGenerator.aspx?TemplateID=" + TemplateID + "&SubTestId=" + SubTestId;
    }
}