using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using NDTReporting.Common;
using NDTReporting.DataLayer;

namespace NDTReporting.Domain
{
    public class DbRadiographicWelds
    {
        string sConnString = Connections.GetConnectionString();
        DALHelper objDalHelper;
        Hashtable hTable = new Hashtable();
        string sQuery = string.Empty;

        public string InsertRadiographicWeld(RadiographicWeldsTemplate _P)
        {
            string sRetMessage = "An error occurred while adding new record";
            HandleError.HandleInternalError(() =>
            {
                #region Fill Param Values
                hTable.Clear();
                if (_P.RadiographicWeld.CalibrationDate != null)
                {
                    hTable.Add("@CalibrationDate", _P.RadiographicWeld.CalibrationDate.Value.ToString("dd/MM/yyyy"));
                }
                hTable.Add("@Client", _P.RadiographicWeld.Client);
                hTable.Add("@ContractNo", _P.RadiographicWeld.ContractNumber);
                hTable.Add("@ContactPerson", _P.RadiographicWeld.ContactPerson);
                hTable.Add("@ContactNumber", _P.RadiographicWeld.ContactNumber);
                hTable.Add("@DensitometerNo", _P.RadiographicWeld.DensitometerNo);
                hTable.Add("@ExposureTime", _P.RadiographicWeld.ExposureTime);
                hTable.Add("@ExtentofExamination", _P.RadiographicWeld.ExtentofExamination);
                hTable.Add("@FilmMakeAndType", _P.RadiographicWeld.FilmMakeAndTypeId);
                hTable.Add("@GeometricalUnsharpness", _P.RadiographicWeld.GeometricalUnsharpness);
                hTable.Add("@IQIBatchNo", _P.RadiographicWeld.IQIBatchNo);
                hTable.Add("@JobDescription", _P.RadiographicWeld.JobDescription);
                hTable.Add("@Location", _P.RadiographicWeld.Location);
                hTable.Add("@MaterialSpecification", _P.RadiographicWeld.MaterialSpecification);
                hTable.Add("@RadiationSourceId", _P.RadiographicWeld.RadiationSourceId);
                hTable.Add("@ShimThickness", _P.RadiographicWeld.ShimThickness);
                hTable.Add("@StageofExamination", _P.RadiographicWeld.StageofExamination);
                hTable.Add("@SubTestId", _P.RadiographicWeld.SubTestId);//TODO: Add SubTestId
                hTable.Add("@SurfaceCondition", _P.RadiographicWeld.SurfaceCondition);
                hTable.Add("@SurfaceTemperature", _P.RadiographicWeld.SurfaceTemperature);
                hTable.Add("@TechniqueId", _P.RadiographicWeld.TechniqueId);
                hTable.Add("@TestDate", _P.RadiographicWeld.TestDateString ?? string.Empty);
                hTable.Add("@Dimension", _P.RadiographicWeld.Dimension);
                hTable.Add("@TestReportNumber", _P.RadiographicWeld.TestReportNumber);
                hTable.Add("@TypeofIQI", _P.RadiographicWeld.TypeofIQI);
                hTable.Add("@WeldPreparation", _P.RadiographicWeld.WeldPreparation);
                hTable.Add("@WeldThickness", _P.RadiographicWeld.WeldThickness);
                hTable.Add("@SFD", _P.RadiographicWeld.SFD);
                hTable.Add("@WeldingMethod", _P.RadiographicWeld.WeldingMethod);
                hTable.Add("@ReportId", _P.RadiographicWeld.ReportID.ToString() ?? 0.ToString()); //default is 0
                hTable.Add("@AppId", _P.RadiographicWeld.AppId);
                hTable.Add("@ClientId", _P.RadiographicWeld.ClientId);
                hTable.Add("@CreatedBy", _P.RadiographicWeld.CreatedBy);
                hTable.Add("@CreatedDate", _P.RadiographicWeld.CreatedDate);
                hTable.Add("@UpdatedBy", _P.RadiographicWeld.UpdatedBy);
                hTable.Add("@UpdatedDate", _P.RadiographicWeld.UpdatedDate);
                hTable.Add("@DeletedStatus", _P.RadiographicWeld.DeletedStatus);

                hTable.Add("@FocalSpotSize", _P.RadiographicWeld.FocalSpotSize);
                hTable.Add("@UnitofEnergy", _P.RadiographicWeld.UnitofEnergy);
                hTable.Add("@ReferenceStandard", _P.RadiographicWeld.ReferenceStandard);
                hTable.Add("@TestSpecification", _P.RadiographicWeld.TestSpecification);
                hTable.Add("@AcceptanceCriteria", _P.RadiographicWeld.AcceptanceCriteria);
                hTable.Add("@TechSheetNo", _P.RadiographicWeld.TechSheetNo);
                

                #endregion
                using (objDalHelper = new DALHelper(sConnString))
                {
                    int reportId = Convert.ToInt32(objDalHelper.GetExecuteSave("[NDTUAT].[prc_InsertRadiographicWeld]", hTable));
                    if (reportId > 0)
                    {
                        DbRadiographicWeldsTestResult listRadiographicTests = new DbRadiographicWeldsTestResult();
                        foreach (RadiographicWeldsTestResult item in _P.RadiographicWeldsTestResult)
                        {
                            item.ReportID = reportId;
                            if (listRadiographicTests.InsertRadiographicWeldTestResult(item) <= 0)
                            {
                                sRetMessage = "Record not Afftected to DataBase";
                            }
                        }
                        sRetMessage = "Record Sucessfully Saved";
                    }
                    else
                    {
                        sRetMessage = "Record not Afftected to DataBase";
                    }
                }
            }, (m, e) =>
            {
            });
            return sRetMessage;
        }
        public string UpdateRadiographicWeld(RadiographicWeldsTemplate _P)
        {
            HandleError.HandleInternalError(() =>
            {
                #region Fill Param Values
                hTable.Clear();
                if (_P.RadiographicWeld.CalibrationDate != null)
                {
                    hTable.Add("@CalibrationDate", _P.RadiographicWeld.CalibrationDate.Value.ToString("dd/MM/yyyy"));
                }
                hTable.Add("@Client", _P.RadiographicWeld.Client);
                hTable.Add("@ContactNumber", _P.RadiographicWeld.ContactNumber);
                hTable.Add("@ContactPerson", _P.RadiographicWeld.ContactPerson);
                hTable.Add("@ContractNo", _P.RadiographicWeld.ContractNumber);
                hTable.Add("@DensitometerNo", _P.RadiographicWeld.DensitometerNo);
                hTable.Add("@ExposureTime", _P.RadiographicWeld.ExposureTime);
                hTable.Add("@ExtentofExamination", _P.RadiographicWeld.ExtentofExamination);
                hTable.Add("@FilmMakeAndType", _P.RadiographicWeld.FilmMakeAndTypeId);
                hTable.Add("@GeometricalUnsharpness", _P.RadiographicWeld.GeometricalUnsharpness);
                hTable.Add("@IQIBatchNo", _P.RadiographicWeld.IQIBatchNo);
                hTable.Add("@JobDescription", _P.RadiographicWeld.JobDescription);
                hTable.Add("@Location", _P.RadiographicWeld.Location);
                hTable.Add("@MaterialSpecification", _P.RadiographicWeld.MaterialSpecification);
                hTable.Add("@RadiationSourceId", _P.RadiographicWeld.RadiationSourceId);
                hTable.Add("@ShimThickness", _P.RadiographicWeld.ShimThickness);
                hTable.Add("@StageofExamination", _P.RadiographicWeld.StageofExamination);
                hTable.Add("@SubTestId", _P.RadiographicWeld.SubTestId);//TODO: Add SubTestId
                hTable.Add("@SurfaceCondition", _P.RadiographicWeld.SurfaceCondition);
                hTable.Add("@SurfaceTemperature", _P.RadiographicWeld.SurfaceTemperature);
                hTable.Add("@TechniqueId", _P.RadiographicWeld.TechniqueId);
                hTable.Add("@TestDate", _P.RadiographicWeld.TestDateString ?? String.Empty);// == null ? string.Empty : _P.RadiographicWeld.TestDate.Value.ToString("dd/MM/yyyy"));
                hTable.Add("@Dimension", _P.RadiographicWeld.Dimension);
                hTable.Add("@TestReportNumber", _P.RadiographicWeld.TestReportNumber);
                hTable.Add("@TypeofIQI", _P.RadiographicWeld.TypeofIQI);
                hTable.Add("@WeldPreparation", _P.RadiographicWeld.WeldPreparation);
                hTable.Add("@WeldThickness", _P.RadiographicWeld.WeldThickness);
                hTable.Add("@SFD", _P.RadiographicWeld.SFD);
                hTable.Add("@WeldingMethod", _P.RadiographicWeld.WeldingMethod);
                hTable.Add("@ReportId", _P.RadiographicWeld.ReportID.ToString() ?? 0.ToString()); //default is 0
                hTable.Add("@AppId", _P.RadiographicWeld.AppId);
                hTable.Add("@ClientId", _P.RadiographicWeld.ClientId);
                hTable.Add("@UpdatedBy", _P.RadiographicWeld.UpdatedBy);
                hTable.Add("@UpdatedDate", _P.RadiographicWeld.UpdatedDate);
                hTable.Add("@DeletedStatus", _P.RadiographicWeld.DeletedStatus);

                hTable.Add("@FocalSpotSize", _P.RadiographicWeld.FocalSpotSize);
                hTable.Add("@UnitofEnergy", _P.RadiographicWeld.UnitofEnergy);
                hTable.Add("@ReferenceStandard", _P.RadiographicWeld.ReferenceStandard);
                hTable.Add("@TestSpecification", _P.RadiographicWeld.TestSpecification);
                hTable.Add("@AcceptanceCriteria", _P.RadiographicWeld.AcceptanceCriteria);
                hTable.Add("@TechSheetNo", _P.RadiographicWeld.TechSheetNo);
                                

                #endregion
                using (objDalHelper = new DALHelper(sConnString))
                {
                    objDalHelper.GetExecuteSave("[NDTUAT].[prc_UpdateRadiographicWeld]", hTable);
                }
            }, (m, e) =>
            {
                throw e;
            });
            int reportId = _P.RadiographicWeld.ReportID;
            string testId = "";
            if (reportId > 0)
            {
                DbRadiographicWeldsTestResult listRadiographicTests = new DbRadiographicWeldsTestResult();
                foreach (RadiographicWeldsTestResult item in _P.RadiographicWeldsTestResult)
                {
                    if (item.TestId != 0)
                        testId += "'" + item.TestId.ToString() + "',";
                }
                listRadiographicTests.DeleteRadiographicWeldTestResultByTestId(testId.Substring(0, testId.Length - 1), reportId);
                foreach (RadiographicWeldsTestResult item in _P.RadiographicWeldsTestResult)
                {
                    item.ReportID = reportId;
                    if (item.TestId == 0)
                    {
                        if (listRadiographicTests.InsertRadiographicWeldTestResult(item) <= 0)
                        {
                            return "Record not Afftected to DataBase";
                        }
                    }
                    else
                    {
                        if (listRadiographicTests.UpdateRadiographicWeldTestResult(item) <= 0)
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
        public RadiographicWeldsTemplate GetRadiographicWeldReportById(int ReportId)
        {
            RadiographicWeldsTemplate _RadiographicWeldsTemplate = new RadiographicWeldsTemplate();
            DbRadiographicWeldsTestResult _DbRadiographicWeldsTestResult = new DbRadiographicWeldsTestResult();
            RadiographicWeld _RadiographicWeld = null;
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetRadiographicWeldReportById]";
                    hTable.Clear();
                    hTable.Add("@ReportId", ReportId.ToString());

                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery, hTable);

                    while (_Reader.Read())
                    {
                        _RadiographicWeld = new RadiographicWeld();
                        _RadiographicWeld.ReportID = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["ReportId"].ToString());
                        _RadiographicWeld.Client = _Reader["Client"].ToString();
                        _RadiographicWeld.ContractNumber = _Reader["ContractNo"].ToString();
                        _RadiographicWeld.ContactNumber = _Reader["ContactNumber"].ToString();
                        _RadiographicWeld.ContactPerson = _Reader["ContactPerson"].ToString();
                        _RadiographicWeld.Location = _Reader["Location"].ToString();
                        _RadiographicWeld.TestReportNumber = _Reader["TestReportNumber"].ToString();
                        _RadiographicWeld.JobDescription = _Reader["JobDescription"].ToString();
                        _RadiographicWeld.TestDate = NullableConversionHandler.ConvertTo<DateTime>(_Reader["TestDate"].ToString());
                        _RadiographicWeld.RadiationSourceId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["RadiationSourceId"].ToString());
                        _RadiographicWeld.FilmMakeAndTypeId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["FilmMakeAndType"].ToString());
                        _RadiographicWeld.TypeofIQI = _Reader["TypeofIQI"].ToString();
                        _RadiographicWeld.IQIBatchNo = _Reader["IQIBatchNo"].ToString();
                        _RadiographicWeld.GeometricalUnsharpness = _Reader["GeometricalUnsharpness"].ToString();
                        _RadiographicWeld.TechniqueId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["TechniqueId"].ToString());
                        _RadiographicWeld.ShimThickness = _Reader["ShimThickness"].ToString();
                        _RadiographicWeld.DensitometerNo = _Reader["DensitometerNo"].ToString();
                        _RadiographicWeld.CalibrationDate = NullableConversionHandler.ConvertTo<DateTime>(_Reader["CalibrationDate"].ToString());
                        _RadiographicWeld.MaterialSpecification = _Reader["MaterialSpecification"].ToString();
                        _RadiographicWeld.SurfaceCondition = _Reader["SurfaceCondition"].ToString();
                        _RadiographicWeld.SurfaceTemperature = _Reader["SurfaceTemperature"].ToString();
                        _RadiographicWeld.ExtentofExamination = _Reader["ExtentofExamination"].ToString();
                        _RadiographicWeld.Dimension = _Reader["Dimension"].ToString();
                        _RadiographicWeld.SFD = _Reader["SFD"].ToString();
                        _RadiographicWeld.WeldThickness = _Reader["WeldThickness"].ToString();
                        _RadiographicWeld.WeldPreparation = _Reader["WeldPreparation"].ToString();
                        _RadiographicWeld.WeldingMethod = _Reader["WeldingMethod"].ToString();
                        _RadiographicWeld.StageofExamination = _Reader["StageofExamination"].ToString();
                        _RadiographicWeld.ExposureTime = _Reader["ExposureTime"].ToString();

