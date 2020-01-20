using System;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting
{
    /// <summary>
    /// Summary description for MasterPageHandler
    /// </summary>
    public class MasterPageHandler : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
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
            
            switch (MethodName.ToLower())
            {
                case "setsessiontesttype":
                    context.Response.Write(SetSessionTestType(context));
                    break;
                case "getpageredirecturl":
                    context.Response.Write(GetPageRedirectUrl(context));
                    break;
                case "logout":
                    context.Response.Write(Logout(context));
                    break;
            }
        }

        private string Logout(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                context.Session.RemoveAll();
                context.Session.Abandon();
                context.Session.Clear();

                _response.IsSucess = true;
                _response.Message = "Logout Success.";
                _response.CallBack = CallBackMethodName;
                _response.ResponseData = "";
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }

        public string SetSessionTestType(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer jSearializer = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
                {
                    PageDetailReq _Req = new PageDetailReq();
                    using (var reader = new StreamReader(context.Request.InputStream))
                    {
                        string jsonValue = reader.ReadToEnd();
                        _Req = jSearializer.Deserialize<PageDetailReq>(jsonValue);
                        context.Session["TestType"] = _Req.TestTypeId;
                        context.Session["CurrentPageId"] = _Req.CurrentPageId;
                        if (_Req.CurrentPageId == "96")
                            context.Session["LookupCode"] = "Technique";//Reset current Lookup code on moving to admin pages.
                    }
                    _response.IsSucess = true;
                    _response.Message = context.Session["TestType"].ToString();
                    _response.CallBack = CallBackMethodName;
                    _response.ResponseData = "";
                }, (m, e) =>
                        {
                            _response.Message = e.Message;
                            _response.IsSucess = false;
                        });
            return jSearializer.Serialize(_response);
        }

        public string GetPageRedirectUrl(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            JavaScriptSerializer js = new JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                PageDetailReq _Req = new PageDetailReq();
                PageDetailResp _Resp = new PageDetailResp();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    _Req = js.Deserialize<PageDetailReq>(jsonValue);

                    string sTestType = _Req.TestTypeId; 
                    string sCurrentPageId = _Req.CurrentPageId;
                    context.Session["CurrentPageId"] = _Req.CurrentPageId;

                    switch (sTestType)
                    {
                        case "1": _Resp.Title = "Radiographic Weld"; break;
                        case "3": _Resp.Title = "Ultrasonic Test"; break;
                        case "5": _Resp.Title = "Magnetic ParticleTest"; break;
                        case "7": _Resp.Title = "Liquid Penetrant Test"; break;
                        default: _Resp.Title = ""; break;
                    }
                    switch (sCurrentPageId)
                    {
                        case "91":
                            #region CreateReport
                            _Resp.Title += " - Crate Report";
                            switch (sTestType)
                            {
                                case "1": _Resp.Page = "RadiographicWeldReport.aspx"; break;
                                case "3": _Resp.Page = "UltrasonicTestReport.aspx"; break;
                                case "5": _Resp.Page = "MagneticParticleTestReport.aspx"; break;
                                case "7": _Resp.Page = "LiquidPenetrantTestReport.aspx"; break;
                            }
                            #endregion
                            break;
                        case "92":
                            #region EditReport
                            _Resp.Title += " - Edit Report";
                            switch (sTestType)
                            {
                                case "1":
                                    _Resp.Page = "RadiographicWeldReportView.aspx?SubTestId=" + sTestType;
                                    break;
                                case "3":
                                    _Resp.Page = "UltrasonicTestReportList.aspx?SubTestId=" + sTestType;
                                    break;
                                case "5":
                                    _Resp.Page = "MagneticParticleTestReportList.aspx?SubTestId=" + sTestType;
                                    break;
                                case "7":
                                    _Resp.Page = "LiquidPenetrantTestReportList.aspx?SubTestId=" + sTestType;
                                    break;
                            }
                            #endregion
                            break;
                        case "93":
                            #region PrintReport
                            _Resp.Title += " - Print Report";
                            switch (sTestType)
                            {
                                case "1":
                                    _Resp.Page = "RadiographicWeldReportView.aspx?SubTestId=" + sTestType;
                                    break;
                                case "3":
                                    _Resp.Page = "UltrasonicTestReportList.aspx?SubTestId=" + sTestType;
                                    break;
                                case "5":
                                    _Resp.Page = "MagneticParticleTestReportList.aspx?SubTestId=" + sTestType;
                                    break;
                                case "7":
                                    _Resp.Page = "LiquidPenetrantTestReportList.aspx?SubTestId=" + sTestType;
                                    break;
                            }
                            #endregion
                            break;
                        case "94":
                            #region CreateTemplate
                            _Resp.Title += " - Create Template";
                            _Resp.Page = "TemplateGenerator.aspx";
                            #endregion
                            break;
                        case "95":
                            #region EditTemplate
                            _Resp.Title += " - Edit Template";
                            _Resp.Page = "GetRediographicWeldTemplateName.aspx?SubTestId=" + sTestType;
                            #endregion
                            break;
                        case "96":
                            #region Home
                            _Resp.Title += " - Home";
                            _Resp.Page = "Home.aspx";
                            #endregion
                            break;
                        case "99":
                            #region LookUpMaster [Admin]
                            _Resp.Title += " - Admin Home";
                            _Resp.Page = "Module/Admin/LookUpPage.aspx";
                            #endregion
                            break;
                    }
                }
                _response.IsSucess = true;
                _response.ResponseData = _Resp;
                _response.Message = "Page Details Received";
                _response.CallBack = CallBackMethodName;
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return js.Serialize(_response);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

    [Serializable]
    public class PageDetailReq
    {
        public string TestTypeId { get; set; }
        public string CurrentPageId { get; set; }
    }
    [Serializable]
    public class PageDetailResp
    {
        public string Page { get; set; }
        public string Title { get; set; }
    }
}