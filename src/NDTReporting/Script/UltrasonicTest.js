{
    var counter = 1;
    var handler = "UltrasonicTestHandler.ashx";
    var handlerCombo = "RadiographicWeldList.ashx";
    var ReportId = 0;
    var datatype = "json";
    var empty = "";
    var myUltrasonicTestResults1 = [];
    var dataResult = null;
    var dataObservation = null;
    //need to make it Dynamic

    var AppId = 1;
    var ClientId = 1;
    var SubTestId = 3;
    var CreatedBy = 1;
    var CreatedDate = new Date();
    var UpdatedBy = 1;
    var UpdatedDate = new Date();
    var DeletedStatus = 0;
    //need to make it Dynamic
}

$(function () {
    $("#txtContractNo").autocomplete({
        //columnnames must have 2 values 1st the id name and next the text name 
        source: 'HTTPWebHandlers/Autocomplete.ashx?method=autolookuplist&ColumnNames=Reportid,ContractNo&SearchColumn=ContractNo&TableName=UltrasonicExaminationTest',
        minLength: 1, // how many character when typing to display auto complete
        // After the value from auto complete is selected it will display the id in Id column
        select: function (event, ui) {
            AutoloadMyPage(ui.item.value, ui.item.label);
            return false;
        },
        focus: function (event, ui) {
            // this is to prevent value change of text box while browsing on the selected items
            event.preventDefault();
            AutoloadMytext(ui.item.label);
        }
    });
});
function AutoloadMytext(label) {
    $('#txtContractNo').val(label);
}

function AutoloadMyPage(value, label) {
    AutoloadMytext(label);
    DoAjaxCall(handler, "AutoCompleteUltrasonicParticleTestReportSucess", "getbyid", value, datatype, empty);
}

function UltrasonicTest() {

    if ($("#txtReportId").val() == "") {
        ReportId = 0;
        this.ReportId = 0;
    } else {
        this.ReportId = $("#txtReportId").val();
    }

    this.FabricatorName = $("#txtFabricatorName").val();
    this.SubTestId = SubTestId;
    this.Location = $("#txtLocation").val();
    this.ReportNo = $("#txtReportNo").val();
    this.ContractNo = $("#txtContractNo").val();
    this.ContactPerson = $("#txtContactPerson").val();
    if ($("#txtDateofTesting").val() == "")
        this.DateofTestingString = '1/1/1753';
    else
        this.DateofTestingString = $("#txtDateofTesting").val();

    //this.DateofTesting = $("#txtDateofTesting").val();
    this.Equipment = $("#txtEquipment").val();
    this.CalibrationStatus = $("#txtCalibration").val();
    this.CouplingMedia = $("#txtCouplingMedia").val();
    this.SurfaceCondition = $("#txtSurfaceCondition").val();
    
    this.ReferenceStandard = $("#txtReferenceStandard").val();
    this.TestSpecification = $("#txtTestSpecification").val();
    this.AcceptanceCriteria = $("#txtAcceptanceCriteria").val();
    this.TechSheetNo = $("#txtTechSheetNo").val();

    this.ExtentofCoverage = $("#txtExtentofCoverage").val();
    this.ConsumablesTypeId = $("#cmbConsumablesType").val();
    this.CalibrationBlock = $("#txtCalibrationBlock").val();
    this.ReferenceBlock = $("#txtReferenceBlock").val();
    this.SearchUnit = $("#txtSearchUnit").val();
    this.Frequency = $("#txtFrequency").val();
    this.BeamAngle = $("#txtBeamAngle").val();
    this.BeamIndex = $("#txtBeamIndex").val();
    this.MaxBeamPath = $("#txtMaxBeamPath").val();
    this.TimeBaseRange = $("#txtTimeBaseRange").val();
    this.Reflector = $("#txtReflector").val();
    this.Gain = $("#txtGain").val();
    this.Correction = $("#txtCorrection").val();
    this.Scan = $("#txtScan").val();
    this.RejectionLevel = $("#txtRejectionLevel").val();
    this.RecordingLevel = $("#txtRecordingLevel").val();
    
    this.AppId = AppId;
    this.ClientId = ClientId;
    this.CreatedBy = CreatedBy;
    this.CreatedDate = CreatedDate;
    this.UpdatedBy = UpdatedBy;
    this.UpdatedDate = UpdatedDate;
    this.DeletedStatus = DeletedStatus;
}

