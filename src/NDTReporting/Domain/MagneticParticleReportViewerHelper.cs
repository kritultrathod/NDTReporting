using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class MagneticParticletestReportViewerHelperOperations
    {
        private SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlConnection _conBillSummary = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlCommand _cmd;
        private SqlCommand _cmdBillSummary;

        public MagneticParticletestReportViewerHelperOperations()
        {
        }

        public ReportTemplate GetMagneticParticleTestReport(ReportTemplate _ReportTemplateReq, string ClientId)//int TemplateID, int ReportId)
        {
            ReportTemplate _ReportTemplateResp = null;

            List<ReportTemplates> TemplatesHolderCollection = new List<ReportTemplates>();
            ReportTemplates tempReportTemplates;
            List<MPJobDescriptionDetails> _MPJobDescriptionDetails = new List<MPJobDescriptionDetails>();
            List<MPTestResultDetail> _MPTestResultDetails = new List<MPTestResultDetail>();
            ReportBillSummary _ReportBillSummary = new ReportBillSummary();

            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                _ReportTemplateResp = new ReportTemplate();

                _cmd.CommandText = "NDTUAT.prc_GetMPTestReportById '" + _ReportTemplateReq.CustomReportTemplateId + "','" + _ReportTemplateReq.ReportId + "'";
                _cmd.CommandType = CommandType.Text;

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
                    _MPJobDescriptionDetails.Add(
                        new MPJobDescriptionDetails()
                        {
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            FabricatorName = ConversionHandler.Instance.ConvertTo<string>(_Reader["FabricatorName"]),
                            Location = ConversionHandler.Instance.ConvertTo<string>(_Reader["Location"]),
                            ReportNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportNo"]),
                            ContractNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContractNo"]),
                            ContactPerson = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContactPerson"]),
                            DateofTesting = ConversionHandler.Instance.ConvertTo<DateTime>(_Reader["DateofTesting"]),
                            JobDescription = ConversionHandler.Instance.ConvertTo<string>(_Reader["JobDescription"]),
                            Material = ConversionHandler.Instance.ConvertTo<string>(_Reader["Material"]),
                            Dimension = ConversionHandler.Instance.ConvertTo<string>(_Reader["Dimension"]),
                            SurfaceCondition = ConversionHandler.Instance.ConvertTo<string>(_Reader["SurfaceCondition"]),
                            ReferenceStandard = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReferenceStandard"]),
                            TestSpecification = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestSpecification"]),
                            AcceptanceCriteria = ConversionHandler.Instance.ConvertTo<string>(_Reader["AcceptanceCriteria"]),
                            TechSheetNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["TechSheetNo"]),
                            ExtentofCoverage = ConversionHandler.Instance.ConvertTo<string>(_Reader["ExtentofCoverage"]),
                            SurfaceTemperature = ConversionHandler.Instance.ConvertTo<string>(_Reader["SurfaceTemperature"]),
                            ConsumablesType = ConversionHandler.Instance.ConvertTo<string>(_Reader["ConsumablesTypeText"]),
                            TechniqueId = ConversionHandler.Instance.ConvertTo<string>(_Reader["TechniqueName"]),
                            Direction = ConversionHandler.Instance.ConvertTo<string>(_Reader["Direction"]),
                            DirectionMagnetization = ConversionHandler.Instance.ConvertTo<string>(_Reader["DirectionMagnetization"]),
                            MagnetizationCurrent = ConversionHandler.Instance.ConvertTo<string>(_Reader["MagnetizationCurrent"]),
                            DetectionMedia = ConversionHandler.Instance.ConvertTo<string>(_Reader["DetectionMedia"]),
                            Concentration = ConversionHandler.Instance.ConvertTo<string>(_Reader["Concentration"]),
                            Illuminance = ConversionHandler.Instance.ConvertTo<string>(_Reader["Illuminance"]),
                            ContrastPaint = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContrastPaint"]),
                            Demagnetizing = ConversionHandler.Instance.ConvertTo<string>(_Reader["Demagnetizing"]),
                            Equipment = ConversionHandler.Instance.ConvertTo<string>(_Reader["Equipment"]),
                            CalibrationStatus = ConversionHandler.Instance.ConvertTo<string>(_Reader["CalibrationStatus"]),
                            Amperage = ConversionHandler.Instance.ConvertTo<string>(_Reader["Amperage"]),
                            Windings = ConversionHandler.Instance.ConvertTo<string>(_Reader["Windings"]),
                            Spacing = ConversionHandler.Instance.ConvertTo<string>(_Reader["Spacing"]),
                            BlackLightIntensity = ConversionHandler.Instance.ConvertTo<string>(_Reader["BlackLightIntensity"]),
                            FieldIndicator = ConversionHandler.Instance.ConvertTo<string>(_Reader["FieldIndicator"]),
                            FinalCleaning = ConversionHandler.Instance.ConvertTo<string>(_Reader["FinalCleaning"])
                        }
                    );
                }

                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _MPTestResultDetails.Add(
                        new MPTestResultDetail()
                        {
                            Serial = ConversionHandler.Instance.ConvertTo<string>(_Reader["Serial"]),
                            TestId = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestId"]),
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            JobDescription = ConversionHandler.Instance.ConvertTo<string>(_Reader["JobDescription"]),
                            Section = ConversionHandler.Instance.ConvertTo<string>(_Reader["Section"]),
                            MagneticDimensionL = ConversionHandler.Instance.ConvertTo<string>(_Reader["MagneticDimensionL"]),
                            MagneticDimensionB = ConversionHandler.Instance.ConvertTo<string>(_Reader["MagneticDimensionB"]),
                            MagneticDimensionH = ConversionHandler.Instance.ConvertTo<string>(_Reader["MagneticDimensionH"]),
                            ObservationsId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ObservationsShortName"]),
                            Result = ConversionHandler.Instance.ConvertTo<string>(_Reader["Remarks"]),
                            SketchReference = ConversionHandler.Instance.ConvertTo<string>(_Reader["SketchReference"])

                        });
                }
                //Fillup the testc Results
                BillSummaryRepository billRepo = new BillSummaryRepository();
                billRepo.GetReportSummaryData(ClientId, _ReportBillSummary
                    , "NDTUAT.prc_GetMagneticParticleReportAllSummaryBillingByReportID", _ReportTemplateReq.ReportId, _cmdBillSummary);

            }, (m, e) =>
            {
                throw e;
            },
            _closeDBConnection
            );

            //RadiographicWeldReport
            tempReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 1).FirstOrDefault();
            // -1 = report layout for editing
            if (tempReportTemplates != null)
            {
                if (_ReportTemplateReq.CustomReportTemplateId != -1)
                {

                    FillReportDetailData(ref tempReportTemplates, _MPJobDescriptionDetails);
                    FillBillSummaryDetailData(ref tempReportTemplates, _ReportBillSummary);
                }
                ReportTemplates rowReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 2).FirstOrDefault();
                FillTestResultDetailsData(ref tempReportTemplates, ref rowReportTemplates, _MPTestResultDetails);

                _ReportTemplateResp.Templates.Add(tempReportTemplates);
            }
            return _ReportTemplateResp;
        }

        private void FillReportDetailData(ref ReportTemplates tempReportTemplates, List<MPJobDescriptionDetails> _MPJobDescriptionDetails)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;
            //Will be always single record Detail
            if (_MPJobDescriptionDetails.Count > 1)
            {
                throw new Exception("There are multiple Reference Documents Details records for given reuest");
            }
            TemplateString = TemplateString.Replace("##ReportId##", _MPJobDescriptionDetails[0].ReportId);
            TemplateString = TemplateString.Replace("##CustomersNameValue##", _MPJobDescriptionDetails[0].FabricatorName);
            TemplateString = TemplateString.Replace("##SubTestIdValue##", _MPJobDescriptionDetails[0].SubTestId);
            TemplateString = TemplateString.Replace("##LocationValue##", _MPJobDescriptionDetails[0].Location);
            TemplateString = TemplateString.Replace("##ReportNoValue##", _MPJobDescriptionDetails[0].ReportNo);
            TemplateString = TemplateString.Replace("##ContractNoValue##", _MPJobDescriptionDetails[0].ContractNo);
            TemplateString = TemplateString.Replace("##ContactPersonValue##", _MPJobDescriptionDetails[0].ContactPerson);
            TemplateString = TemplateString.Replace("##DateOfTestingValue##", _MPJobDescriptionDetails[0].DateofTestingString);
            TemplateString = TemplateString.Replace("##JobDescriptionValue##", _MPJobDescriptionDetails[0].JobDescription);
            TemplateString = TemplateString.Replace("##MaterialValue##", _MPJobDescriptionDetails[0].Material);
            TemplateString = TemplateString.Replace("##DimensionValue##", _MPJobDescriptionDetails[0].Dimension);
            TemplateString = TemplateString.Replace("##SurfaceConditionValue##", _MPJobDescriptionDetails[0].SurfaceCondition);
            TemplateString = TemplateString.Replace("##ReferenceCodeValue##", _MPJobDescriptionDetails[0].ReferenceStandard);
            TemplateString = TemplateString.Replace("##TestSpecificationValue##", _MPJobDescriptionDetails[0].TestSpecification);
            TemplateString = TemplateString.Replace("##AcceptanceCriteriaValue##", _MPJobDescriptionDetails[0].AcceptanceCriteria);
            TemplateString = TemplateString.Replace("##ProcedureValue##", _MPJobDescriptionDetails[0].TechSheetNo);
            TemplateString = TemplateString.Replace("##ExtentofCoverageValue##", _MPJobDescriptionDetails[0].ExtentofCoverage);
            TemplateString = TemplateString.Replace("##SurfaceTemperatureValue##", _MPJobDescriptionDetails[0].SurfaceTemperature);
            TemplateString = TemplateString.Replace("##ConsumablesTypeText##", _MPJobDescriptionDetails[0].ConsumablesType);
            TemplateString = TemplateString.Replace("##MTTechniqueValue##", _MPJobDescriptionDetails[0].TechniqueId);
            TemplateString = TemplateString.Replace("##DirectionofMagnetizationValue##", _MPJobDescriptionDetails[0].Direction);
            TemplateString = TemplateString.Replace("##DirectionMagnetizationValue##", _MPJobDescriptionDetails[0].DirectionMagnetization);
            TemplateString = TemplateString.Replace("##MagnetizationCurrentValue##", _MPJobDescriptionDetails[0].MagnetizationCurrent);
            TemplateString = TemplateString.Replace("##DetectionMediaValue##", _MPJobDescriptionDetails[0].DetectionMedia);
            TemplateString = TemplateString.Replace("##ConcentrationValue##", _MPJobDescriptionDetails[0].Concentration);
            TemplateString = TemplateString.Replace("##IlluminanceValue##", _MPJobDescriptionDetails[0].Illuminance);
            TemplateString = TemplateString.Replace("##ContrastPaintValue##", _MPJobDescriptionDetails[0].ContrastPaint);
            TemplateString = TemplateString.Replace("##DemagnetizingValue##", _MPJobDescriptionDetails[0].Demagnetizing);
            TemplateString = TemplateString.Replace("##EquipmentValue##", _MPJobDescriptionDetails[0].Equipment);
            TemplateString = TemplateString.Replace("##CalibrationStatusValue##", _MPJobDescriptionDetails[0].CalibrationStatus);
            TemplateString = TemplateString.Replace("##AmperageValue##", _MPJobDescriptionDetails[0].Amperage);
            TemplateString = TemplateString.Replace("##WindingsValue##", _MPJobDescriptionDetails[0].Windings);
            TemplateString = TemplateString.Replace("##SpacingValue##", _MPJobDescriptionDetails[0].Spacing);
            TemplateString = TemplateString.Replace("##BlackLightIntensityValue##", _MPJobDescriptionDetails[0].BlackLightIntensity);
            TemplateString = TemplateString.Replace("##FieldIndicatiorValue##", _MPJobDescriptionDetails[0].FieldIndicator);
            TemplateString = TemplateString.Replace("##FinalCleaningValue##", _MPJobDescriptionDetails[0].FinalCleaning);
            tempReportTemplates.TemplateStrings = TemplateString;
        }
        private void FillBillSummaryDetailData(ref ReportTemplates tempReportTemplates, ReportBillSummary _ReportBillSummary)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;
            
            TemplateString = TemplateString.Replace("##RunningInch##", _ReportBillSummary.RunningInch);
            TemplateString = TemplateString.Replace("##RunningInchAmount##", _ReportBillSummary.RunningInchAmount);
            TemplateString = TemplateString.Replace("##SquareInch##", _ReportBillSummary.SquareInch);
            TemplateString = TemplateString.Replace("##SquareInchAmount##", _ReportBillSummary.SquareInchAmount);

            tempReportTemplates.TemplateStrings = TemplateString;
        }
        private void FillTestResultDetailsData(ref ReportTemplates tempReportTemplates, ref  ReportTemplates tableRowReportTemplates, List<MPTestResultDetail> _MPTestResultDetails)
        {
            string TemplateStrings = tableRowReportTemplates.TemplateStrings;
            StringBuilder s = new StringBuilder();
            s.Clear();
            if (_MPTestResultDetails != null && _MPTestResultDetails.Count > 0)
            {
                foreach (MPTestResultDetail MPTestResultDetail in _MPTestResultDetails)
                {
                    string TemplateString = TemplateStrings;

                    TemplateString = TemplateString.Replace("##Serial##", MPTestResultDetail.Serial);
                    TemplateString = TemplateString.Replace("##JobDescription##", MPTestResultDetail.JobDescription);
                    TemplateString = TemplateString.Replace("##Section##", MPTestResultDetail.Section);
                    TemplateString = TemplateString.Replace("##MagneticDimensionL##", MPTestResultDetail.MagneticDimensionL);
                    TemplateString = TemplateString.Replace("##MagneticDimensionB##", MPTestResultDetail.MagneticDimensionB);
                    TemplateString = TemplateString.Replace("##MagneticDimensionH##", MPTestResultDetail.MagneticDimensionH);
                    TemplateString = TemplateString.Replace("##Observations##", MPTestResultDetail.ObservationsId);
                    TemplateString = TemplateString.Replace("##Result##", MPTestResultDetail.Result);
                    TemplateString = TemplateString.Replace("##SketchReference##", MPTestResultDetail.SketchReference);
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

    }

    public class MPJobDescriptionDetails
    {
        public string ReportId { get; set; }
        public string FabricatorName { get; set; }
        public string SubTestId { get; set; }
        public string Location { get; set; }
        public string ReportNo { get; set; }
        public string ContractNo { get; set; }
        public string ContactPerson { get; set; }

        private DateTime _DateofTesting;
        public DateTime DateofTesting
        { get { return _DateofTesting; } set { _DateofTesting = value; } }
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
        public string JobDescription { get; set; }
        public string Material { get; set; }
        public string Dimension { get; set; }
        public string SurfaceCondition { get; set; }
        public string ReferenceStandard { get; set; }
        public string TestSpecification { get; set; }
        public string AcceptanceCriteria { get; set; }
        public string TechSheetNo { get; set; }
        public string ExtentofCoverage { get; set; }
        public string SurfaceTemperature { get; set; }
        public string ConsumablesType { get; set; }
        public string TechniqueId { get; set; }
        public string Direction { get; set; }
        public string DirectionMagnetization { get; set; }
        public string MagnetizationCurrent { get; set; }
        public string DetectionMedia { get; set; }
        public string Concentration { get; set; }
        public string Illuminance { get; set; }
        public string ContrastPaint { get; set; }
        public string Demagnetizing { get; set; }
        public string Equipment { get; set; }
        public string CalibrationStatus { get; set; }
        public string Amperage { get; set; }
        public string Windings { get; set; }
        public string Spacing { get; set; }
        public string BlackLightIntensity { get; set; }
        public string FieldIndicator { get; set; }
        public string FinalCleaning { get; set; }
    }
}