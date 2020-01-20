using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    /// <summary>
    /// DataBase Communications and Data Modeling Responsibilities Here
    /// </summary>
    public class ReportViewerHelperOperations
    {
        #region Private Properties
        private SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlConnection _conBillSummary = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlCommand _cmd;
        private SqlCommand _cmdBillSummary;
        #endregion

        #region Public Properties
        private ReportViewerHelper _ReportViewerHelper;
        
        #endregion

        #region Constructor
        public ReportViewerHelperOperations()
        {
            _ReportViewerHelper = new ReportViewerHelper();
        }
        #endregion

        #region Public Methods
        public ReportTemplate GetBaseReport(ReportTemplate _ReportTemplateReq)//int TemplateID, int ReportId)
        {
            ReportTemplate _ReportTemplateResp = null;

            List<ReportTemplates> TemplatesHolderCollection = new List<ReportTemplates>();
            ReportTemplates tempReportTemplates;
            List<TestResultDetail> _TestResultDetails = new List<TestResultDetail>();

            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                _ReportTemplateResp = new ReportTemplate();

                _cmd.CommandText = "NDTUAT.prc_getBaseReportById '" + _ReportTemplateReq.SubTestId + "','" + _ReportTemplateReq.ClientId + "'";
                _cmd.CommandType = CommandType.Text;

                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())// Template
                {
                  
                    //TODO: Write DBNull Check converters and ConvertBack Checks for common Types.
                    _ReportTemplateResp.SubTestId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["SubTestId"].ToString());
                    _ReportTemplateResp.CustomReportTemplateId = 0;
                    TemplatesHolderCollection.Add(
                        new ReportTemplates(
                                ConversionHandler.Instance.ConvertTo<int>(_Reader["SectionsID"]),
                                ConversionHandler.Instance.ConvertTo<string>(string.Empty),
                                ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportTemplate"])
                                ));
                }
                
            }, (m, e) =>
            {
                throw e;
            },
            _closeDBConnection
            );

            #region Fillup response with Template n Data
            tempReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 1).FirstOrDefault();
            
            if (tempReportTemplates != null)
            {
                ReportTemplates rowReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 2).FirstOrDefault();
                FillTestResultDetailsData(ref tempReportTemplates, ref rowReportTemplates, _TestResultDetails);
                _ReportTemplateResp.Templates.Add(tempReportTemplates);
            }
            #endregion

            return _ReportTemplateResp;
        }

        public ReportTemplate GetRadiographicWeldReport(ReportTemplate _ReportTemplateReq, string ClientId)//int TemplateID, int ReportId)
        {
            ReportTemplate _ReportTemplateResp = null;

            List<ReportTemplates> TemplatesHolderCollection = new List<ReportTemplates>();
            ReportTemplates tempReportTemplates;
            List<JobDescriptionDetails> _JobDescriptionDetails = new List<JobDescriptionDetails>();
            List<TestResultDetail> _TestResultDetails = new List<TestResultDetail>();
            ReportBillSummary _ReportBillSummary = new ReportBillSummary();

            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                _ReportTemplateResp = new ReportTemplate();

                _cmd.CommandText = "NDTUAT.prc_getReportById '" + _ReportTemplateReq.CustomReportTemplateId + "','" + _ReportTemplateReq.ReportId + "'";
                _cmd.CommandType = CommandType.Text;

                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())// Template
                {
                    //TODO: Write DBNull Check converters and ConvertBack Checks for common Types.
                    _ReportTemplateResp.CustomReportTemplateId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["ID"].ToString());
                    _ReportTemplateResp.TemplateName = _Reader["ReportTemplateName"].ToString();
                    TemplatesHolderCollection.Add(
                        new ReportTemplates(
                                ConversionHandler.Instance.ConvertTo<int>(_Reader["SectionsID"]),
                                ConversionHandler.Instance.ConvertTo<string>(string.Empty),//_Reader["Section"]),
                                ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportTemplate"])
                                ));
                }
                
                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _JobDescriptionDetails.Add(
                        new JobDescriptionDetails()
                        {
                            Client = ConversionHandler.Instance.ConvertTo<string>(_Reader["Client"]),
                            ReportNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestReportNumber"]),
                            Location = ConversionHandler.Instance.ConvertTo<string>(_Reader["Location"]),
                            Description = ConversionHandler.Instance.ConvertTo<string>(_Reader["JobDescription"]),
                            TestDate = ConversionHandler.Instance.ConvertTo<DateTime>(_Reader["TestDate"]),
                            ContactPerson1 = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContactPerson"]),
                            ContractNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContractNo"]),
                            ContactPerson = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContactPerson"]),
                            MaterialSpecification = ConversionHandler.Instance.ConvertTo<string>(_Reader["MaterialSpecification"]),
                            SurfaceCondition = ConversionHandler.Instance.ConvertTo<string>(_Reader["SurfaceCondition"]),
                            SurfaceTemperature = ConversionHandler.Instance.ConvertTo<string>(_Reader["SurfaceTemperature"]),
                            ExtentofExamination = ConversionHandler.Instance.ConvertTo<string>(_Reader["ExtentofExamination"]),
                            Dimension = ConversionHandler.Instance.ConvertTo<string>(_Reader["Dimension"]),
                            WeldThickness = ConversionHandler.Instance.ConvertTo<string>(_Reader["WeldThickness"]),
                            WeldPreparation = ConversionHandler.Instance.ConvertTo<string>(_Reader["WeldPreparation"]),
                            StageofExamination = ConversionHandler.Instance.ConvertTo<string>(_Reader["StageofExamination"]),
                            SFD = ConversionHandler.Instance.ConvertTo<string>(_Reader["SFD"]),
                            WeldingMethod = ConversionHandler.Instance.ConvertTo<string>(_Reader["WeldingMethod"]),

                            ReferenceStandard = ConversionHandler.Instance.ConvertTo<String>(_Reader["ReferenceStandard"]),
                            TestSpecification = ConversionHandler.Instance.ConvertTo<String>(_Reader["TestSpecification"]),
                            TechSheetNo = ConversionHandler.Instance.ConvertTo<String>(_Reader["TechSheetNo"]),
                            AcceptanceCriteria = ConversionHandler.Instance.ConvertTo<String>(_Reader["AcceptanceCriteria"]),

                            TypeofSource = ConversionHandler.Instance.ConvertTo<String>(_Reader["TypeofSource"]),
                            UnitofEnergy = ConversionHandler.Instance.ConvertTo<String>(_Reader["UnitofEnergy"]),
                            Identification = ConversionHandler.Instance.ConvertTo<String>(_Reader["Identification"]),
                            FocalSpotSize = ConversionHandler.Instance.ConvertTo<String>(_Reader["FocalSpotSize"]),

                            FilmMakeAndType = ConversionHandler.Instance.ConvertTo<String>(_Reader["FilmMakeAndType"]),
                            TypeofIQI = ConversionHandler.Instance.ConvertTo<String>(_Reader["TypeofIQI"]),
                            IQIBatchNo = ConversionHandler.Instance.ConvertTo<String>(_Reader["IQIBatchNo"]),
                            TechniqueName = ConversionHandler.Instance.ConvertTo<String>(_Reader["TechniqueName"]),
                            ShimThickness = ConversionHandler.Instance.ConvertTo<String>(_Reader["ShimThickness"]),
                            DensitometerNo = ConversionHandler.Instance.ConvertTo<String>(_Reader["DensitometerNo"]),
                            CalibrationDate = ConversionHandler.Instance.ConvertTo<DateTime>(_Reader["CalibrationDate"]),
                            GeometricalUnsharpness = ConversionHandler.Instance.ConvertTo<String>(_Reader["GeometricalUnsharpness"]),
                            ExposureTime = ConversionHandler.Instance.ConvertTo<String>(_Reader["ExposureTime"])

                        }
                    );
                }

                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _TestResultDetails.Add(
                        new TestResultDetail()
                        {
                            SrNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["SrNo"]),
                            TestId = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestId"]),
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            IdentificationNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["IdentificationNo"]),
                            JointNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["JointNo"]),
                            Welder = ConversionHandler.Instance.ConvertTo<string>(_Reader["Welder"]),
                            Segment = ConversionHandler.Instance.ConvertTo<string>(_Reader["Segment"]),
                            FlimSizeX = ConversionHandler.Instance.ConvertTo<string>(_Reader["FlimSizeX"]),
                            FlimSizeY = ConversionHandler.Instance.ConvertTo<string>(_Reader["FlimSizeY"]),
                            Density = ConversionHandler.Instance.ConvertTo<string>(_Reader["Density"]),
                            Sensitivity = ConversionHandler.Instance.ConvertTo<string>(_Reader["Sensitivity"]),
                            Observations = ConversionHandler.Instance.ConvertTo<string>(_Reader["ObservationsShortName"]),
                            Remarks = ConversionHandler.Instance.ConvertTo<string>(_Reader["Remarks"])
                        });
                }
                BillSummaryRepository billRepo = new BillSummaryRepository();
                billRepo.GetReportSummaryData(ClientId, _ReportBillSummary
                    , "NDTUAT.prc_GetRadiographicReportAllSummaryBillingByReportID", _ReportTemplateReq.ReportId, _cmdBillSummary);

            }, (m, e) =>
            {
                throw e;
            },
            _closeDBConnection
            );

            #region Fillup response with Template n Data
            tempReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 1).FirstOrDefault();
            // -1 = report layout for editing
            if (tempReportTemplates != null)
            {
                if (_ReportTemplateReq.CustomReportTemplateId < 1)
                {
                    FillJobDescriptionData(ref tempReportTemplates, _JobDescriptionDetails);
                    FillJobDetailsData(ref tempReportTemplates, _JobDescriptionDetails);
                    FillRadiographyTechniqueDetailData(ref tempReportTemplates, _JobDescriptionDetails);
                    FillRadiographyBillSummaryDetailData(ref tempReportTemplates, _ReportBillSummary);
                }
                ReportTemplates rowReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 2).FirstOrDefault();
                FillTestResultDetailsData(ref tempReportTemplates, ref rowReportTemplates, _TestResultDetails);

                _ReportTemplateResp.Templates.Add(tempReportTemplates);
            }

            #endregion

            return _ReportTemplateResp;
        }

        public ReportTemplate GetRadiographicWeldReportWithData(ReportTemplateWithData _ReportTemplateReq, string ClientId)//int TemplateID, int ReportId)
        {
            ReportTemplate _ReportTemplateResp = null;

            List<ReportTemplates> TemplatesHolderCollection = new List<ReportTemplates>();
            ReportTemplates tempReportTemplates;
            List<JobDescriptionDetails> _JobDescriptionDetails = new List<JobDescriptionDetails>();
            List<TestResultDetail> _TestResultDetails = new List<TestResultDetail>();
            ReportBillSummary _ReportBillSummary = new ReportBillSummary();

            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                _ReportTemplateResp = new ReportTemplate();

                _cmd.CommandText = "NDTUAT.prc_getReportById";
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.Add(new SqlParameter("@CustomReportTemplateId", _ReportTemplateReq.CustomReportTemplateId));
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _ReportTemplateReq.ReportId));//

                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())// Template
                {
                    //TODO: Write DBNull Check converters and ConvertBack Checks for common Types.
                    _ReportTemplateResp.CustomReportTemplateId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["ID"].ToString());
                    TemplatesHolderCollection.Add(
                        new ReportTemplates(
                                ConversionHandler.Instance.ConvertTo<int>(_Reader["SectionsID"]),
                                ConversionHandler.Instance.ConvertTo<string>(string.Empty),//_Reader["Section"]),
                                ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportTemplate"])
                                ));
                }
        
                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _JobDescriptionDetails.Add(
                        new JobDescriptionDetails()
                        {
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            Client = ConversionHandler.Instance.ConvertTo<string>(_Reader["Client"]),
                            ReportNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestReportNumber"]),
                            Location = ConversionHandler.Instance.ConvertTo<string>(_Reader["Location"]),
                            Description = ConversionHandler.Instance.ConvertTo<string>(_Reader["JobDescription"]),
                            TestDate = ConversionHandler.Instance.ConvertTo<DateTime>(_Reader["TestDate"]),
                            ContactPerson1 = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContactPerson"]),
                            ContractNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContractNo"]),
                            ContactPerson = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContactPerson"]),
                            
                            MaterialSpecification = ConversionHandler.Instance.ConvertTo<string>(_Reader["MaterialSpecification"]),
                            SurfaceCondition = ConversionHandler.Instance.ConvertTo<string>(_Reader["SurfaceCondition"]),
                            SurfaceTemperature = ConversionHandler.Instance.ConvertTo<string>(_Reader["SurfaceTemperature"]),
                            ExtentofExamination = ConversionHandler.Instance.ConvertTo<string>(_Reader["ExtentofExamination"]),
                            Dimension = ConversionHandler.Instance.ConvertTo<string>(_Reader["Dimension"]),
                            WeldThickness = ConversionHandler.Instance.ConvertTo<string>(_Reader["WeldThickness"]),
                            WeldPreparation = ConversionHandler.Instance.ConvertTo<string>(_Reader["WeldPreparation"]),
                            StageofExamination = ConversionHandler.Instance.ConvertTo<string>(_Reader["StageofExamination"]),
                            SFD = ConversionHandler.Instance.ConvertTo<string>(_Reader["SFD"]),
                            WeldingMethod = ConversionHandler.Instance.ConvertTo<string>(_Reader["WeldingMethod"]),

                            //Code = ConversionHandler.Instance.ConvertTo<String>(_Reader["Code"]),
                            //TestSpecification = ConversionHandler.Instance.ConvertTo<String>(_Reader["TestSpecification"]),
                            //TestProcedureNo = ConversionHandler.Instance.ConvertTo<String>(_Reader["TestProcedureNo"]),
                            //AcceptanceStandard = ConversionHandler.Instance.ConvertTo<String>(_Reader["AcceptanceStandard"]),

                            ReferenceStandard = ConversionHandler.Instance.ConvertTo<String>(_Reader["ReferenceStandard"]),
                            TestSpecification = ConversionHandler.Instance.ConvertTo<String>(_Reader["TestSpecification"]),
                            TechSheetNo = ConversionHandler.Instance.ConvertTo<String>(_Reader["TechSheetNo"]),
                            AcceptanceCriteria = ConversionHandler.Instance.ConvertTo<String>(_Reader["AcceptanceCriteria"]),

                            TypeofSource = ConversionHandler.Instance.ConvertTo<String>(_Reader["TypeofSource"]),
                            UnitofEnergy = ConversionHandler.Instance.ConvertTo<String>(_Reader["UnitofEnergy"]),
                            Identification = ConversionHandler.Instance.ConvertTo<String>(_Reader["Identification"]),
                            FocalSpotSize = ConversionHandler.Instance.ConvertTo<String>(_Reader["FocalSpotSize"]),

                            FilmMakeAndType = ConversionHandler.Instance.ConvertTo<String>(_Reader["FilmMakeAndType"]),
                            TypeofIQI = ConversionHandler.Instance.ConvertTo<String>(_Reader["TypeofIQI"]),
                            IQIBatchNo = ConversionHandler.Instance.ConvertTo<String>(_Reader["IQIBatchNo"]),
                            TechniqueName = ConversionHandler.Instance.ConvertTo<String>(_Reader["TechniqueName"]),
                            ShimThickness = ConversionHandler.Instance.ConvertTo<String>(_Reader["ShimThickness"]),
                            DensitometerNo = ConversionHandler.Instance.ConvertTo<String>(_Reader["DensitometerNo"]),
                            CalibrationDate = NullableConversionHandler.ConvertTo<DateTime>(_Reader["CalibrationDate"].ToString()),
                            GeometricalUnsharpness = ConversionHandler.Instance.ConvertTo<String>(_Reader["GeometricalUnsharpness"]),
                            ExposureTime = ConversionHandler.Instance.ConvertTo<String>(_Reader["ExposureTime"])
                        });
                }

                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _TestResultDetails.Add(
                        new TestResultDetail()
                        {
                            SrNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["SrNo"]),
                            TestId = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestId"]),
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            IdentificationNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["IdentificationNo"]),
                            JointNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["JointNo"]),
                            Welder = ConversionHandler.Instance.ConvertTo<string>(_Reader["Welder"]),
                            Segment = ConversionHandler.Instance.ConvertTo<string>(_Reader["Segment"]),
                            FlimSizeX = ConversionHandler.Instance.ConvertTo<string>(_Reader["FlimSizeX"]),
                            FlimSizeY = ConversionHandler.Instance.ConvertTo<string>(_Reader["FlimSizeY"]),
                            Density = ConversionHandler.Instance.ConvertTo<string>(_Reader["Density"]),
                            Sensitivity = ConversionHandler.Instance.ConvertTo<string>(_Reader["Sensitivity"]),
                            Observations = ConversionHandler.Instance.ConvertTo<string>(_Reader["ObservationsShortName"]),
                            Remarks = ConversionHandler.Instance.ConvertTo<string>(_Reader["Remarks"])
                        });
                }


                //Fillup the testc Results
                _cmdBillSummary.CommandText = "NDTUAT.prc_GetRadiographicReportAllSummaryBillingByReportID";
                _cmdBillSummary.CommandType = CommandType.StoredProcedure;

                _cmdBillSummary.Parameters.Add(new SqlParameter("@ClientID", Convert.ToInt32(ClientId)));
                _cmdBillSummary.Parameters.Add(new SqlParameter("@ReportId", _ReportTemplateReq.ReportId));

                SqlDataReader _BillSummaryReader = _cmdBillSummary.ExecuteReader();
                while (_BillSummaryReader.Read())
                {
                    _ReportBillSummary.RunningInch = ConversionHandler.Instance.ConvertTo<string>(
                        _BillSummaryReader["TotalQuantumOfJobInch"]);
                }
                _BillSummaryReader.NextResult();
                //( Running Inch X Per Unit Rate ) + Per Date Rate = Total 
                while (_BillSummaryReader.Read())
                {
                    _ReportBillSummary.RunningInchAmount = " ( " + ConversionHandler.Instance.ConvertTo<string>(
                        _BillSummaryReader["TotalQuantumOfJobInch"]) + " X " + ConversionHandler.Instance.ConvertTo<string>(
                            _BillSummaryReader["PerUnitRate"]) + " ) + " + ConversionHandler.Instance.ConvertTo<string>(
                                _BillSummaryReader["PerDayUnitRate"]) + " = " + ConversionHandler.Instance.ConvertTo<string>(
                                    _BillSummaryReader["Total"]);
                }
                _BillSummaryReader.NextResult();
                while (_BillSummaryReader.Read())
                {
                    _ReportBillSummary.SquareInch = ConversionHandler.Instance.ConvertTo<string>(
                        _BillSummaryReader["TotalQuantumOfJobSquareInch"]);
                }
                _BillSummaryReader.NextResult();
                while (_BillSummaryReader.Read())
                {
                    _ReportBillSummary.SquareInchAmount = " ( " + ConversionHandler.Instance.ConvertTo<string>(
                        _BillSummaryReader["TotalQuantumOfJobSquareInch"]) + " X " + ConversionHandler.Instance.ConvertTo<string>(
                            _BillSummaryReader["PerUnitRate"]) + " ) + " + ConversionHandler.Instance.ConvertTo<string>(
                                _BillSummaryReader["PerDayUnitRate"]) + " = " + ConversionHandler.Instance.ConvertTo<string>(
                                    _BillSummaryReader["Total"]);
                }
            }, (m, e) =>
            {
                throw e;
            },
            _closeDBConnection
            );

            #region Fillup response with Template n Data
            //RadiographicWeldReport
            tempReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 1).FirstOrDefault();
            // -1 = report layout for editing
            if (tempReportTemplates != null)
            {
                if (_ReportTemplateReq.CustomReportTemplateId >= 1)
                {
                    FillJobDescriptionData(ref tempReportTemplates, _JobDescriptionDetails);
                    FillJobDetailsData(ref tempReportTemplates, _JobDescriptionDetails);
                    FillRadiographyTechniqueDetailData(ref tempReportTemplates, _JobDescriptionDetails);
                    FillRadiographyBillSummaryDetailData(ref tempReportTemplates, _ReportBillSummary);
                }
                ReportTemplates rowReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 2).FirstOrDefault();
                FillTestResultDetailsData(ref tempReportTemplates, ref rowReportTemplates, _TestResultDetails);

                _ReportTemplateResp.Templates.Add(tempReportTemplates);
            }
            #endregion
            return _ReportTemplateResp;
        }

        public string SaveTemplateByReportID(ReportViewerHelper _ReportTemplate)
        {
            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                //TODO: KTR - Replace with an SP here
                _cmd.CommandText = "UPDATE NDTUAT.ReportTemplates SET ReportTemplate=@ReportTemplate WHERE ID = @ID";
                _cmd.Parameters.Add(new SqlParameter("@ID", _ReportTemplate.ReportTemplateID));
                _cmd.Parameters.Add(new SqlParameter("@ReportTemplate", _ReportTemplate.TemplateString));

                _cmd.ExecuteNonQuery();

            }, (m, e) =>
            {
                _logException(m, e);
                throw e;
            },
            _closeDBConnection
            );

            return "Saved Sucessfully";
        }

        public List<TestType> GetTestNames()
        {
            try
            {
                List<TestType> _lstTestNames = new List<TestType>();

                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "Select SubTestId, SubTestName from NDTUAT.SubTest WHERE DeletedStatus=0";
                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())
                {
                    TestType _TestTypes = new TestType();

                    _TestTypes.SubTestId = Convert.ToInt32(_Reader["SubTestId"].ToString());
                    _TestTypes.SubTestName = _Reader["SubTestName"].ToString();

                    _lstTestNames.Add(_TestTypes);
                }
                return _lstTestNames;
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
        #endregion

        #region Private Methods
        private void FillJobDescriptionData(ref ReportTemplates tempReportTemplates, List<JobDescriptionDetails> _JobDescriptionDetails)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;
            //Will be always single record Detail
            if (_JobDescriptionDetails.Count > 1)
            {
                throw new Exception("There are multiple Job Description Details records for given reuest");
            }
            if (_JobDescriptionDetails.Count > 0)
            {
                TemplateString = TemplateString.Replace("##ReportId##", _JobDescriptionDetails[0].ReportId);
                TemplateString = TemplateString.Replace("##ClientValue##", _JobDescriptionDetails[0].Client);
                TemplateString = TemplateString.Replace("##reportnoValue##", _JobDescriptionDetails[0].ReportNo);
                TemplateString = TemplateString.Replace("##LocationValue##", _JobDescriptionDetails[0].Location);
                TemplateString = TemplateString.Replace("##descriptionValue##", _JobDescriptionDetails[0].Description);
                TemplateString = TemplateString.Replace("##testdateValue##", _JobDescriptionDetails[0].TestDateString);
                TemplateString = TemplateString.Replace("##contactperson1Value##", _JobDescriptionDetails[0].ContactPerson1);
                TemplateString = TemplateString.Replace("##ContractNoValue##", _JobDescriptionDetails[0].ContractNo);
                TemplateString = TemplateString.Replace("##contactpersonValue##", _JobDescriptionDetails[0].ContactPerson);
            }
            tempReportTemplates.TemplateStrings = TemplateString;
        }
        private void FillJobDetailsData(ref ReportTemplates tempReportTemplates, List<JobDescriptionDetails> _JobDescriptionDetails)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;
            //Will be always single record Detail
            if (_JobDescriptionDetails.Count > 1)
            {
                throw new Exception("There are multiple Reference Documents Details records for given reuest");
            }
            if (_JobDescriptionDetails.Count > 0)
            {
                TemplateString = TemplateString.Replace("##MaterialSpecificationValue##", _JobDescriptionDetails[0].MaterialSpecification);
                TemplateString = TemplateString.Replace("##SurfaceConditionValue##", _JobDescriptionDetails[0].SurfaceCondition);
                TemplateString = TemplateString.Replace("##SurfaceTemperatureValue##", _JobDescriptionDetails[0].SurfaceTemperature);
                TemplateString = TemplateString.Replace("##ExtentofExaminationValue##", _JobDescriptionDetails[0].ExtentofExamination);
                TemplateString = TemplateString.Replace("##DimensionValue##", _JobDescriptionDetails[0].Dimension);
                TemplateString = TemplateString.Replace("##WeldThicknessValue##", _JobDescriptionDetails[0].WeldThickness);
                TemplateString = TemplateString.Replace("##WeldPreparationValue##", _JobDescriptionDetails[0].WeldPreparation);
                TemplateString = TemplateString.Replace("##StageofExaminationValue##", _JobDescriptionDetails[0].StageofExamination);
                TemplateString = TemplateString.Replace("##SFDValue##", _JobDescriptionDetails[0].SFD);
                TemplateString = TemplateString.Replace("##WeldingMethodValue##", _JobDescriptionDetails[0].WeldingMethod);
            }
            tempReportTemplates.TemplateStrings = TemplateString;
        }
        private void FillRadiographyTechniqueDetailData(ref ReportTemplates tempReportTemplates, List<JobDescriptionDetails> _JobDescriptionDetails)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;
            //Will be always single record Detail
            if (_JobDescriptionDetails.Count > 1)
            {
                throw new Exception("There are multiple Reference Documents Details records for given reuest");
            }
            if (_JobDescriptionDetails.Count > 0)
            {
                TemplateString = TemplateString.Replace("##TypeofSourceValue##", _JobDescriptionDetails[0].TypeofSource);
                TemplateString = TemplateString.Replace("##UnitofEnergyValue##", _JobDescriptionDetails[0].UnitofEnergy);
                TemplateString = TemplateString.Replace("##IdentificationValue##", _JobDescriptionDetails[0].Identification);
                TemplateString = TemplateString.Replace("##FocalSpotSizeValue##", _JobDescriptionDetails[0].FocalSpotSize);

                TemplateString = TemplateString.Replace("##FilmMakeAndTypeValue##", _JobDescriptionDetails[0].FilmMakeAndType);
                TemplateString = TemplateString.Replace("##TypeofIQIValue##", _JobDescriptionDetails[0].TypeofIQI);
                TemplateString = TemplateString.Replace("##IQIBatchNoValue##", _JobDescriptionDetails[0].IQIBatchNo);
                TemplateString = TemplateString.Replace("##TechniqueNameValue##", _JobDescriptionDetails[0].TechniqueName);
                TemplateString = TemplateString.Replace("##ShimThicknessValue##", _JobDescriptionDetails[0].ShimThickness);
                TemplateString = TemplateString.Replace("##DensitometerNoValue##", _JobDescriptionDetails[0].DensitometerNo);
                TemplateString = TemplateString.Replace("##CalibrationDateValue##", _JobDescriptionDetails[0].CalibrationDateString);
                TemplateString = TemplateString.Replace("##GeometricalUnsharpnessValue##", _JobDescriptionDetails[0].GeometricalUnsharpness);
                TemplateString = TemplateString.Replace("##ExposureTime##", _JobDescriptionDetails[0].ExposureTime);

                TemplateString = TemplateString.Replace("##MaterialspecificationValue##", _JobDescriptionDetails[0].MaterialSpecification);
                TemplateString = TemplateString.Replace("##SurfaceConditionValue##", _JobDescriptionDetails[0].SurfaceCondition);
                TemplateString = TemplateString.Replace("##SurfaceTemperatureValue##", _JobDescriptionDetails[0].SurfaceTemperature);
                TemplateString = TemplateString.Replace("##ExtentofExaminationValue##", _JobDescriptionDetails[0].ExtentofExamination);
                TemplateString = TemplateString.Replace("##DimensionValue##", _JobDescriptionDetails[0].Dimension);
                TemplateString = TemplateString.Replace("##SFDValue##", _JobDescriptionDetails[0].SFD);
                TemplateString = TemplateString.Replace("##WeldingMethodValue##", _JobDescriptionDetails[0].WeldingMethod);
                TemplateString = TemplateString.Replace("##WeldThicknessValue##", _JobDescriptionDetails[0].WeldThickness);
                TemplateString = TemplateString.Replace("##WeldPreparationValue##", _JobDescriptionDetails[0].WeldPreparation);
                TemplateString = TemplateString.Replace("##StageofExaminationValue##", _JobDescriptionDetails[0].StageofExamination);

                TemplateString = TemplateString.Replace("##CodeValue##", _JobDescriptionDetails[0].ReferenceStandard);
                TemplateString = TemplateString.Replace("##TestSpecificationValue##", _JobDescriptionDetails[0].TestSpecification);
                TemplateString = TemplateString.Replace("##AcceptanceStandardValue##", _JobDescriptionDetails[0].AcceptanceCriteria);
                TemplateString = TemplateString.Replace("##TestProcedureValue##", _JobDescriptionDetails[0].TechSheetNo);
            }
            tempReportTemplates.TemplateStrings = TemplateString;
        }
        private void FillRadiographyBillSummaryDetailData(ref ReportTemplates tempReportTemplates, ReportBillSummary _ReportBillSummary)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;


            TemplateString = TemplateString.Replace("##RunningInch##", _ReportBillSummary.RunningInch);
            TemplateString = TemplateString.Replace("##RunningInchAmount##", _ReportBillSummary.RunningInchAmount);
            TemplateString = TemplateString.Replace("##SquareInch##", _ReportBillSummary.SquareInch);
            TemplateString = TemplateString.Replace("##SquareInchAmount##", _ReportBillSummary.SquareInchAmount);

            tempReportTemplates.TemplateStrings = TemplateString;
        }

        private void FillTestResultDetailsData(ref ReportTemplates tempReportTemplates, ref  ReportTemplates tableRowReportTemplates, List<TestResultDetail> _TestResultDetails)
        {
            string TemplateStrings = tableRowReportTemplates.TemplateStrings;
            StringBuilder s = new StringBuilder();
            s.Clear();
            if (_TestResultDetails != null && _TestResultDetails.Count > 0)
            {
                foreach (TestResultDetail TestResultDetail in _TestResultDetails)
                {
                    string TemplateString = TemplateStrings;

                    TemplateString = TemplateString.Replace("##SrNo##", TestResultDetail.SrNo);
                    TemplateString = TemplateString.Replace("##IdentificationNo##", TestResultDetail.IdentificationNo);
                    TemplateString = TemplateString.Replace("##JointNo##", TestResultDetail.JointNo);
                    TemplateString = TemplateString.Replace("##Welder##", TestResultDetail.Welder);
                    TemplateString = TemplateString.Replace("##Segment##", TestResultDetail.Segment);
                    TemplateString = TemplateString.Replace("##FilmSize##", TestResultDetail.FlimSizeX + "X" + TestResultDetail.FlimSizeY);
                    TemplateString = TemplateString.Replace("##Density##", TestResultDetail.Density);
                    TemplateString = TemplateString.Replace("##Sensitivity##", TestResultDetail.Sensitivity);
                    TemplateString = TemplateString.Replace("##Observations##", TestResultDetail.Observations);
                    TemplateString = TemplateString.Replace("##Remarks##", TestResultDetail.Remarks);
                    s.Append(TemplateString);
                }
            }
            else
            {
                s.Append(TemplateStrings); // for ReportId = -1 , for template generator only
            }
            tempReportTemplates.TemplateStrings = tempReportTemplates.TemplateStrings.Replace("##JobDetailsTableRowTemplate##", s.ToString());
        }

        private void _openDBConnection()
        {
            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            _cmd = _con.CreateCommand();

            if (_conBillSummary.State != System.Data.ConnectionState.Open)
                _conBillSummary.Open();
            _cmdBillSummary = _conBillSummary.CreateCommand();
        }
        private void _closeDBConnection()
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();

            if (_conBillSummary.State != System.Data.ConnectionState.Closed)
                _conBillSummary.Close();
        }
        private void _logException(string message, Exception ex)
        {
        }
        #endregion
    }
}