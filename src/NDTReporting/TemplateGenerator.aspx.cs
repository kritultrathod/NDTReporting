using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;
using NDTReporting.Common;

namespace NDTReporting
{
    public partial class TemplateGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        [WebMethod]
        public static List<string> GetAutoCompleteData(string username)
        {
            List<string> result = new List<string>();
            if (username != null)
            {
                using (SqlConnection _con = new SqlConnection(Connections.GetConnectionString()))
                {
                    using (
                        SqlCommand cmd =
                            new SqlCommand("SELECT TemplateName FROM NDTUAT.CustomReportTemplate WHERE " +
                                           "ReportTemplateName LIKE '%'+ @SearchText +'%'", _con))
                    {
                        _con.Open();
                        cmd.Parameters.AddWithValue("@SearchText", username);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            result.Add(dr["TemplateName"].ToString());
                        }
                    }
                }
            }
            return result;
        }
    }
}