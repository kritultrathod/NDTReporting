using System;
using System.Web;
using System.Web.Script.Serialization;
namespace NDTReporting.Domain
{
    public class ResponseHelper : IDisposable
    {
        public string MethodName { get; set; }
        public string CallBackMethodName { get; set; }
        public object Parameter { get; set; }
        public JsonResponse iJsonResponse { get; set; }
        public JavaScriptSerializer iJSSearializer { get; set; }

        public ResponseHelper(HttpContext context)
        {
            iJsonResponse = new JsonResponse();
            iJSSearializer = new JavaScriptSerializer();

            context.Response.ContentType = "application/x-javascript";
            this.MethodName = context.Request.Params["method"];
            this.Parameter = context.Request.Params["param"];
            this.CallBackMethodName = context.Request.Params["callbackmethod"];
        }


        void IDisposable.Dispose()
        {
            #region Freeup Resources
            this.iJsonResponse = null;
            this.iJSSearializer = null; 
            #endregion

            GC.SuppressFinalize(this);
        }
    }
}