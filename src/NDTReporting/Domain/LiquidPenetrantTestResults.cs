using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class DbLiquidPenetrantTestResults : DbBase
    {
        private SqlConnection _con = new SqlConnection(Connections.GetConnectionString());

        public int InsertLiquidPenetrantTestResults(LiquidPenetrantTestResults _P)
        {
            int ret = 0;
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();

                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_InsertLiquidPenetrantTestResults";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _P.ReportId));
                _cmd.Parameters.Add(new SqlParameter("@Serial", _P.Serial));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@LiquidQuantityX", _P.LiquidQuantityX));
                _cmd.Parameters.Add(new SqlParameter("@LiquidQuantityY", _P.LiquidQuantityY));
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

        public int UpdateLiquidPenetrantTestResults(LiquidPenetrantTestResults _P)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_UpdateLiquidPenetrantTestResults";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@TestId", _P.TestId));
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _P.ReportId));
                _cmd.Parameters.Add(new SqlParameter("@Serial", _P.Serial));
                _cmd.Parameters.Add(new SqlParameter("@JobDescription", _P.JobDescription));
                _cmd.Parameters.Add(new SqlParameter("@LiquidQuantityX", _P.LiquidQuantityX));
                _cmd.Parameters.Add(new SqlParameter("@LiquidQuantityY", _P.LiquidQuantityY));
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

        public List<LiquidPenetrantTestResults> GetLiquidPenetrantTestResultsById(int ReportId)
        {

            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "NDTUAT.prc_GetLiquidPenetrantTestResultsReportById";
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));

                SqlDataReader _Reader = _cmd.ExecuteReader();
                List<LiquidPenetrantTestResults> _LiquidPenetrantTestResults = new List<LiquidPenetrantTestResults>();
                LiquidPenetrantTestResults _LiquidPenetrantTestResult = null;
                while (_Reader.Read())
                {
                    _LiquidPenetrantTestResult = new LiquidPenetrantTestResults();
                    _LiquidPenetrantTestResult.TestId = Convert.ToInt32(_Reader["TestId"].ToString());
                    _LiquidPenetrantTestResult.ReportId = Convert.ToInt32(_Reader["ReportId"].ToString());
                    _LiquidPenetrantTestResult.Serial = Convert.ToInt32(_Reader["Serial"].ToString());
                    _LiquidPenetrantTestResult.JobDescription = _Reader["JobDescription"].ToString();
                    _LiquidPenetrantTestResult.LiquidQuantityX = _Reader["LiquidQuantityX"].ToString();
                    _LiquidPenetrantTestResult.LiquidQuantityY = _Reader["LiquidQuantityY"].ToString();
                    _LiquidPenetrantTestResult.ObservationsId = Convert.ToInt32(_Reader["ObservationsId"].ToString());
                    _LiquidPenetrantTestResult.Result = Convert.ToInt32(_Reader["Result"].ToString());
                    _LiquidPenetrantTestResult.SketchReference = _Reader["SketchReference"].ToString();
                    _LiquidPenetrantTestResults.Add(_LiquidPenetrantTestResult);
                }
                return _LiquidPenetrantTestResults;
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

        public int DeleteLiquidPenetrantTestResultsByReportId(int ReportId)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "NDTUAT.prc_DeleteLiquidPenetrantTestResultsByReportId";
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

        public int DeleteLiquidPenetrantTestResultsByTestId(string TestId, int ReportId)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandType = CommandType.StoredProcedure;
                _cmd.CommandText = "NDTUAT.prc_DeleteLiquidPenetrantTestResultsByTestId";

                _cmd.Parameters.Add(new SqlParameter("@ReportId", ReportId));
                _cmd.Parameters.Add(new SqlParameter("@TestId", TestId));
                return _cmd.ExecuteNonQuery();
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
    public class LiquidPenetrantTestResults
    {
        private int _TestId = 0;
        public int TestId { get { return _TestId; } set { _TestId = value; } }

        private int _ReportId = 0;
        public int ReportId { get { return _ReportId; } set { _ReportId = value; } }

        private int _Serial = 0;
        public int Serial { get { return _Serial; } set { _Serial = value; } }

        private string _JobDescription = string.Empty;
        public string JobDescription { get { return _JobDescription; } set { _JobDescription = value; } }

        private string _LiquidQuantityX = string.Empty;
        public string LiquidQuantityX { get { return _LiquidQuantityX; } set { _LiquidQuantityX = value; } }

        private string _LiquidQuantityY = string.Empty;
        public string LiquidQuantityY { get { return _LiquidQuantityY; } set { _LiquidQuantityY = value; } }

        private int _ObservationsId = 0;
        public int ObservationsId { get { return _ObservationsId; } set { _ObservationsId = value; } }

        private int _Result = 0;
        public int Result { get { return _Result; } set { _Result = value; } }

        private string _SketchReference = string.Empty;
        public string SketchReference { get { return _SketchReference; } set { _SketchReference = value; } }

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