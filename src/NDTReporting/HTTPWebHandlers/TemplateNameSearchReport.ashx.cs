using System;
using System.Collections.Generic;
using System.Web;
using NDTReporting.Common;
using NDTReporting.Domain;

namespace NDTReporting.HTTPWebHandlers
{
    /// <summary>
    /// Summary description for TemplateNameSearchReport
    /// </summary>
    public class TemplateNameSearchReport : IHttpHandler
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
                case "gettemplatenames1":
                    context.Response.Write(GetTemplateNames1(context));
                    break;
                default:
                    break;
            }
        }
        public string GetTemplateNames1(HttpContext context)
        {
            JsonResponse _response = new JsonResponse();
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                         new System.Web.Script.Serialization.JavaScriptSerializer();
            HandleError.HandleInternalError(() =>
            {

                List<ReportTemplateNames> _lstReportTemplateNames =
                    new List<ReportTemplateNames>();
                _lstReportTemplateNames = _DbSearchReports.GetTemplateNames(0, Convert.ToInt32(Parameter), "", Convert.ToInt32(ClientId));
                throw new Exception("KTR: HOT-wired to build - fix this for 1st and 3rd new parameters ");
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