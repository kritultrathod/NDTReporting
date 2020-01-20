using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using NDTReporting.Common;
using NDTReporting.DataLayer;

namespace NDTReporting.Domain
{
    public class DbRadiographicWeldsTestResult : DbBase
    {
        string sConnString = Connections.GetConnectionString();
        DALHelper objDalHelper;
        Hashtable hTable = new Hashtable();
        string sQuery = string.Empty;

        public int InsertRadiographicWeldTestResult(RadiographicWeldsTestResult _P)
        {
            int ResultId = 0;
            HandleError.HandleInternalError(() =>
                {
                    hTable.Clear();
                    hTable.Add("@ReportId", _P.ReportID);
                    hTable.Add("@IdentificationNo", _P.IdentificationNo);
                    hTable.Add("@JointNo", _P.JointNo);
                    hTable.Add("@Welder", _P.Welder);
                    hTable.Add("@Segment", _P.Segment);
                    hTable.Add("@FlimSizeX", _P.FlimSizeX);
                    hTable.Add("@FlimSizeY", _P.FlimSizeY);
                    hTable.Add("@Density", _P.Density);
                    hTable.Add("@Sensitivity", _P.Sensitivity);
                    hTable.Add("@ObservationsId", _P.ObservationsId);
                    hTable.Add("@RemarksId", _P.RemarksId);
                    hTable.Add("@AppId", _P.AppId);
                    hTable.Add("@ClientId", _P.ClientId);
                    hTable.Add("@CreatedBy", _P.CreatedBy);
                    hTable.Add("@CreatedDate", _P.CreatedDate);
                    hTable.Add("@UpdatedBy", _P.UpdatedBy);
                    hTable.Add("@UpdatedDate", _P.UpdatedDate);
                    hTable.Add("@DeletedStatus", _P.DeletedStatus);
                    using (objDalHelper = new DALHelper(sConnString))
                    {
                        sQuery = "[NDTUAT].[prc_InsertRadiographicWeldTestResult]";
                        ResultId = ConversionHandler.Instance.ConvertTo<int>(objDalHelper.GetExecuteSave(sQuery, hTable));
                    }
                }, (m, e) =>
                {
                    throw e;
                });
            return ResultId;
        }

