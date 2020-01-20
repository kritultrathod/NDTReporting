{
    var counter = 1;
    var handler = "MagneticParticleTestHandler.ashx";
    var handlerCombo = "RadiographicWeldList.ashx";
    var ReportId = 0;
    var datatype = "json";
    var empty = "";
    var myMagneticParticleTestResults1 = [];
    var dataResult = null;
    var dataObservation = null;
    //need to make it Dynamic


    var AppId = 1;
    var ClientId = 1;
    var SubTestId = 5;
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
        source: 'HTTPWebHandlers/Autocomplete.ashx?method=autolookuplist&ColumnNames=Reportid,ContractNo&SearchColumn=ContractNo&TableName=MagneticParticleExaminationTest',
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
    DoAjaxCall(handler, "AutoCompleteMagneticParticleTestReportSucess", "getbyid", value, datatype, empty);
}

function MagneticParticleTest() {

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
    this.JobDescription = $("#txtJobDescription").val();
    this.Material = $("#txtMaterial").val();
    this.Dimension = $("#txtDimension").val();
    this.SurfaceCondition = $("#txtSurfaceCondition").val();
    this.ReferenceStandard = $("#txtReferenceStandard").val();
    this.TestSpecification = $("#txtTestSpecification").val();
    this.AcceptanceCriteria = $("#txtAcceptanceCriteria").val();
    this.TechSheetNo = $("#txtTechSheetNo").val();
    this.ExtentofCoverage = $("#txtExtentofCoverage").val();
    this.SurfaceTemperature = $("#txtSurfaceTemperature").val();
    this.ConsumablesTypeId = $("#cmbConsumablesType").val();
    this.TechniqueId = $("#cmbTechniqueId").val();
    this.Direction = $("#txtDirection").val();
    this.DirectionMagnetization = $("#txtDirectionMagnetization").val();
    this.MagnetizationCurrent = $("#txtMagnetizationCurrent").val();
    this.Concentration = $("#txtConcentration").val();
    this.Illuminance = $("#txtIlluminance").val();
    this.ContrastPaint = $("#txtContrastPaint").val();
    this.Demagnetizing = $("#txtDemagnetizing").val();
    this.Equipment = $("#txtEquipment").val();
    this.CalibrationStatus = $("#txtCalibrationStatus").val();
    this.Amperage = $("#txtAmperage").val();
    this.Windings = $("#txtWindings").val();
    this.Spacing = $("#txtSpacing").val();
    this.BlackLightIntensity = $("#txtBlackLightIntensity").val();
    this.FieldIndicator = $("#txtFieldIndicator").val();
    this.FinalCleaning = $("#txtFinalCleaning").val();

    this.AppId = AppId;
    this.ClientId = ClientId;
    this.CreatedBy = CreatedBy;
    this.CreatedDate = CreatedDate;
    this.UpdatedBy = UpdatedBy;
    this.UpdatedDate = UpdatedDate;
    this.DeletedStatus = DeletedStatus;
}

