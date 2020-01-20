var handlerTest = "ReportLayoutViewerHandler.ashx";
var datatype = "json";
var empty = "";

$(document).ready(function () {
    $("#btnClose").click(function (e) {
        HideDialog();
        e.preventDefault();
    });
    InitializeTemplate();
    DoAjaxCall(handlerTest, "FillComboTest", "GetTestNames", "", datatype, empty);

});

function ShowDialog(modal) {
    $("#overlay").show();
    $("#dialog").fadeIn(200);

    if (modal) {
        $("#overlay").unbind("click");
    }
    else {

        $("#overlay").click(function (e) {
            HideDialog();
        });
    }
}
function HideDialog() {
    $("#overlay").hide();
    $("#dialog").fadeOut(200);
}

function FillComboTest(data, message) {

    var combo = $("#cmbTest").get(0);
    addSelectOneOption(combo);
    for (var i = 0; i < data.length; i++) {
        var newOption = document.createElement("option");
        newOption.text = data[i].SubTestName;
        newOption.value = data[i].SubTestId;
        combo.add(newOption);
    }
}

function InitializeTemplate() {
    ShowDialog(true);
}

function DisplayCreateReportList() {
    SubTestId = $("#cmbTest option:selected").val();
    HideDialog();
    if (SubTestId == 1) {
        window.location.href = "RadiographicWeldReport.aspx";
    }
    if (SubTestId == 3) {
        window.location.href = "UltrasonicTestReport.aspx";
    }
    if (SubTestId == 5) {
        window.location.href = "MagneticParticleTestReport.aspx";
    }
    if (SubTestId == 7) {
        window.location.href = "LiquidPenetrantTestReport.aspx";
    }
}
function DisplayEditReportList() {
    SubTestId = $("#cmbTest option:selected").val();
    HideDialog();
    if (SubTestId == 1) {
        window.location.href = "RadiographicWeldReportView.aspx?SubTestId=" + SubTestId;
    }
    if (SubTestId == 3) {
        window.location.href = "UltrasonicTestReportList.aspx?SubTestId=" + SubTestId;
    }
    if (SubTestId == 5) {
        window.location.href = "MagneticParticleTestReportList.aspx?SubTestId=" + SubTestId;
    }
    if (SubTestId == 7) {
        window.location.href = "LiquidPenetrantTestReportList.aspx?SubTestId=" + SubTestId;
    }
}

function DisplayTemplateList() {
    SubTestId = $("#cmbTest option:selected").val();
    HideDialog();

    window.location.href = "GetRediographicWeldTemplateName.aspx?SubTestId=" + SubTestId;

}