//Custom Declarations
{
    var handler = "SearchReport.ashx";
    var ReportID = 0;

    var myRadiographicWeldsTestResults1 = [];
    var datatype = "json";
    var empty = "";
}
//Page Functions
{
    $(document).ready(function () {
        GetReportNumbers();
    });
    function GetReportNumbers() {
        DoAjaxCall(handler, "FillCombo", "GetReportNumbers", "", datatype, empty);
    }

    function GetReportsById() {
        
        var strUser;
        strUser = $("#selectTestReportNumber option:selected").val();
        var param = "&ID=" + strUser;
        DoAjaxCall(handler, "SearchReports", "GetReports", param, datatype, empty);
    }

    function FillCombo(data, message) {
        var combo = document.getElementById('selectTestReportNumber');
        addSelectOneOption(combo);
        for (var i = 0; i < data.length; i++) {
            var newOption = document.createElement("option");
            newOption.text = data[i].TestReportNumber;
            newOption.value = data[i].ReportID;
            combo.add(newOption);
        }
    }

    function SearchReports(data, message) {
        var str = " <table border='1' cellpadding='2' cellspacing='0' width='500px'><tr><td colspan=7 style='background-color: Gray' align='center'><b>Report List</b></td></tr><tr> <td>Test Report No.</td><td>Client</td><td>Location</td><td>ContactPerson</td><td>ContactNumber</td><td>JobDescription</td><td>TestDate</td></tr>";

        str += "<tr><td>" + data.RadiographicWeld.TestReportNumber + "</td>";
        str += "<td>" + data.RadiographicWeld.Client + "</td>";
        str += "<td>" + data.RadiographicWeld.Location + "</td>";
        str += "<td>" + data.RadiographicWeld.ContactPerson + "</td>";
        str += "<td>" + data.RadiographicWeld.ContactNumber + "</td>";
        str += "<td>" + data.RadiographicWeld.JobDescription + "</td>";
        str += "<td>" + data.RadiographicWeld.TestDate + "</td></tr>";
        str += "</table>";
        str += "<br><br>";

        str += " <table border='1' cellpadding='2' cellspacing='0' width='500px'><tr><td colspan=7 style='background-color: Gray' align='center'><b>Test Results</b></td></tr><tr> <td>Identification No.</td><td>Joint No.</td><td>Welder  </td><td>Segment</td><td>FilmSize</td><td>Observation</td><td>Remarks</td></tr>";

        for (var i = 0; i < data.RadiographicWeldsTestResult.length; i++) {
            str += "<tr><td>" + data.RadiographicWeldsTestResult[i].IdentificationNo + "</td>";
            str += "<td>" + data.RadiographicWeldsTestResult[i].JointNo + "</td>";
            str += "<td>" + data.RadiographicWeldsTestResult[i].Welder + "</td>";
            str += "<td>" + data.RadiographicWeldsTestResult[i].Segment + "</td>";
            str += "<td>" + data.RadiographicWeldsTestResult[i].FlimSizeX + " X " + data.RadiographicWeldsTestResult[i].FlimSizeY + "</td>";
            str += "<td>" + data.RadiographicWeldsTestResult[i].Observation + "</td>";
            str += "<td>" + data.RadiographicWeldsTestResult[i].Remarks + "</td></tr>";
        }
        str += "</table>"

        $('#ListingData').html(str);
    }
}