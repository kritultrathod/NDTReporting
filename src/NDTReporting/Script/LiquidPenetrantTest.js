{
	var counter = 1;
	var handler = "LiquidPenetrantTestHandler.ashx";
	var handlerCombo = "RadiographicWeldList.ashx";
	var ReportId = 0;
	var datatype = "json";
	var empty = "";
	var myLiquidPenetrantTestResults1 = [];
	var dataResult = null;
	var dataObservation = null;
	//need to make it Dynamic


	var AppId = 1;
	var ClientId = 1;
	var SubTestId = 7;
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
		source: 'HTTPWebHandlers/Autocomplete.ashx?method=autolookuplist&ColumnNames=Reportid,ContractNo&SearchColumn=ContractNo&TableName=LiquidPenetrantExaminationTest',
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
	DoAjaxCall(handler, "AutoCompleteLiquidPenetrantTestReportSucess", "getbyid", value, datatype, empty);

}

function LiquidPenetrantTest() {
	if ($("#txtReportId").val() == "") {
		ReportId = 0;
		this.ReportId = 0;
	} else {
		this.ReportId = $("#txtReportId").val();
		ReportId = this.ReportId;
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

	this.Penetrant = $("#txtPenetrant").val();
	this.PenetrantBatchNo = $("#txtPenetrantBatchNo").val();
	this.ApplicationOfPenetrant = $("#txtApplicationOfPenetrant").val();
	this.PenetrantRemovalMethod = $("#txtPenetrantRemovalMethod").val();
	this.Developer = $("#txtDeveloper").val();
	this.DeveloperBatchNo = $("#txtDeveloperBatchNo").val();
	this.ApplicationOfDeveloper = $("#txtApplicationOfDeveloper").val();
	this.ViewingCondition = $("#txtViewingCondition").val();
	this.MarkingOfIndication = $("#txtMarkingOfIndication").val();
	this.PreCleaning = $("#txtPreCleaning").val();
	this.DwellTime = $("#txtDwellTime").val();
	this.DryingTime = $("#txtDryingTime").val();
	this.BlackLightDetails = $("#txtBlackLightDetails").val();
	this.FinalClearing = $("#txtFinalClearing").val();

	this.AppId = AppId;
	this.ClientId = ClientId;
	this.CreatedBy = CreatedBy;
	this.CreatedDate = CreatedDate;
	this.UpdatedBy = UpdatedBy;
	this.UpdatedDate = UpdatedDate;
	this.DeletedStatus = DeletedStatus;
}

function LiquidPenetrantTestResults(TestId, ReportId, Serial, JobDescription, LiquidQuantityX, LiquidQuantityY, ObservationsId, Result, SketchReference, AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus) {
	this.TestId = TestId;
	this.ReportId = ReportId;
	this.Serial = Serial;
	this.JobDescription = JobDescription;
	this.LiquidQuantityX = LiquidQuantityX;
	this.LiquidQuantityY = LiquidQuantityY;
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

function LiquidPenetrantTestWrapper(LiquidPenetrantTest, LiquidPenetrantTestResults) {
	this.LiquidPenetrantTest = LiquidPenetrantTest;
	this.LiquidPenetrantTestResults = LiquidPenetrantTestResults;
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
				"<input type=\"text\" style='width: 100%;' name=\"txtSerial" + currentCounter + "\" id=\"txtSerial" + currentCounter + "\"  /></div>" +
			"<div class='TableValue left' style='width: 15%; text-align: center;' >" +
				"<input type=\"text\" style='width: 100%;' name=\"txtJobDescription" + currentCounter + "\" id=\"txtJobDescription" + currentCounter + "\"  class=\"{required:true, messages:{required:' is required!'}}\" /></div>" +
			"<div class='TableValue left' style='width: 15%;'>" +
				"<input type=\"text\" style='width: 40%;' name=\"txtLiquidQuantityX" + currentCounter + "\" id=\"txtLiquidQuantityX" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0, messages:{required:' is required!'}}\"  />&nbsp;X&nbsp;" +
				"<input type=\"text\" style='width: 40%;' name=\"txtLiquidQuantityY" + currentCounter + "\" id=\"txtLiquidQuantityY" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0, messages:{required:' is required!'}}\"  /></div>" +
			"<div class='TableValue left' style='width: 20%;'>" +
				"<select style='width: 100%;'  name=\"cmbObservationsId" + currentCounter + "\" id=\"cmbObservationsId" + currentCounter + "\" ></select></div>" +
			"<div class='TableValue left' style='width: 20%;'>" +
				"<select style='width: 100%;'  name=\"cmbResult" + currentCounter + "\" id=\"cmbResult" + currentCounter + "\" ></select></div>" +
			"<div class='TableValue left' style='width: 20%; text-align: center;'>" +
				"<input type=\"text\" style='width: 100%;' name=\"txtSketchReference" + currentCounter + "\" id=\"txtSketchReference" + currentCounter + "\"  /></div><div class=\"clear\"/>");
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
		ReportID = getParameterByName("ReportId");

		DoAjaxCall(handler, "EditLiquidPenetrantTestReportSucess", "getbyid", getParameterByName("ReportId"), datatype, empty);
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
	$("#txtSurfaceCondition").val("");
	$("#txtReferenceStandard").val("");
	$("#txtTestSpecification").val("");
	$("#txtAcceptanceCriteria").val("");
	$("#txtTechSheetNo").val("");
	$("#txtExtentofCoverage").val("");
	$("#txtSurfaceTemperature").val("");
	$("#cmbConsumablesType").val(0);
	$("#cmbTechniqueId").val(0);
	$("#txtPenetrant").val("");
	$("#txtPenetrantBatchNo").val("");
	$("#txtApplicationOfPenetrant").val("");
	$("#txtPenetrantRemovalMethod").val("");
	$("#txtDeveloper").val("");
	$("#txtDeveloperBatchNo").val("");
	$("#txtApplicationOfDeveloper").val("");
	$("#txtViewingCondition").val("");
	$("#txtMarkingOfIndication").val("");
	$("#txtPreCleaning").val("");
	$("#txtDwellTime").val("");
	$("#txtDryingTime").val("");
	$("#txtBlackLightDetails").val("");
	$("#txtFinalClearing").val("");

	for (i = 0; i < counter; i++) {

		$("#txtTestId" + i + "").val("");
		$("#txtSerial" + i + "").val("");
		$("#txtJobDescription" + i + "").val("");
		$("#txtLiquidQuantityX" + i + "").val("");
		$("#txtLiquidQuantityY" + i + "").val("");
		$("#cmbObservationsId" + i + "").val(0);
		$("#cmbResult" + i + "").val(0);
		$("#txtSketchReference" + i + "").val("");

	}
}

