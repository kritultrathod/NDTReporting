using System;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting
{
    /// <summary>
    /// Summary description for UltrasonicTestHandler
    /// </summary>
    public class UltrasonicTestHandler : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        string MethodName = string.Empty;
        string CallBackMethodName = string.Empty;
        object Parameter = string.Empty;
        private DbUltrasonicTest _DbUltrasonicTest = new DbUltrasonicTest();
        String CreatedBy = string.Empty;
        String ClientId = string.Empty;
        String AppId = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            if (context != null)
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
                    case "insert":
                        context.Response.Write(Insert(context));
                        break;
                    case "update":
                        context.Response.Write(Update(context));
                        break;
                    case "deleteultrasonictests":
                        context.Response.Write(Delete(context));
                        break;
                    case "getallultrasonictestreports":
                        context.Response.Write(GetReportList(context));
                        break;
                    case "getbyid":
                        context.Response.Write(GetUltrasonicTestReportById());
                        break;
                }
            }
        }

        public string Insert(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                UltrasonicTestTemplate _P = new UltrasonicTestTemplate();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    _P = js.Deserialize<UltrasonicTestTemplate>(jsonValue);

                    _P.UltrasonicTest.CreatedBy = Convert.ToInt32(CreatedBy);
                    _P.UltrasonicTest.ClientId = Convert.ToInt32(ClientId);
                    _P.UltrasonicTest.AppId = Convert.ToInt32(AppId);
                    _P.UltrasonicTest.CreatedDate = Convert.ToDateTime(DateTime.Now);
                    _P.UltrasonicTest.UpdatedBy = Convert.ToInt32(CreatedBy);
                    _P.UltrasonicTest.UpdatedDate = Convert.ToDateTime(DateTime.Now);

                    foreach (UltrasonicTestResults item in _P.UltrasonicTestResults)
                    {
                        item.CreatedBy = Convert.ToInt32(CreatedBy);
                        item.ClientId = Convert.ToInt32(ClientId);
                        item.AppId = Convert.ToInt32(AppId);
                        item.CreatedDate = Convert.ToDateTime(DateTime.Now);
                        item.UpdatedBy = Convert.ToInt32(CreatedBy);
                        item.UpdatedDate = Convert.ToDateTime(DateTime.Now);
                    }
                }
                _response.IsSucess = true;
                _response.CallBack = CallBackMethodName;
                _response.ResponseData =
                    _DbUltrasonicTest.InsertUltrasonicTest(_P);
                _response.Message = "SucessFully Saved";
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });

            return jSearializer.Serialize(_response);
        }

        public string Update(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                UltrasonicTestTemplate _P = new UltrasonicTestTemplate();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    _P = js.Deserialize<UltrasonicTestTemplate>(jsonValue);

                    _P.UltrasonicTest.ClientId = Convert.ToInt32(ClientId);
                    _P.UltrasonicTest.AppId = Convert.ToInt32(AppId);
                    _P.UltrasonicTest.UpdatedBy = Convert.ToInt32(CreatedBy);
                    _P.UltrasonicTest.UpdatedDate = Convert.ToDateTime(DateTime.Now);

                    foreach (UltrasonicTestResults item in _P.UltrasonicTestResults)
                    {
                        item.ClientId = Convert.ToInt32(ClientId);
                        item.AppId = Convert.ToInt32(AppId);
                        item.UpdatedBy = Convert.ToInt32(CreatedBy);
                        item.UpdatedDate = Convert.ToDateTime(DateTime.Now);
                    }
                }
                _response.IsSucess = true;
                _response.CallBack = CallBackMethodName;
                _response.ResponseData = _DbUltrasonicTest.UpdateUltrasonicTest(_P);
                _response.Message = "SucessFully Updated";
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }

        public string Delete(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                _response.IsSucess = true;
                _response.Message = "Record Sucessfully Deleted";
                _response.CallBack = CallBackMethodName;
                _response.ResponseData =
                    _DbUltrasonicTest.DeleteUltrasonicTestReport(
                        Convert.ToInt32(Parameter));
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }

        public string GetReportList(HttpContext context)
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
                recordResp = _DbUltrasonicTest.GetAllUltrasonicTestReports(recordReq);
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

        private string GetUltrasonicTestReportById()
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                _response.IsSucess = true;
                _response.Message = "Record Sucessfully Retreived";
                _response.CallBack = CallBackMethodName;
                _response.ResponseData =
                    _DbUltrasonicTest.GetUltrasonicTestReportById(
                        Convert.ToInt32(Parameter));
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