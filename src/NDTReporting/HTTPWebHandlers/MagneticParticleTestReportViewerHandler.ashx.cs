using System;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting
{
    /// <summary>
    /// Summary description for MagneticParticleTestReportViewerHandler
    /// </summary>
    public class MagneticParticleTestReportViewerHandler : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        private ResponseHelper _ResponseHelper;
        MagneticParticletestReportViewerHelperOperations _MagneticParticletestReportViewerHelperOperations = new MagneticParticletestReportViewerHelperOperations();
        DbTemplateGenerator _DbTemplateGenerator = new DbTemplateGenerator();
        String ClientId = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            using (_ResponseHelper = new ResponseHelper(context))
            {
                ClientId = context.Session["ClientId"].ToString();
                switch (_ResponseHelper.MethodName.ToLower())
                {
                    case "getmagneticparticletestreport":
                        context.Response.Write(GetMagneticParticleTestReport(context));
                        break;
                    default:
                        break;
                }
            }
        }

        private string GetMagneticParticleTestReport(HttpContext context)
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
                _ResponseHelper.iJsonResponse.ResponseData = _MagneticParticletestReportViewerHelperOperations.GetMagneticParticleTestReport(_ReportTemplate, ClientId);
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