var SaveLiquidParticleTest = function () {

	var TestidTemp = 0;
	if ($("#txtReportId").val() == "") {
		ReportId = 0;
		this.ReportId = 0;
	} else {
		this.ReportId = $("#txtReportId").val();
		ReportId = this.ReportId;
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
			myLiquidPenetrantTestResults1[i] = new LiquidPenetrantTestResults
			(TestidTemp, ReportId,
			$("#txtSerial" + i).val(),
			$("#txtJobDescription" + i).val(),
			$("#txtLiquidQuantityX" + i).val(),
			$("#txtLiquidQuantityY" + i).val(),
			$("#cmbObservationsId" + i).val(),
			$("#cmbResult" + i).val(),
			$("#txtSketchReference" + i).val(), AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus
			);
		}
	}
	var myLiquidPenetrantTest = new LiquidPenetrantTest();
	var myLiquidPenetrantTestTemplate = new LiquidPenetrantTestWrapper(myLiquidPenetrantTest, myLiquidPenetrantTestResults1);

	if (ReportId == 0)
		DoAjaxCall(handler, "InsertLiquidPenetrantTestCompleted", "Insert", empty, datatype, JSON.stringify(myLiquidPenetrantTestTemplate));
	else
	//handler, completed, method, parameter, datatype, data
		DoAjaxCall(handler, "UpdateLiquidPenetrantTestCompleted", "Update", empty, datatype, JSON.stringify(myLiquidPenetrantTestTemplate));
};

function InsertLiquidPenetrantTestCompleted(data, message) {
	alert(message);
	ClearValue();
	window.location.href = "LiquidPenetrantTestReportList.aspx?SubTestId=" + SubTestId;
}

