using System.Collections;
using System.Data.SqlClient;
using NDTReporting.Common;
using NDTReporting.DataLayer;

namespace NDTReporting.Domain
{
    public class CompanyDetails
    {
        string sConnString = Connections.GetConnectionString();
        DALHelper objDalHelper;
        Hashtable hTable = new Hashtable();
        string sQuery = string.Empty;
        public CompanyDetails GetCompanyDetails(int ClientId)
        {
            CompanyDetails _CompanyDetails = null;
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetCompanyDetails] '" + ClientId.ToString() + "'";
                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery);
                    while (_Reader.Read())
                    {
                        _CompanyDetails = new CompanyDetails();
                        _CompanyDetails.CompanyName = _Reader["CompanyName"].ToString();
    	                _CompanyDetails.Logo = _Reader["Logo"].ToString();
	                    _CompanyDetails.Address = _Reader["Address"].ToString();
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _CompanyDetails;
        }

        private int _ClientId = 0;
        public int ClientId
        { get { return _ClientId; } set { _ClientId = value; } }

        private string _CompanyName = string.Empty;
        public string CompanyName
        { get { return _CompanyName; } set { _CompanyName = value; } }

        private string _Logo = string.Empty;
        public string Logo
        { get { return _Logo; } set { _Logo = value; } }

        private string _Address = string.Empty;
        public string Address
        { get { return _Address; } set { _Address = value; } }

        private string _Address1 = string.Empty;
        public string Address1
        { get { return _Address1; } set { _Address1 = value; } }

        private string _ContactNos = string.Empty;
        public string ContactNos
        { get { return _ContactNos; } set { _ContactNos = value; } }

        private string _EmailWeb = string.Empty;
        public string EmailWeb
        { get { return _EmailWeb; } set { _EmailWeb = value; } }
    }
}