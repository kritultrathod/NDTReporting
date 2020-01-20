using System;
using System.Configuration;

namespace NDTReporting.Common
{
    public static class ConfigManager
    {
        public static int SearchPageSize { get; set; }
        public static string SiteUrl { get; set; }

        static ConfigManager()
        {
            HandleError.HandleInternalError(() =>
            {
                SearchPageSize = Convert.ToInt32(ConfigurationManager.AppSettings["SearchPageSize"]);
                SiteUrl = ConfigurationManager.AppSettings["SiteUrl"].ToString();
            }, (a, e) =>
            {
                //Failed Error Retrieving Configuration values;
            }, () =>
            {
                //Cleanup
            });
        }


    }
}