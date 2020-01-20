{
    var handler = "ReportLayoutViewerHandler.ashx";
    var datatype = "json";
    var empty = "";
    var SubTestId = 0;
    var ClientId = 1;
    var CreatedBy = 1;
    var BaseReportTemplateID = 0;
    var CustomReportTemplateId = 0;
}

//Custom Classes
{
    function ReportTemplate(SubTestId, CustomReportTemplateId, ClientId, ReportId, Templates) {
        this.CustomReportTemplateId = CustomReportTemplateId;
        this.SubTestId = SubTestId;
        this.ClientId = ClientId;
        this.ReportId = ReportId;
        this.Templates = Templates;
    }
    //BaseTemplateId & TemplateId
    function CustomTemplateGenerator(BaseReportTemplateID, SubTestId, ReportTemplateName, ReportTemplates, ClientId, CreatedBy, CustomReportTemplateId) {
        this.BaseReportTemplateID = BaseReportTemplateID;
        this.SubTestId = SubTestId;
        this.ReportTemplateName = ReportTemplateName;
        this.ReportTemplates = ReportTemplates;
        this.ClientId = ClientId;
        this.CreatedBy = CreatedBy;
        this.CustomReportTemplateId = CustomReportTemplateId;
    }

    function Template(SectionsID, Sections, TemplateStrings) {
        this.SectionsID = SectionsID;
        this.Sections = Sections;
        this.TemplateStrings = TemplateStrings;
    }
}

$(document).ready(function () {
    TemplateID = getParameterByName("TemplateID");
    var tmpSubTestId = getParameterByName("SubTestId");
    if (typeof tmpSubTestId == "string" && tmpSubTestId != "") {
        SubTestId = tmpSubTestId;
    }

    $("#btnClose").click(function (e) {
        HideDialog();
        e.preventDefault();
    });
    //TODO: KTR - Changed for Edit template
    if (TemplateID == 0) {
        DoAjaxCall(handler, "FillComboTest", "GetTestNames", "", datatype, empty);
    }
    else {
        GetRadiographicWeldReport();
    }
});

function GetRadiographicWeldReport() {

    //handler, completed, method, parameter, datatype, data
    //TODO: KTR - Report ID Hardcoded to parameter = 1 -> //var id = '<%= Session("VariableName")%>'
    var paramReportID = 0; // getParameterByName("ReportId");
    var paramReportTemplateId = TemplateID;
    var req = new ReportTemplate(SubTestId, paramReportTemplateId, paramReportID, 0, null);
    DoAjaxCall(handler, "GetRadiographicWeldReportCompleted", "GetRadiographicWeldReport", "", "json", JSON.stringify(req));
}
function GetRadiographicWeldReportCompleted(data, message) {

    var str = data;
    var iTemplate = null;

    if (str.Templates[0] != null) {
        if (str.Templates[0].SectionsID == 1) {
            $("#txtTemplateName").val(str.TemplateName);
            iTemplate = htmlDecode(str.Templates[0].TemplateStrings);
            $('#ModifyTemplate').html(iTemplate);

            $(".delete-tab").live('click', function () {
                $(this).parent().remove();
            });
            //For RT

            $("#JobDescription, #ReferenceDocuments, #RadiographyTechniqueDetail, #RadiographyJobDetails, #JobDetails, #Legend, #Signatures").swappable({


                items: '.DivCells',
                cursorAt: { top: -10, left: 0 }
            })//.disableSelection();

            $("#JobDescriptionContainer, #ReferenceDocumentsContainer, #RadiographyTechniqueDetailsContainer, #RadiographyJobDetailsContainer, #JobDetailsContainer, #LegendContainer, #SignaturesContainer").swappable({
                items: '.body',
                cursorAt: { top: -10, left: 0 }
            })//.disableSelection();

            //FOR MT
            $("#CustomerDetails, #TestDetail, #TestResults, #JobDescription, #ReferenceDocuments, #RadiographyTechniqueDetail, #JobDetails, #Legend, #Signatures").swappable({
                items: '.DivCells',
                cursorAt: { top: -10, left: 0 }
            })
            //.disableSelection();
            $("#JobDescriptionContainer, #TestDetailsContainer, #TestResultsContainer, #ReferenceDocumentsContainer, #RadiographyTechniqueDetailsContainer, #JobDetailsContainer, #LegendContainer, #SignaturesContainer").swappable({
                items: '.body',
                cursorAt: { top: -10, left: 0 }
            })//.disableSelection();

            //INLINE EDIT
            $(".DivFieldLabel").live('click', function () {
                $('.ajax').html($('.ajax input').val());
                $('.ajax').removeClass('ajax');
                $(this).addClass('ajax');
                $(this).html('<input id="editbox" size="' + $(this).text().length + '" type="text" value="' + $(this).text() + '">');
                $('#editbox').focus();
            });
            $(".DivFieldLabel").bind('keydown', function (event) {
                switch (event.keyCode) {
                    case 13: // save on ENTER
                        $(this).html($('.ajax input').val());
                        $(this).removeClass('ajax');
                        break;
                }
            })
            //FOR LPT
            $(".DivCells").append('<div class="delete-tab"></div>');

        }
    }
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
    TemplateID = getParameterByName("TemplateID");
    Display();
}

function Display() {
    SubTestId = ssnTestTypeId;
    var req = new ReportTemplate(SubTestId, 1, ClientId, 0, null);
    DoAjaxCall(handler, "GetBaseReportCompleted", "GetBaseReport", "", "json", JSON.stringify(req));

}

