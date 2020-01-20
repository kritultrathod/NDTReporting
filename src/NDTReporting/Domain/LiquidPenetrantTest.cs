using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class DbLiquidPenetrantTest
    {
        private SqlConnection _con = new SqlConnection(Connections.GetConnectionString());

        public string InsertLiquidPenetrantTest(LiquidPenetrantTestTemplate _P)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_InsertLiquidPenetrantTest";
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.Add(new SqlParameter("@FabricatorName", _P.LiquidPenetrantTest.FabricatorName));
                _cmd.Parameters.Add(new SqlParameter("@SubTestId", _P.LiquidPenetrantTest.SubTestId));
                _cmd.Parameters.Add(new SqlParameter("@Location", _P.LiquidPenetrantTest.Location));
                _cmd.Parameters.Add(new SqlParameter("@ReportNo", _P.LiquidPenetrantTest.ReportNo));
                _cmd.Parameters.Add(new SqlParameter("@ContractNo", _P.LiquidPenetrantTest.ContractNo));
                _cmd.Parameters.Add(new SqlParameter("@ContactPerson", _P.LiquidPenetrantTest.ContactPerson));
                _cmd.Parameters.Add(new SqlParameter("@DateofTesting", _P.LiquidPenetrantTest.DateofTestingString ?? string.Empty));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.LiquidPenetrantTest.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@Material", _P.LiquidPenetrantTest.Material));
                _cmd.Parameters.Add(new SqlParameter("@Dimension", _P.LiquidPenetrantTest.Dimension));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceCondition", _P.LiquidPenetrantTest.SurfaceCondition));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceStandard", _P.LiquidPenetrantTest.ReferenceStandard));
                _cmd.Parameters.Add(new SqlParameter("@TestSpecification", _P.LiquidPenetrantTest.TestSpecification));
                _cmd.Parameters.Add(new SqlParameter("@AcceptanceCriteria", _P.LiquidPenetrantTest.AcceptanceCriteria));
                _cmd.Parameters.Add(new SqlParameter("@TechSheetNo", _P.LiquidPenetrantTest.TechSheetNo));
                _cmd.Parameters.Add(new SqlParameter("@ExtentofCoverage", _P.LiquidPenetrantTest.ExtentofCoverage));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceTemperature", _P.LiquidPenetrantTest.SurfaceTemperature));
                _cmd.Parameters.Add(new SqlParameter("@ConsumablesType", _P.LiquidPenetrantTest.ConsumablesTypeId));
                _cmd.Parameters.Add(new SqlParameter("@TechniqueId", _P.LiquidPenetrantTest.TechniqueId));
                _cmd.Parameters.Add(new SqlParameter("@Penetrant", _P.LiquidPenetrantTest.Penetrant));
                _cmd.Parameters.Add(new SqlParameter("@PenetrantBatchNo", _P.LiquidPenetrantTest.PenetrantBatchNo));
                _cmd.Parameters.Add(new SqlParameter("@ApplicationOfPenetrant", _P.LiquidPenetrantTest.ApplicationOfPenetrant));
                _cmd.Parameters.Add(new SqlParameter("@PenetrantRemovalMethod", _P.LiquidPenetrantTest.PenetrantRemovalMethod));
                _cmd.Parameters.Add(new SqlParameter("@Developer", _P.LiquidPenetrantTest.Developer));
                _cmd.Parameters.Add(new SqlParameter("@DeveloperBatchNo", _P.LiquidPenetrantTest.DeveloperBatchNo));
                _cmd.Parameters.Add(new SqlParameter("@ApplicationOfDeveloper", _P.LiquidPenetrantTest.ApplicationOfDeveloper));
                _cmd.Parameters.Add(new SqlParameter("@ViewingCondition", _P.LiquidPenetrantTest.ViewingCondition));
                _cmd.Parameters.Add(new SqlParameter("@MarkingOfIndication", _P.LiquidPenetrantTest.MarkingOfIndication));
                _cmd.Parameters.Add(new SqlParameter("@PreCleaning", _P.LiquidPenetrantTest.PreCleaning));
                _cmd.Parameters.Add(new SqlParameter("@DwellTime", _P.LiquidPenetrantTest.DwellTime));
                _cmd.Parameters.Add(new SqlParameter("@DryingTime", _P.LiquidPenetrantTest.DryingTime));
                _cmd.Parameters.Add(new SqlParameter("@BlackLightDetails", _P.LiquidPenetrantTest.BlackLightDetails));
                _cmd.Parameters.Add(new SqlParameter("@FinalClearing", _P.LiquidPenetrantTest.FinalClearing));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.LiquidPenetrantTest.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.LiquidPenetrantTest.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.LiquidPenetrantTest.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.LiquidPenetrantTest.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.LiquidPenetrantTest.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.LiquidPenetrantTest.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.LiquidPenetrantTest.DeletedStatus));

                int reportId = Convert.ToInt32(_cmd.ExecuteScalar());

                if (reportId > 0)
                {
                    DbLiquidPenetrantTestResults listLiquidPenetrantTests = new DbLiquidPenetrantTestResults();
                    foreach (LiquidPenetrantTestResults item in _P.LiquidPenetrantTestResults)
                    {
                        item.ReportId = reportId;
                        if (listLiquidPenetrantTests.InsertLiquidPenetrantTestResults(item) <= 0)
                        {
                            return "Record not Afftected to DataBase";
                        }
                    }
                    return "Record Sucessfully Saved";
                }
                else
                    return "Record not Afftected to DataBase";

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

        public string UpdateLiquidPenetrantTest(LiquidPenetrantTestTemplate _P)
        {
            try
            {

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_UpdateLiquidPenetrantTest";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _P.LiquidPenetrantTest.ReportId));
                _cmd.Parameters.Add(new SqlParameter("@FabricatorName", _P.LiquidPenetrantTest.FabricatorName));
                _cmd.Parameters.Add(new SqlParameter("@SubTestId", _P.LiquidPenetrantTest.SubTestId));
                _cmd.Parameters.Add(new SqlParameter("@Location", _P.LiquidPenetrantTest.Location));
                _cmd.Parameters.Add(new SqlParameter("@ReportNo", _P.LiquidPenetrantTest.ReportNo));
                _cmd.Parameters.Add(new SqlParameter("@ContractNo", _P.LiquidPenetrantTest.ContractNo));
                _cmd.Parameters.Add(new SqlParameter("@ContactPerson", _P.LiquidPenetrantTest.ContactPerson));
                _cmd.Parameters.Add(new SqlParameter("@DateofTesting", _P.LiquidPenetrantTest.DateofTestingString ?? string.Empty));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.LiquidPenetrantTest.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@Material", _P.LiquidPenetrantTest.Material));
                _cmd.Parameters.Add(new SqlParameter("@Dimension", _P.LiquidPenetrantTest.Dimension));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceCondition", _P.LiquidPenetrantTest.SurfaceCondition));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceStandard", _P.LiquidPenetrantTest.ReferenceStandard));
                _cmd.Parameters.Add(new SqlParameter("@TestSpecification", _P.LiquidPenetrantTest.TestSpecification));
                _cmd.Parameters.Add(new SqlParameter("@AcceptanceCriteria", _P.LiquidPenetrantTest.AcceptanceCriteria));
                _cmd.Parameters.Add(new SqlParameter("@TechSheetNo", _P.LiquidPenetrantTest.TechSheetNo));
                _cmd.Parameters.Add(new SqlParameter("@ExtentofCoverage", _P.LiquidPenetrantTest.ExtentofCoverage));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceTemperature", _P.LiquidPenetrantTest.SurfaceTemperature));
                _cmd.Parameters.Add(new SqlParameter("@ConsumablesType", _P.LiquidPenetrantTest.ConsumablesTypeId));
                _cmd.Parameters.Add(new SqlParameter("@TechniqueId", _P.LiquidPenetrantTest.TechniqueId));
                _cmd.Parameters.Add(new SqlParameter("@Penetrant", _P.LiquidPenetrantTest.Penetrant));
                _cmd.Parameters.Add(new SqlParameter("@PenetrantBatchNo", _P.LiquidPenetrantTest.PenetrantBatchNo));
                _cmd.Parameters.Add(new SqlParameter("@ApplicationOfPenetrant", _P.LiquidPenetrantTest.ApplicationOfPenetrant));
                _cmd.Parameters.Add(new SqlParameter("@PenetrantRemovalMethod", _P.LiquidPenetrantTest.PenetrantRemovalMethod));
                _cmd.Parameters.Add(new SqlParameter("@Developer", _P.LiquidPenetrantTest.Developer));
                _cmd.Parameters.Add(new SqlParameter("@DeveloperBatchNo", _P.LiquidPenetrantTest.DeveloperBatchNo));
                _cmd.Parameters.Add(new SqlParameter("@ApplicationOfDeveloper", _P.LiquidPenetrantTest.ApplicationOfDeveloper));
                _cmd.Parameters.Add(new SqlParameter("@ViewingCondition", _P.LiquidPenetrantTest.ViewingCondition));
                _cmd.Parameters.Add(new SqlParameter("@MarkingOfIndication", _P.LiquidPenetrantTest.MarkingOfIndication));
                _cmd.Parameters.Add(new SqlParameter("@PreCleaning", _P.LiquidPenetrantTest.PreCleaning));
                _cmd.Parameters.Add(new SqlParameter("@DwellTime", _P.LiquidPenetrantTest.DwellTime));
                _cmd.Parameters.Add(new SqlParameter("@DryingTime", _P.LiquidPenetrantTest.DryingTime));
                _cmd.Parameters.Add(new SqlParameter("@BlackLightDetails", _P.LiquidPenetrantTest.BlackLightDetails));
                _cmd.Parameters.Add(new SqlParameter("@FinalClearing", _P.LiquidPenetrantTest.FinalClearing));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.LiquidPenetrantTest.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.LiquidPenetrantTest.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.LiquidPenetrantTest.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.LiquidPenetrantTest.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.LiquidPenetrantTest.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.LiquidPenetrantTest.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.LiquidPenetrantTest.DeletedStatus));

                _cmd.ExecuteNonQuery();

                int reportId = _P.LiquidPenetrantTest.ReportId;
                string testId = "";
                if (reportId > 0)
                {
                    DbLiquidPenetrantTestResults listLiquidPenetrantTestResults = new DbLiquidPenetrantTestResults();
                    foreach (LiquidPenetrantTestResults item in _P.LiquidPenetrantTestResults)
                    {
                        if (item.TestId != 0)
                            testId = testId + item.TestId.ToString() + ",";
                    }
                    listLiquidPenetrantTestResults.DeleteLiquidPenetrantTestResultsByTestId(testId.Substring(0, testId.Length - 1), reportId);

                    foreach (LiquidPenetrantTestResults item in _P.LiquidPenetrantTestResults)
                    {
                        item.ReportId = reportId;
                        if (item.TestId == 0)
                        {
                            if (listLiquidPenetrantTestResults.InsertLiquidPenetrantTestResults(item) <= 0)
                            {
                                return "Record not Afftected to DataBase";
                            }
                        }
                        else
                        {
                            if (listLiquidPenetrantTestResults.UpdateLiquidPenetrantTestResults(item) <= 0)
                            {
                                return "Record not Afftected to DataBase";
                            }
                        }
                    }
                    return "Record Sucessfully Updated";
                }
                else
                    return "Record not Afftected to DataBase";

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

        public string DeleteLiquidPenetrantTestReport(int ReportId)
        {
            try
            {

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandType = CommandType.StoredProcedure;
                DbLiquidPenetrantTestResults listLiquidPenetrantTests = new DbLiquidPenetrantTestResults();

                if (listLiquidPenetrantTests.DeleteLiquidPenetrantTestResultsByReportId(ReportId) > 0)
                {

                }

                _cmd.CommandText = "NDTUAT.prc_DeleteLiquidPenetrantTest";
                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));
                if (_cmd.ExecuteNonQuery() > 0)
                    return "Records Sucessfully Delete";
                else
                    return "Records not Afftected to DataBase";

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

        public SearchTestRecordResp GetAllLiquidPenetrantTestReports(SearchTestRecordReq recordReq)
        {
            try
            {
                SearchTestRecordResp recordResp = new SearchTestRecordResp();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "[NDTUAT].[prc_GetAllLiquidPenetrantTestReport_KTR]";
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", recordReq.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@PageIndex", recordReq.PageIndex));
                _cmd.Parameters.Add(new SqlParameter("@pageSize", ConfigManager.SearchPageSize));

                _cmd.Parameters.Add(new SqlParameter("@OrderBy", recordReq.SortField));
                _cmd.Parameters.Add(new SqlParameter("@OrderDir", recordReq.SortDir));

                if (!string.IsNullOrEmpty(recordReq.ReportId)) _cmd.Parameters.Add(new SqlParameter("@ReportId", recordReq.ReportId));
                if (!string.IsNullOrEmpty(recordReq.TestReportNo)) _cmd.Parameters.Add(new SqlParameter("@TestReportNo", recordReq.TestReportNo));
                if (!string.IsNullOrEmpty(recordReq.Client)) _cmd.Parameters.Add(new SqlParameter("@Client", recordReq.Client));
                if (!string.IsNullOrEmpty(recordReq.Location)) _cmd.Parameters.Add(new SqlParameter("@Location", recordReq.Location));
                if (!string.IsNullOrEmpty(recordReq.ContactPerson)) _cmd.Parameters.Add(new SqlParameter("@ContactPerson", recordReq.ContactPerson));
                if (!string.IsNullOrEmpty(recordReq.ContractNo)) _cmd.Parameters.Add(new SqlParameter("@ContractNo", recordReq.ContractNo));
                if (!string.IsNullOrEmpty(recordReq.TestDateStartString)) _cmd.Parameters.Add(new SqlParameter("@TestDateStart", recordReq.TestDateStartString));
                if (!string.IsNullOrEmpty(recordReq.TestDateEndString)) _cmd.Parameters.Add(new SqlParameter("@TestDateEnd", recordReq.TestDateEndString));

                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())
                {
                    TestRecordLight liquidPenetrantTest = new TestRecordLight();

                    liquidPenetrantTest.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    liquidPenetrantTest.ReportNo = _Reader["ReportNo"].ToString();
                    liquidPenetrantTest.FabricatorName = _Reader["FabricatorName"].ToString();
                    liquidPenetrantTest.ContactPerson = _Reader["ContactPerson"].ToString();
                    liquidPenetrantTest.ContractNo = _Reader["ContractNo"].ToString();
                    liquidPenetrantTest.Location = _Reader["Location"].ToString();
                    liquidPenetrantTest.IsAuthorized = Convert.ToBoolean(_Reader["IsAuthorized"]);
                    liquidPenetrantTest.DateofTestingString = _Reader["DateofTesting"].ToString();
                    recordResp.TestRecordLightList.Add(liquidPenetrantTest);
                }
                _Reader.NextResult();
                while (_Reader.Read())
                {
                    recordResp.PageCount = Convert.ToInt32(_Reader["PageCount"].ToString());
                    recordResp.PageIndex = Convert.ToInt32(_Reader["pageIndex"].ToString());
                }

                recordResp.Req = recordReq;
                recordResp.Req.TestDateStartString = recordReq.TestDateStartString;//.ToString("MM/dd/yyyy");
                recordResp.Req.TestDateEndString = recordReq.TestDateEndString;//.ToString("MM/dd/yyyy");

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

        public LiquidPenetrantTestTemplate GetLiquidPenetrantTestReportById(int ReportId)
        {
            LiquidPenetrantTestTemplate _LiquidPenetrantTestTemplate = new LiquidPenetrantTestTemplate();
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_GetLiquidPenetrantTestReportById";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));
                SqlDataReader _Reader = _cmd.ExecuteReader();
                LiquidPenetrantTest _LiquidPenetrantTest = null;
                while (_Reader.Read())
                {
                    _LiquidPenetrantTest = new LiquidPenetrantTest();
                    _LiquidPenetrantTest.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _LiquidPenetrantTest.FabricatorName = _Reader["FabricatorName"].ToString();
                    _LiquidPenetrantTest.Location = _Reader["Location"].ToString();
                    _LiquidPenetrantTest.ReportNo = _Reader["ReportNo"].ToString();
                    _LiquidPenetrantTest.ContractNo = _Reader["ContractNo"].ToString();
                    _LiquidPenetrantTest.ContactPerson = _Reader["ContactPerson"].ToString();
                    _LiquidPenetrantTest.DateofTesting = Convert.ToDateTime(_Reader["DateofTesting"].ToString());
                    _LiquidPenetrantTest.JobDescription = _Reader["JobDescription"].ToString();
                    _LiquidPenetrantTest.Material = _Reader["Material"].ToString();
                    _LiquidPenetrantTest.Dimension = _Reader["Dimension"].ToString();
                    _LiquidPenetrantTest.SurfaceCondition = _Reader["SurfaceCondition"].ToString();
                    _LiquidPenetrantTest.ReferenceStandard = _Reader["ReferenceStandard"].ToString();
                    _LiquidPenetrantTest.TestSpecification = _Reader["TestSpecification"].ToString();
                    _LiquidPenetrantTest.AcceptanceCriteria = _Reader["AcceptanceCriteria"].ToString();
                    _LiquidPenetrantTest.TechSheetNo = _Reader["TechSheetNo"].ToString();
                    _LiquidPenetrantTest.ExtentofCoverage = _Reader["ExtentofCoverage"].ToString();
                    _LiquidPenetrantTest.SurfaceTemperature = _Reader["SurfaceTemperature"].ToString();
                    _LiquidPenetrantTest.ConsumablesTypeId = Convert.ToInt32(_Reader["ConsumablesType"].ToString());
                    _LiquidPenetrantTest.TechniqueId = Convert.ToInt32(_Reader["TechniqueId"].ToString());
                    _LiquidPenetrantTest.Penetrant = _Reader["Penetrant"].ToString();
                    _LiquidPenetrantTest.PenetrantBatchNo = _Reader["PenetrantBatchNo"].ToString();
                    _LiquidPenetrantTest.ApplicationOfPenetrant = _Reader["ApplicationOfPenetrant"].ToString();
                    _LiquidPenetrantTest.PenetrantRemovalMethod = _Reader["PenetrantRemovalMethod"].ToString();
                    _LiquidPenetrantTest.Developer = _Reader["Developer"].ToString();
                    _LiquidPenetrantTest.DeveloperBatchNo = _Reader["DeveloperBatchNo"].ToString();
                    _LiquidPenetrantTest.ApplicationOfDeveloper = _Reader["ApplicationOfDeveloper"].ToString();
                    _LiquidPenetrantTest.ViewingCondition = _Reader["ViewingCondition"].ToString();
                    _LiquidPenetrantTest.MarkingOfIndication = _Reader["MarkingOfIndication"].ToString();
                    _LiquidPenetrantTest.PreCleaning = _Reader["PreCleaning"].ToString();
                    _LiquidPenetrantTest.DwellTime = _Reader["DwellTime"].ToString();
                    _LiquidPenetrantTest.DryingTime = _Reader["DryingTime"].ToString();
                    _LiquidPenetrantTest.BlackLightDetails = _Reader["BlackLightDetails"].ToString();
                    _LiquidPenetrantTest.FinalClearing = _Reader["FinalClearing"].ToString();

                }
                _LiquidPenetrantTestTemplate.LiquidPenetrantTest = _LiquidPenetrantTest;

                DbLiquidPenetrantTestResults _DbLiquidPenetrantTestResults = new DbLiquidPenetrantTestResults();

                _LiquidPenetrantTestTemplate.LiquidPenetrantTestResults = _DbLiquidPenetrantTestResults.GetLiquidPenetrantTestResultsById(ReportId);

                return _LiquidPenetrantTestTemplate;
            }
            catch 
            {
                throw ;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }
    }
    [Serializable]
    public class LiquidPenetrantTest
    {
        private int _ReportId = 0;
        public int ReportId { get { return _ReportId; } set { _ReportId = value; } }

        private string _FabricatorName = string.Empty;
        public string FabricatorName { get { return _FabricatorName; } set { _FabricatorName = value; } }

        private int _SubTestId = 0;
        public int SubTestId { get { return _SubTestId; } set { _SubTestId = value; } }

        private string _Location = string.Empty;
        public string Location { get { return _Location; } set { _Location = value; } }

        private string _ReportNo = string.Empty;
        public string ReportNo { get { return _ReportNo; } set { _ReportNo = value; } }

        private string _ContractNo = string.Empty;
        public string ContractNo { get { return _ContractNo; } set { _ContractNo = value; } }

        private string _ContactPerson = string.Empty;
        public string ContactPerson { get { return _ContactPerson; } set { _ContactPerson = value; } }

        private DateTime _DateofTesting = DateTime.Now;
        public DateTime DateofTesting { get { return _DateofTesting; } set { _DateofTesting = value; } }

        public string DateofTestingString
        {
            get
            {
                return _DateofTesting.ToString("dd/MM/yyyy");
            }
            set
            {
                string s;
                DateTime t = DateTime.MinValue;
                s = value;

                CultureInfo culture = CultureInfo.CreateSpecificCulture("en-GB");
                DateTimeStyles styles = DateTimeStyles.None;
                if (DateTime.TryParse(s, culture, styles, out t))
                {
                    _DateofTesting = t;
                }
                //= value;
            }
        }

        private string _JobDescription = string.Empty;
        public string JobDescription { get { return _JobDescription; } set { _JobDescription = value; } }

        private string _Material = string.Empty;
        public string Material { get { return _Material; } set { _Material = value; } }

        private string _Dimension = string.Empty;
        public string Dimension { get { return _Dimension; } set { _Dimension = value; } }

        private string _SurfaceCondition = string.Empty;
        public string SurfaceCondition { get { return _SurfaceCondition; } set { _SurfaceCondition = value; } }

        private string _ReferenceStandard = string.Empty;
        public string ReferenceStandard { get { return _ReferenceStandard; } set { _ReferenceStandard = value; } }

        private string _TestSpecification = string.Empty;
        public string TestSpecification { get { return _TestSpecification; } set { _TestSpecification = value; } }
        
        private string _AcceptanceCriteria = string.Empty;
        public string AcceptanceCriteria { get { return _AcceptanceCriteria; } set { _AcceptanceCriteria = value; } }

        private string _TechSheetNo = string.Empty;
        public string TechSheetNo { get { return _TechSheetNo; } set { _TechSheetNo = value; } }

        private string _ExtentofCoverage = string.Empty;
        public string ExtentofCoverage { get { return _ExtentofCoverage; } set { _ExtentofCoverage = value; } }

        private string _SurfaceTemperature = string.Empty;
        public string SurfaceTemperature { get { return _SurfaceTemperature; } set { _SurfaceTemperature = value; } }

        private string _ConsumablesType = string.Empty;
        public string ConsumablesType { get { return _ConsumablesType; } set { _ConsumablesType = value; } }
        private int _ConsumablesTypeId = 0;
        public int ConsumablesTypeId { get { return _ConsumablesTypeId; } set { _ConsumablesTypeId = value; } }

        private int _TechniqueId = 0;
        public int TechniqueId { get { return _TechniqueId; } set { _TechniqueId = value; } }

        private string _Penetrant = string.Empty;
        public string Penetrant { get { return _Penetrant; } set { _Penetrant = value; } }

        private string _PenetrantBatchNo = string.Empty;
        public string PenetrantBatchNo { get { return _PenetrantBatchNo; } set { _PenetrantBatchNo = value; } }

        private string _ApplicationOfPenetrant = string.Empty;
        public string ApplicationOfPenetrant { get { return _ApplicationOfPenetrant; } set { _ApplicationOfPenetrant = value; } }

        private string _PenetrantRemovalMethod = string.Empty;
        public string PenetrantRemovalMethod { get { return _PenetrantRemovalMethod; } set { _PenetrantRemovalMethod = value; } }

        private string _Developer = string.Empty;
        public string Developer { get { return _Developer; } set { _Developer = value; } }

        private string _DeveloperBatchNo = string.Empty;
        public string DeveloperBatchNo { get { return _DeveloperBatchNo; } set { _DeveloperBatchNo = value; } }

        private string _ApplicationOfDeveloper = string.Empty;
        public string ApplicationOfDeveloper { get { return _ApplicationOfDeveloper; } set { _ApplicationOfDeveloper = value; } }

        private string _ViewingCondition = string.Empty;
        public string ViewingCondition { get { return _ViewingCondition; } set { _ViewingCondition = value; } }

        private string _MarkingOfIndication = string.Empty;
        public string MarkingOfIndication { get { return _MarkingOfIndication; } set { _MarkingOfIndication = value; } }

        private string _PreCleaning = string.Empty;
        public string PreCleaning { get { return _PreCleaning; } set { _PreCleaning = value; } }

        private string _DwellTime = string.Empty;
        public string DwellTime { get { return _DwellTime; } set { _DwellTime = value; } }

        private string _DryingTime = string.Empty;
        public string DryingTime { get { return _DryingTime; } set { _DryingTime = value; } }

        private string _BlackLightDetails = string.Empty;
        public string BlackLightDetails { get { return _BlackLightDetails; } set { _BlackLightDetails = value; } }

        private string _FinalClearing = string.Empty;
        public string FinalClearing { get { return _FinalClearing; } set { _FinalClearing = value; } }

        private int _AppId = 0;
        public int AppId { get { return _AppId; } set { _AppId = value; } }

        private int _ClientId = 0;
        public int ClientId { get { return _ClientId; } set { _ClientId = value; } }

        private int _CreatedBy = 0;
        public int CreatedBy { get { return _CreatedBy; } set { _CreatedBy = value; } }

        private DateTime _CreatedDate = DateTime.Now;
        public DateTime CreatedDate { get { return _CreatedDate; } set { _CreatedDate = value; } }

        private int _UpdatedBy = 0;
        public int UpdatedBy { get { return _UpdatedBy; } set { _UpdatedBy = value; } }

        private DateTime _UpdatedDate = DateTime.Now;
        public DateTime UpdatedDate { get { return _UpdatedDate; } set { _UpdatedDate = value; } }

        private int _DeletedStatus = 0;
        public int DeletedStatus { get { return _DeletedStatus; } set { _DeletedStatus = value; } }
    }
}