using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using NDTReporting.Common;


namespace NDTReporting.Domain
{
    public class DbUltrasonicTestResults : DbBase
    {
        private SqlConnection _con = new SqlConnection(Connections.GetConnectionString());

        public int InsertUltrasonicTestResults(UltrasonicTestResults _P)
        {
            int ret = 0;
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();

                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_InsertUltrasonicTestResults";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _P.ReportId));
                _cmd.Parameters.Add(new SqlParameter("@Serial", _P.Serial));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@Material", _P.Material));
                _cmd.Parameters.Add(new SqlParameter("@UltrasonicQuantityX", _P.UltrasonicQuantityX));
                _cmd.Parameters.Add(new SqlParameter("@UltrasonicQuantityY", _P.UltrasonicQuantityY));
                _cmd.Parameters.Add(new SqlParameter("@Dimension", _P.Dimension));
                _cmd.Parameters.Add(new SqlParameter("@ObservationsId", _P.ObservationsId));
                _cmd.Parameters.Add(new SqlParameter("@Length", _P.Length));
                _cmd.Parameters.Add(new SqlParameter("@Depth", _P.Depth));
                _cmd.Parameters.Add(new SqlParameter("@Result", _P.Result));
                _cmd.Parameters.Add(new SqlParameter("@SketchReference", _P.SketchReference));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.DeletedStatus));
                ret = _cmd.ExecuteNonQuery();
                return ret;
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

        public int UpdateUltrasonicTestResults(UltrasonicTestResults _P)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_UpdateUltrasonicTestResults";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@TestId", _P.TestId));
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _P.ReportId));
                _cmd.Parameters.Add(new SqlParameter("@Serial", _P.Serial));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@Material", _P.Material));
                _cmd.Parameters.Add(new SqlParameter("@UltrasonicQuantityX", _P.UltrasonicQuantityX));
                _cmd.Parameters.Add(new SqlParameter("@UltrasonicQuantityY", _P.UltrasonicQuantityY));
                _cmd.Parameters.Add(new SqlParameter("@Dimension", _P.Dimension));
                _cmd.Parameters.Add(new SqlParameter("@Length", _P.Length));
                _cmd.Parameters.Add(new SqlParameter("@Depth", _P.Depth));
                _cmd.Parameters.Add(new SqlParameter("@ObservationsId", _P.ObservationsId));
                _cmd.Parameters.Add(new SqlParameter("@Result", _P.Result));
                _cmd.Parameters.Add(new SqlParameter("@SketchReference", _P.SketchReference));
                _cmd.Parameters.Add(new SqlParameter("@AppId", _P.AppId));
                _cmd.Parameters.Add(new SqlParameter("@ClientId", _P.ClientId));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", _P.CreatedBy));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", _P.CreatedDate));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedBy", _P.UpdatedBy));
                _cmd.Parameters.Add(new SqlParameter("@UpdatedDate", _P.UpdatedDate));
                _cmd.Parameters.Add(new SqlParameter("@DeletedStatus", _P.DeletedStatus));

                return _cmd.ExecuteNonQuery();
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

        public List<UltrasonicTestResults> GetUltrasonicTestResultsById(int ReportId)
        {

            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_GetUltrasonicTestResultsReportById";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));

                SqlDataReader _Reader = _cmd.ExecuteReader();
                List<UltrasonicTestResults> _UltrasonicTestResults = new List<UltrasonicTestResults>();
                UltrasonicTestResults _UltrasonicTestResult = null;
                while (_Reader.Read())
                {
                    _UltrasonicTestResult = new UltrasonicTestResults();
                    _UltrasonicTestResult.TestId = Convert.ToInt32(_Reader["TestId"].ToString());
                    _UltrasonicTestResult.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _UltrasonicTestResult.Serial = Convert.ToInt32(_Reader["Serial"].ToString());
                    _UltrasonicTestResult.JobDescription = _Reader["JobDescription"].ToString();
                    _UltrasonicTestResult.Material = _Reader["Material"].ToString();
                    _UltrasonicTestResult.UltrasonicQuantityX = _Reader["UltrasonicQuantityX"].ToString();
                    _UltrasonicTestResult.UltrasonicQuantityY = _Reader["UltrasonicQuantityY"].ToString();
                    _UltrasonicTestResult.Dimension = _Reader["Dimension"].ToString();
                    _UltrasonicTestResult.Length = Convert.ToInt32(_Reader["Length"].ToString());
                    _UltrasonicTestResult.Depth = Convert.ToInt32(_Reader["Depth"].ToString());
                    _UltrasonicTestResult.ObservationsId = Convert.ToInt32(_Reader["ObservationsId"].ToString());
                    _UltrasonicTestResult.Result = Convert.ToInt32(_Reader["Result"].ToString());
                    _UltrasonicTestResult.SketchReference = _Reader["SketchReference"].ToString();
                    _UltrasonicTestResults.Add(_UltrasonicTestResult);
                }
                return _UltrasonicTestResults;
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

        public int DeleteUltrasonicTestResultsByReportId(int ReportId)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "NDTUAT.prc_DeleteUltrasonicTestResultsByReportId";
                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));
                return _cmd.ExecuteNonQuery();
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

        public int DeleteUltrasonicTestResultsByTestId(string TestId, int ReportId)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "NDTUAT.prc_DeleteUltrasonicTestResultsByTestId";

                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));
                _cmd.Parameters.Add(new SqlParameter("@TestId", TestId));
                return _cmd.ExecuteNonQuery();
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