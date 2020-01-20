using System;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting.HTTPWebHandlers
{
    /// <summary>
    /// Summary description for TemplateEditHandler
    /// </summary>
    public class TemplateEditHandler : IHttpHandler
    {
        string MethodName = string.Empty;
        ReportViewerHelperOperations _ReportViewerHelperOperations = new ReportViewerHelperOperations();
        string CallBackMethodName = string.Empty;
        private GetTemplateName _DbRadiographicWelds = new GetTemplateName();
        object Parameter = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MethodName = context.Request.Params["method"];
            Parameter = context.Request.Params["param"];
            CallBackMethodName = context.Request.Params["callbackmethod"];

                switch(MethodName.ToLower())
                {
                    case "getbyid":
                        break;
                    case "updatecustomtemplate":
                        context.Response.Write(UpdateTemplate(context));
                        break;
                    case "deleteradiographictemplate":
                        context.Response.Write(deleteRadiographicTemplate(context));
                        break;
                    default:
                        break;
                }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public string UpdateTemplate(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
         
            HandleError.HandleInternalError(() =>
            {
                getTemplateName _editTemplate = new getTemplateName();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    _editTemplate = js.Deserialize<getTemplateName>(jsonValue);
                }
                _response.IsSucess = true;
                _response.CallBack = CallBackMethodName;
                _response.ResponseData = _DbRadiographicWelds.UpdateCustomTemplate(_editTemplate);
                _response.Message = "Template saved sucessfully.";
            }, (m, e) =>
            {
                _response.IsSucess = false;
                _response.Message = m;
                _response.ResponseData = e;
            });

            return jSearializer.Serialize(_response);
        }
        private string deleteRadiographicTemplate(HttpContext context)
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
                    _DbRadiographicWelds.deleteRadiographicTemplate(
                        Convert.ToInt32(Parameter));
            }, (m, e) =>
            {
                _response.Message = e.Message;
                _response.IsSucess = false;
            });
            return jSearializer.Serialize(_response);
        }
    }
}