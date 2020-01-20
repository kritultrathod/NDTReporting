//Custom Declarations
{
    var handlerCombo = "SearchReport.ashx";
    var handler = "UltrasonicTestHandler.ashx";
    var ReportID = 0;
    var curntPage;
    var pageCount;
    var sortField = '5';
    var sortDir = 'D';

    var myRadiographicWeldsTestResults1 = [];
    var datatype = "json";
    var empty = "";
    var SubTestId = 0;
    var printAction = "";
}
//Page Functions
{
    $(document).ready(function () {
        
        curntPage = 1;
        pageCount = 1;
        sortField = '5';
        sortDir = 'D';
        $(".PrintReport").live('click', function (e) {
            var id = $(this).attr('id');
            printAction = $(this)[0].innerText;
            var req;
            if (printAction == "Authorize") {
                if (ssnIsAdmin == 1) {
                    $("#txtHiddenReportId").val(id);
                    req = new TemplateParams(0, SubTestId, printAction); //Authorize: send SubTestId to get all available templates for Test Type
                    DoAjaxCall(handlerCombo, "FillComboTemplates", "GetTemplateNames", "", datatype, JSON.stringify(req));
                    e.preventDefault();
                }
            }
            if (printAction == "Print") {
                $("#txtHiddenReportId").val(id);
                req = new TemplateParams(id, 0, printAction); //Print: send ReportId to get only the authorised print templates
                DoAjaxCall(handlerCombo, "FillComboTemplates", "GetTemplateNames", "", datatype, JSON.stringify(req));
                e.preventDefault();
            }
        });
        $("#btnSearch").live('click', function (e) {
            GetAllUltrasonicTestReports();
            e.preventDefault();
        });
        $("#btnClearSearch").live('click', function (e) {
            $('#txtSrcTestReportNumber').val('');
            $('#txtSrcClient').val('');
            $('#txtSrcLocation').val('');
            $('#txtSrcContactPerson').val('');
            $('#txtSrcContractNo').val('');
            $('#txtSrcTestDateStart').val('');
            $('#txtSrcTestDateEnd').val('');
            $('#txtSrcReportId').val('');
            sortField = '5';
            sortDir = 'D';
            $("#cmbSrcSortBy").val(sortField);
            $("#cmbSrcSortDir").val(sortDir);

            GetAllUltrasonicTestReports();
            e.preventDefault();
        });
        $(".navBtnPrev").live('click', function (e) {
            initializePaginationFields();
            curntPage--;

            if (curntPage < 1) {
                return; //ignore if max pageCount reached;
            }

            GetAllUltrasonicTestReports();
            e.preventDefault();
        });
        $(".navBtnNext").live('click', function (e) {
            initializePaginationFields();
            curntPage++;

            if (curntPage > pageCount) {
                return; //ignore if max pageCount reached;
            }

            GetAllUltrasonicTestReports();
            e.preventDefault();
        });
        $("#btnClose").click(function (e) {
            HideDialog();
            e.preventDefault();
        });
        
        GetAllUltrasonicTestReports();
        SubTestId = getParameterByName("SubTestId");
    });

    function GetAllUltrasonicTestReports() {
        
        sortField = $('#cmbSrcSortBy').val() == undefined ? sortField : $('#cmbSrcSortBy').val();
        sortDir = $('#cmbSrcSortDir').val() == undefined ? sortDir : $('#cmbSrcSortDir').val();

        var req = new SearchTestRecordReq(
            $('#txtSrcReportId').val() == undefined ? '' : $('#txtSrcReportId').val(),
            0, //'createdBy - take from sesssion' - currently taken from session at server side.
            curntPage, //pageIndex
            sortField,
            sortDir,
            $('#txtSrcTestReportNumber').val() == undefined || $('#txtSrcTestReportNumber').val() == 'Test Report No.' ? '' : $('#txtSrcTestReportNumber').val(),
            $('#txtSrcClient').val() == undefined ? '' : $('#txtSrcClient').val(),
            $('#txtSrcLocation').val() == undefined ? '' : $('#txtSrcLocation').val(),
            $('#txtSrcContactPerson').val() == undefined ? '' : $('#txtSrcContactPerson').val(),
            $('#txtSrcContractNo').val() == undefined ? '' : $('#txtSrcContractNo').val(),
            $('#txtSrcTestDateStart').val() == undefined ? '' : $('#txtSrcTestDateStart').val(),
            $('#txtSrcTestDateEnd').val() == undefined ? '' : $('#txtSrcTestDateEnd').val()
        );
        DoAjaxCall(handler, "DisplayAllUltrasonicTestReports", "GetAllUltrasonicTestReports", "", datatype, JSON.stringify(req));

    }

    function FillComboTemplates(data, message) {
        
        var combo = $("#cmbTemplate").get(0);
        combo.length = 0;
        addSelectOneOption(combo);
        for (var i = 0; i < data.length; i++) {
            var newOption = document.createElement("option");
            newOption.text = data[i].TemplateName;
            newOption.value = data[i].TemplateID;
            combo.add(newOption);
        }
        ShowDialog(true);
    }

    function DisplayAllUltrasonicTestReports(data, message) {
        
        var str = "<table style='width: 100%;' class='TableValue'> " +
            "<tr> <td colspan='10' class='TDHeader'><b>Ultrasonic Test Report List</b> </td> </tr> ";
        //Search Controls Row
        str += "<tr>" +
            "<td class='TDHeaderCell1' style='width: 5%'><input id='txtSrcReportId' type='text' value=" + data.Req.ReportId + "></td>" +
            "<td class='TDHeaderCell1' style='width: 5%'><input id='txtSrcTestReportNumber' type='text' value=" + data.Req.TestReportNo + "></td>" +
            "<td class='TDHeaderCell1' style='width: 10%'><input id='txtSrcClient' type='text' value=" + data.Req.Client + "></td>" +
            "<td class='TDHeaderCell1' style='width: 10%'><input id='txtSrcContactPerson' type='text' value=" + data.Req.ContactPerson + "></td>" +
            "<td class='TDHeaderCell1' style='width: 10%'><input id='txtSrcContractNo' type='text' value=" + data.Req.ContractNo + "></td>" +
            "<td class='TDHeaderCell1' style='width: 7%'><input id='txtSrcTestDateStart' type='text' value=" + data.Req.TestDateStartString + "><br><input id='txtSrcTestDateEnd' type='text' value=" + data.Req.TestDateEndString + "></td>" +
            "<td class='TDHeaderCell1' style='width: 10%'><input id='txtSrcLocation' type='text' value=" + data.Req.Location + "></td>" +
            "<td class='TDHeaderCell1' style='width: 9%'><a href='javascript:void(0)' class='classname' id='btnSearch'>Search</a></td>" +
            "<td class='TDHeaderCell1' style='width: 9%'><a href='javascript:void(0)' class='classname' id='btnClearSearch'>Clear</a></td>" +
            "<td class='TDHeaderCell1' style='width: 9%'><select id='cmbSrcSortBy'></select><select id='cmbSrcSortDir'></select></td>" +
            "</tr>";
        //Table Header Row
        str += "<tr> " +
            "<td class='TDHeaderCell1'>Unique No</td>" +
            "<td class='TDHeaderCell1'>Test Report No.</td> " +
            "<td class='TDHeaderCell1'>Client</td> " +
            "<td class='TDHeaderCell1'>Contact Person</td> " +
            "<td class='TDHeaderCell1'>Contract Number</td> " +
            "<td class='TDHeaderCell1'>Test Date</td> " +
            "<td class='TDHeaderCell1'>Location</td> " +
            "<td class='TDHeaderCell1'>Delete</td> " +
            "<td class='TDHeaderCell1'>Edit</td> " +
            "<td class='TDHeaderCell1'>Print/Authorize</td></tr>";

        for (var i = 0; i < data.TestRecordLightList.length; i++) {
            str += "<tr>";
            str += "<td class='TDFieldCell1'>" + data.TestRecordLightList[i].ReportId + "</td>";
            str += "<td class='TDFieldCell1'>" + data.TestRecordLightList[i].ReportNo + "</td>";
            str += "<td class='TDFieldCell1'>" + data.TestRecordLightList[i].FabricatorName + "</td>";
            str += "<td class='TDFieldCell1'>" + data.TestRecordLightList[i].ContactPerson + "</td>";
            str += "<td class='TDFieldCell1'>" + data.TestRecordLightList[i].ContractNo + "</td>";
            str += "<td class='TDFieldCell1'>" + data.TestRecordLightList[i].DateofTestingString + "</td>";
            str += "<td class='TDFieldCell1'>" + data.TestRecordLightList[i].Location + "</td>";
            str += "<td class='TDFieldCell1'><a href='javascript:void(0)' class='classname' onclick='DeleteReport(" + data.TestRecordLightList[i].ReportId + ")'>Delete</a></td>";
            str += "<td class='TDFieldCell1'><a href='javascript:void(0)' class='classname' onclick='EditReport(" + data.TestRecordLightList[i].ReportId + ")'>Edit</a></td>";
            str += "<td class='TDFieldCell1'><a href='javascript:void(0)' class='classname " + GetLinkState() + " id='" + data.TestRecordLightList[i].ReportId + "' " + GetDisableButtonState(data.TestRecordLightList[i].ReportId, data.TestRecordLightList[i].IsAuthorized) + " >" + GetPrintLabel(data.TestRecordLightList[i].IsAuthorized) + "</a></td>";
            str += "</tr>";
        }
        str += "<tr>";
        str += "<td class='TDHeader' colspan='10'>";
        str += "<a href='javascript:void(0)' class='classname navBtnPrev'><</a>&nbsp;";
        str += "<input id='navBtnPageIndex' type='text' style='width: 50px' value=" + data.PageIndex + " disabled>";
        str += "&nbsp;of&nbsp;";
        str += "<input id='navBtnPageCount' type='text'style='width: 50px' value=" + data.PageCount + " disabled>&nbsp;";
        str += "<a href='javascript:void(0)' class='classname navBtnNext'>></a>";
        str += "</td>";
        str += "</tr>";
        str += "</table>";
        $('#ListingData').html(str);

        $("#txtSrcTestDateStart").datepicker();
        $("#txtSrcTestDateStart").datepicker("option", "dateFormat", "dd/mm/yy");
        $("#txtSrcTestDateEnd").datepicker();
        $("#txtSrcTestDateEnd").datepicker("option", "dateFormat", "dd/mm/yy");

        $('#txtSrcTestDateStart').val(data.Req.TestDateStartString);
        $('#txtSrcTestDateEnd').val(data.Req.TestDateEndString);
        initializePaginationFields();
        fillComboSortBy();

        var sortField = data.Req.SortField;
        $("#cmbSrcSortBy").val(sortField);
        var sortDir = data.Req.SortDir;
        $("#cmbSrcSortDir").val(sortDir);

        if ($('#txtSrcTestReportNumber').val() == '')
            $("#lblSrcTestReportNumber").inlineLabel();
        else
            $('label[for="txtSrcTestReportNumber"]').hide();
    }

    function fillComboSortBy() {
        var comboSortBy = $("#cmbSrcSortBy").get(0);
        addSelectOneOption(comboSortBy);
        comboSortBy.add(new Option("Test Report No.", "1"));
        comboSortBy.add(new Option("Client", "2"));
        comboSortBy.add(new Option("Contact Person", "3"));
        comboSortBy.add(new Option("Contract Number", "4"));
        comboSortBy.add(new Option("Test Date", "5"));
        comboSortBy.add(new Option("Location", "6"));

        var comboSortDir = $("#cmbSrcSortDir").get(0);
        comboSortDir.add(new Option("A-Z", "A"));
        comboSortDir.add(new Option("Z-A", "D"));
    }

    function initializePaginationFields() {
        curntPage = $('#navBtnPageIndex').val();
        pageCount = $('#navBtnPageCount').val();
    }

    function DeleteReport(ReportID) {
        if (confirm("Are you sure you want to delete the record?")) {
            DoAjaxCall(handler, "DeleteUltrasonicTestReportSucess", "DeleteUltrasonicTests", ReportID, datatype, empty);
        }
    }

    function EditReport(ReportID) {
        window.location.href = "UltrasonicTestReport.aspx?ReportId=" + ReportID;
    }
    function DeleteUltrasonicTestReportSucess(data, message) {
        
        GetAllUltrasonicTestReports();
        alert(message);
    }

    function Print() {
        
        var printTemplateId = $("#cmbTemplate option:selected").val();
        var printReportId = $("#txtHiddenReportId").val();
        var req = new ReportViewParams(printReportId, printTemplateId, printAction);
        DoAjaxCall(handlerCombo, "RedirectToReportViewParams", "SetNavParams", "", datatype, JSON.stringify(req));
        HideDialog();
    }
    function RedirectToReportViewParams(data, message) {
        window.location.href = "UltrasonicTestReportViewer.aspx";
    }

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
}
