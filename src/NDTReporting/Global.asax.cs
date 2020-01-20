using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace NDTReporting
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            NDTReporting.Common.HandleError.LogAppError(string.Format("Application Started at {0}", System.DateTime.Now.ToString("yyyy-mm-dd-hh:mm.ss")), null);
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            NDTReporting.Common.HandleError.LogAppError(string.Format("Session Started at {0}", System.DateTime.Now.ToString("yyyy-mm-dd-hh:mm.ss")), null);
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            NDTReporting.Common.HandleError.LogAppError(string.Format("Application_BeginRequest Started at {0}", System.DateTime.Now.ToString("yyyy-mm-dd-hh:mm.ss")), null);
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            NDTReporting.Common.HandleError.LogAppError(string.Format("Application_AuthenticateRequest checking at {0}", System.DateTime.Now.ToString("yyyy-mm-dd-hh:mm.ss")), null);
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            System.Web.HttpContext context = HttpContext.Current;
            System.Exception ex = context.Server.GetLastError();
            NDTReporting.Common.HandleError.LogAppError(GetHttpReqAttributes(context.Request), ex);
        }

        protected void Session_End(object sender, EventArgs e)
        {
            NDTReporting.Common.HandleError.LogAppError(string.Format("Session_End checking at {0}", System.DateTime.Now.ToString("yyyy-mm-dd-hh:mm.ss")), null);
        }

        protected void Application_End(object sender, EventArgs e)
        {
            System.Exception ex = new Exception("NDTReporting.Global.Application_End Called. Application Ended.");
            NDTReporting.Common.HandleError.LogAppError(string.Format("Session Ended at {0}", System.DateTime.Now.ToString("yyyy-mm-dd-hh:mm.ss")), ex);
        }

        private string GetHttpReqAttributes(HttpRequest request)
        {
            string strdict = string.Empty;
            try
            {
                var dict = request.DumpProperties();
                strdict = string.Join(string.Format("{0}", Environment.NewLine), dict.Select(kv => kv.Key + "=" + kv.Value ?? kv.Value.ToString()));
            }
            catch (Exception e)
            {
                NDTReporting.Common.HandleError.LogAppError("GetHttpReqAttributes()", e);
                //throw;
            }
            return strdict;
        }
    }

    public static class MyExtensions
    {
        public static Dictionary<string, object> DumpProperties(this System.Web.HttpRequest obj)
        {
            var props = new Dictionary<string, object>();
            try
            {
                PropertyInfo[] pi = obj.GetType().GetProperties();
                foreach (var propertyInfo in pi)
                {
                    object o = getSValue(propertyInfo, obj);
                    if (!string.IsNullOrEmpty(o.ToString()))
                        props.Add(propertyInfo.Name, getSValue(propertyInfo, obj));
                }
                //props = pi.ToDictionary(p => p.Name,  (p) => { try {p.GetValue(obj, null)} catch ()});
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return props;
        }

        private static string getSValue(PropertyInfo p, HttpRequest obj)
        {
            string s = string.Empty;
            try
            {
                s = p.GetValue(obj, null).ToString();
            }
            catch (Exception)
            {
                //throw;
            }
            return s;
        }
    }
}