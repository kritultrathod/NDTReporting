using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting
{
    /// <summary>
    /// Service Request Handler for the ReportLayout Page 
    /// </summary>
    public class ReportLayoutViewerHandler : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        private ResponseHelper _ResponseHelper;
        ReportViewerHelperOperations _ReportViewerHelperOperations = new ReportViewerHelperOperations();
        DbTemplateGenerator _DbTemplateGenerator = new DbTemplateGenerator();
        private DbRadiographicWelds _DbRadiographicWelds = new DbRadiographicWelds();
        String CreatedBy = string.Empty;
        String ClientId = string.Empty;
        String AppId = string.Empty;

        #region Public Methods
        #region IHttpHandler
        public void ProcessRequest(HttpContext context)
        {
            using (_ResponseHelper = new ResponseHelper(context))
            {
                CreatedBy = context.Session["id"].ToString();
                ClientId = context.Session["ClientId"].ToString();
                AppId = context.Session["AppId"].ToString();

                switch (_ResponseHelper.MethodName.ToLower())
                {
                    case "getbasereport":
                        context.Response.Write(GetBaseReport(context));
                        break;
                    case "getradiographicweldreportbyid":
                        context.Response.Write(GetRadiographicWeldReportById(context));
                        break;
                    case "getradiographicweldreport":
                        context.Response.Write(GetRadiographicWeldReport(context));
                        break;
                    case "getradiographicweldreportwithdata":
                        context.Response.Write(GetRadiographicWeldReportWithData(context));
                        break;
                    case "insertcustomtemplate":
                        context.Response.Write(Insert(context));
                        break;
                    case "gettestnames":
                        context.Response.Write(GetTestNames());
                        break;
                    default:
                        break;
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #endregion
        #endregion

        #region Private Methods

        private string GetBaseReport(HttpContext context)
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
                _ReportTemplate.ClientId = Convert.ToInt32(ClientId);
                _ResponseHelper.iJsonResponse.IsSucess = true;
                _ResponseHelper.iJsonResponse.CallBack = _ResponseHelper.CallBackMethodName;
                _ResponseHelper.iJsonResponse.ResponseData = _ReportViewerHelperOperations.GetBaseReport(_ReportTemplate);
                _ResponseHelper.iJsonResponse.Message = "Report Template Retrieved";
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

        private string GetRadiographicWeldReportById(HttpContext context)
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
                _ResponseHelper.iJsonResponse.ResponseData = _DbRadiographicWelds.GetRadiographicWeldReportById(4);
                _ResponseHelper.iJsonResponse.Message = "Report Template Retrieved";
                #endregion

            }, (m, e) =>
            {
                _ResponseHelper.iJsonResponse.IsSucess = false;
                _ResponseHelper.iJsonResponse.Message = m;
                _ResponseHelper.iJsonResponse.ResponseData = e;
            });
            return _ResponseHelper.iJSSearializer.Serialize(_ResponseHelper.iJsonResponse);
        }

        private string GetRadiographicWeldReport(HttpContext context)
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
                _ResponseHelper.iJsonResponse.ResponseData = _ReportViewerHelperOperations.GetRadiographicWeldReport(_ReportTemplate, ClientId);
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

        private string GetRadiographicWeldReportWithData(HttpContext context)
        {
            HandleError.HandleInternalError(() =>
            {
                #region Read Request Parameters
                //TODO: KTR - Fix this once the template thing is over
                ReportTemplateWithData _ReportTemplate = new ReportTemplateWithData();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    _ReportTemplate = js.Deserialize<ReportTemplateWithData>(jsonValue);
                }
                #endregion

                #region Prepare Response

                _ResponseHelper.iJsonResponse.IsSucess = true;
                _ResponseHelper.iJsonResponse.CallBack = _ResponseHelper.CallBackMethodName;
                _ResponseHelper.iJsonResponse.ResponseData = _ReportViewerHelperOperations.GetRadiographicWeldReportWithData(_ReportTemplate, ClientId);
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

        public string Insert(HttpContext context)
        {
         
            HandleError.HandleInternalError(() =>
            {
                CustomTemplateGenerator _P = new CustomTemplateGenerator();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    _P = js.Deserialize<CustomTemplateGenerator>(jsonValue);
                }
                _P.CreatedBy = Convert.ToInt32(CreatedBy);
                _P.ClientId = Convert.ToInt32(ClientId);

                _ResponseHelper.iJsonResponse.IsSucess = true;
                _ResponseHelper.iJsonResponse.CallBack = _ResponseHelper.CallBackMethodName;
                _ResponseHelper.iJsonResponse.ResponseData = _DbTemplateGenerator.InsertCustomTemplate(_P);
                _ResponseHelper.iJsonResponse.Message = _ResponseHelper.iJsonResponse.ResponseData.ToString();// "Template saved sucessfully.";
            }, (m, e) =>
            {
                _ResponseHelper.iJsonResponse.IsSucess = false;
                _ResponseHelper.iJsonResponse.Message = m;
                _ResponseHelper.iJsonResponse.ResponseData = e;
            });

            return _ResponseHelper.iJSSearializer.Serialize(_ResponseHelper.iJsonResponse);
        }

        public string GetTestNames()
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {

                List<TestType> _lstTestNames = new List<TestType>();
                _lstTestNames = _ReportViewerHelperOperations.GetTestNames();

                _response.IsSucess = true;
                _response.Message = string.Empty;
                _response.CallBack = _ResponseHelper.CallBackMethodName;
                _response.ResponseData = _lstTestNames;
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }

        private void OnError(string ErrorMessage, Exception e)
        { //TODO: generic Helper method for this class
        }
        #endregion
    }
}