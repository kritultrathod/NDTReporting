using System;
using System.Web;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting.HTTPWebHandlers
{
    /// <summary>
    /// Summary description for TemplateGenerator
    /// </summary>
    public class TemplateGenerator : IHttpHandler
    {
        
        string MethodName = string.Empty;
        string CallBackMethodName = string.Empty;
        object Parameter = string.Empty;
        private DbRadiographicWelds _DbRadiographicWelds = new DbRadiographicWelds();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MethodName = context.Request.Params["method"];
            Parameter = context.Request.Params["param"];
            CallBackMethodName = context.Request.Params["callbackmethod"];

            switch (MethodName.ToLower())
            {
                case "getbasetemplate":
                    context.Response.Write(GetBaseTemplate());
                    break;
            }
        }

        private string GetBaseTemplate()
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {
                _response.IsSucess = true;
                _response.Message = "Record Retreived Edited";
                _response.CallBack = CallBackMethodName;
                _response.ResponseData =
                    _DbRadiographicWelds.GetRadiographicWeldReportById(
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