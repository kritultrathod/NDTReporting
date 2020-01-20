{
    var handler = "TemplateEditHandler.ashx";
    var UpdateLayouthandler = "ReportLayoutViewerHandler.ashx";
    var datatype = "json";
    var empty = "";
    var TemplateID = 0;
    var ClientId = "";
    var reporttemplate = "";
    var SubTestId = 0;
}

//    Custom Classes
{
    function ReportTemplate(TestID, ReportId, TemplateID, Templates) {
        this.TestID = TestID;
        this.ReportId = ReportId;
        this.ReportTemplateID = TemplateID;
        this.Templates = Templates;
    }

    function CustomTemplateGenerator(SubTestId, ReportTemplateName, ReportTemplates, ClientId) {
        this.SubTestId = SubTestId;
        this.ReportTemplateName = ReportTemplateName;
        this.ReportTemplates = ReportTemplates;
        this.ClientId = ClientId;
    }

    function Template(SectionsID, Sections, TemplateStrings) {
        this.SectionsID = SectionsID;
        this.Sections = Sections;
        this.TemplateStrings = TemplateStrings;
    }
}

function InitializeTemplate() {
    
    var req = new ReportTemplate(1, -1, 1, null);
    LoadAllCombo();
}

function LoadAllCombo() {
    
    DoAjaxCall(handler, "gettemplatename", "getbyid", getParameterByName("TemplateID"), datatype, empty);
}

function gettemplatename(data, message) {

    var templateString = "";
    var templateTestResultString = "";
    var templateBannerString = "";
    ClientId = data[0].ClientId;
    SubTestId = data[0].SubTestId;
    $("#txtTemplateName").val(data[0].ReportTemplateName);

    //here u will have to get 2 rows where sectionid=1 & 2
    //then u will be able to see the test result wala section
    
    templateBannerString = htmlDecode(data[1].ReportTemplate);
    templateTestResultString = htmlDecode(data[0].ReportTemplate);
    templateString = templateBannerString.replace("##JobDetailsTableRowTemplate##", templateTestResultString);

    
    $('#ModifyTemplate').html(templateString);

    $(".delete-tab").live('click', function () {
        $(this).parent().remove();
    });

    $('.Sections').sortable({
        connectWith: '.Sections',
        cursorAt: { top: 0, left: 0 },
        placeholder: "ui-state-highlight",
        smooth: true
    })//.disableSelection();

    $('.DivColumns').sortable({
        connectWith: '.DivColumns',
        cursorAt: { top: 0, left: 0 },
        placeholder: "ui-state-highlight",
        smooth: true
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
            //$('.ajax').html($('.ajax input').val());              
            //$('.ajax').removeClass('ajax');              
            //$(this).addClass('ajax');              
            //$(this).html('<input id="editbox" size="' + $(this).text().length + '" type="text" value="' + $(this).text() + '">');              
            //$('#editbox').focus();              
        }

    })
    $(".DivCells").append('<div class="delete-tab"></div>');
}

function call() {
    
    var ModifiedTemplateName = $("#txtTemplateName").val();
    if (ModifiedTemplateName != "") {
    
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
        var myCustomTemplateGenerator = new CustomTemplateGenerator(SubTestId, ModifiedTemplateName, ReportTemplates, ClientId);

        if ($("#txtTemplateName").val() != null && JobDetailsTableRow != null && myReportDetails != null) {
    
            DoAjaxCall(UpdateLayouthandler, "editTemplateCompleted", "InsertCustomTemplate", empty, datatype, JSON.stringify(myCustomTemplateGenerator));
        }
    }
    else {
        alert("Template Name can't be empty");
    }
}

function editTemplateCompleted(data, message) {
  
    alert(message);
}

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