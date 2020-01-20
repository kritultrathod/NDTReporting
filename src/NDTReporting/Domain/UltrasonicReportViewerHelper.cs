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
    public class UltrasonictestReportViewerHelperOperations
    {
        private SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlConnection _conBillSummary = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlCommand _cmd;
        private SqlCommand _cmdBillSummary;

        private UltrasonicReportViewerHelper _UltrasonicReportViewerHelper;

        public UltrasonictestReportViewerHelperOperations()
        {
            _UltrasonicReportViewerHelper = new UltrasonicReportViewerHelper();
        }

        public ReportTemplate GetUltrasonicTestReport(ReportTemplate _ReportTemplateReq, string ClientId)//int TemplateID, int ReportId)
        {
            //string TemplateString = string.Empty;
            ReportTemplate _ReportTemplateResp = null;

            List<ReportTemplates> TemplatesHolderCollection = new List<ReportTemplates>();
            ReportTemplates tempReportTemplates;
            List<UTJobDescriptionDetails> _UTJobDescriptionDetails = new List<UTJobDescriptionDetails>();
            List<UTTestResultDetail> _UTTestResultDetails = new List<UTTestResultDetail>();
            ReportBillSummary _ReportBillSummary = new ReportBillSummary();

            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                _ReportTemplateResp = new ReportTemplate();

                _cmd.CommandText = "NDTUAT.prc_GetUTTestReportById '" + _ReportTemplateReq.CustomReportTemplateId + "','" + _ReportTemplateReq.ReportId + "'";
                _cmd.CommandType = CommandType.Text;
                SqlDataReader _Reader = _cmd.ExecuteReader();

                while (_Reader.Read())// Template
                {
                    //TODO: Write DBNull Check converters and ConvertBack Checks for common Types.
                    _ReportTemplateResp.CustomReportTemplateId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["ID"].ToString());

                    TemplatesHolderCollection.Add(
                        new ReportTemplates(
                                ConversionHandler.Instance.ConvertTo<int>(_Reader["SectionsID"]),
                                ConversionHandler.Instance.ConvertTo<string>(string.Empty),
                                ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportTemplate"])
                                ));
                }
                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _UTJobDescriptionDetails.Add(
                        new UTJobDescriptionDetails()
                        {
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            FabricatorName = ConversionHandler.Instance.ConvertTo<string>(_Reader["FabricatorName"]),
                            Location = ConversionHandler.Instance.ConvertTo<string>(_Reader["Location"]),
                            ReportNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportNo"]),
                            ContractNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContractNo"]),
                            ContactPerson = ConversionHandler.Instance.ConvertTo<string>(_Reader["ContactPerson"]),
                            DateofTesting = ConversionHandler.Instance.ConvertTo<DateTime>(_Reader["DateofTesting"]),
                            Equipment = ConversionHandler.Instance.ConvertTo<string>(_Reader["Equipment"]),
                            CalibrationStatus = ConversionHandler.Instance.ConvertTo<string>(_Reader["CalibrationStatus"]),
                            CouplingMedia = ConversionHandler.Instance.ConvertTo<string>(_Reader["CouplingMedia"]),
                            SurfaceCondition = ConversionHandler.Instance.ConvertTo<string>(_Reader["SurfaceCondition"]),
                            
                            ReferenceStandard = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReferenceStandard"]),
                            TestSpecification = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestSpecification"]),
                            AcceptanceCriteria = ConversionHandler.Instance.ConvertTo<string>(_Reader["AcceptanceCriteria"]),
                            TechSheetNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["TechSheetNo"]),
                            ExtentofCoverage = ConversionHandler.Instance.ConvertTo<string>(_Reader["ExtentofCoverage"]),
                            ConsumablesType = ConversionHandler.Instance.ConvertTo<string>(_Reader["ConsumablesTypeText"]),
                            CalibrationBlock = ConversionHandler.Instance.ConvertTo<string>(_Reader["CalibrationBlock"]),
                            ReferenceBlock = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReferenceBlock"]),
                            SearchUnit = ConversionHandler.Instance.ConvertTo<string>(_Reader["SearchUnit"]),
                            Frequency = ConversionHandler.Instance.ConvertTo<string>(_Reader["Frequency"]),
                            BeamAngle = ConversionHandler.Instance.ConvertTo<string>(_Reader["BeamAngle"]),
                            BeamIndex = ConversionHandler.Instance.ConvertTo<string>(_Reader["BeamIndex"]),
                            MaxBeamPath = ConversionHandler.Instance.ConvertTo<string>(_Reader["MaxBeamPath"]),
                            TimeBaseRange = ConversionHandler.Instance.ConvertTo<string>(_Reader["TimeBaseRange"]),
                            Reflector = ConversionHandler.Instance.ConvertTo<string>(_Reader["Reflector"]),
                            Gain = ConversionHandler.Instance.ConvertTo<string>(_Reader["Gain"]),
                            Correction = ConversionHandler.Instance.ConvertTo<string>(_Reader["Correction"]),
                            Scan = ConversionHandler.Instance.ConvertTo<string>(_Reader["Scan"]),
                            RejectionLevel = ConversionHandler.Instance.ConvertTo<string>(_Reader["RejectionLevel"]),
                            RecordingLevel = ConversionHandler.Instance.ConvertTo<string>(_Reader["RecordingLevel"]),

                        }
                    );
                }
                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _UTTestResultDetails.Add(
                        new UTTestResultDetail()
                        {
                            Serial = ConversionHandler.Instance.ConvertTo<string>(_Reader["Serial"]),
                            TestId = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestId"]),
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            JobDescription = ConversionHandler.Instance.ConvertTo<string>(_Reader["JobDescription"]),
                            Material = ConversionHandler.Instance.ConvertTo<string>(_Reader["Material"]),
                            UltrasonicQuantityX = ConversionHandler.Instance.ConvertTo<string>(_Reader["UltrasonicQuantityX"]),
                            UltrasonicQuantityY = ConversionHandler.Instance.ConvertTo<string>(_Reader["UltrasonicQuantityY"]),
                            Dimension = ConversionHandler.Instance.ConvertTo<string>(_Reader["Dimension"]),
                            ObservationsId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ObservationsShortName"]),
                            Length = ConversionHandler.Instance.ConvertTo<string>(_Reader["Length"]),
                            Depth = ConversionHandler.Instance.ConvertTo<string>(_Reader["Depth"]),
                            Result = ConversionHandler.Instance.ConvertTo<string>(_Reader["Remarks"]),
                            SketchReference = ConversionHandler.Instance.ConvertTo<string>(_Reader["SketchReference"])

                        });
                }

                //Fillup the testc Results
                BillSummaryRepository billRepo = new BillSummaryRepository();
                billRepo.GetReportSummaryData(ClientId, _ReportBillSummary
                    , "NDTUAT.prc_GetUltrasonicReportALLSummaryBillingByReportID", _ReportTemplateReq.ReportId, _cmdBillSummary);

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
                    FillReportDetailData(ref tempReportTemplates, _UTJobDescriptionDetails);
                    FillBillSummaryDetailData(ref tempReportTemplates, _ReportBillSummary);
                }
                ReportTemplates rowReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 2).FirstOrDefault();
                FillTestResultDetailsData(ref tempReportTemplates, ref rowReportTemplates, _UTTestResultDetails);

                _ReportTemplateResp.Templates.Add(tempReportTemplates);
            }
            return _ReportTemplateResp;
        }

        private void FillReportDetailData(ref ReportTemplates tempReportTemplates, List<UTJobDescriptionDetails> _UTJobDescriptionDetails)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;
            //Will be always single record Detail
            if (_UTJobDescriptionDetails.Count > 1)
            {
                throw new Exception("There are multiple Reference Documents Details records for given reuest");
            }
            TemplateString = TemplateString.Replace("##ReportId##", _UTJobDescriptionDetails[0].ReportId);
            TemplateString = TemplateString.Replace("##CustomersNameValue##", _UTJobDescriptionDetails[0].FabricatorName);
            TemplateString = TemplateString.Replace("##SubTestIdValue##", _UTJobDescriptionDetails[0].SubTestId);
            TemplateString = TemplateString.Replace("##LocationValue##", _UTJobDescriptionDetails[0].Location);
            TemplateString = TemplateString.Replace("##ReportNoValue##", _UTJobDescriptionDetails[0].ReportNo);
            TemplateString = TemplateString.Replace("##ContractNoValue##", _UTJobDescriptionDetails[0].ContractNo);
            TemplateString = TemplateString.Replace("##ContactPersonValue##", _UTJobDescriptionDetails[0].ContactPerson);
            TemplateString = TemplateString.Replace("##DateOfTestingValue##", _UTJobDescriptionDetails[0].DateofTestingString);
            TemplateString = TemplateString.Replace("##EquipmentValue##", _UTJobDescriptionDetails[0].Equipment);
            TemplateString = TemplateString.Replace("##CalibrationStatusValue##", _UTJobDescriptionDetails[0].CalibrationStatus);
            TemplateString = TemplateString.Replace("##CouplingMediaValue##", _UTJobDescriptionDetails[0].CouplingMedia);
            TemplateString = TemplateString.Replace("##SurfaceConditionValue##", _UTJobDescriptionDetails[0].SurfaceCondition);
            TemplateString = TemplateString.Replace("##ReferenceCodeValue##", _UTJobDescriptionDetails[0].ReferenceStandard);
            TemplateString = TemplateString.Replace("##TestSpecificationValue##", _UTJobDescriptionDetails[0].TestSpecification);
            TemplateString = TemplateString.Replace("##AcceptanceCriteriaValue##", _UTJobDescriptionDetails[0].AcceptanceCriteria);
            TemplateString = TemplateString.Replace("##ProcedureValue##", _UTJobDescriptionDetails[0].TechSheetNo);
            TemplateString = TemplateString.Replace("##ExtentofCoverageValue##", _UTJobDescriptionDetails[0].ExtentofCoverage);
            TemplateString = TemplateString.Replace("##ConsumablesTypeText##", _UTJobDescriptionDetails[0].ConsumablesType);
            TemplateString = TemplateString.Replace("##CalibrationBlockValue##", _UTJobDescriptionDetails[0].CalibrationBlock);
            TemplateString = TemplateString.Replace("##ReferenceBlockValue##", _UTJobDescriptionDetails[0].ReferenceBlock);
            TemplateString = TemplateString.Replace("##SearchUnitValue##", _UTJobDescriptionDetails[0].SearchUnit);
            TemplateString = TemplateString.Replace("##FrequencyValue##", _UTJobDescriptionDetails[0].Frequency);
            TemplateString = TemplateString.Replace("##BeamAngleValue##", _UTJobDescriptionDetails[0].BeamAngle);
            TemplateString = TemplateString.Replace("##BeamIndexValue##", _UTJobDescriptionDetails[0].BeamIndex);
            TemplateString = TemplateString.Replace("##MaxBeamPathValue##", _UTJobDescriptionDetails[0].MaxBeamPath);
            TemplateString = TemplateString.Replace("##TimeBaseRangeValue##", _UTJobDescriptionDetails[0].TimeBaseRange);
            TemplateString = TemplateString.Replace("##ReflectorValue##", _UTJobDescriptionDetails[0].Reflector);
            TemplateString = TemplateString.Replace("##GainValue##", _UTJobDescriptionDetails[0].Gain);
            TemplateString = TemplateString.Replace("##AddCorrectionValue##", _UTJobDescriptionDetails[0].Correction);
            TemplateString = TemplateString.Replace("##ScanValue##", _UTJobDescriptionDetails[0].Scan);
            TemplateString = TemplateString.Replace("##RejectionLevelValue##", _UTJobDescriptionDetails[0].RejectionLevel);
            TemplateString = TemplateString.Replace("##RecordingLevelValue##", _UTJobDescriptionDetails[0].RecordingLevel);

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
        private void FillTestResultDetailsData(ref ReportTemplates tempReportTemplates, ref  ReportTemplates tableRowReportTemplates, List<UTTestResultDetail> _UTTestResultDetails)
        {
            string TemplateStrings = tableRowReportTemplates.TemplateStrings;
            StringBuilder s = new StringBuilder();
            s.Clear();
            if (_UTTestResultDetails != null && _UTTestResultDetails.Count > 0)
            {
                foreach (UTTestResultDetail UTTestResultDetail in _UTTestResultDetails)
                {
                    string TemplateString = TemplateStrings;

                    TemplateString = TemplateString.Replace("##Serial##", UTTestResultDetail.Serial);
                    TemplateString = TemplateString.Replace("##JobDescription##", UTTestResultDetail.JobDescription);
                    TemplateString = TemplateString.Replace("##Material##", UTTestResultDetail.Material);
                    TemplateString = TemplateString.Replace("##X##", UTTestResultDetail.UltrasonicQuantityX);
                    TemplateString = TemplateString.Replace("##Y##", UTTestResultDetail.UltrasonicQuantityY);
                    TemplateString = TemplateString.Replace("##Dimension##", UTTestResultDetail.Dimension);
                    TemplateString = TemplateString.Replace("##Length##", UTTestResultDetail.Length);
                    TemplateString = TemplateString.Replace("##Depth##", UTTestResultDetail.Depth);
                    TemplateString = TemplateString.Replace("##Observations##", UTTestResultDetail.ObservationsId);
                    TemplateString = TemplateString.Replace("##Result##", UTTestResultDetail.Result);
                    TemplateString = TemplateString.Replace("##SketchReference##", UTTestResultDetail.SketchReference);
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

    public class UltrasonicReportViewerHelper
    {
        public int ReportTemplateID { get; set; }
        public int ClientId { get; set; }
        public int ReportId { get; set; }
        public string TemplateString { get; set; }
    }

    public class UTTestResultDetail
    {
        public string TestId { get; set; }
        public string ReportId { get; set; }
        public string Serial { get; set; }
        public string JobDescription { get; set; }
        public string Material { get; set; }
        public string Dimension { get; set; }
        public string UltrasonicQuantityX { get; set; }
        public string UltrasonicQuantityY { get; set; }
        public string Length { get; set; }
        public string Depth { get; set; }
        public string ObservationsId { get; set; }
        public string Result { get; set; }
        public string SketchReference { get; set; }
    }

    public class UTJobDescriptionDetails
    {
        //private int _ReportId = 0;
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
        public string Equipment { get; set; }
        public string CalibrationStatus { get; set; }
        public string CouplingMedia { get; set; }
        public string SurfaceCondition { get; set; }
        public string ReferenceStandard { get; set; }
        public string TestSpecification { get; set; }
        public string AcceptanceCriteria { get; set; }
        public string TechSheetNo { get; set; }
        public string ExtentofCoverage { get; set; }
        public string ConsumablesType { get; set; }
        public string CalibrationBlock { get; set; }
        public string ReferenceBlock { get; set; }
        public string SearchUnit { get; set; }
        public string Frequency { get; set; }
        public string BeamAngle { get; set; }
        public string BeamIndex { get; set; }
        public string MaxBeamPath { get; set; }
        public string TimeBaseRange { get; set; }
        public string Reflector { get; set; }
        public string Gain { get; set; }
        public string Correction { get; set; }
        public string Scan { get; set; }
        public string RejectionLevel { get; set; }
        public string RecordingLevel { get; set; }
    }
}