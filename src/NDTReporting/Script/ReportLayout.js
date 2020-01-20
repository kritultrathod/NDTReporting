//Page Logic
{
    var iTemplate = null;
    var document_ready = function () {
        GetRadiographicWeldReportTemplate();
        $('.Sections').sortable({
            connectWith: '.Sections'
        })
    }
    //Custom Classes
    {
        function ReportTemplate(TestID, ReportId, ReportTemplateID, Templates) {
            this.TestID = TestID;
            this.ReportId = ReportId;
            this.ReportTemplateID = ReportTemplateID;
            this.Templates = Templates;
        }
        function Template(SectionsID, Sections, TemplateStrings) {
            this.SectionsID = SectionsID;
            this.Sections = Sections;
            this.TemplateStrings = TemplateStrings;
        }
    }
    //Load RadiographicWeldReport Templates
    {
        function GetRadiographicWeldReportTemplate() {
            
            //handler, completed, method, parameter, datatype, data
            var req = new ReportTemplate(1, 1, 0, null);
            DoAjaxCall(handler, "GetRadiographicWeldReportTemplateCompleted", "GetRadiographicWeldReportTemplate", "", "json", JSON.stringify(req));
        }
        function GetRadiographicWeldReportTemplateCompleted(data, message) {
            var str = data;
            
            //Job Description
            if (null != str.Templates && null != str.Templates[0].TemplateStrings) {
                iTemplate = htmlDecode(str.Templates[0].TemplateStrings);
                $('#container').html(iTemplate);
            }
        }
    }
    //Save Layout
    {
        function saveCurrentLayout(exampleNr) {
            var x = htmlEncode($(exampleNr).html()).replace(/&/g, "~");

            alert(x);
            var param = "&ID=" + "1" + "&ClientId=" + "0" + "&ReportId=" + "0" + "&ReportTemplate=" + x + "";
            DoAjaxCall(handler, "SaveTemplateByReportIDCompleted", "SaveTemplateByReportID", param, "json", "");
        }
        function SaveTemplateByReportIDCompleted(data, message) {
            var str = data;
            alert(message);
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
    var handler = "ReportLayoutHandler.ashx";
    $(document).ready(document_ready);
}