function SearchText() {
    $(".TDFieldCell").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "TemplateGenerator.aspx/GetAutoCompleteData",
                data: "{'username':'" + document.getElementById('txtTemplateName').value + "'}",
                dataType: "json",
                dataFilter: function (data) { return data; },
                success: function (data) {
                    response(data.d);
                },
                error: function (result) {
                    alert("Error");
                }
            });
        }
    });
}

function GetBaseReportCompleted(data, message) {

    var str = data;
    CustomReportTemplateId = str.CustomReportTemplateId; // will be 0 for insert ,value for update
    ClientId = str.ClientId;
    BaseReportTemplateID = str.SubTestId; //ReportTemplateID -> NDTUAT.ReportTemplates.TemplateId DB -> i.e. BaseReportTemplateID
    var iTemplate = null;

    if (str.Templates[0] != null) {
        if (str.Templates[0].SectionsID == 1) {

            iTemplate = htmlDecode(str.Templates[0].TemplateStrings);
            $('#ModifyTemplate').html(iTemplate);

            $(".delete-tab").live('click', function () {
                $(this).parent().remove();
            });
            //For RT
            $("#JobDescription, #ReferenceDocuments, #RadiographyTechniqueDetail, #RadiographyJobDetails, #JobDetails, #Legend, #Signatures").swappable({
                items: '.DivCells',
                cursorAt: { top: -10, left: 0 }
            })//.disableSelection();
            $("#JobDescriptionContainer, #ReferenceDocumentsContainer, #RadiographyTechniqueDetailsContainer, #RadiographyJobDetailsContainer, #JobDetailsContainer, #LegendContainer, #SignaturesContainer").swappable({
                items: '.body',
                cursorAt: { top: -10, left: 0 }
            })//.disableSelection();

            //FOR MT
            $("#CustomerDetails, #TestDetail, #TestResults, #JobDescription, #ReferenceDocuments, #RadiographyTechniqueDetail, #JobDetails, #Legend, #Signatures").swappable({
                items: '.DivCells',
                cursorAt: { top: -10, left: 0 }
            })
            //.disableSelection();
            $("#JobDescriptionContainer, #TestDetailsContainer, #TestResultsContainer, #ReferenceDocumentsContainer, #RadiographyTechniqueDetailsContainer, #JobDetailsContainer, #LegendContainer, #SignaturesContainer").swappable({

                items: '.body',
                cursorAt: { top: -10, left: 0 }
            })//.disableSelection();

            //INLINE EDIT
            $(".DivFieldLabel").live('click', function () {
                $('.ajax').html($('.ajax input').val());
                $('.ajax').removeClass('ajax');
                $(this).addClass('ajax');
                $(this).html('<input id="editbox" size="' + $(this).text().length + '" type="text" value="' + $(this).text() + '">');
                $(this).focus();
            });
            $(".DivFieldLabel").bind('keydown', function (event) {
                switch (event.keyCode) {
                    case 13: // save on ENTER
                        $(this).html($('.ajax input').val());
                        $(this).removeClass('ajax');
                        break;
                }
            })
            //FOR LPT
            $(".DivCells").append('<div class="delete-tab"></div>');
        }
    }
}

function InsertCustomTemplateCompleted(data, message) {
    alert(message);

    window.location.href = "GetRediographicWeldTemplateName.aspx?SubTestId=" + SubTestId;

}

function call() {
    var ModifiedTemplateName = $("#txtTemplateName").val();

    if (ModifiedTemplateName != "") {

        //var ClientId = 0; //TODO: KTR - get it from Combo; VCS - Why will this value come from combo box. Its a new custom template
        if (CustomReportTemplateId < 1 && getParameterByName("TemplateID") != "") {
            CustomReportTemplateId = getParameterByName("TemplateID");
            BaseReportTemplateID = SubTestId;
        }

        var JobDetailsTableRow = new Template(2, "JobDetailsTableRow", htmlEncode($("#JobDetailsTableRowTemplateContainer").html()));

        $("#JobDetailsTableRowTemplateContainer").html("##JobDetailsTableRowTemplate##");
        var RptTmp = "";
        $('div').removeClass('delete-tab');
        RptTmp = $("#ModifyTemplate").html();
        ReportDetails = htmlEncode(RptTmp);
        var myReportDetails = new Template(1, "ReportDetails", ReportDetails);

        var ReportTemplates = [];
        ReportTemplates[0] = JobDetailsTableRow;
        ReportTemplates[1] = myReportDetails;

        var myCustomTemplateGenerator = new CustomTemplateGenerator(BaseReportTemplateID, SubTestId, ModifiedTemplateName, ReportTemplates, ClientId, CreatedBy, CustomReportTemplateId);

        if ($("#txtTemplateName").val() != null && JobDetailsTableRow != null && myReportDetails != null) {
            DoAjaxCall(handler, "InsertCustomTemplateCompleted", "InsertCustomTemplate", empty, datatype, JSON.stringify(myCustomTemplateGenerator));
        }
    }
    else {
        alert("Template Name can't be empty");
    }
}

//Move to Common Functions
{
    function htmlEncode(value) {
        if (value) {
            return jQuery('<div />').text(value).html();
        } else {
            return '';
        }
    }
    function htmlDecode(value) {
        if (value) {
            return $('<div />').html(value).text();
        } else {
            return '';
        }
    }
}

function SaveModifiedTemplate(ModifiedTemplateName, ReportDetails, JobDetailsTableRow) {
}