                        _RadiographicWeld.FocalSpotSize = _Reader["FocalSpotSize"].ToString();
                        _RadiographicWeld.UnitofEnergy = _Reader["UnitofEnergy"].ToString();
                        _RadiographicWeld.ReferenceStandard = _Reader["ReferenceStandard"].ToString();
                        _RadiographicWeld.TestSpecification = _Reader["TestSpecification"].ToString();
                        _RadiographicWeld.AcceptanceCriteria = _Reader["AcceptanceCriteria"].ToString();
                        _RadiographicWeld.TechSheetNo = _Reader["TechSheetNo"].ToString();
                    }
                    _RadiographicWeldsTemplate.RadiographicWeld = _RadiographicWeld;
                }
            }, (m, e) =>
            {
                throw e;
            });
            _RadiographicWeldsTemplate.RadiographicWeldsTestResult = _DbRadiographicWeldsTestResult.GetRadiographicWeldReportTestResultsById(ReportId);
            return _RadiographicWeldsTemplate;
        }
        public string DeleteRadiographicWeldReport(int ReportId)
        {
            string sResult = "An error occurred while deleting record.";
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    string sQuery = "[NDTUAT].[prc_DeleteRadiographicWeldReport]";
                    hTable.Clear();
                    hTable.Add("@ReportId", ReportId);

                    if (objDalHelper.GetExecuteNonQueryWithSP(sQuery, hTable) > 0)
                        sResult = "Records Sucessfully Delete";
                    else
                        sResult = "Records not Afftected to DataBase";
                }
            }, (m, e) =>
            {
                throw e;
            });
            return sResult;
        }
        public List<RadiographicWeld> GetTechnique(int SubTestId, int ClientId)
        {
            List<RadiographicWeld> _lstTechnique = new List<RadiographicWeld>();
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetLookUpValues]";
                    hTable.Clear();
                    hTable.Add("@LookupCode", "Technique");
                    hTable.Add("@SubTestId", SubTestId);
                    hTable.Add("@ClientID", ClientId);

                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery, hTable);

                    while (_Reader.Read())
                    {
                        RadiographicWeld _RadiographicWelds = new RadiographicWeld();
                        _RadiographicWelds.TechniqueId = Convert.ToInt32(_Reader["ID"].ToString());
                        _RadiographicWelds.TechniqueShortName = _Reader["Value"].ToString();
                        _lstTechnique.Add(_RadiographicWelds);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstTechnique;
        }
        public List<RadiographicWeld> GetRemarks(int SubTestId, int ClientId)
        {
            List<RadiographicWeld> _lstRemarks = new List<RadiographicWeld>();
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetLookUpValues]";
                    hTable.Clear();
                    hTable.Add("@LookupCode", "Remarks");
                    hTable.Add("@SubTestId", SubTestId);
                    hTable.Add("@ClientID", ClientId);

                    SqlDataReader _Reader = new DALHelper(Connections.GetConnectionString()).GetExecuteReader(sQuery, hTable);
                    while (_Reader.Read())
                    {
                        RadiographicWeld _RadiographicWelds = new RadiographicWeld();
                        _RadiographicWelds.RemarksId = ConversionHandler.Instance.ConvertTo<int>(_Reader["ID"].ToString());
                        _RadiographicWelds.RemarksShortName = _Reader["Value"].ToString();
                        _lstRemarks.Add(_RadiographicWelds);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstRemarks;
        }
        public List<RadiographicWeld> GetObservations(int SubTestId, int ClientId)
        {
            List<RadiographicWeld> _lstObservations = new List<RadiographicWeld>();
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetLookUpValues]";
                    hTable.Clear();
                    hTable.Add("@LookupCode", "Observations");
                    hTable.Add("@SubTestId", SubTestId);
                    hTable.Add("@ClientID", ClientId);

                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery, hTable);

                    while (_Reader.Read())
                    {
                        RadiographicWeld _RadiographicWelds = new RadiographicWeld();
                        _RadiographicWelds.ObservationsId = Convert.ToInt32(_Reader["ID"].ToString());
                        _RadiographicWelds.ObservationsShortName = _Reader["Value"].ToString();
                        _lstObservations.Add(_RadiographicWelds);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstObservations;
        }
        public List<RadiographicWeld> GetFilmMakeAndTypes(int SubTestId, int clientId)
        {
            List<RadiographicWeld> _lstFilmMakeAndTypes = new List<RadiographicWeld>();
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetLookUpValues]";
                    hTable.Clear();
                    hTable.Add("@LookupCode", "FilmMakeAndType");
                    hTable.Add("@SubTestId", SubTestId);
                    hTable.Add("@ClientID", clientId);

                    SqlDataReader _Reader = new DALHelper(Connections.GetConnectionString()).GetExecuteReader(sQuery, hTable);
                    while (_Reader.Read())
                    {
                        RadiographicWeld _RadiographicWelds = new RadiographicWeld();
                        _RadiographicWelds.FilmMakeAndTypeId = ConversionHandler.Instance.ConvertTo<int>(_Reader["ID"].ToString());
                        _RadiographicWelds.FilmMakeAndTypeShortName = _Reader["Value"].ToString();
                        _lstFilmMakeAndTypes.Add(_RadiographicWelds);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstFilmMakeAndTypes;
        }
        //CodeSmell: KTR MagneticParticleTest seems wrong here
        public List<MagneticParticleTest> GetConsumablesType(int SubTestId, int ClientId)
        {
            List<MagneticParticleTest> _lstReportNumbers = new List<MagneticParticleTest>();
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetLookUpValues]";
                    hTable.Clear();
                    hTable.Add("@LookupCode", "ConsumablesType");
                    hTable.Add("@SubTestId", SubTestId);
                    hTable.Add("@ClientId", ClientId);

                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery, hTable);
                    while (_Reader.Read())
                    {
                        MagneticParticleTest _magneticParticles = new MagneticParticleTest();
                        _magneticParticles.ConsumablesTypeId = Convert.ToInt32(_Reader["ID"].ToString());
                        _magneticParticles.ConsumablesType = _Reader["Value"].ToString();
                        _lstReportNumbers.Add(_magneticParticles);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstReportNumbers;
        }
        public List<RadiographicWeld> GetRadiationSource()
        {
            List<RadiographicWeld> _lstRadiationSource = new List<RadiographicWeld>();
            HandleError.HandleInternalError(() =>
            {
                using (objDalHelper = new DALHelper(sConnString))
                {
                    sQuery = "[NDTUAT].[prc_GetRadiationSource]";
                    SqlDataReader _Reader = objDalHelper.GetExecuteReader(sQuery);
                    while (_Reader.Read())
                    {
                        RadiographicWeld _RadiographicWelds = new RadiographicWeld();
                        _RadiographicWelds.RadiationSourceId = Convert.ToInt32(_Reader["RadiationSourceId"].ToString());
                        _RadiographicWelds.Identification = _Reader["Identification"].ToString();
                        _lstRadiationSource.Add(_RadiographicWelds);
                    }
                }
            }, (m, e) =>
            {
                throw e;
            });
            return _lstRadiationSource;
        }
        
    }
}