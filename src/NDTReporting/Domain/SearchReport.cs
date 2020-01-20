using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using NDTReporting.Common;
using NDTReporting.DataLayer;

namespace NDTReporting.Domain
{
    public class DbSearchReports : DbBase
    {
        #region Private Properties
        private SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlCommand _cmd;
        string sConnString = Connections.GetConnectionString();
        DALHelper objDalHelper;
        Hashtable hTable = new Hashtable();
        string sQuery = string.Empty;
        #endregion

        private RadiographicWeldsTemplate _retrieve = new RadiographicWeldsTemplate();
        public RadiographicWeldsTemplate GetReports(int id)
        {
            try
            {
                _retrieve.RadiographicWeld = new RadiographicWeld();
                _retrieve.RadiographicWeldsTestResult = new List<RadiographicWeldsTestResult>();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "select RW.* from NDTUAT.RadiographicWeld RW where ReportId = " + id.ToString();
                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())
                {
                    _retrieve.RadiographicWeld.TestReportNumber = _Reader["TestReportNumber"].ToString();
                    _retrieve.RadiographicWeld.Client = _Reader["Client"].ToString();
                    _retrieve.RadiographicWeld.Location = _Reader["Location"].ToString();
                    _retrieve.RadiographicWeld.ContactPerson = _Reader["ContactPerson"].ToString();
                    _retrieve.RadiographicWeld.ContactNumber = _Reader["ContactNumber"].ToString();
                    _retrieve.RadiographicWeld.JobDescription = _Reader["JobDescription"].ToString();
                    _retrieve.RadiographicWeld.TestDate = Convert.ToDateTime(_Reader["TestDate"].ToString());
                }
            }
            catch
            {
                throw;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }

            foreach (RadiographicWeldsTestResult item in GetReportsDetails(id))
            {
                _retrieve.RadiographicWeldsTestResult.Add(item);
            }

            return _retrieve;
        }

        public List<RadiographicWeldsTestResult> GetReportsDetails(int id)
        {
            try
            {
                List<RadiographicWeldsTestResult> _lstTestResult = new List<RadiographicWeldsTestResult>();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "select RWT.* from NDTUAT.RadiographicWeldTestResult RWT where ReportId=" +
                                   id.ToString();
                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())
                {
                    RadiographicWeldsTestResult _RadiographicWeldsTestResult = new RadiographicWeldsTestResult();

                    _RadiographicWeldsTestResult.IdentificationNo = _Reader["IdentificationNo"].ToString();
                    _RadiographicWeldsTestResult.JointNo = _Reader["JointNo"].ToString();
                    _RadiographicWeldsTestResult.Welder = _Reader["Welder"].ToString();
                    _RadiographicWeldsTestResult.Segment = _Reader["Segment"].ToString();
                    _RadiographicWeldsTestResult.FlimSizeX = _Reader["FlimSizeX"].ToString();
                    _RadiographicWeldsTestResult.FlimSizeY = _Reader["FlimSizeY"].ToString();
                    _RadiographicWeldsTestResult.ObservationsId = Convert.ToInt32(_Reader["ObservationsId"].ToString());
                    _RadiographicWeldsTestResult.RemarksId = Convert.ToInt32(_Reader["RemarksId"].ToString());

                    _lstTestResult.Add(_RadiographicWeldsTestResult);
                }
                return _lstTestResult;
            }
            catch
            {
                throw;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }

        public SearchTestRecordResp GetAllRadiographicWeldReports(SearchTestRecordReq recordReq)
        {
            try
            {
                SearchTestRecordResp recordResp = new SearchTestRecordResp();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "[NDTUAT].[prc_GetAllRadiographicWeldReports_KTR]";
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", recordReq.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@PageIndex", recordReq.PageIndex));
                _cmd.Parameters.Add(new SqlParameter("@pageSize", ConfigManager.SearchPageSize));