function UltrasonicTestResults(TestId, ReportId, Serial, JobDescription, Material, UltrasonicQuantityX, UltrasonicQuantityY, Dimension, Length, Depth, ObservationsId, Result, SketchReference, AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus) {
    this.TestId = TestId;
    this.ReportId = ReportId;
    this.Serial = Serial;
    this.JobDescription = JobDescription;
    this.Material = Material;
    this.UltrasonicQuantityX = UltrasonicQuantityX;
    this.UltrasonicQuantityY = UltrasonicQuantityY;
    this.Dimension = Dimension;
    this.Length = Length;
    this.Depth = Depth;
    this.ObservationsId = ObservationsId;
    this.Result = Result;
    this.SketchReference = SketchReference;
    this.AppId = AppId;
    this.ClientId = ClientId;
    this.CreatedBy = CreatedBy;
    this.CreatedDate = CreatedDate;
    this.UpdatedBy = UpdatedBy;
    this.UpdatedDate = UpdatedDate;
    this.DeletedStatus = DeletedStatus;
}

function UltrasonicTestWrapper(UltrasonicTest, UltrasonicTestResults) {
    this.UltrasonicTest = UltrasonicTest;
    this.UltrasonicTestResults = UltrasonicTestResults;
}


$(document).ready(function () {
    $("#addButton").live('click', function (e) {
        if (counter >= 25) {
            alert("Only 25 Test results are allowed.");
            return false;
        }
        AddNewLineTestResult(counter);
        counter++;
        e.preventDefault();
    });
    $("#removeButton").live('click', function (e) {
        if (counter == 1) {
            alert("Please enter at-least one row of Test result.");
            return false;
        }
        counter--;
        $('#LineContent' + counter).remove();
        e.preventDefault();
    });
});

function AddNewLineTestResult(currentCounter) {
    var newLineContentDiv = $(document.createElement('div')).attr("id", 'LineContent' + currentCounter);

    //TODO : remove this hard coding template.
    newLineContentDiv.append("" +
			"<div class='TableValue left' style='width: 10%;'>" +
				"<input type=\"hidden\" style='clear: left; margin-left: inherit;' name=\"txtTestId" + currentCounter + "\" id=\"txtTestId" + currentCounter + "\" />" +
				"<input type=\"text\" style='width: 100%;' name=\"txtSerial" + currentCounter + "\" id=\"txtSerial" + currentCounter + "\" /></div>" +
			"<div class='TableValue left' style='width: 10%; text-align: center;' >" +
				"<input type=\"text\" style='width: 100%;' name=\"txtJobDescription" + currentCounter + "\" id=\"txtJobDescription" + currentCounter + "\"  class=\"{required:true, messages:{required:' is required!'}}\" /></div>" +
            "<div class='TableValue left' style='width: 10%;'>" +
				"<input type=\"text\" style='width: 100%;' name=\"txtMaterial" + currentCounter + "\" id=\"txtMaterial" + currentCounter + "\"  /></div>" +
			"<div class='TableValue left' style='width: 10%;'>" +
				"<input type=\"text\" style='width: 40%;' name=\"txtUltrasonicQuantityX" + currentCounter + "\" id=\"txtUltrasonicQuantityX" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0, messages:{required:' is required!'}}\"  />&nbsp;X&nbsp;" +
            	"<input type=\"text\" style='width: 40%;' name=\"txtUltrasonicQuantityY" + currentCounter + "\" id=\"txtUltrasonicQuantityY" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0, messages:{required:' is required!'}}\"  /></div>" +
			"<div class='TableValue left' style='width: 8%;'>" +
				"<input type=\"text\" style='width: 100%;' name=\"txtDimension" + currentCounter + "\" id=\"txtDimension" + currentCounter + "\"  /></div>" +
            "<div class='TableValue left' style='width: 11%;'>" +
				"<input type=\"text\" style='width: 100%;' name=\"txtLength" + currentCounter + "\" id=\"txtLength" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0, messages:{required:' is required!'}}\" /></div>" +
            "<div class='TableValue left' style='width: 11%;'>" +
				"<input type=\"text\" style='width: 100%;' name=\"txtDepth" + currentCounter + "\" id=\"txtDepth" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0, messages:{required:' is required!'}}\" /></div>" +

			"<div class='TableValue left' style='width: 10%;'>" +
				"<select style='width: 100%;'  name=\"cmbObservationsId" + currentCounter + "\" id=\"cmbObservationsId" + currentCounter + "\" ></select></div>" +
			"<div class='TableValue left' style='width: 10%;'>" +
				"<select style='width: 100%;'  name=\"cmbResult" + currentCounter + "\" id=\"cmbResult" + currentCounter + "\" ></select></div>" +
			"<div class='TableValue left' style='width: 10%; text-align: center;'>" +
				"<input type=\"text\" style='width: 100%;' name=\"txtSketchReference" + currentCounter + "\" id=\"txtSketchReference" + currentCounter + "\"  /></div><div class=\"clear\"/>");
    // var counter = 1;
    //Read dynamically from the above object = document.getElementById('txtIdentificationNo' + counter + '').value

    newLineContentDiv.appendTo("#TestResults");
    FillResult(currentCounter, dataResult);
    FillObservations(currentCounter, dataObservation);
}

