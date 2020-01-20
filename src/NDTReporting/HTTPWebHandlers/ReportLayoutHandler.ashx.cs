using System;
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
    public class ReportLayoutHandler : IHttpHandler
    {
        private ResponseHelper _ResponseHelper;
        ReportTemplateOperations _ReportTemplateOperations = new ReportTemplateOperations();

        #region Public Methods
        #region IHttpHandler
        public void ProcessRequest(HttpContext context)
        {
            using (_ResponseHelper = new ResponseHelper(context))
            {
                switch (_ResponseHelper.MethodName.ToLower())
                {
                    case "getradiographicweldreporttemplate":
                        context.Response.Write(GetRadiographicWeldReportTemplate(context));
                        break;
                    case "savetemplatebyreportid":
                        context.Response.Write(SaveTemplateByReportID(context));
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

        private string GetRadiographicWeldReportTemplate(HttpContext context)
        {
            HandleError.HandleInternalError(() =>
            {
                ReportTemplate _ReportTemplate = new ReportTemplate();
                using (var reader = new StreamReader(context.Request.InputStream))
                {
                    string jsonValue = reader.ReadToEnd();
                    var js = new JavaScriptSerializer();
                    _ReportTemplate = js.Deserialize<ReportTemplate>(jsonValue);
                }

                _ReportTemplate = _ReportTemplateOperations.GetRadiographicWeldReportTemplate(_ReportTemplate);

                _ResponseHelper.iJsonResponse.IsSucess = true;
                _ResponseHelper.iJsonResponse.Message = "GetReportTemplateById Sucess";
                _ResponseHelper.iJsonResponse.CallBack = _ResponseHelper.CallBackMethodName;
                _ResponseHelper.iJsonResponse.ResponseData = _ReportTemplate;

            }, (m, e) =>
            {
                _ResponseHelper.iJsonResponse.IsSucess = false;
                _ResponseHelper.iJsonResponse.Message = m;
                _ResponseHelper.iJsonResponse.ResponseData = e;
            }
            );
            return _ResponseHelper.iJSSearializer.Serialize(_ResponseHelper.iJsonResponse);
        }

        private string SaveTemplateByReportID(HttpContext context)
        {
            HandleError.HandleInternalError(() =>
            {
                ReportTemplate _ReportTemplate = new ReportTemplate();
                _ReportTemplate.CustomReportTemplateId = Convert.ToInt32(context.Request.Params["CustomReportTemplateId"].ToString());
                _ReportTemplate.ReportId = Convert.ToInt32(context.Request.Params["ReportId"].ToString()); //TODO: KTR KTR KTR 
                _ReportTemplate.SubTestId = Convert.ToInt32(context.Request.Params["SubTestId"].ToString());
                //TODO: KTR*** - Fix Template Collection
         
                _ResponseHelper.iJsonResponse.IsSucess = true;
                _ResponseHelper.iJsonResponse.CallBack = _ResponseHelper.CallBackMethodName;
                _ResponseHelper.iJsonResponse.ResponseData = _ReportTemplateOperations.SaveTemplateByReportID(_ReportTemplate);
                _ResponseHelper.iJsonResponse.Message = "SucessFully Saved";

            }, (m, e) =>
            {
                _ResponseHelper.iJsonResponse.IsSucess = false;
                _ResponseHelper.iJsonResponse.Message = m;
                _ResponseHelper.iJsonResponse.ResponseData = e;
            }
        );
            return _ResponseHelper.iJSSearializer.Serialize(_ResponseHelper.iJsonResponse);
        }

        private void OnError(string ErrorMessage, Exception e)
        { //TODO: generic Helper method for this class
        }
        #endregion

    }

}