                _cmd.Parameters.Add(new SqlParameter("@OrderBy", recordReq.SortField));
                _cmd.Parameters.Add(new SqlParameter("@OrderDir", recordReq.SortDir));

                if (!string.IsNullOrEmpty(recordReq.ReportId))
                    _cmd.Parameters.Add(new SqlParameter("@ReportId", recordReq.ReportId));
                if (!string.IsNullOrEmpty(recordReq.TestReportNo))
                    _cmd.Parameters.Add(new SqlParameter("@TestReportNo", recordReq.TestReportNo));
                if (!string.IsNullOrEmpty(recordReq.Client))
                    _cmd.Parameters.Add(new SqlParameter("@Client", recordReq.Client));
                if (!string.IsNullOrEmpty(recordReq.Location))
                    _cmd.Parameters.Add(new SqlParameter("@Location", recordReq.Location));
                if (!string.IsNullOrEmpty(recordReq.ContactPerson))
                    _cmd.Parameters.Add(new SqlParameter("@ContactPerson", recordReq.ContactPerson));
                if (!string.IsNullOrEmpty(recordReq.ContractNo))
                    _cmd.Parameters.Add(new SqlParameter("@ContractNo", recordReq.ContractNo));
                if (!string.IsNullOrEmpty(recordReq.TestDateStartString))
                    _cmd.Parameters.Add(new SqlParameter("@TestDateStart", recordReq.TestDateStartString));
                if (!string.IsNullOrEmpty(recordReq.TestDateEndString))
                    _cmd.Parameters.Add(new SqlParameter("@TestDateEnd", recordReq.TestDateEndString));

                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())
                {
                    TestRecordLight _RadiographicWelds = new TestRecordLight();

                    _RadiographicWelds.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _RadiographicWelds.ReportNo = _Reader["ReportNo"].ToString();
                    _RadiographicWelds.FabricatorName = _Reader["FabricatorName"].ToString();
                    _RadiographicWelds.ContactPerson = _Reader["ContactPerson"].ToString();
                    _RadiographicWelds.ContractNo = _Reader["ContractNo"].ToString();
                    _RadiographicWelds.Location = _Reader["Location"].ToString();
                    _RadiographicWelds.IsAuthorized = Convert.ToBoolean(_Reader["IsAuthorized"]);
                    _RadiographicWelds.DateofTestingString = _Reader["DateofTesting"].ToString();
                    recordResp.TestRecordLightList.Add(_RadiographicWelds);
                }
                _Reader.NextResult();
                while (_Reader.Read())
                {
                    recordResp.PageCount = Convert.ToInt32(_Reader["PageCount"].ToString());
                    recordResp.PageIndex = Convert.ToInt32(_Reader["pageIndex"].ToString());
                }

                recordResp.Req = recordReq;
                recordResp.Req.TestDateStartString = recordReq.TestDateStartString; //.ToString("MM/dd/yyyy");
                recordResp.Req.TestDateEndString = recordReq.TestDateEndString; //.ToString("MM/dd/yyyy");

                return recordResp;
            }
            catch
            {
                throw;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }

        public List<RadiographicWeld> GetReportNumbers()
        {
            try
            {
                List<RadiographicWeld> _lstReportNumbers = new List<RadiographicWeld>();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "select RW.ReportId, RW.TestReportNumber from NDTUAT.RadiographicWeld RW";
                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())
                {
                    RadiographicWeld _RadiographicWelds = new RadiographicWeld();

                    _RadiographicWelds.ReportID = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _RadiographicWelds.TestReportNumber = _Reader["TestReportNumber"].ToString();

                    _lstReportNumbers.Add(_RadiographicWelds);
                }
                return _lstReportNumbers;
            }
            catch
            {
                throw;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }

        public List<ReportTemplateNames> GetTemplateNames(int reportId, int subTestId, string action, int clientId)
        {
            List<ReportTemplateNames> _lstReportNames = new List<ReportTemplateNames>();
            HandleError.HandleInternalError(() =>
                {
                    _openDBConnection();
                    SqlCommand _cmd = _con.CreateCommand();
                    _cmd.CommandText = "[NDTUAT].[prc_GetTemplateNames]";
                    _cmd.CommandType = CommandType.StoredProcedure;
                    _cmd.Parameters.Add((action == "Authorize" || action == "All")
                                            ? new SqlParameter("@SubTestId", subTestId) //Get all templates for "Print" approval
                                            : new SqlParameter("@ReportId", reportId));//Get "Authorized" templates for a report
                    _cmd.Parameters.Add(new SqlParameter("@ClientID", clientId));

                    SqlDataReader _Reader = _cmd.ExecuteReader();

                    while (_Reader.Read())
                    {
                        ReportTemplateNames _ReportTemplates = new ReportTemplateNames();

                        _ReportTemplates.TemplateID = Convert.ToInt32(_Reader["CustomReportTemplateId"].ToString());
                        _ReportTemplates.ClientId = Convert.ToInt32(_Reader["ClientID"].ToString());
                        _ReportTemplates.TemplateName = _Reader["TemplateName"].ToString();

                        _lstReportNames.Add(_ReportTemplates);
                    }
                }, (m, e) =>
                {
                    HandleError.LogAppError(m, e);
                    throw e;
                },
                    _closeDBConnection
                );
            return _lstReportNames;
        }

        public int InsertReportAndTemplateAuthMap(ReportViewParams _P)
        {
            int ResultId = 0;
            HandleError.HandleInternalError(() =>
            {
                hTable.Clear();
                hTable.Add("@ReportId", _P.ReportId);
                hTable.Add("@CustomReportTemplateId", _P.TemplateId);
                hTable.Add("@SubTestId", _P.SubTestId);
                hTable.Add("@AppID", _P.AppId);
                hTable.Add("@ClientID", _P.ClientId);
                hTable.Add("@CreatedBy", _P.CreatedBy);
                hTable.Add("@CreatedDate", _P.CreatedDate);
                hTable.Add("@DeletedStatus", _P.DeletedStatus);

                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_InsertReportAndTemplateAuthMap]";
                    ResultId = ConversionHandler.Instance.ConvertTo<int>(objDalHelper.GetExecuteSave(sQuery, hTable));
                }
            }, (m, e) =>
            {
                throw e;
            });
            return ResultId;
        }

        #region Private Methods
        private void _openDBConnection()
        {
            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            _cmd = _con.CreateCommand();
        }
        private void _closeDBConnection()
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();
        }
        private void _logException(string message, Exception ex)
        {
            HandleError.LogAppError(message, ex);
        }
        #endregion
    }

    public class ReportTemplateNames
    {
        private int _TemplateID = 0;
        public int TemplateID
        {
            get { return _TemplateID; }
            set { _TemplateID = value; }
        }
        private string _TemplateName = string.Empty;
        public string TemplateName
        {
            get { return _TemplateName; }
            set { _TemplateName = value; }
        }
        private int _ClientId = 0;
        public int ClientId
        {
            get { return _ClientId; }
            set { _ClientId = value; }
        }
    }

    public class TemplateParams
    {
        public int ReportId { get; set; }
        public int SubTestId { get; set; }
        public string Action { get; set; }
    }

    public class ReportViewParams
    {
        public int ReportId { get; set; }
        public int TemplateId { get; set; }
        public int SubTestId { get; set; }
        public string Action { get; set; }

        public int AppId { get; set; }
        public int ClientId { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
        public int DeletedStatus { get; set; }

        public ReportViewParams()
        {
            AppId = 0;
            ClientId = 0;
            CreatedBy = 0;
            CreatedDate = DateTime.Now;
            UpdatedBy = 0;
            UpdatedDate = DateTime.Now;
            DeletedStatus = 0;
        }

    }

}