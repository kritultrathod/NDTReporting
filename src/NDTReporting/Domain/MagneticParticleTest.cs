using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class DbMagneticParticleTest : DbBase
    {
        private SqlConnection _con = new SqlConnection(Connections.GetConnectionString());

        public string InsertMagneticParticleTest(MagneticParticleTestTemplate _P)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_InsertMagneticParticleTest";
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.Add(new SqlParameter("@FabricatorName", _P.MagneticParticleTest.FabricatorName));
                _cmd.Parameters.Add(new SqlParameter("@SubTestId", _P.MagneticParticleTest.SubTestId));
                _cmd.Parameters.Add(new SqlParameter("@Location", _P.MagneticParticleTest.Location));
                _cmd.Parameters.Add(new SqlParameter("@ReportNo", _P.MagneticParticleTest.ReportNo));
                _cmd.Parameters.Add(new SqlParameter("@ContractNo", _P.MagneticParticleTest.ContractNo));
                _cmd.Parameters.Add(new SqlParameter("@ContactPerson", _P.MagneticParticleTest.ContactPerson));
                _cmd.Parameters.Add(new SqlParameter("@DateofTesting", _P.MagneticParticleTest.DateofTestingString ?? string.Empty));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.MagneticParticleTest.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@Material", _P.MagneticParticleTest.Material));
                _cmd.Parameters.Add(new SqlParameter("@Dimension", _P.MagneticParticleTest.Dimension));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceCondition", _P.MagneticParticleTest.SurfaceCondition));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceStandard", _P.MagneticParticleTest.ReferenceStandard));
                _cmd.Parameters.Add(new SqlParameter("@TestSpecification", _P.MagneticParticleTest.TestSpecification));
                _cmd.Parameters.Add(new SqlParameter("@AcceptanceCriteria", _P.MagneticParticleTest.AcceptanceCriteria));
                _cmd.Parameters.Add(new SqlParameter("@TechSheetNo", _P.MagneticParticleTest.TechSheetNo));
                _cmd.Parameters.Add(new SqlParameter("@ExtentofCoverage", _P.MagneticParticleTest.ExtentofCoverage));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceTemperature", _P.MagneticParticleTest.SurfaceTemperature));
                _cmd.Parameters.Add(new SqlParameter("@ConsumablesType", _P.MagneticParticleTest.ConsumablesTypeId));
                _cmd.Parameters.Add(new SqlParameter("@TechniqueId", _P.MagneticParticleTest.TechniqueId));
                _cmd.Parameters.Add(new SqlParameter("@Direction", _P.MagneticParticleTest.Direction));
                _cmd.Parameters.Add(new SqlParameter("@DirectionMagnetization", _P.MagneticParticleTest.DirectionMagnetization));
                _cmd.Parameters.Add(new SqlParameter("@MagnetizationCurrent", _P.MagneticParticleTest.MagnetizationCurrent));
                _cmd.Parameters.Add(new SqlParameter("@DetectionMedia", _P.MagneticParticleTest.DetectionMedia));
                _cmd.Parameters.Add(new SqlParameter("@Concentration", _P.MagneticParticleTest.Concentration));
                _cmd.Parameters.Add(new SqlParameter("@Illuminance", _P.MagneticParticleTest.Illuminance));
                _cmd.Parameters.Add(new SqlParameter("@ContrastPaint", _P.MagneticParticleTest.ContrastPaint));
                _cmd.Parameters.Add(new SqlParameter("@Demagnetizing", _P.MagneticParticleTest.Demagnetizing));
                _cmd.Parameters.Add(new SqlParameter("@Equipment", _P.MagneticParticleTest.Equipment));
                _cmd.Parameters.Add(new SqlParameter("@CalibrationStatus", _P.MagneticParticleTest.CalibrationStatus));
                _cmd.Parameters.Add(new SqlParameter("@Amperage", _P.MagneticParticleTest.Amperage));
                _cmd.Parameters.Add(new SqlParameter("@Windings", _P.MagneticParticleTest.Windings));
                _cmd.Parameters.Add(new SqlParameter("@Spacing", _P.MagneticParticleTest.Spacing));
                _cmd.Parameters.Add(new SqlParameter("@BlackLightIntensity", _P.MagneticParticleTest.BlackLightIntensity));
                _cmd.Parameters.Add(new SqlParameter("@FieldIndicator", _P.MagneticParticleTest.FieldIndicator));
                _cmd.Parameters.Add(new SqlParameter("@FinalCleaning", _P.MagneticParticleTest.FinalCleaning));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.MagneticParticleTest.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.MagneticParticleTest.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.MagneticParticleTest.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.MagneticParticleTest.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.MagneticParticleTest.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.MagneticParticleTest.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.MagneticParticleTest.DeletedStatus));

                int reportId = Convert.ToInt32(_cmd.ExecuteScalar());

                if (reportId > 0)
                {
                    DbMagneticParticleTestResults listRadiographicTests = new DbMagneticParticleTestResults();
                    foreach (MagneticParticleTestResults item in _P.MagneticParticleTestResults)
                    {

                        item.ReportId = reportId;
                        if (listRadiographicTests.InsertMagneticParticleTestResults(item) <= 0)
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
                throw ;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }

        public string UpdateMagneticParticleTest(MagneticParticleTestTemplate _P)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_UpdateMagneticParticleTest";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _P.MagneticParticleTest.ReportId));
                _cmd.Parameters.Add(new SqlParameter("@FabricatorName", _P.MagneticParticleTest.FabricatorName));
                _cmd.Parameters.Add(new SqlParameter("@SubTestId", _P.MagneticParticleTest.SubTestId));
                _cmd.Parameters.Add(new SqlParameter("@Location", _P.MagneticParticleTest.Location));
                _cmd.Parameters.Add(new SqlParameter("@ReportNo", _P.MagneticParticleTest.ReportNo));
                _cmd.Parameters.Add(new SqlParameter("@ContractNo", _P.MagneticParticleTest.ContractNo));
                _cmd.Parameters.Add(new SqlParameter("@ContactPerson", _P.MagneticParticleTest.ContactPerson));
                _cmd.Parameters.Add(new SqlParameter("@DateofTesting", _P.MagneticParticleTest.DateofTestingString ?? string.Empty));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.MagneticParticleTest.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@Material", _P.MagneticParticleTest.Material));
                _cmd.Parameters.Add(new SqlParameter("@Dimension", _P.MagneticParticleTest.Dimension));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceCondition", _P.MagneticParticleTest.SurfaceCondition));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceStandard", _P.MagneticParticleTest.ReferenceStandard));
                _cmd.Parameters.Add(new SqlParameter("@TestSpecification", _P.MagneticParticleTest.TestSpecification));
                _cmd.Parameters.Add(new SqlParameter("@AcceptanceCriteria", _P.MagneticParticleTest.AcceptanceCriteria));
                _cmd.Parameters.Add(new SqlParameter("@TechSheetNo", _P.MagneticParticleTest.TechSheetNo));
                _cmd.Parameters.Add(new SqlParameter("@ExtentofCoverage", _P.MagneticParticleTest.ExtentofCoverage));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceTemperature", _P.MagneticParticleTest.SurfaceTemperature));
                _cmd.Parameters.Add(new SqlParameter("@ConsumablesType", _P.MagneticParticleTest.ConsumablesTypeId));
                _cmd.Parameters.Add(new SqlParameter("@TechniqueId", _P.MagneticParticleTest.TechniqueId));
                _cmd.Parameters.Add(new SqlParameter("@Direction", _P.MagneticParticleTest.Direction));
                _cmd.Parameters.Add(new SqlParameter("@DirectionMagnetization", _P.MagneticParticleTest.DirectionMagnetization));
                _cmd.Parameters.Add(new SqlParameter("@MagnetizationCurrent", _P.MagneticParticleTest.MagnetizationCurrent));
                _cmd.Parameters.Add(new SqlParameter("@DetectionMedia", _P.MagneticParticleTest.DetectionMedia));
                _cmd.Parameters.Add(new SqlParameter("@Concentration", _P.MagneticParticleTest.Concentration));
                _cmd.Parameters.Add(new SqlParameter("@Illuminance", _P.MagneticParticleTest.Illuminance));
                _cmd.Parameters.Add(new SqlParameter("@ContrastPaint", _P.MagneticParticleTest.ContrastPaint));
                _cmd.Parameters.Add(new SqlParameter("@Demagnetizing", _P.MagneticParticleTest.Demagnetizing));
                _cmd.Parameters.Add(new SqlParameter("@Equipment", _P.MagneticParticleTest.Equipment));
                _cmd.Parameters.Add(new SqlParameter("@CalibrationStatus", _P.MagneticParticleTest.CalibrationStatus));
                _cmd.Parameters.Add(new SqlParameter("@Amperage", _P.MagneticParticleTest.Amperage));
                _cmd.Parameters.Add(new SqlParameter("@Windings", _P.MagneticParticleTest.Windings));
                _cmd.Parameters.Add(new SqlParameter("@Spacing", _P.MagneticParticleTest.Spacing));
                _cmd.Parameters.Add(new SqlParameter("@BlackLightIntensity", _P.MagneticParticleTest.BlackLightIntensity));
                _cmd.Parameters.Add(new SqlParameter("@FieldIndicator", _P.MagneticParticleTest.FieldIndicator));
                _cmd.Parameters.Add(new SqlParameter("@FinalCleaning", _P.MagneticParticleTest.FinalCleaning));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.MagneticParticleTest.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.MagneticParticleTest.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.MagneticParticleTest.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.MagneticParticleTest.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.MagneticParticleTest.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.MagneticParticleTest.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.MagneticParticleTest.DeletedStatus));

                _cmd.ExecuteNonQuery();

                int reportId = _P.MagneticParticleTest.ReportId;
                string testId = "";
                if (reportId > 0)
                {
                    DbMagneticParticleTestResults listMagneticTestResults = new DbMagneticParticleTestResults();
                    foreach (MagneticParticleTestResults item in _P.MagneticParticleTestResults)
                    {
                        if (item.TestId != 0)
                            testId = testId + item.TestId.ToString() + ",";
                    }
                    listMagneticTestResults.DeleteMagneticParticleTestResultsByTestId(testId.Substring(0, testId.Length - 1), reportId);

                    foreach (MagneticParticleTestResults item in _P.MagneticParticleTestResults)
                    {
                        item.ReportId = reportId;
                        if (item.TestId == 0)
                        {
                            if (listMagneticTestResults.InsertMagneticParticleTestResults(item) <= 0)
                            {
                                return "Record not Afftected to DataBase";
                            }
                        }
                        else
                        {
                            if (listMagneticTestResults.UpdateMagneticParticleTestResults(item) <= 0)
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
                throw ;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }

        public string DeleteMagneticParticleTestReport(int ReportId)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandType = CommandType.StoredProcedure;
                DbMagneticParticleTestResults listMagneticParticleTests = new DbMagneticParticleTestResults();

                if (listMagneticParticleTests.DeleteMagneticParticleTestResultsByReportId(ReportId) > 0)
                {

                }

                _cmd.CommandText = "NDTUAT.prc_DeleteMagneticParticleTest";
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

        public SearchTestRecordResp GetAllMagneticParticleTestReports(SearchTestRecordReq recordReq)
        {
            try
            {
                SearchTestRecordResp recordResp = new SearchTestRecordResp();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_GetAllMagneticParticleTestReport_KTR";
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
                    TestRecordLight _MagneticParticleTest = new TestRecordLight();

                    _MagneticParticleTest.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _MagneticParticleTest.ReportNo = _Reader["ReportNo"].ToString();
                    _MagneticParticleTest.FabricatorName = _Reader["FabricatorName"].ToString();
                    _MagneticParticleTest.ContactPerson = _Reader["ContactPerson"].ToString();
                    _MagneticParticleTest.ContractNo = _Reader["ContractNo"].ToString();
                    _MagneticParticleTest.Location = _Reader["Location"].ToString();
                    _MagneticParticleTest.IsAuthorized = Convert.ToBoolean(_Reader["IsAuthorized"]);
                    _MagneticParticleTest.DateofTestingString = _Reader["DateofTesting"].ToString();// Convert.ToDateTime(_Reader["DateofTesting"].ToString());
                    recordResp.TestRecordLightList.Add(_MagneticParticleTest);
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
                throw ;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }

        public MagneticParticleTestTemplate GetMagneticParticleTestReportById(int ReportId)
        {
            MagneticParticleTestTemplate _MagneticParticleTestTemplate = new MagneticParticleTestTemplate();
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_GetMagneticParticleTestReportById";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));
                SqlDataReader _Reader = _cmd.ExecuteReader();
                MagneticParticleTest _MagneticParticleTest = null;
                while (_Reader.Read())
                {
                    _MagneticParticleTest = new MagneticParticleTest();
                    _MagneticParticleTest.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _MagneticParticleTest.FabricatorName = _Reader["FabricatorName"].ToString();
                    _MagneticParticleTest.Location = _Reader["Location"].ToString();
                    _MagneticParticleTest.ReportNo = _Reader["ReportNo"].ToString();
                    _MagneticParticleTest.ContractNo = _Reader["ContractNo"].ToString();
                    _MagneticParticleTest.ContactPerson = _Reader["ContactPerson"].ToString();
                    _MagneticParticleTest.DateofTestingString = _Reader["DateofTesting"].ToString();// Convert.ToDateTime(_Reader["DateofTesting"].ToString());
                    _MagneticParticleTest.JobDescription = _Reader["JobDescription"].ToString();
                    _MagneticParticleTest.Material = _Reader["Material"].ToString();
                    _MagneticParticleTest.Dimension = _Reader["Dimension"].ToString();
                    _MagneticParticleTest.SurfaceCondition = _Reader["SurfaceCondition"].ToString();
                    _MagneticParticleTest.ReferenceStandard = _Reader["ReferenceStandard"].ToString();
                    _MagneticParticleTest.TestSpecification = _Reader["TestSpecification"].ToString();
                    _MagneticParticleTest.AcceptanceCriteria = _Reader["AcceptanceCriteria"].ToString();
                    _MagneticParticleTest.TechSheetNo = _Reader["TechSheetNo"].ToString();
                    _MagneticParticleTest.ExtentofCoverage = _Reader["ExtentofCoverage"].ToString();
                    _MagneticParticleTest.SurfaceTemperature = _Reader["SurfaceTemperature"].ToString();
                    _MagneticParticleTest.ConsumablesTypeId = Convert.ToInt32(_Reader["ConsumablesType"].ToString());
                    _MagneticParticleTest.TechniqueId = Convert.ToInt32(_Reader["TechniqueId"].ToString());
                    _MagneticParticleTest.Direction = _Reader["Direction"].ToString();
                    _MagneticParticleTest.DirectionMagnetization = _Reader["DirectionMagnetization"].ToString();
                    _MagneticParticleTest.MagnetizationCurrent = _Reader["MagnetizationCurrent"].ToString();
                    _MagneticParticleTest.DetectionMedia = _Reader["DetectionMedia"].ToString();
                    _MagneticParticleTest.Concentration = _Reader["Concentration"].ToString();
                    _MagneticParticleTest.Illuminance = _Reader["Illuminance"].ToString();
                    _MagneticParticleTest.ContrastPaint = _Reader["ContrastPaint"].ToString();
                    _MagneticParticleTest.Demagnetizing = _Reader["Demagnetizing"].ToString();
                    _MagneticParticleTest.Equipment = _Reader["Equipment"].ToString();
                    _MagneticParticleTest.CalibrationStatus = _Reader["CalibrationStatus"].ToString();
                    _MagneticParticleTest.Amperage = _Reader["Amperage"].ToString();
                    _MagneticParticleTest.Windings = _Reader["Windings"].ToString();
                    _MagneticParticleTest.Spacing = _Reader["Spacing"].ToString();
                    _MagneticParticleTest.BlackLightIntensity = _Reader["BlackLightIntensity"].ToString();
                    _MagneticParticleTest.FieldIndicator = _Reader["FieldIndicator"].ToString();
                    _MagneticParticleTest.FinalCleaning = _Reader["FinalCleaning"].ToString();

                }
                _MagneticParticleTestTemplate.MagneticParticleTest = _MagneticParticleTest;

                DbMagneticParticleTestResults _DbMagneticParticleTestResults = new DbMagneticParticleTestResults();

                _MagneticParticleTestTemplate.MagneticParticleTestResults = _DbMagneticParticleTestResults.GetMagneticParticleTestResultsById(ReportId);

                return _MagneticParticleTestTemplate;
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
    }

    [Serializable]
    public class MagneticParticleTest
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

        private string _Direction = string.Empty;
        public string Direction { get { return _Direction; } set { _Direction = value; } }

        private string _DirectionMagnetization = string.Empty;
        public string DirectionMagnetization { get { return _DirectionMagnetization; } set { _DirectionMagnetization = value; } }

        private string _MagnetizationCurrent = string.Empty;
        public string MagnetizationCurrent { get { return _MagnetizationCurrent; } set { _MagnetizationCurrent = value; } }

        private string _DetectionMedia = string.Empty;
        public string DetectionMedia { get { return _DetectionMedia; } set { _DetectionMedia = value; } }

        private string _Concentration = string.Empty;
        public string Concentration { get { return _Concentration; } set { _Concentration = value; } }

        private string _Illuminance = string.Empty;
        public string Illuminance { get { return _Illuminance; } set { _Illuminance = value; } }

        private string _ContrastPaint = string.Empty;
        public string ContrastPaint { get { return _ContrastPaint; } set { _ContrastPaint = value; } }

        private string _Demagnetizing = string.Empty;
        public string Demagnetizing { get { return _Demagnetizing; } set { _Demagnetizing = value; } }

        private string _Equipment = string.Empty;
        public string Equipment { get { return _Equipment; } set { _Equipment = value; } }

        private string _CalibrationStatus = string.Empty;
        public string CalibrationStatus { get { return _CalibrationStatus; } set { _CalibrationStatus = value; } }

        private string _Amperage = string.Empty;
        public string Amperage { get { return _Amperage; } set { _Amperage = value; } }

        private string _Windings = string.Empty;
        public string Windings { get { return _Windings; } set { _Windings = value; } }

        private string _Spacing = string.Empty;
        public string Spacing { get { return _Spacing; } set { _Spacing = value; } }

        private string _BlackLightIntensity = string.Empty;
        public string BlackLightIntensity { get { return _BlackLightIntensity; } set { _BlackLightIntensity = value; } }

        private string _FieldIndicator = string.Empty;
        public string FieldIndicator { get { return _FieldIndicator; } set { _FieldIndicator = value; } }

        private string _FinalCleaning = string.Empty;
        public string FinalCleaning { get { return _FinalCleaning; } set { _FinalCleaning = value; } }

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