function EditLiquidPenetrantTestReportSucess(data, message) {

	FillLiquidFields(data);

	for (i = 0; i < data.LiquidPenetrantTestResults.length; i++) {
		if (i > 0) {
			AddNewLineTestResult(i);
			counter++;
		}
		$("#txtTestId" + i + "").val(data.LiquidPenetrantTestResults[i].TestId);
		$("#txtSerial" + i + "").val(data.LiquidPenetrantTestResults[i].Serial);
		$("#txtJobDescription" + i + "").val(data.LiquidPenetrantTestResults[i].JobDescription);
		$("#txtLiquidQuantityX" + i + "").val(data.LiquidPenetrantTestResults[i].LiquidQuantityX);
		$("#txtLiquidQuantityY" + i + "").val(data.LiquidPenetrantTestResults[i].LiquidQuantityY);
		$("#cmbObservationsId" + i + "").val(data.LiquidPenetrantTestResults[i].ObservationsId);
		$("#cmbResult" + i + "").val(data.LiquidPenetrantTestResults[i].Result);
		$("#txtSketchReference" + i + "").val(data.LiquidPenetrantTestResults[i].SketchReference);

	}
}
function FillLiquidFields(data) {
	$("#txtReportId").val(data.LiquidPenetrantTest.ReportId);
	$("#txtFabricatorName").val(data.LiquidPenetrantTest.FabricatorName);
	$("#txtLocation").val(data.LiquidPenetrantTest.Location);
	$("#txtReportNo").val(data.LiquidPenetrantTest.ReportNo);
	$("#txtContractNo").val(data.LiquidPenetrantTest.ContractNo);
	$("#txtContactPerson").val(data.LiquidPenetrantTest.ContactPerson);
	$("#txtDateofTesting").val(data.LiquidPenetrantTest.DateofTestingString);
	$("#txtJobDescription").val(data.LiquidPenetrantTest.JobDescription);
	$("#txtMaterial").val(data.LiquidPenetrantTest.Material);
	$("#txtDimension").val(data.LiquidPenetrantTest.Dimension);
	$("#txtSurfaceCondition").val(data.LiquidPenetrantTest.SurfaceCondition);
	$("#txtReferenceStandard").val(data.LiquidPenetrantTest.ReferenceStandard);
	$("#txtTestSpecification").val(data.LiquidPenetrantTest.TestSpecification);
	$("#txtAcceptanceCriteria").val(data.LiquidPenetrantTest.AcceptanceCriteria);
	$("#txtTechSheetNo").val(data.LiquidPenetrantTest.TechSheetNo);
	$("#txtExtentofCoverage").val(data.LiquidPenetrantTest.ExtentofCoverage);
	$("#txtSurfaceTemperature").val(data.LiquidPenetrantTest.SurfaceTemperature);
	$("#cmbConsumablesType").val(data.LiquidPenetrantTest.ConsumablesTypeId);
	$("#cmbTechniqueId").val(data.LiquidPenetrantTest.TechniqueId);
	$("#txtPenetrant").val(data.LiquidPenetrantTest.Penetrant);

	$("#txtPenetrantBatchNo").val(data.LiquidPenetrantTest.PenetrantBatchNo);
	$("#txtApplicationOfPenetrant").val(data.LiquidPenetrantTest.ApplicationOfPenetrant);
	$("#txtPenetrantRemovalMethod").val(data.LiquidPenetrantTest.PenetrantRemovalMethod);
	$("#txtDeveloper").val(data.LiquidPenetrantTest.Developer);
	$("#txtDeveloperBatchNo").val(data.LiquidPenetrantTest.DeveloperBatchNo);
	$("#txtApplicationOfDeveloper").val(data.LiquidPenetrantTest.ApplicationOfDeveloper);
	$("#txtViewingCondition").val(data.LiquidPenetrantTest.ViewingCondition);
	$("#txtMarkingOfIndication").val(data.LiquidPenetrantTest.MarkingOfIndication);
	$("#txtPreCleaning").val(data.LiquidPenetrantTest.PreCleaning);
	$("#txtDwellTime").val(data.LiquidPenetrantTest.DwellTime);
	$("#txtDryingTime").val(data.LiquidPenetrantTest.DryingTime);
	$("#txtBlackLightDetails").val(data.LiquidPenetrantTest.BlackLightDetails);
	$("#txtFinalClearing").val(data.LiquidPenetrantTest.FinalClearing);
}
function UpdateLiquidPenetrantTestCompleted(data, message) {
	alert(message);
	ClearValue();
	window.location.href = "LiquidPenetrantTestReportList.aspx?SubTestId=" + SubTestId;
}

function AutoCompleteLiquidPenetrantTestReportSucess(data, message) {
	FillLiquidFields(data);
}

//All simple auto complete and details comments on the first function
{
	function AutoCompleteControl(IdOfControl, SearchColumnname) {

		$(IdOfControl).autocomplete({
			//columnnames must have 2 values 1st the id name and next the text name (We know the id is of no use but still add it)
			source: "HTTPWebHandlers/Autocomplete.ashx?method=autosimplelist&&ColumnNames=Reportid,"
			+ SearchColumnname + "&SearchColumn=" + SearchColumnname + "&TableName=LiquidPenetrantExaminationTest"
		});
	}
	$(function () {
		AutoCompleteControl("#txtFabricatorName", "FabricatorName");
		AutoCompleteControl("#txtLocation", "Location");
		AutoCompleteControl("#txtReportNo", "ReportNo");
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
		AutoCompleteControl("#txtPenetrant", "Penetrant");
		AutoCompleteControl("#txtPenetrantBatchNo", "PenetrantBatchNo");
		AutoCompleteControl("#txtApplicationOfPenetrant", "ApplicationOfPenetrant");
		AutoCompleteControl("#txtPenetrantRemovalMethod", "PenetrantRemovalMethod");
		AutoCompleteControl("#txtDeveloper", "Developer");
		AutoCompleteControl("#txtDeveloperBatchNo", "DeveloperBatchNo");
		AutoCompleteControl("#txtApplicationOfDeveloper", "ApplicationOfDeveloper");
		AutoCompleteControl("#txtViewingCondition", "ViewingCondition");
		AutoCompleteControl("#txtMarkingOfIndication", "MarkingOfIndication");
		AutoCompleteControl("#txtPreCleaning", "PreCleaning");
		AutoCompleteControl("#txtDwellTime", "DwellTime");
		AutoCompleteControl("#txtDryingTime", "DryingTime");
		AutoCompleteControl("#txtBlackLightDetails", "BlackLightDetails");
		AutoCompleteControl("#txtFinalClearing", "FinalClearing");
	});
}