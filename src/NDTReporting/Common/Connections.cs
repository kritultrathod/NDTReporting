using System;
using System.Configuration;

namespace NDTReporting.Common
{
    public static class Connections
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings[(Int32)ConnectinStringEnum.NDTReportingDB].ConnectionString;
        }
        /// <summary>
        /// List of DB information & To be configures in this order 
        /// </summary>
        private enum ConnectinStringEnum
        {
            NDTReportingDB = 1
        }
    }
}