$(document).ready(function () {
    LoadAllCombo();
});

function LoadAllCombo() {
    DoAjaxCall(handlerCombo, "FillComboResult", "GetRemarks", SubTestId, datatype, empty);
    DoAjaxCall(handlerCombo, "FillComboObservations", "GetObservations", SubTestId, datatype, empty);
    DoAjaxCall(handlerCombo, "FillComboConsumablesType", "GetConsumablesType", SubTestId, datatype, empty);
}

function FillComboResult(data, message) {
    dataResult = data;
    FillResult(0, data);

}
function FillResult(comboCounter, data) {
    var combo = document.getElementById('cmbResult' + comboCounter);
    addSelectOneOption(combo);
    for (var i = 0; i < data.length; i++) {
        var newOption = document.createElement("option");
        newOption.text = data[i].RemarksShortName;
        newOption.value = data[i].RemarksId;
        combo.add(newOption);
    }
}
function SleepFunc()
{ }
function FillComboObservations(data, message) {

    dataObservation = data;
    FillObservations(0, data);

    if (getParameterByName("ReportId") != "") {
        setTimeout("SleepFunc()", 5000);
        ReportId = getParameterByName("ReportId");
        DoAjaxCall(handler, "EditUltrasonicTestReportSucess", "getbyid", getParameterByName("ReportId"), datatype, empty);
    }

}
function FillObservations(comboCounter, data) {

    var combo = document.getElementById('cmbObservationsId' + comboCounter);
    addSelectOneOption(combo);
    for (var i = 0; i < data.length; i++) {
        var newOption = document.createElement("option");
        newOption.text = data[i].ObservationsShortName;
        newOption.value = data[i].ObservationsId;
        combo.add(newOption);
    }

}
function FillComboConsumablesType(data, message) {

    var combo = $("#cmbConsumablesType").get(0);
    addSelectOneOption(combo);
    for (var i = 0; i < data.length; i++) {
        var newOption = document.createElement("option");
        newOption.text = data[i].ConsumablesType;
        newOption.value = data[i].ConsumablesTypeId;
        combo.add(newOption);
    }
}

function ClearValue() {
    $("#txtReportId").val("");
    $("#txtFabricatorName").val("");
    $("#txtLocation").val("");
    $("#txtReportNo").val("");
    $("#txtContractNo").val("");
    $("#txtContactPerson").val("");
    $("#txtDateofTesting").val("");
    $("#txtEquipment").val("");
    $("#txtCalibration").val("");
    $("#txtCouplingMedia").val("");
    $("#txtSurfaceCondition").val("");

    $("#txtReferenceStandard").val("");
    $("#txtTestSpecification").val("");
    $("#txtAcceptanceCriteria").val("");
    $("#txtTechSheetNo").val("");

    $("#txtExtentofCoverage").val("");
    $("#cmbConsumablesType").val(0);
    $("#txtCalibrationBlock").val("");
    $("#txtReferenceBlock").val("");
    $("#txtSearchUnit").val("");
    $("#txtFrequency").val("");
    $("#txtBeamAngle").val("");
    $("#txtBeamIndex").val("");
    $("#txtMaxBeamPath").val("");
    $("#txtTimeBaseRange").val("");
    $("#txtReflector").val("");
    $("#txtGain").val("");
    $("#txtCorrection").val("");
    $("#txtScan").val("");
    $("#txtRejectionLevel").val("");
    $("#txtRecordingLevel").val("");
    
    for (i = 0; i < counter; i++) {

        $("#txtTestId" + i + "").val("");
        $("#txtSerial" + i + "").val("");
        $("#txtJobDescription" + i + "").val("");
        $("#txtMaterial" + i + "").val("");
        $("#txtUltrasonicQuantityX" + i + "").val("");
        $("#txtUltrasonicQuantityY" + i + "").val("");
        $("#txtDimension" + i + "").val("");
        $("#txtLength" + i + "").val("");
        $("#txtDepth" + i + "").val("");
        $("#cmbObservationsId" + i + "").val(0);
        $("#cmbResult" + i + "").val(0);
        $("#txtSketchReference" + i + "").val("");

    }
}

