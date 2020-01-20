using System;
using System.Data;
using System.Data.SqlClient;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class DbUltrasonicTest : DbBase
    {
        private SqlConnection _con = new SqlConnection(Connections.GetConnectionString());

        public string InsertUltrasonicTest(UltrasonicTestTemplate _P)
        {
            try
            {

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_InsertUltrasonicTest";
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.Add(new SqlParameter("@FabricatorName", _P.UltrasonicTest.FabricatorName));
                _cmd.Parameters.Add(new SqlParameter("@SubTestId", _P.UltrasonicTest.SubTestId));
                _cmd.Parameters.Add(new SqlParameter("@Location", _P.UltrasonicTest.Location));
                _cmd.Parameters.Add(new SqlParameter("@ReportNo", _P.UltrasonicTest.ReportNo));
                _cmd.Parameters.Add(new SqlParameter("@ContractNo", _P.UltrasonicTest.ContractNo));
                _cmd.Parameters.Add(new SqlParameter("@ContactPerson", _P.UltrasonicTest.ContactPerson));
                _cmd.Parameters.Add(new SqlParameter("@DateofTesting", _P.UltrasonicTest.DateofTestingString ?? string.Empty));
                _cmd.Parameters.Add(new SqlParameter("@Equipment", _P.UltrasonicTest.Equipment));
                _cmd.Parameters.Add(new SqlParameter("@CalibrationStatus", _P.UltrasonicTest.CalibrationStatus));
                _cmd.Parameters.Add(new SqlParameter("@CouplingMedia", _P.UltrasonicTest.CouplingMedia));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceCondition", _P.UltrasonicTest.SurfaceCondition));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceStandard", _P.UltrasonicTest.ReferenceStandard));
                _cmd.Parameters.Add(new SqlParameter("@TestSpecification", _P.UltrasonicTest.TestSpecification));
                _cmd.Parameters.Add(new SqlParameter("@AcceptanceCriteria", _P.UltrasonicTest.AcceptanceCriteria));
                _cmd.Parameters.Add(new SqlParameter("@TechSheetNo", _P.UltrasonicTest.TechSheetNo));
                _cmd.Parameters.Add(new SqlParameter("@ExtentofCoverage", _P.UltrasonicTest.ExtentofCoverage));
                _cmd.Parameters.Add(new SqlParameter("@ConsumablesType", _P.UltrasonicTest.ConsumablesTypeId));
                _cmd.Parameters.Add(new SqlParameter("@CalibrationBlock", _P.UltrasonicTest.CalibrationBlock));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceBlock", _P.UltrasonicTest.ReferenceBlock));
                _cmd.Parameters.Add(new SqlParameter("@SearchUnit", _P.UltrasonicTest.SearchUnit));
                _cmd.Parameters.Add(new SqlParameter("@Frequency", _P.UltrasonicTest.Frequency));
                _cmd.Parameters.Add(new SqlParameter("@BeamAngle", _P.UltrasonicTest.BeamAngle));
                _cmd.Parameters.Add(new SqlParameter("@BeamIndex", _P.UltrasonicTest.BeamIndex));
                _cmd.Parameters.Add(new SqlParameter("@MaxBeamPath", _P.UltrasonicTest.MaxBeamPath));
                _cmd.Parameters.Add(new SqlParameter("@TimeBaseRange", _P.UltrasonicTest.TimeBaseRange));
                _cmd.Parameters.Add(new SqlParameter("@Reflector", _P.UltrasonicTest.Reflector));
                _cmd.Parameters.Add(new SqlParameter("@Gain", _P.UltrasonicTest.Gain));
                _cmd.Parameters.Add(new SqlParameter("@Correction", _P.UltrasonicTest.Correction));
                _cmd.Parameters.Add(new SqlParameter("@Scan", _P.UltrasonicTest.Scan));
                _cmd.Parameters.Add(new SqlParameter("@RejectionLevel", _P.UltrasonicTest.RejectionLevel));
                _cmd.Parameters.Add(new SqlParameter("@RecordingLevel", _P.UltrasonicTest.RecordingLevel));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.UltrasonicTest.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.UltrasonicTest.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.UltrasonicTest.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.UltrasonicTest.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.UltrasonicTest.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.UltrasonicTest.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.UltrasonicTest.DeletedStatus));

                int reportId = Convert.ToInt32(_cmd.ExecuteScalar());

                if (reportId > 0)
                {
                    DbUltrasonicTestResults listRadiographicTests = new DbUltrasonicTestResults();
                    foreach (UltrasonicTestResults item in _P.UltrasonicTestResults)
                    {
                        item.ReportId = reportId;
                        if (listRadiographicTests.InsertUltrasonicTestResults(item) <= 0)
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

        public string UpdateUltrasonicTest(UltrasonicTestTemplate _P)
        {
            try
            {

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_UpdateUltrasonicTest";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _P.UltrasonicTest.ReportId));
                _cmd.Parameters.Add(new SqlParameter("@FabricatorName", _P.UltrasonicTest.FabricatorName));
                _cmd.Parameters.Add(new SqlParameter("@SubTestId", _P.UltrasonicTest.SubTestId));
                _cmd.Parameters.Add(new SqlParameter("@Location", _P.UltrasonicTest.Location));
                _cmd.Parameters.Add(new SqlParameter("@ReportNo", _P.UltrasonicTest.ReportNo));
                _cmd.Parameters.Add(new SqlParameter("@ContractNo", _P.UltrasonicTest.ContractNo));
                _cmd.Parameters.Add(new SqlParameter("@ContactPerson", _P.UltrasonicTest.ContactPerson));
                _cmd.Parameters.Add(new SqlParameter("@DateofTesting", _P.UltrasonicTest.DateofTestingString ?? string.Empty));
                _cmd.Parameters.Add(new SqlParameter("@Equipment", _P.UltrasonicTest.Equipment));
                _cmd.Parameters.Add(new SqlParameter("@CalibrationStatus", _P.UltrasonicTest.CalibrationStatus));
                _cmd.Parameters.Add(new SqlParameter("@CouplingMedia", _P.UltrasonicTest.CouplingMedia));
                _cmd.Parameters.Add(new SqlParameter("@SurfaceCondition", _P.UltrasonicTest.SurfaceCondition));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceStandard", _P.UltrasonicTest.ReferenceStandard));
                _cmd.Parameters.Add(new SqlParameter("@TestSpecification", _P.UltrasonicTest.TestSpecification));
                _cmd.Parameters.Add(new SqlParameter("@AcceptanceCriteria", _P.UltrasonicTest.AcceptanceCriteria));
                _cmd.Parameters.Add(new SqlParameter("@TechSheetNo", _P.UltrasonicTest.TechSheetNo));
                _cmd.Parameters.Add(new SqlParameter("@ExtentofCoverage", _P.UltrasonicTest.ExtentofCoverage));
                _cmd.Parameters.Add(new SqlParameter("@ConsumablesType", _P.UltrasonicTest.ConsumablesTypeId));
                _cmd.Parameters.Add(new SqlParameter("@CalibrationBlock", _P.UltrasonicTest.CalibrationBlock));
                _cmd.Parameters.Add(new SqlParameter("@ReferenceBlock", _P.UltrasonicTest.ReferenceBlock));
                _cmd.Parameters.Add(new SqlParameter("@SearchUnit", _P.UltrasonicTest.SearchUnit));
                _cmd.Parameters.Add(new SqlParameter("@Frequency", _P.UltrasonicTest.Frequency));
                _cmd.Parameters.Add(new SqlParameter("@BeamAngle", _P.UltrasonicTest.BeamAngle));
                _cmd.Parameters.Add(new SqlParameter("@BeamIndex", _P.UltrasonicTest.BeamIndex));
                _cmd.Parameters.Add(new SqlParameter("@MaxBeamPath", _P.UltrasonicTest.MaxBeamPath));
                _cmd.Parameters.Add(new SqlParameter("@TimeBaseRange", _P.UltrasonicTest.TimeBaseRange));
                _cmd.Parameters.Add(new SqlParameter("@Reflector", _P.UltrasonicTest.Reflector));
                _cmd.Parameters.Add(new SqlParameter("@Gain", _P.UltrasonicTest.Gain));
                _cmd.Parameters.Add(new SqlParameter("@Correction", _P.UltrasonicTest.Correction));
                _cmd.Parameters.Add(new SqlParameter("@Scan", _P.UltrasonicTest.Scan));
                _cmd.Parameters.Add(new SqlParameter("@RejectionLevel", _P.UltrasonicTest.RejectionLevel));
                _cmd.Parameters.Add(new SqlParameter("@RecordingLevel", _P.UltrasonicTest.RecordingLevel));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.UltrasonicTest.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.UltrasonicTest.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.UltrasonicTest.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.UltrasonicTest.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.UltrasonicTest.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.UltrasonicTest.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.UltrasonicTest.DeletedStatus));

                _cmd.ExecuteNonQuery();

                int reportId = _P.UltrasonicTest.ReportId;
                string testId = "";
                if (reportId > 0)
                {
                    DbUltrasonicTestResults listMagneticTestResults = new DbUltrasonicTestResults();
                    foreach (UltrasonicTestResults item in _P.UltrasonicTestResults)
                    {
                        if (item.TestId != 0)
                            testId = testId + item.TestId.ToString() + ",";
                    }
                    listMagneticTestResults.DeleteUltrasonicTestResultsByTestId(testId.Substring(0, testId.Length - 1), reportId);

                    foreach (UltrasonicTestResults item in _P.UltrasonicTestResults)
                    {
                        item.ReportId = reportId;
                        if (item.TestId == 0)
                        {
                            if (listMagneticTestResults.InsertUltrasonicTestResults(item) <= 0)
                            {
                                return "Record not Afftected to DataBase";
                            }
                        }
                        else
                        {
                            if (listMagneticTestResults.UpdateUltrasonicTestResults(item) <= 0)
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

        public string DeleteUltrasonicTestReport(int ReportId)
        {
            try
            {

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandType = CommandType.StoredProcedure;
                DbUltrasonicTestResults listUltrasonicTests = new DbUltrasonicTestResults();

                if (listUltrasonicTests.DeleteUltrasonicTestResultsByReportId(ReportId) > 0)
                {

                }

                _cmd.CommandText = "NDTUAT.prc_DeleteUltrasonicTest";
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

        public SearchTestRecordResp GetAllUltrasonicTestReports(SearchTestRecordReq recordReq)
        {
            try
            {
                SearchTestRecordResp recordResp = new SearchTestRecordResp();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "[NDTUAT].[prc_GetAllUltrasonicTestReport_KTR]";
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

        public UltrasonicTestTemplate GetUltrasonicTestReportById(int ReportId)
        {
            UltrasonicTestTemplate _UltrasonicTestTemplate = new UltrasonicTestTemplate();
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_GetUltrasonicTestReportById";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));
                SqlDataReader _Reader = _cmd.ExecuteReader();
                UltrasonicTest _UltrasonicTest = null;
                while (_Reader.Read())
                {
                    _UltrasonicTest = new UltrasonicTest();
                    _UltrasonicTest.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _UltrasonicTest.FabricatorName = _Reader["FabricatorName"].ToString();
                    _UltrasonicTest.Location = _Reader["Location"].ToString();
                    _UltrasonicTest.ReportNo = _Reader["ReportNo"].ToString();
                    _UltrasonicTest.ContractNo = _Reader["ContractNo"].ToString();
                    _UltrasonicTest.ContactPerson = _Reader["ContactPerson"].ToString();
                    _UltrasonicTest.DateofTesting = Convert.ToDateTime(_Reader["DateofTesting"].ToString());
                    _UltrasonicTest.Equipment = _Reader["Equipment"].ToString();
                    _UltrasonicTest.CalibrationStatus = _Reader["CalibrationStatus"].ToString();
                    _UltrasonicTest.CouplingMedia = _Reader["CouplingMedia"].ToString();
                    _UltrasonicTest.SurfaceCondition = _Reader["SurfaceCondition"].ToString();
                    _UltrasonicTest.ReferenceStandard = _Reader["ReferenceStandard"].ToString();
                    _UltrasonicTest.TestSpecification = _Reader["TestSpecification"].ToString();
                    _UltrasonicTest.AcceptanceCriteria = _Reader["AcceptanceCriteria"].ToString();
                    _UltrasonicTest.TechSheetNo = _Reader["TechSheetNo"].ToString();
                    _UltrasonicTest.ExtentofCoverage = _Reader["ExtentofCoverage"].ToString();
                    _UltrasonicTest.ConsumablesTypeId = Convert.ToInt32(_Reader["ConsumablesType"].ToString());
                    _UltrasonicTest.CalibrationBlock = _Reader["CalibrationBlock"].ToString();
                    _UltrasonicTest.ReferenceBlock = _Reader["ReferenceBlock"].ToString();
                    _UltrasonicTest.SearchUnit = _Reader["SearchUnit"].ToString();
                    _UltrasonicTest.Frequency = _Reader["Frequency"].ToString();
                    _UltrasonicTest.BeamAngle = _Reader["BeamAngle"].ToString();
                    _UltrasonicTest.BeamIndex = _Reader["BeamIndex"].ToString();
                    _UltrasonicTest.MaxBeamPath = _Reader["MaxBeamPath"].ToString();
                    _UltrasonicTest.TimeBaseRange = _Reader["TimeBaseRange"].ToString();
                    _UltrasonicTest.Reflector = _Reader["Reflector"].ToString();
                    _UltrasonicTest.Gain = _Reader["Gain"].ToString();
                    _UltrasonicTest.Correction = _Reader["Correction"].ToString();
                    _UltrasonicTest.Scan = _Reader["Scan"].ToString();
                    _UltrasonicTest.RejectionLevel = _Reader["RejectionLevel"].ToString();
                    _UltrasonicTest.RecordingLevel = _Reader["RecordingLevel"].ToString();
                }
                _UltrasonicTestTemplate.UltrasonicTest = _UltrasonicTest;
                DbUltrasonicTestResults _DbUltrasonicTestResults = new DbUltrasonicTestResults();
                _UltrasonicTestTemplate.UltrasonicTestResults = _DbUltrasonicTestResults.GetUltrasonicTestResultsById(ReportId);

                return _UltrasonicTestTemplate;
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

}