function MagneticParticleTestResults(TestId, ReportId, Serial, JobDescription, Section, MagneticDimensionL, MagneticDimensionB, MagneticDimensionH, ObservationsId, Result, SketchReference, AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus) {
    this.TestId = TestId;
    this.ReportId = ReportId;
    this.Serial = Serial;
    this.JobDescription = JobDescription;
    this.Section = Section;
    this.MagneticDimensionL = MagneticDimensionL;
    this.MagneticDimensionB = MagneticDimensionB;
    this.MagneticDimensionH = MagneticDimensionH;
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

function MagneticParticleTestWrapper(MagneticParticleTest, MagneticParticleTestResults) {
    this.MagneticParticleTest = MagneticParticleTest;
    this.MagneticParticleTestResults = MagneticParticleTestResults;
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
				"<input type=\"text\" style='width: 100%;' name=\"txtSerial" + currentCounter + "\" id=\"txtSerial" + currentCounter + "\" class=\"{required:true, messages:{required:' is required!'}}\" /></div>" +
			"<div class='TableValue left' style='width: 15%; text-align: center;' >" +
				"<input type=\"text\" style='width: 100%;' name=\"txtJobDescription" + currentCounter + "\" id=\"txtJobDescription" + currentCounter + "\"  class=\"{required:true, messages:{required:' is required!'}}\" /></div>" +
			"<div class='TableValue left' style='width: 15%;'>" +
				"<input type=\"text\" style='width: 100%;' name=\"txtSection" + currentCounter + "\" id=\"txtSection" + currentCounter + "\"  /></div>" +
			"<div class='TableValue left' style='width: 15%;'>" +
				"<input type=\"text\" style='width: 25%;' name=\"txtMagneticDimensionL" + currentCounter + "\" id=\"txtMagneticDimensionL" + currentCounter + "\" />&nbsp;X&nbsp;" +
				"<input type=\"text\" style='width: 25%;' name=\"txtMagneticDimensionB" + currentCounter + "\" id=\"txtMagneticDimensionB" + currentCounter + "\" />&nbsp;X&nbsp;" +
                "<input type=\"text\" style='width: 25%;' name=\"txtMagneticDimensionH" + currentCounter + "\" id=\"txtMagneticDimensionH" + currentCounter + "\" /></div>" +
			"<div class='TableValue left' style='width: 15%;'>" +
				"<select style='width: 100%;'  name=\"cmbObservationsId" + currentCounter + "\" id=\"cmbObservationsId" + currentCounter + "\" ></select></div>" +
			"<div class='TableValue left' style='width: 15%;'>" +
				"<select style='width: 100%;'  name=\"cmbResult" + currentCounter + "\" id=\"cmbResult" + currentCounter + "\" ></select></div>" +
			"<div class='TableValue left' style='width: 15%; text-align: center;'>" +
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
    DoAjaxCall(handlerCombo, "FillComboTechnique", "GetTechnique", SubTestId, datatype, empty);
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
        DoAjaxCall(handler, "EditMagneticParticleTestReportSucess", "getbyid", getParameterByName("ReportId"), datatype, empty);
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


function FillComboTechnique(data, message) {

    var combo = $("#cmbTechniqueId").get(0);
    addSelectOneOption(combo);
    for (var i = 0; i < data.length; i++) {
        var newOption = document.createElement("option");
        newOption.text = data[i].TechniqueShortName;
        newOption.value = data[i].TechniqueId;
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
    $("#txtJobDescription").val("");
    $("#txtMaterial").val("");
    $("#txtDimension").val("");
    $("#txtDimension").val("");
    $("#txtSurfaceCondition").val("");
    $("#txtReferenceStandard").val("");
    $("#txtTestSpecification").val("");
    $("#txtAcceptanceCriteria").val("");
    $("#txtTechSheetNo").val("");
    $("#txtExtentofCoverage").val("");
    $("#txtSurfaceTemperature").val("");
    $("#cmbConsumablesType").val(0);
    $("#cmbTechniqueId").val(0);
    $("#txtDirection").val("");
    $("#txtDirectionMagnetization").val("");
    $("#txtMagnetizationCurrent").val("");
    $("#txtConcentration").val("");
    $("#txtIlluminance").val("");
    $("#txtContrastPaint").val("");
    $("#txtDemagnetizing").val("");
    $("#txtEquipment").val("");
    $("#txtCalibrationStatus").val("");
    $("#txtAmperage").val("");
    $("#txtWindings").val("");
    $("#txtSpacing").val("");
    $("#txtBlackLightIntensity").val("");
    $("#txtFieldIndicator").val("");
    $("#txtFinalCleaning").val("");

    for (i = 0; i < counter; i++) {

        $("#txtTestId" + i + "").val("");
        $("#txtSerial" + i + "").val("");
        $("#txtJobDescription" + i + "").val("");
        $("#txtSection" + i + "").val("");
        $("#txtMagneticDimensionL" + i + "").val("");
        $("#txtMagneticDimensionB" + i + "").val("");
        $("#txtMagneticDimensionH" + i + "").val("");
        $("#cmbObservationsId" + i + "").val(0);
        $("#cmbResult" + i + "").val(0);
        $("#txtSketchReference" + i + "").val("");

    }
}

var SaveMagneticParticleTest = function () {
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
            myMagneticParticleTestResults1[i] = new MagneticParticleTestResults
			(TestidTemp, ReportId,
			$("#txtSerial" + i).val(),
			$("#txtJobDescription" + i).val(),
			$("#txtSection" + i).val(),
			$("#txtMagneticDimensionL" + i).val(),
			$("#txtMagneticDimensionB" + i).val(),
            $("#txtMagneticDimensionH" + i).val(),
			$("#cmbObservationsId" + i).val(),
			$("#cmbResult" + i).val(),
			$("#txtSketchReference" + i).val(), AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus
			);
        }
    }
    var myMagneticParticleTest = new MagneticParticleTest();
    var myMagneticParticleTestTemplate = new MagneticParticleTestWrapper(myMagneticParticleTest, myMagneticParticleTestResults1);
    
    if (ReportId == 0)
        DoAjaxCall(handler, "InsertMagneticParticleTestCompleted", "Insert", empty, datatype, JSON.stringify(myMagneticParticleTestTemplate));
    else
    //handler, completed, method, parameter, datatype, data
        DoAjaxCall(handler, "UpdateMagneticParticleTestCompleted", "Update", empty, datatype, JSON.stringify(myMagneticParticleTestTemplate));
};

function InsertMagneticParticleTestCompleted(data, message) {
    alert(message);
    ClearValue();
    window.location.href = "MagneticParticleTestReportList.aspx?SubTestId=" + SubTestId;
}

function EditMagneticParticleTestReportSucess(data, message) {
    $("#txtReportId").val(data.MagneticParticleTest.ReportId);
    FillMagneticFields(data);

    for (i = 0; i < data.MagneticParticleTestResults.length; i++) {
        if (i > 0) {
            AddNewLineTestResult(i);
            counter++;
        }
        $("#txtTestId" + i + "").val(data.MagneticParticleTestResults[i].TestId);
        $("#txtSerial" + i + "").val(data.MagneticParticleTestResults[i].Serial);
        $("#txtJobDescription" + i + "").val(data.MagneticParticleTestResults[i].JobDescription);
        $("#txtSection" + i + "").val(data.MagneticParticleTestResults[i].Section);
        $("#txtMagneticDimensionL" + i + "").val(data.MagneticParticleTestResults[i].MagneticDimensionL);
        $("#txtMagneticDimensionB" + i + "").val(data.MagneticParticleTestResults[i].MagneticDimensionB);
        $("#txtMagneticDimensionH" + i + "").val(data.MagneticParticleTestResults[i].MagneticDimensionH);
        $("#cmbObservationsId" + i + "").val(data.MagneticParticleTestResults[i].ObservationsId);
        $("#cmbResult" + i + "").val(data.MagneticParticleTestResults[i].Result);
        $("#txtSketchReference" + i + "").val(data.MagneticParticleTestResults[i].SketchReference);
    }
}

function FillMagneticFields(data) {
    $("#txtFabricatorName").val(data.MagneticParticleTest.FabricatorName);
    $("#txtLocation").val(data.MagneticParticleTest.Location);
    $("#txtReportNo").val(data.MagneticParticleTest.ReportNo);
    $("#txtContractNo").val(data.MagneticParticleTest.ContractNo);
    $("#txtContactPerson").val(data.MagneticParticleTest.ContactPerson);
    $("#txtDateofTesting").val(data.MagneticParticleTest.DateofTestingString);
    $("#txtJobDescription").val(data.MagneticParticleTest.JobDescription);
    $("#txtMaterial").val(data.MagneticParticleTest.Material);
    $("#txtDimension").val(data.MagneticParticleTest.Dimension);
    $("#txtSurfaceCondition").val(data.MagneticParticleTest.SurfaceCondition);
    $("#txtReferenceStandard").val(data.MagneticParticleTest.ReferenceStandard);
    $("#txtTestSpecification").val(data.MagneticParticleTest.TestSpecification);
    $("#txtAcceptanceCriteria").val(data.MagneticParticleTest.AcceptanceCriteria);
    $("#txtTechSheetNo").val(data.MagneticParticleTest.TechSheetNo);
    $("#txtExtentofCoverage").val(data.MagneticParticleTest.ExtentofCoverage);
    $("#txtSurfaceTemperature").val(data.MagneticParticleTest.SurfaceTemperature);
    $("#cmbConsumablesType").val(data.MagneticParticleTest.ConsumablesTypeId);
    $("#cmbTechniqueId").val(data.MagneticParticleTest.TechniqueId);
    $("#txtDirection").val(data.MagneticParticleTest.Direction);
    $("#txtDirectionMagnetization").val(data.MagneticParticleTest.DirectionMagnetization);
    $("#txtMagnetizationCurrent").val(data.MagneticParticleTest.MagnetizationCurrent);
    
    $("#txtConcentration").val(data.MagneticParticleTest.Concentration);
    $("#txtIlluminance").val(data.MagneticParticleTest.Illuminance);
    $("#txtContrastPaint").val(data.MagneticParticleTest.ContrastPaint);
    $("#txtDemagnetizing").val(data.MagneticParticleTest.Demagnetizing);
    $("#txtEquipment").val(data.MagneticParticleTest.Equipment);
    $("#txtCalibrationStatus").val(data.MagneticParticleTest.CalibrationStatus);
    $("#txtAmperage").val(data.MagneticParticleTest.Amperage);
    $("#txtWindings").val(data.MagneticParticleTest.Windings);
    $("#txtSpacing").val(data.MagneticParticleTest.Spacing);
    $("#txtBlackLightIntensity").val(data.MagneticParticleTest.BlackLightIntensity);
    $("#txtFieldIndicator").val(data.MagneticParticleTest.FieldIndicator);
    $("#txtFinalCleaning").val(data.MagneticParticleTest.FinalCleaning);
}

function UpdateMagneticParticleTestCompleted(data, message) {
    alert(message);
    ClearValue();
    window.location.href = "MagneticParticleTestReportList.aspx?SubTestId=" + SubTestId;
}

function AutoCompleteMagneticParticleTestReportSucess(data, message) {
    FillMagneticFields(data);
}

//All simple auto complete and details comments on the first function
{
    function AutoCompleteControl(IdOfControl, SearchColumnname) {

        $(IdOfControl).autocomplete({
            //columnnames must have 2 values 1st the id name and next the text name (We know the id is of no use but still add it)
            source: "HTTPWebHandlers/Autocomplete.ashx?method=autosimplelist&&ColumnNames=Reportid,"
			+ SearchColumnname + "&SearchColumn=" + SearchColumnname + "&TableName=MagneticParticleExaminationTest"
        });
    }
    $(function () {
        AutoCompleteControl("#txtFabricatorName", "FabricatorName");
        AutoCompleteControl("#txtLocation", "Location");
        AutoCompleteControl("#txtReportNo", "ReportNo");
        AutoCompleteControl("#txtContactPerson", "ContactPerson");
        AutoCompleteControl("#txtDateofTesting", "DateofTesting");
        AutoCompleteControl("#txtJobDescription", "JobDescription");
        AutoCompleteControl("#txtMaterial", "Material");
        AutoCompleteControl("#txtDimension", "Dimension");
        AutoCompleteControl("#txtSurfaceCondition", "SurfaceCondition");
        AutoCompleteControl("#txtReferenceStandard", "ReferenceStandard");
        AutoCompleteControl("#txtTestSpecification", "TestSpecification");
        AutoCompleteControl("#txtAcceptanceCriteria", "AcceptanceCriteria");
        AutoCompleteControl("#txtTechSheetNo", "TechSheetNo");
        AutoCompleteControl("#txtExtentofCoverage", "ExtentofCoverage");
        AutoCompleteControl("#txtSurfaceTemperature", "SurfaceTemperature");
        AutoCompleteControl("#txtDirection", "Direction");
        AutoCompleteControl("#txtDirectionMagnetization", "DirectionMagnetization");
        AutoCompleteControl("#txtMagnetizationCurrent", "MagnetizationCurrent");
        AutoCompleteControl("#txtConcentration", "Concentration");
        AutoCompleteControl("#txtIlluminance", "Illuminance");
        AutoCompleteControl("#txtContrastPaint", "ContrastPaint");
        AutoCompleteControl("#txtDemagnetizing", "Demagnetizing");
        AutoCompleteControl("#txtEquipment", "Equipment");
        AutoCompleteControl("#txtCalibrationStatus", "CalibrationStatus");
        AutoCompleteControl("#txtAmperage", "Amperage");
        AutoCompleteControl("#txtWindings", "Windings");
        AutoCompleteControl("#txtSpacing", "Spacing");
        AutoCompleteControl("#txtBlackLightIntensity", "BlackLightIntensity");
        AutoCompleteControl("#txtFieldIndicator", "FieldIndicator");
        AutoCompleteControl("#txtFinalCleaning", "FinalCleaning");
    });
}