var SaveUltrasonicTest = function () {
    
    var TestidTemp = 0;

    if ($("#txtReportId").val() == "") {
        ReportId = 0;
        this.ReportId = 0;
    } else {
        this.ReportId = $("#txtReportId").val();
    }

    for (i = 0; i < 25; i++) {
        if ($("#txtSerial" + i).val() == null) {
            break;
        }
        else {
            if ($("#txtTestId" + i).val() == "") {
                TestidTemp = 0;
            }
            else { TestidTemp = $("#txtTestId" + i).val(); }
            myUltrasonicTestResults1[i] = new UltrasonicTestResults
			(TestidTemp, ReportId,
			$("#txtSerial" + i).val(),
			$("#txtJobDescription" + i).val(),
            $("#txtMaterial" + i).val(),
			$("#txtUltrasonicQuantityX" + i).val(),
            $("#txtUltrasonicQuantityY" + i).val(),
			$("#txtDimension" + i).val(),
            $("#txtLength" + i).val(),
            $("#txtDepth" + i).val(),
			$("#cmbObservationsId" + i).val(),
			$("#cmbResult" + i).val(),
			$("#txtSketchReference" + i).val(), AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus
			);
        }
    }
    var myUltrasonicTest = new UltrasonicTest();
    var myUltrasonicTestTemplate = new UltrasonicTestWrapper(myUltrasonicTest, myUltrasonicTestResults1);
    
    if (ReportId == 0)
        DoAjaxCall(handler, "InsertUltrasonicTestCompleted", "Insert", empty, datatype, JSON.stringify(myUltrasonicTestTemplate));
    else
    //handler, completed, method, parameter, datatype, data
        DoAjaxCall(handler, "UpdateUltrasonicTestCompleted", "Update", empty, datatype, JSON.stringify(myUltrasonicTestTemplate));
};

function InsertUltrasonicTestCompleted(data, message) {
    alert(message);
    ClearValue();
    window.location.href = "UltrasonicTestReportList.aspx?SubTestId=" + SubTestId;
}

function EditUltrasonicTestReportSucess(data, message) {
    
    FillUltrasonicFields(data);
    $("#txtReportId").val(data.UltrasonicTest.ReportId);

    for (i = 0; i < data.UltrasonicTestResults.length; i++) {
        if (i > 0) {
            AddNewLineTestResult(i);
            counter++;
        }
        $("#txtTestId" + i + "").val(data.UltrasonicTestResults[i].TestId);
        $("#txtSerial" + i + "").val(data.UltrasonicTestResults[i].Serial);
        $("#txtJobDescription" + i + "").val(data.UltrasonicTestResults[i].JobDescription);
        $("#txtMaterial" + i + "").val(data.UltrasonicTestResults[i].Material);
        $("#txtUltrasonicQuantityX" + i + "").val(data.UltrasonicTestResults[i].UltrasonicQuantityX);
        $("#txtUltrasonicQuantityY" + i + "").val(data.UltrasonicTestResults[i].UltrasonicQuantityY);
        $("#txtDimension" + i + "").val(data.UltrasonicTestResults[i].Dimension);
        $("#txtLength" + i + "").val(data.UltrasonicTestResults[i].Length);
        $("#txtDepth" + i + "").val(data.UltrasonicTestResults[i].Depth);
        $("#cmbObservationsId" + i + "").val(data.UltrasonicTestResults[i].ObservationsId);
        $("#cmbResult" + i + "").val(data.UltrasonicTestResults[i].Result);
        $("#txtSketchReference" + i + "").val(data.UltrasonicTestResults[i].SketchReference);

    }
}