        public int UpdateRadiographicWeldTestResult(RadiographicWeldsTestResult _P)
        {
            int ResultId = 0;
            HandleError.HandleInternalError(() =>
            {
                hTable.Clear();
                hTable.Add("@TestId", _P.TestId);
                hTable.Add("@ReportId", _P.ReportID);
                hTable.Add("@IdentificationNo", _P.IdentificationNo);
                hTable.Add("@JointNo", _P.JointNo);
                hTable.Add("@Welder", _P.Welder);
                hTable.Add("@Segment", _P.Segment);
                hTable.Add("@FlimSizeX", _P.FlimSizeX);
                hTable.Add("@FlimSizeY", _P.FlimSizeY);
                hTable.Add("@Density", _P.Density);
                hTable.Add("@Sensitivity", _P.Sensitivity);
                hTable.Add("@ObservationsId", _P.ObservationsId);
                hTable.Add("@RemarksId", _P.RemarksId);
                hTable.Add("@AppId", _P.AppId);
                hTable.Add("@ClientId", _P.ClientId);
                hTable.Add("@UpdatedBy", _P.UpdatedBy);
                hTable.Add("@UpdatedDate", _P.UpdatedDate);
                hTable.Add("@DeletedStatus", _P.DeletedStatus);

                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_UpdateRadiographicWeldTestResult]";
                    ResultId = ConversionHandler.Instance.ConvertTo<int>(objDalHelper.GetExecuteSave(sQuery, hTable));
                }
            }, (m, e) =>
            {
                throw e;
            });
            return ResultId;
        }

        public List<RadiographicWeldsTestResult> GetRadiographicWeldReportTestResultsById(int ReportId)
        {
            List<RadiographicWeldsTestResult> _RadiographicWeldsTestResults = new List<RadiographicWeldsTestResult>();
            RadiographicWeldsTestResult _RadiographicWeldsTestResult = null;
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetRadiographicWeldReportTestResultsById] '" + ReportId.ToString() + "'";
                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery);
                    while (_Reader.Read())
                    {
                        _RadiographicWeldsTestResult = new RadiographicWeldsTestResult();
                        _RadiographicWeldsTestResult.FlimSizeX = _Reader["FlimSizeX"].ToString();
                        _RadiographicWeldsTestResult.FlimSizeY = _Reader["FlimSizeY"].ToString();
                        _RadiographicWeldsTestResult.IdentificationNo = _Reader["IdentificationNo"].ToString();
                        _RadiographicWeldsTestResult.JointNo = _Reader["JointNo"].ToString();
                        //_RadiographicWeldsTestResult.JointNo = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["JointNo"].ToString());
                        _RadiographicWeldsTestResult.ObservationsId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["ObservationsId"].ToString());
                        _RadiographicWeldsTestResult.RemarksId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["RemarksId"].ToString());
                        _RadiographicWeldsTestResult.ReportID = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["ReportID"].ToString());
                        _RadiographicWeldsTestResult.Segment = _Reader["Segment"].ToString();
                        _RadiographicWeldsTestResult.TestId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["TestId"].ToString());
                        _RadiographicWeldsTestResult.Welder = _Reader["Welder"].ToString();
                        _RadiographicWeldsTestResult.Density = ConversionHandler.Instance.ConvertTo<decimal>(_Reader["Density"].ToString());
                        _RadiographicWeldsTestResult.Sensitivity = _Reader["Sensitivity"].ToString();
                        _RadiographicWeldsTestResults.Add(_RadiographicWeldsTestResult);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _RadiographicWeldsTestResults;
        }

        public int DeleteRadiographicWeldTestResultByReportId(int ReportId)
        {
            int ResultId = 0;
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    string sQuery = "[NDTUAT].[prc_DeleteRadiographicWeldTestResultByReportId] '" + ReportId.ToString() + "'";
                    ResultId = objDalHelper.GetExecuteNonQuery(sQuery);
                }
            }, (m, e) =>
            {
                throw e;
            });
            return ResultId;
        }

        public int DeleteRadiographicWeldTestResultByTestId(string TestId, int ReportId)
        {
            int ResultId = 0;
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    //TODO: KTR - Find a ways to pass multiple ids -- "[NDTUAT].[DeleteRadiographicWeldTestResultByTestId] '" + TestId + "','" + ReportId.ToString() + "'";
                    string sQuery = "Delete From NDTUAT.RadiographicWeldTestResult Where TestId not in (" + TestId + ") and ReportId='" + ReportId.ToString() + "'";
                    ResultId = objDalHelper.GetExecuteNonQuery(sQuery);
                }
            }
            , (m, e) => { throw e; });
            return ResultId;
        }
    }
    [Serializable]
    public class RadiographicWeldsTestResult
    {

        private int _TestId = 0;
        public int TestId
        {
            get { return _TestId; }
            set { _TestId = value; }
        }
        private int _ReportID = 0;
        public int ReportID
        {
            get { return _ReportID; }
            set { _ReportID = value; }
        }
        private string _IdentificationNo = string.Empty;
        public string IdentificationNo
        {
            get { return _IdentificationNo; }
            set { _IdentificationNo = value; }
        }
        private string _JointNo = string.Empty;
        public string JointNo
        {
            get { return _JointNo; }
            set { _JointNo = value; }
        }
        private string _Welder = string.Empty;
        public string Welder
        {
            get { return _Welder; }
            set { _Welder = value; }
        }
        private string _Segment = string.Empty;
        public string Segment
        {
            get { return _Segment; }
            set { _Segment = value; }
        }
        private string _FlimSizeX = string.Empty;
        public string FlimSizeX
        {
            get { return _FlimSizeX; }
            set { _FlimSizeX = value; }
        }
        private string _FlimSizeY = string.Empty;
        public string FlimSizeY
        {
            get { return _FlimSizeY; }
            set { _FlimSizeY = value; }
        }
        private int _ObservationsId = 0;
        public int ObservationsId
        {
            get { return _ObservationsId; }
            set { _ObservationsId = value; }
        }
        private int _RemarksId = 0;
        public int RemarksId
        {
            get { return _RemarksId; }
            set { _RemarksId = value; }
        }
        private decimal _Density = 0.0m;
        public decimal Density
        {
            get { return _Density; }
            set { _Density = value; }
        }
        private string _Sensitivity = string.Empty;
        public string Sensitivity
        {
            get { return _Sensitivity; }
            set { _Sensitivity = value; }
        }

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
