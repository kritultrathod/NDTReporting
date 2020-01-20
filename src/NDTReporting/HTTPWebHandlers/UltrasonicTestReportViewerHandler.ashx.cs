using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting
{
    /// <summary>
    /// Summary description for UltrasonicTestReportViewerHandler
    /// </summary>
    public class UltrasonicTestReportViewerHandler : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        private ResponseHelper _ResponseHelper;
        UltrasonictestReportViewerHelperOperations _UltrasonictestReportViewerHelperOperations = new UltrasonictestReportViewerHelperOperations();
        DbTemplateGenerator _DbTemplateGenerator = new DbTemplateGenerator();
        private string ClientId = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            using (_ResponseHelper = new ResponseHelper(context))
            {
                ClientId = context.Session["ClientId"].ToString();
                switch (_ResponseHelper.MethodName.ToLower())
                {
                    case "getultrasonictestreport":
                        context.Response.Write(GetUltrasonicTestReport(context));
                        break;
                    default:
                        break;
                }
            }
        }

        private string GetUltrasonicTestReport(HttpContext context)
        {
            HandleError.HandleInternalError(() =>
            {
                #region Read Request Parameters
                //TODO: KTR - Fix this once the template thing is over
                ReportTemplate _ReportTemplate = new ReportTemplate();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    _ReportTemplate = js.Deserialize<ReportTemplate>(jsonValue);
                }
                #endregion

                #region Prepare Response
                _ResponseHelper.iJsonResponse.IsSucess = true;
                _ResponseHelper.iJsonResponse.CallBack = _ResponseHelper.CallBackMethodName;
                _ResponseHelper.iJsonResponse.ResponseData = _UltrasonictestReportViewerHelperOperations.GetUltrasonicTestReport(_ReportTemplate,ClientId);
                _ResponseHelper.iJsonResponse.Message = "Report Data Retrieved";
                #endregion

            }, (m, e) =>
            {
                _ResponseHelper.iJsonResponse.IsSucess = false;
                _ResponseHelper.iJsonResponse.Message = m;
                _ResponseHelper.iJsonResponse.ResponseData = e;
            }
        );
            return _ResponseHelper.iJSSearializer.Serialize(_ResponseHelper.iJsonResponse);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}