function FillUltrasonicFields(data) {

    $("#txtFabricatorName").val(data.UltrasonicTest.FabricatorName);
    $("#txtLocation").val(data.UltrasonicTest.Location);
    $("#txtReportNo").val(data.UltrasonicTest.ReportNo);
    $("#txtContractNo").val(data.UltrasonicTest.ContractNo);
    $("#txtContactPerson").val(data.UltrasonicTest.ContactPerson);
    $("#txtDateofTesting").val(data.UltrasonicTest.DateofTestingString);
    $("#txtEquipment").val(data.UltrasonicTest.Equipment);
    $("#txtCalibration").val(data.UltrasonicTest.CalibrationStatus);
    $("#txtCouplingMedia").val(data.UltrasonicTest.CouplingMedia);
    $("#txtSurfaceCondition").val(data.UltrasonicTest.SurfaceCondition);

    
    $("#txtReferenceStandard").val(data.UltrasonicTest.ReferenceStandard);
    $("#txtTestSpecification").val(data.UltrasonicTest.TestSpecification);
    $("#txtAcceptanceCriteria").val(data.UltrasonicTest.AcceptanceCriteria);
    $("#txtTechSheetNo").val(data.UltrasonicTest.TechSheetNo);

    
    $("#txtExtentofCoverage").val(data.UltrasonicTest.ExtentofCoverage);
    $("#cmbConsumablesType").val(data.UltrasonicTest.ConsumablesTypeId);
    $("#txtCalibrationBlock").val(data.UltrasonicTest.CalibrationBlock);
    $("#txtReferenceBlock").val(data.UltrasonicTest.ReferenceBlock);
    $("#txtSearchUnit").val(data.UltrasonicTest.SearchUnit);
    $("#txtFrequency").val(data.UltrasonicTest.Frequency);
    $("#txtBeamAngle").val(data.UltrasonicTest.BeamAngle);
    $("#txtBeamIndex").val(data.UltrasonicTest.BeamIndex);
    $("#txtMaxBeamPath").val(data.UltrasonicTest.MaxBeamPath);
    $("#txtTimeBaseRange").val(data.UltrasonicTest.TimeBaseRange);
    $("#txtReflector").val(data.UltrasonicTest.Reflector);
    $("#txtGain").val(data.UltrasonicTest.Gain);
    $("#txtCorrection").val(data.UltrasonicTest.Correction);
    $("#txtScan").val(data.UltrasonicTest.Scan);
    $("#txtRejectionLevel").val(data.UltrasonicTest.RejectionLevel);
    $("#txtRecordingLevel").val(data.UltrasonicTest.RecordingLevel);
    
}

function UpdateUltrasonicTestCompleted(data, message) {
    alert(message);
    ClearValue();
    window.location.href = "UltrasonicTestReportList.aspx?SubTestId=" + SubTestId;
}

function AutoCompleteUltrasonicParticleTestReportSucess(data, message) {
    FillUltrasonicFields(data)
}

//All simple auto complete and details comments on the first function
{
    function AutoCompleteControl(IdOfControl, SearchColumnname) {

        $(IdOfControl).autocomplete({
            //columnnames must have 2 values 1st the id name and next the text name (We know the id is of no use but still add it)
            source: "HTTPWebHandlers/Autocomplete.ashx?method=autosimplelist&&ColumnNames=Reportid,"
			+ SearchColumnname + "&SearchColumn=" + SearchColumnname + "&TableName=UltrasonicExaminationTest"
        });
    }
    $(function () {
        AutoCompleteControl("#txtFabricatorName", "FabricatorName");
        AutoCompleteControl("#txtLocation", "Location");
        AutoCompleteControl("#txtReportNo", "ReportNo");
        AutoCompleteControl("#txtContactPerson", "ContactPerson");
        AutoCompleteControl("#txtDateofTesting", "DateofTesting");
        AutoCompleteControl("#txtEquipment", "Equipment");
        AutoCompleteControl("#txtCalibration", "CalibrationStatus");
        AutoCompleteControl("#txtCouplingMedia", "CouplingMedia");
        AutoCompleteControl("#txtSurfaceCondition", "SurfaceCondition");
        AutoCompleteControl("#txtAcceptanceCriteria", "AcceptanceCriteria");
        AutoCompleteControl("#txtTechSheetNo", "TechSheetNo");
        AutoCompleteControl("#txtExtentofCoverage", "ExtentofCoverage");
    });
}