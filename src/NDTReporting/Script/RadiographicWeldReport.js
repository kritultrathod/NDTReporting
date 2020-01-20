//handler, completed, method, parameter, datatype, data
//Custom Declarations
{
    var handler = "RadiographicWeldList.ashx";
    var handlerTest = "ReportLayoutViewerHandler.ashx";
    var handlerCombo = "SearchReport.ashx";
    var dataRemark = null;
    var dataObservation = null;
    var ReportId = 0;
    var counter = 1;
    var myRadiographicWeldsTestResults1 = [];
    var datatype = "json";
    var empty = "";

    var AppId = 1;
    var ClientId = 1;
    var SubTestId = 1;
    var CreatedBy = 1;
    var CreatedDate = new Date();
    var UpdatedBy = 1;
    var UpdatedDate = new Date();
    var DeletedStatus = 0;
}
$(function () {
    $("#txtContractNumber").autocomplete({
        //columnnames must have 2 values 1st the id name and next the text name 
        source: 'HTTPWebHandlers/Autocomplete.ashx?method=autolookuplist&ColumnNames=Reportid,ContractNo&SearchColumn=ContractNo&TableName=RadiographicWeld',
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
    $('#txtContractNumber').val(label);
}

function AutoloadMyPage(value, label) {
    AutoloadMytext(label);
    DoAjaxCall(handler, "AutoCompleteRadiographicWeldTestReportSucess", "getbyid", value, datatype, empty);

}
//Entity Construction
{
    //TODO: KTR - Automate this generation from the CS file ifself
    //TODO: KTR - Add Client Side Validations in constructions itself.
    function RadiographicWeld() {
        
        if ($("#txtReportId").val() == "") {
            ReportId = 0;
            this.ReportId = 0;
        } else {
            this.ReportId = $("#txtReportId").val(); //  document.getElementById("txtReportId").value;
        }
        this.SubTestId = SubTestId;
        this.Client = $("#txtClient").val(); // document.getElementById("txtClient").value;
        this.ContractNumber = $("#txtContractNumber").val();

        this.ContactPerson = $("#txtContactPerson").val();
        this.ContactNumber = $("#txtContactNumber").val();

        this.JobDescription = $("#txtJobDescription").val();
        this.Location = $("#txtLocation").val();
        if ($("#txtTestDate").val() == "")
            this.TestDateString = "";
        else
            this.TestDateString = $("#txtTestDate").val();

        this.TestReportNumber = $("#txtTestReportNumber").val();
        this.RadiationSourceId = $("#cmbRadiationSource").val();
        this.ExposureTime = $("#txtExposureTime").val();
        this.FilmMakeAndTypeId = $("#cmbFilmMakeAndTypeId").val();
        this.TypeofIQI = $("#txtTypeofIQI").val();
        this.IQIBatchNo = $("#txtIQIBatchNo").val();
        this.GeometricalUnsharpness = $("#txtGeometricalUnsharpness").val();
        this.TechniqueId = $("#cmbTechniqueId").val();
        this.ShimThickness = $("#txtShimThickness").val();
        this.DensitometerNo = $("#txtDensitometerNo").val();

        if ($("#txtCalibrationDate").val() == "")
            this.CalibrationDateString = "";
        else
            this.CalibrationDateString = $("#txtCalibrationDate").val();

        this.MaterialSpecification = $("#txtMaterialSpecification").val();
        this.SurfaceCondition = $("#txtSurfaceCondition").val();
        this.SurfaceTemperature = $("#txtSurfaceTemperature").val();
        this.ExtentofExamination = $("#txtExtentofExamination").val();
        this.Dimension = $("#txtDimension").val();
        this.SFD = $("#txtSFD").val();
        this.WeldThickness = $("#txtWeldThickness").val();
        this.WeldPreparation = $("#txtWeldPreparation").val();
        this.WeldingMethod = $("#txtWeldingMethod").val();
        this.StageofExamination = $("#txtStageofExamination").val();
        this.FocalSpotSize = $("#txtFocalSpotSize").val();
        this.UnitofEnergy = $("#txtUnitofEnergy").val();

        this.ReferenceStandard = $("#txtReferenceStandard").val();
        this.TestSpecification = $("#txtTestSpecification").val();
        this.AcceptanceCriteria = $("#txtAcceptanceCriteria").val();
        this.TechSheetNo = $("#txtTechSheetNo").val();

        this.AppId = AppId;
        this.ClientId = ClientId;
        this.CreatedBy = CreatedBy;
        this.CreatedDate = CreatedDate;
        this.UpdatedBy = UpdatedBy;
        this.UpdatedDate = UpdatedDate;
        this.DeletedStatus = DeletedStatus;
    }

    function RadiographicWeldsTestResult(TestId, ReportId, IdentificationNo, JointNo, Welder, Segment, FlimSizeX, FlimSizeY, ObservationsId, RemarksId, Density, Sensitivity, AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus) {
        this.TestId = TestId;
        this.ReportId = ReportId;
        this.IdentificationNo = 0;
        if (IdentificationNo != "")
            this.IdentificationNo = IdentificationNo;
        this.JointNo = 0;
        if (JointNo != "")
            this.JointNo = JointNo;
        this.Welder = Welder;
        this.Segment = Segment;
        this.FlimSizeX = FlimSizeX;
        this.FlimSizeY = FlimSizeY;
        this.ObservationsId = ObservationsId;
        this.RemarksId = RemarksId;
        this.Density = 0;
        if (Density != "")
            this.Density = Density;
        this.Sensitivity = Sensitivity;

        this.AppId = AppId;
        this.ClientId = ClientId;
        this.CreatedBy = CreatedBy;
        this.CreatedDate = CreatedDate;
        this.UpdatedBy = UpdatedBy;
        this.UpdatedDate = UpdatedDate;
        this.DeletedStatus = DeletedStatus;
    }

    function RadiographicWeldsWrapper(RadiographicWeld, RadiographicWeldsTestResults) {
        
        this.RadiographicWeld = RadiographicWeld;
        this.RadiographicWeldsTestResult = RadiographicWeldsTestResults;
    }
}

//Page Functions
{
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
            "<div class='TableValue left' style='width: 12%;'>" +
                "<input type=\"hidden\" style='clear: left; margin-left: inherit;' name=\"txtTestId" + currentCounter + "\" id=\"txtTestId" + currentCounter + "\" />" +
                "<input type=\"text\" style='width: 100%;' name=\"txtIdentificationNo" + currentCounter + "\" id=\"txtIdentificationNo" + currentCounter + "\" class=\"{required:true, messages:{required:' is required!'}}\" /></div>" +
            "<div class='TableValue left' style='width: 11%; text-align: center;' >" +
                "<input type=\"text\" style='width: 100%;' name=\"txtJointNo" + currentCounter + "\" id=\"txtJointNo" + currentCounter + "\"  class=\"{required:true, messages:{required:' is required!'}}\" /></div>" +
            "<div class='TableValue left' style='width: 11%;'>" +
                "<input type=\"text\" style='width: 100%;' name=\"txtWelderNo" + currentCounter + "\" id=\"txtWelderNo" + currentCounter + "\"  /></div>" +
            "<div class='TableValue left' style='width: 11%;'>" +
                "<input type=\"text\" style='width: 100%;' name=\"txtSegment" + currentCounter + "\" id=\"txtSegment" + currentCounter + "\"  /></div>" +
            "<div class='TableValue left' style='width: 11%; text-align: center;'>" +
            "<input type=\"text\" style=\"width: 40%;\" name=\"txtFlimSizeX" + currentCounter + "\" id=\"txtFlimSizeX" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0, messages:{required:' is required!'}}\" />&nbsp;X <input type=\"text\" style=\"width: 40%;\" name=\"txtFlimSizeY" + currentCounter + "\" id=\"txtFlimSizeY" + currentCounter + "\" class=\"{required:true, number:true,  minStrict:0,  messages:{required:' is required!'}}\" /></div>" +
            "<div class='TableValue left' style='width: 11%; text-align: center;'>" +
                "<input type=\"text\" style='width: 100%;' name=\"txtDensity" + currentCounter + "\" id=\"txtDensity" + currentCounter + "\" class=\"{required:true, number:true, messages:{required:' is required!'}}\" /></div>" +
            "<div class='TableValue left' style='width: 11%; text-align: center;'>" +
                "<input type=\"text\" style='width: 100%;' name=\"txtSensitivity" + currentCounter + "\" id=\"txtSensitivity" + currentCounter + "\"  /></div>" +
            "<div class='TableValue left' style='width: 11%;'>" +
                "<select style='width: 100%;'  name=\"cmbObservation" + currentCounter + "\" id=\"cmbObservation" + currentCounter + "\" ></select></div>" +
            "<div class='TableValue left' style='width: 11%;'>" +
                "<select style='width: 100%;'  name=\"cmbRemarks" + currentCounter + "\" id=\"cmbRemarks" + currentCounter + "\" ></select></div><div class=\"clear\"/>");
        // var counter = 1;
        //Read dynamically from the above object = document.getElementById('txtIdentificationNo' + counter + '').value

        newLineContentDiv.appendTo("#TestResults");
        FillRemarks(currentCounter, dataRemark);
        FillObservations(currentCounter, dataObservation);
    }

    $(document).ready(function () {
        LoadAllCombo();
    });

    function LoadAllCombo() {
        DoAjaxCall(handler, "FillComboRadiationSource", "GetRadiationSource", SubTestId, datatype, empty); //TODO: KTR - SOURCE MASTER Combo & Master Table
        DoAjaxCall(handler, "FillComboTechnique", "GetTechnique", SubTestId, datatype, empty);
        DoAjaxCall(handler, "FillComboRemarks", "GetRemarks", SubTestId, datatype, empty);
        DoAjaxCall(handler, "FillComboObservations", "GetObservations", SubTestId, datatype, empty);
        DoAjaxCall(handler, "FillComboFilmMakeAndType", "Getfilmmakeandtypes", SubTestId + "," + ClientId, datatype, empty);
    }

    function FillComboRemarks(data, message) {
        dataRemark = data;
        FillRemarks(0, data);
    }
    function FillRemarks(comboCounter, data) {
        var combo = document.getElementById('cmbRemarks' + comboCounter);
        addSelectOneOption(combo);
        for (var i = 0; i < data.length; i++) {
            var newOption = document.createElement("option");
            newOption.text = data[i].RemarksShortName;
            newOption.value = data[i].RemarksId;
            combo.add(newOption);
        }
    }
    function SleepFunc() { }
    function FillComboObservations(data, message) {
        dataObservation = data;
        FillObservations(0, data);
        if (getParameterByName("ReportID") != "") {
            setTimeout("SleepFunc()", 5000);
            ReportId = getParameterByName("ReportID");
   
            DoAjaxCall(handler, "EditRadiographicWeldReportSucess", "getbyid", getParameterByName("ReportID"), datatype, empty);
        }
    }
    function FillObservations(comboCounter, data) {
        var combo = document.getElementById('cmbObservation' + comboCounter);
        addSelectOneOption(combo);
        for (var i = 0; i < data.length; i++) {
            var newOption = document.createElement("option");
            newOption.text = data[i].ObservationsShortName;
            newOption.value = data[i].ObservationsId;
            combo.add(newOption);
        }

    }
    function FillComboRadiationSource(data, message) {
   
        var combo = $("#cmbRadiationSource").get(0);
        addSelectOneOption(combo);
        for (var i = 0; i < data.length; i++) {
            var newOption = document.createElement("option");
            newOption.text = data[i].Identification;
            newOption.value = data[i].RadiationSourceId;
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

    function FillComboFilmMakeAndType(data, message) {
   
        var combo = $("#cmbFilmMakeAndTypeId").get(0);
        addSelectOneOption(combo);
        for (var i = 0; i < data.length; i++) {
            var newOption = document.createElement("option");
            newOption.text = data[i].FilmMakeAndTypeShortName;
            newOption.value = data[i].FilmMakeAndTypeId;
            combo.add(newOption);
        }

    }


    function ClearValue() {
        $("#txtReportId").val("");
        $("#txtClient").val("");
        $("#txtContractNumber").val("");
        $("#txtContactPerson").val("");
        $("#txtContactNumber").val("");
        $("#txtJobDescription").val("");
        $("#txtLocation").val("");
        $("#txtTestDate").val("");
        $("#txtTestReportNumber").val("");
        $("#cmbFilmMakeAndTypeId").val("");
        $("#txtTypeofIQI").val("");
        $("#txtIQIBatchNo").val("");
        $("#txtGeometricalUnsharpness").val("");
        $("#cmbTechniqueId").val("");
        $("#txtShimThickness").val("");
        $("#txtDensitometerNo").val("");
        $("#txtCalibrationDate").val("");

        $("#txtMaterialSpecification").val("");
        $("#txtSurfaceCondition").val("");
        $("#txtSurfaceTemperature").val("");
        $("#txtExtentofExamination").val("");
        $("#txtDimension").val("");
        $("#txtSFD").val("");
        $("#txtWeldThickness").val("");
        $("#txtWeldPreparation").val("");
        $("#txtWeldingMethod").val("");
        $("#txtStageofExamination").val("");
        $("#txtExposureTime").val("");
        $("#txtFocalSpotSize").val("");
        $("#txtUnitofEnergy").val("");
        $("#cmbRadiationSource").val(0);
        $("#cmbTechniqueId").val(0);
        $("#cmbFilmMakeAndTypeId").val(0);

        $("#txtReferenceStandard").val("");
        $("#txtTestSpecification").val("");
        $("#txtAcceptanceCriteria").val("");
        $("#txtTechSheetNo").val("");

        for (i = 0; i < counter; i++) {
            $("#txtTestId" + i + "").val("");
            $("#txtIdentificationNo" + i + "").val("");
            $("#txtJointNo" + i + "").val("");
            $("#txtWelderNo" + i + "").val("");
            $("#txtSegment" + i + "").val("");
            $("#txtFlimSizeX" + i + "").val("");
            $("#txtFlimSizeY" + i + "").val("");
            $("#cmbObservation" + i + "").val(0);
            $("#cmbRemarks" + i + "").val(0);
            $("#txtDensity" + i + "").val("");
            $("#txtSensitivity" + i + "").val("");
        }
    }

    function EditRadiographicWeldReportSucess(data, message) {
   
        $("#txtReportId").val(data.RadiographicWeld.ReportID);
        FillRadiographicWeldFields(data);
        for (i = 0; i < data.RadiographicWeldsTestResult.length; i++) {
            if (i > 0) {
                AddNewLineTestResult(i);
                counter++;
            }
            $("#txtTestId" + i + "").val(data.RadiographicWeldsTestResult[i].TestId);
            $("#txtIdentificationNo" + i + "").val(data.RadiographicWeldsTestResult[i].IdentificationNo);
            $("#txtJointNo" + i + "").val(data.RadiographicWeldsTestResult[i].JointNo);
            $("#txtWelderNo" + i + "").val(data.RadiographicWeldsTestResult[i].Welder);
            $("#txtSegment" + i + "").val(data.RadiographicWeldsTestResult[i].Segment);
            $("#txtFlimSizeX" + i + "").val(data.RadiographicWeldsTestResult[i].FlimSizeX);
            $("#txtFlimSizeY" + i + "").val(data.RadiographicWeldsTestResult[i].FlimSizeY);
            $("#cmbObservation" + i + "").val(data.RadiographicWeldsTestResult[i].ObservationsId);
            $("#cmbRemarks" + i + "").val(data.RadiographicWeldsTestResult[i].RemarksId);
            $("#txtDensity" + i + "").val(data.RadiographicWeldsTestResult[i].Density);
            $("#txtSensitivity" + i + "").val(data.RadiographicWeldsTestResult[i].Sensitivity);
        }
    }

    var SaveRadiographicWelds = function () {
   
        var TestidTemp = 0;
        if ($("#txtReportId").val() == "") {
            ReportId = 0;
            this.ReportId = 0;
        } else {
            this.ReportId = $("#txtReportId").val();
        }
        for (i = 0; i < 25; i++) {
            if ($("#txtIdentificationNo" + i).val() == null) {

                break;
            }
            else {
                if ($("#txtTestId" + i).val() == "") {
                    TestidTemp = 0;
                }
                else { TestidTemp = $("#txtTestId" + i).val(); }
                myRadiographicWeldsTestResults1[i] = new RadiographicWeldsTestResult
            (TestidTemp, ReportId,
            $("#txtIdentificationNo" + i).val(),
            $("#txtJointNo" + i).val(),
            $("#txtWelderNo" + i).val(),
            $("#txtSegment" + i).val(),
            $("#txtFlimSizeX" + i).val(),
            $("#txtFlimSizeY" + i).val(),
            $("#cmbObservation" + i).val(),
            $("#cmbRemarks" + i).val(),
            $("#txtDensity" + i).val(),
            $("#txtSensitivity" + i).val(), AppId, ClientId, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, DeletedStatus
            );
            }
        }
        var localRadiographicWeld = new RadiographicWeld();
        var myRadiographicWeldsTemplate = new RadiographicWeldsWrapper(localRadiographicWeld, myRadiographicWeldsTestResults1);
        
        if (ReportId == 0)
        //handler, completed, method, parameter, datatype, data
        //var param = "&ID=" + "7" + "&ClientId=" + "0" + "&ReportId=" + "0" + "&ReportTemplate=" + x + "&FieldOrder=" + "";
            DoAjaxCall(handler, "InsertRadiographicWeldSucess", "Insert", empty, datatype, JSON.stringify(myRadiographicWeldsTemplate));
        else {
            //handler, completed, method, parameter, datatype, data
            DoAjaxCall(handler, "UpdateRadiographicWeldSucess", "Update", empty, datatype, JSON.stringify(myRadiographicWeldsTemplate));
        }
    };

    function InsertRadiographicWeldSucess(data, message) {
        alert(message);
        ClearValue();
        window.location.href = "RadiographicWeldReportView.aspx?SubTestId=" + SubTestId;
    }

    function FillRadiographicWeldFields(data) {
        $("#txtClient").val(data.RadiographicWeld.Client);
        $("#txtContractNumber").val(data.RadiographicWeld.ContractNumber);
        $("#txtContactPerson").val(data.RadiographicWeld.ContactPerson);
        $("#txtContactNumber").val(data.RadiographicWeld.ContactNumber);
        $("#txtJobDescription").val(data.RadiographicWeld.JobDescription);
        $("#txtLocation").val(data.RadiographicWeld.Location);
        $("#txtTestDate").val(data.RadiographicWeld.TestDateString);
        $("#txtTestReportNumber").val(data.RadiographicWeld.TestReportNumber);
        $("#cmbRadiationSource").val(data.RadiographicWeld.RadiationSourceId);
        $("#cmbFilmMakeAndTypeId").val(data.RadiographicWeld.FilmMakeAndTypeId);
        $("#txtTypeofIQI").val(data.RadiographicWeld.TypeofIQI);
        $("#txtIQIBatchNo").val(data.RadiographicWeld.IQIBatchNo);
        $("#txtGeometricalUnsharpness").val(data.RadiographicWeld.GeometricalUnsharpness);
        $("#cmbTechniqueId").val(data.RadiographicWeld.TechniqueId);
        $("#txtShimThickness").val(data.RadiographicWeld.ShimThickness);
        $("#txtDensitometerNo").val(data.RadiographicWeld.DensitometerNo);
        $("#txtCalibrationDate").val(data.RadiographicWeld.CalibrationDateString);

        $("#txtExposureTime").val(data.RadiographicWeld.ExposureTime);
        $("#txtMaterialSpecification").val(data.RadiographicWeld.MaterialSpecification);
        $("#txtSurfaceCondition").val(data.RadiographicWeld.SurfaceCondition);
        $("#txtSurfaceTemperature").val(data.RadiographicWeld.SurfaceTemperature);
        $("#txtExtentofExamination").val(data.RadiographicWeld.ExtentofExamination);
        $("#txtDimension").val(data.RadiographicWeld.Dimension);
        $("#txtSFD").val(data.RadiographicWeld.SFD);
        $("#txtWeldThickness").val(data.RadiographicWeld.WeldThickness);
        $("#txtWeldPreparation").val(data.RadiographicWeld.WeldPreparation);
        $("#txtWeldingMethod").val(data.RadiographicWeld.WeldingMethod);
        $("#txtStageofExamination").val(data.RadiographicWeld.StageofExamination);
        $("#txtFocalSpotSize").val(data.RadiographicWeld.FocalSpotSize);
        $("#txtUnitofEnergy").val(data.RadiographicWeld.UnitofEnergy);

        $("#txtReferenceStandard").val(data.RadiographicWeld.ReferenceStandard);
        $("#txtTestSpecification").val(data.RadiographicWeld.TestSpecification);
        $("#txtAcceptanceCriteria").val(data.RadiographicWeld.AcceptanceCriteria);
        $("#txtTechSheetNo").val(data.RadiographicWeld.TechSheetNo);
    }

    function UpdateRadiographicWeldSucess(data, message) {
        alert(message);
        ClearValue();
        window.location.href = "RadiographicWeldReportView.aspx?SubTestId=" + SubTestId;
    }

    function AutoCompleteRadiographicWeldTestReportSucess(data, message) {
        FillRadiographicWeldFields(data);
    }

    //All simple auto complete and details comments on the first function
    {
        function AutoCompleteControl(IdOfControl, SearchColumnname) {

            $(IdOfControl).autocomplete({
                //columnnames must have 2 values 1st the id name and next the text name (We know the id is of no use but still add it)
                source: "HTTPWebHandlers/Autocomplete.ashx?method=autosimplelist&&ColumnNames=Reportid,"
            + SearchColumnname + "&SearchColumn=" + SearchColumnname + "&TableName=RadiographicWeld"
            });
        }
        $(function () {
            AutoCompleteControl("#txtFabricatorName", "FabricatorName");
            AutoCompleteControl("#txtClient", "Client");
            AutoCompleteControl("#txtContactPerson", "ContactPerson");
            AutoCompleteControl("#txtContactNumber", "ContactNumber");
            AutoCompleteControl("#txtJobDescription", "JobDescription");
            AutoCompleteControl("#txtLocation", "Location");
            AutoCompleteControl("#txtTestDate", "TestDate");
            AutoCompleteControl("#txtTestReportNumber", "TestReportNumber");
            AutoCompleteControl("#cmbRadiationSource", "RadiationSourceId");
            AutoCompleteControl("#cmbFilmMakeAndTypeId", "FilmMakeAndType");
            AutoCompleteControl("#txtTypeofIQI", "TypeofIQI");
            AutoCompleteControl("#txtIQIBatchNo", "IQIBatchNo");
            AutoCompleteControl("#txtGeometricalUnsharpness", "GeometricalUnsharpness");
            AutoCompleteControl("#cmbTechniqueId", "TechniqueId");
            AutoCompleteControl("#txtShimThickness", "ShimThickness");
            AutoCompleteControl("#txtDensitometerNo", "DensitometerNo");
            AutoCompleteControl("#txtCalibrationDate", "CalibrationDate");
            AutoCompleteControl("#txtExposureTime", "ExposureTime");
            AutoCompleteControl("#txtMaterialSpecification", "MaterialSpecification");
            AutoCompleteControl("#txtSurfaceCondition", "SurfaceCondition");
            AutoCompleteControl("#txtSurfaceTemperature", "SurfaceTemperature");
            AutoCompleteControl("#txtExtentofExamination", "ExtentofExamination");
            AutoCompleteControl("#txtDimension", "Dimension");
            AutoCompleteControl("#txtSFD", "SFD");
            AutoCompleteControl("#txtWeldThickness", "WeldThickness");
            AutoCompleteControl("#txtWeldPreparation", "WeldPreparation");
            AutoCompleteControl("#txtWeldingMethod", "WeldingMethod");
            AutoCompleteControl("#txtStageofExamination", "StageofExamination");
            AutoCompleteControl("#txtFocalSpotSize", "FocalSpotSize");
            AutoCompleteControl("#txtUnitofEnergy", "UnitofEnergy");

            AutoCompleteControl("#txtReferenceStandard", "ReferenceStandard");
            AutoCompleteControl("#txtTestSpecification", "TestSpecification");
            AutoCompleteControl("#txtAcceptanceCriteria", "AcceptanceCriteria");
            AutoCompleteControl("#txtTechSheetNo", "TechSheetNo");
        });
    }

}
