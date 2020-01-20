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
    /// Summary description for SearchReport
    /// </summary>
    public class SearchReport : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        string MethodName = string.Empty;
        string CallBackMethodName = string.Empty;
        object Parameter = string.Empty;
        private DbSearchReports _DbSearchReports = new DbSearchReports();
        String CreatedBy = string.Empty;
        String ClientId = string.Empty;
        String AppId = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MethodName = context.Request.Params["method"];
            Parameter = context.Request.Params["param"];
            CallBackMethodName = context.Request.Params["callbackmethod"];
            CreatedBy = context.Session["id"].ToString();
            ClientId = context.Session["ClientId"].ToString();
            AppId = context.Session["AppId"].ToString();

            switch (MethodName.ToLower())
            {
                case "getreports":
                    context.Response.Write(GetReportDetails(context));
                    break;
                case "getreportnumbers":
                    context.Response.Write(GetReportNumbers());
                    break;
                case "getallradiographicweldreports":
                    context.Response.Write(GetAllRadiographicWeldReports(context));
                    break;
                case "gettemplatenames":
                    context.Response.Write(GetTemplateNames(context));
                    break;
                case "setnavparams":
                    context.Response.Write(SetNavParams(context));
                    break;
                case "getsession4":
                    context.Response.Write("1");
                    break;
                case "getsession8":
                    context.Response.Write("1");
                    break;
                case "getsession12":
                    context.Response.Write("1");
                    break;
                case "getsession16":
                    context.Response.Write("1");
                    break;
            }
        }

        public string SetNavParams(HttpContext context)
        {
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            JsonResponse _response = new JsonResponse();
            HandleError.HandleInternalError(() =>
            {
                ReportViewParams _Req = new ReportViewParams();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    _Req = jSearializer.Deserialize<ReportViewParams>(jsonValue);

                    context.Session["ReportId"] = _Req.ReportId;
                    context.Session["TemplateId"] = _Req.TemplateId;
                    context.Session["Action"] = _Req.Action;
                }
                _response.IsSucess = true;
                _response.ResponseData = "success";
                _response.Message = "success";
                _response.CallBack = CallBackMethodName;
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }

        public string GetReportDetails(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                {
                    RadiographicWeldsTemplate _SearchReports =
                        new RadiographicWeldsTemplate();
                    _SearchReports =
                        _DbSearchReports.GetReports(
                            Convert.ToInt32(context.Request.Params["ID"].ToString()));
                    _response.IsSucess = true;
                    _response.Message = string.Empty;
                    _response.CallBack = CallBackMethodName;
                    _response.ResponseData = _SearchReports;
                }, (m, e) =>
                        {
                            _response.Message = e.Message;
                            _response.IsSucess = false;
                        });
            return jSearializer.Serialize(_response);
        }

        public string GetAllRadiographicWeldReports(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                {
                    SearchTestRecordResp recordResp = new SearchTestRecordResp();
                    SearchTestRecordReq recordReq = new SearchTestRecordReq();

                    using (var reader = new StreamReader(context.Request.InputStream))
                    {
                        string jsonValue = reader.ReadToEnd();
                        var js = new JavaScriptSerializer();
                        recordReq = js.Deserialize<SearchTestRecordReq>(jsonValue);
                    }

                    recordReq.CreatedBy = Convert.ToInt32(CreatedBy);// TODO: Move this to UI - KTR
                    recordResp = _DbSearchReports.GetAllRadiographicWeldReports(recordReq);
                    _response.IsSucess = true;
                    _response.Message = string.Empty;
                    _response.CallBack = CallBackMethodName;
                    _response.ResponseData = recordResp;
                }, (m, e) =>
                {
                    _response.Message = e.Message;
                    _response.IsSucess = false;
                });
            return jSearializer.Serialize(_response);
        }

        public string GetReportNumbers()
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                    {
                        List<RadiographicWeld> _lstRadiographicWeld = new List<RadiographicWeld>();
                        _lstRadiographicWeld = _DbSearchReports.GetReportNumbers();
                        _response.IsSucess = true;
                        _response.Message = string.Empty;
                        _response.CallBack = CallBackMethodName;
                        _response.ResponseData = _lstRadiographicWeld;
                    }, (m, e) =>
                            {
                                _response.Message = e.Message;
                                _response.IsSucess = false;
                            });
            return jSearializer.Serialize(_response);
        }

        public string GetTemplateNames(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                TemplateParams req = new TemplateParams();
                List<ReportTemplateNames> _lstReportTemplateNames = new List<ReportTemplateNames>();

                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    req = js.Deserialize<TemplateParams>(jsonValue);
                }
                _lstReportTemplateNames = _DbSearchReports.GetTemplateNames(Convert.ToInt32(req.ReportId), Convert.ToInt32(req.SubTestId), req.Action, Convert.ToInt32(ClientId));

                _response.IsSucess = true;
                _response.Message = string.Empty;
                _response.CallBack = CallBackMethodName;
                _response.ResponseData = _lstReportTemplateNames;
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
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