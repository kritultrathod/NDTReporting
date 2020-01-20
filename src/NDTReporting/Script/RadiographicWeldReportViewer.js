//Page Logic
{
    var document_ready = function () {

        GetRadiographicWeldReport();

        if (ssnAction != "Authorize") {
            $("#btnAuthorize").disable = true;
        }
    };  //Custom Classes
    {
        function ReportTemplateWithData(customReportTemplateId, reportId, templates) {
            this.CustomReportTemplateId = customReportTemplateId;
            this.ReportId = reportId;
            this.Templates = templates;
        }
        function Template(sectionsId, sections, templateStrings) {
            this.SectionsID = sectionsId;
            this.Sections = sections;
            this.TemplateStrings = templateStrings;
        }
    }
    //Load RadiographicWeldReport Templates With Data
    {
        function GetRadiographicWeldReport() {
            //handler, completed, method, parameter, datatype, data
            var req = new ReportTemplateWithData(ssnTemplateId, ssnReportId, null);
            DoAjaxCall(handler, "GetRadiographicWeldReportCompleted", "GetRadiographicWeldReportWithData", "", "json", JSON.stringify(req));
        }
        function GetRadiographicWeldReportCompleted(data, message) {
            //debugger
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
    var handler = "ReportLayoutViewerHandler.ashx";
    $(document).ready(document_ready);
}