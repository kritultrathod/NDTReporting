using System.Web;
using NDTReporting.Domain;

namespace NDTReporting
{
    /// <summary>
    /// Summary description for RadiographicWelds
    /// </summary>
    public class Autocomplete : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        string MethodName = string.Empty;
        string term = string.Empty;
        string SearchText = string.Empty;
        string ColumnNames = string.Empty;
        string SearchColumn = string.Empty;
        string TableName = string.Empty;
        string UserId = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            if (context != null)
            {
                context.Response.ContentType = "application/json";
                MethodName = context.Request.Params["method"];
                term = context.Request.QueryString["term"];
                ColumnNames = context.Request.Params["ColumnNames"];
                SearchColumn = context.Request.Params["SearchColumn"];
                TableName = context.Request.Params["TableName"];
                UserId = context.Session["id"].ToString();
                switch (MethodName.ToLower())
                {
                    case "autolookuplist":
                        context.Response.Write(onselectevent(context));
                        break;
                    case "autosimplelist":
                        context.Response.Write(standardstringlist(context));
                        break;
                }
            }
        }
        public string onselectevent(HttpContext context)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                             new System.Web.Script.Serialization.JavaScriptSerializer();

            AutoComplete callAuto = new AutoComplete();

            var result = callAuto.GetLookupList(term, ColumnNames, SearchColumn, TableName, UserId);
            return jSearializer.Serialize(result);
        }

        public string standardstringlist(HttpContext context)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jSearializer =
                             new System.Web.Script.Serialization.JavaScriptSerializer();
            AutoComplete callAuto = new AutoComplete();
            var result = callAuto.GetStandardList(term, ColumnNames, SearchColumn, TableName, UserId);
            return jSearializer.Serialize(result);
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