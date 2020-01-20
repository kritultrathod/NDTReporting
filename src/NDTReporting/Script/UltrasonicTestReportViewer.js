//Page Logic
{
    var document_ready = function () {
        GetUltrasonicTestReport();
        if (ssnAction != "Authorize") {
            $("#btnAuthorize").disable = true;
        }
    };
    //Custom Classes
    {
        function ReportTemplateWithData(CustomReportTemplateId, ReportId, Templates) {
            this.CustomReportTemplateId = CustomReportTemplateId;
            this.ReportId = ReportId;
            this.Templates = Templates;
        }
        function Template(SectionsID, Sections, TemplateStrings) {
            this.SectionsID = SectionsID;
            this.Sections = Sections;
            this.TemplateStrings = TemplateStrings;
        }
    }
    //Load RadiographicWeldReport Templates With Data
    {
        function GetUltrasonicTestReport() {
            //handler, completed, method, parameter, datatype, data
            var req = new ReportTemplateWithData(ssnTemplateId, ssnReportId, null);
            DoAjaxCall(handler, "GetUltrasonicTestReportCompleted", "GetUltrasonicTestReport", "", "json", JSON.stringify(req));
        }
        function GetUltrasonicTestReportCompleted(data, message) {
            var str = data;
            var iTemplate = null;
            if (str.Templates[0] != null) {
                if (str.Templates[0].SectionsID == 1) {
                    iTemplate = htmlDecode(str.Templates[0].TemplateStrings);
                    $('#container').html(iTemplate);
                    $("#txtTemplate").val(htmlEncode(iTemplate));
                }
            }
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

}
//Page Level Declarations
{
    var handler = "UltrasonicTestReportViewerHandler.ashx";
    $(document).ready(document_ready);
}
