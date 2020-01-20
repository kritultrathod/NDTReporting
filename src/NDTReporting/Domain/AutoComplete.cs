using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using NDTReporting.Common;
using NDTReporting.DataLayer;

namespace NDTReporting.Domain
{
    public class AutoComplete
    {
        string sConnString = Connections.GetConnectionString();
        DALHelper objDalHelper;
        string sQuery = string.Empty;


        public List<String> GetStandardList(string SearchText, string ColumnNames,
            string SearchColumn, string TableName, string UserId)
        {
            List<String> _lstAuto = new List<String>();

            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = SqlAutoCompleteQuery(SearchText, ColumnNames, SearchColumn, TableName, UserId);
                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery);

                    while (_Reader.Read())
                    {
                        _lstAuto.Add(_Reader[ColumnNames.Substring(ColumnNames.IndexOf(',') + 1)].ToString());
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstAuto;
        }
        public List<LookupData> GetLookupList(string SearchText, string ColumnNames,
            string SearchColumn, string TableName, string UserId)
        {
            List<LookupData> _lstAuto = new List<LookupData>();
            LookupData each;
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = SqlAutoCompleteQuery(SearchText, ColumnNames, SearchColumn, TableName, UserId);
                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery);

                    while (_Reader.Read())
                    {
                        each = new LookupData();
                        each.value = _Reader[ColumnNames.Substring(0, ColumnNames.IndexOf(','))].ToString();
                        each.label = _Reader[ColumnNames.Substring(ColumnNames.IndexOf(',') + 1)].ToString();
                        _lstAuto.Add(each);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstAuto;
        }

        private static string SqlAutoCompleteQuery(string SearchText, string ColumnNames,
            string SearchColumn, string TableName, string UserId)
        {
            return "SELECT * FROM (SELECT " + ColumnNames + ", ROW_NUMBER() OVER (PARTITION BY "
                + ColumnNames.Trim().Substring(ColumnNames.IndexOf(",") + 1) + " ORDER BY " 
                + ColumnNames.Trim().Substring(0, ColumnNames.IndexOf(",")) + ") AS RowNumber "
                + "  FROM NDTUAT." + TableName + " WHERE " 
                +  SearchColumn + " LIKE '%" + SearchText + "%' and (Createdby = " + UserId 
                + " or Updatedby = " + UserId + ") and deletedStatus = 0) AS a "
                + " WHERE   a.RowNumber = 1 ";
        }

        public class LookupData
        {
            public string label { get; set; }
            public string value { get; set; }
        }
    }
}