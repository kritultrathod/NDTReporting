using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using NDTReporting.Common;
using System.Text;
using System.Globalization;

namespace NDTReporting.Domain
{

    public class LiquidPenetranttestReportViewerHelperOperations
    {
        private SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlConnection _conBillSummary = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlCommand _cmd;
        private SqlCommand _cmdBillSummary;
        private LiquidPenetrantReportViewerHelper _LiquidPenetrantReportViewerHelper;

        public LiquidPenetranttestReportViewerHelperOperations()
        {
            _LiquidPenetrantReportViewerHelper = new LiquidPenetrantReportViewerHelper();
        }

        public ReportTemplate GetLiquidPenetrantTestReport(ReportTemplate _ReportTemplateReq, string ClientId)//int TemplateID, int ReportId)
        {
            //string TemplateString = string.Empty;
            ReportTemplate _ReportTemplateResp = null;

            List<ReportTemplates> TemplatesHolderCollection = new List<ReportTemplates>();
            ReportTemplates tempReportTemplates;
            List<LPJobDescriptionDetails> _LPJobDescriptionDetails = new List<LPJobDescriptionDetails>();
            List<LPTestResultDetail> _LPTestResultDetails = new List<LPTestResultDetail>();
            ReportBillSummary _ReportBillSummary = new ReportBillSummary();

            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                _ReportTemplateResp = new ReportTemplate();

                _cmd.CommandText = "NDTUAT.prc_GetLPTestReportById '" + _ReportTemplateReq.CustomReportTemplateId + "','" + _ReportTemplateReq.ReportId + "'";
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
                    _LPJobDescriptionDetails.Add(
                        new LPJobDescriptionDetails()
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
                            Penetrant = ConversionHandler.Instance.ConvertTo<string>(_Reader["Penetrant"]),
                            PenetrantBatchNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["PenetrantBatchNo"]),
                            ApplicationOfPenetrant = ConversionHandler.Instance.ConvertTo<string>(_Reader["ApplicationOfPenetrant"]),
                            PenetrantRemovalMethod = ConversionHandler.Instance.ConvertTo<string>(_Reader["PenetrantRemovalMethod"]),
                            Developer = ConversionHandler.Instance.ConvertTo<string>(_Reader["Developer"]),
                            DeveloperBatchNo = ConversionHandler.Instance.ConvertTo<string>(_Reader["DeveloperBatchNo"]),
                            ApplicationOfDeveloper = ConversionHandler.Instance.ConvertTo<string>(_Reader["ApplicationOfDeveloper"]),
                            ViewingCondition = ConversionHandler.Instance.ConvertTo<string>(_Reader["ViewingCondition"]),
                            MarkingOfIndication = ConversionHandler.Instance.ConvertTo<string>(_Reader["MarkingOfIndication"]),
                            PreCleaning = ConversionHandler.Instance.ConvertTo<string>(_Reader["PreCleaning"]),
                            DwellTime = ConversionHandler.Instance.ConvertTo<string>(_Reader["DwellTime"]),
                            DryingTime = ConversionHandler.Instance.ConvertTo<string>(_Reader["DryingTime"]),
                            BlackLightDetails = ConversionHandler.Instance.ConvertTo<string>(_Reader["BlackLightDetails"]),
                            FinalClearing = ConversionHandler.Instance.ConvertTo<string>(_Reader["FinalClearing"])
                        }
                    );
                }

                _Reader.NextResult();
                while (_Reader.Read())// RadiographicWeld = JobDescription Details //02 Set report data in the template
                {
                    _LPTestResultDetails.Add(
                        new LPTestResultDetail()
                        {
                            Serial = ConversionHandler.Instance.ConvertTo<string>(_Reader["Serial"]),
                            TestId = ConversionHandler.Instance.ConvertTo<string>(_Reader["TestId"]),
                            ReportId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportId"]),
                            JobDescription = ConversionHandler.Instance.ConvertTo<string>(_Reader["JobDescription"]),
                            LiquidQuantityX = ConversionHandler.Instance.ConvertTo<string>(_Reader["LiquidQuantityX"]),
                            LiquidQuantityY = ConversionHandler.Instance.ConvertTo<string>(_Reader["LiquidQuantityY"]),
                            ObservationsId = ConversionHandler.Instance.ConvertTo<string>(_Reader["ObservationsShortName"]),
                            Result = ConversionHandler.Instance.ConvertTo<string>(_Reader["Remarks"]),
                            SketchReference = ConversionHandler.Instance.ConvertTo<string>(_Reader["SketchReference"])

                        });
                }

                //Fillup the testc Results
                BillSummaryRepository billRepo = new BillSummaryRepository();
                billRepo.GetReportSummaryData(ClientId, _ReportBillSummary
                    , "NDTUAT.prc_GetLiquidPenetrantReportALLSummaryBillingByReportID", _ReportTemplateReq.ReportId, _cmdBillSummary);
                
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

                    FillReportDetailData(ref tempReportTemplates, _LPJobDescriptionDetails);
                    FillBillSummaryDetailData(ref tempReportTemplates, _ReportBillSummary);
                }
                ReportTemplates rowReportTemplates = TemplatesHolderCollection.Where(x => x.SectionsID == 2).FirstOrDefault();
                FillTestResultDetailsData(ref tempReportTemplates, ref rowReportTemplates, _LPTestResultDetails);


                //to uncomment
                _ReportTemplateResp.Templates.Add(tempReportTemplates);
            }
            return _ReportTemplateResp;
        }

        private void FillReportDetailData(ref ReportTemplates tempReportTemplates, List<LPJobDescriptionDetails> _LPJobDescriptionDetails)
        {
            string TemplateString = tempReportTemplates.TemplateStrings;
            //Will be always single record Detail
            if (_LPJobDescriptionDetails.Count > 1)
            {
                throw new Exception("There are multiple Reference Documents Details records for given reuest");
            }
            TemplateString = TemplateString.Replace("##ReportId##", _LPJobDescriptionDetails[0].ReportId);
            TemplateString = TemplateString.Replace("##CustomersNameValue##", _LPJobDescriptionDetails[0].FabricatorName);
            TemplateString = TemplateString.Replace("##SubTestIdValue##", _LPJobDescriptionDetails[0].SubTestId);
            TemplateString = TemplateString.Replace("##LocationValue##", _LPJobDescriptionDetails[0].Location);
            TemplateString = TemplateString.Replace("##ReportNoValue##", _LPJobDescriptionDetails[0].ReportNo);
            TemplateString = TemplateString.Replace("##ContractNoValue##", _LPJobDescriptionDetails[0].ContractNo);
            TemplateString = TemplateString.Replace("##ContactPersonValue##", _LPJobDescriptionDetails[0].ContactPerson);
            TemplateString = TemplateString.Replace("##DateOfTestingValue##", _LPJobDescriptionDetails[0].DateofTestingString);
            TemplateString = TemplateString.Replace("##JobDescriptionValue##", _LPJobDescriptionDetails[0].JobDescription);
            TemplateString = TemplateString.Replace("##MaterialValue##", _LPJobDescriptionDetails[0].Material);
            TemplateString = TemplateString.Replace("##DimensionValue##", _LPJobDescriptionDetails[0].Dimension);
            TemplateString = TemplateString.Replace("##SurfaceConditionValue##", _LPJobDescriptionDetails[0].SurfaceCondition);
            TemplateString = TemplateString.Replace("##ReferenceCodeValue##", _LPJobDescriptionDetails[0].ReferenceStandard);
            TemplateString = TemplateString.Replace("##TestSpecificationValue##", _LPJobDescriptionDetails[0].TestSpecification);
            TemplateString = TemplateString.Replace("##AcceptanceCriteriaValue##", _LPJobDescriptionDetails[0].AcceptanceCriteria);
            TemplateString = TemplateString.Replace("##ProcedureValue##", _LPJobDescriptionDetails[0].TechSheetNo);
            TemplateString = TemplateString.Replace("##ExtentofCoverageValue##", _LPJobDescriptionDetails[0].ExtentofCoverage);
            TemplateString = TemplateString.Replace("##SurfaceTemperatureValue##", _LPJobDescriptionDetails[0].SurfaceTemperature);
            TemplateString = TemplateString.Replace("##ConsumablesTypeText##", _LPJobDescriptionDetails[0].ConsumablesType);
            TemplateString = TemplateString.Replace("##LPTTechniqueValue##", _LPJobDescriptionDetails[0].TechniqueId);
            TemplateString = TemplateString.Replace("##PenetrantValue##", _LPJobDescriptionDetails[0].Penetrant);
            TemplateString = TemplateString.Replace("##PBatchNoValue##", _LPJobDescriptionDetails[0].PenetrantBatchNo);
            TemplateString = TemplateString.Replace("##ApplicationOfPenetrantValue##", _LPJobDescriptionDetails[0].ApplicationOfPenetrant);
            TemplateString = TemplateString.Replace("##PenetrantRemovalMethodValue##", _LPJobDescriptionDetails[0].PenetrantRemovalMethod);
            TemplateString = TemplateString.Replace("##DeveloperValue##", _LPJobDescriptionDetails[0].Developer);
            TemplateString = TemplateString.Replace("##DBatchNoValue##", _LPJobDescriptionDetails[0].DeveloperBatchNo);
            TemplateString = TemplateString.Replace("##ApplicationOfDeveloperValue##", _LPJobDescriptionDetails[0].ApplicationOfDeveloper);
            TemplateString = TemplateString.Replace("##ViewingConditionValue##", _LPJobDescriptionDetails[0].ViewingCondition);
            TemplateString = TemplateString.Replace("##MarkingOfIndicationValue##", _LPJobDescriptionDetails[0].MarkingOfIndication);
            TemplateString = TemplateString.Replace("##PreCleaningValue##", _LPJobDescriptionDetails[0].PreCleaning);
            TemplateString = TemplateString.Replace("##DwellTimeValue##", _LPJobDescriptionDetails[0].DwellTime);
            TemplateString = TemplateString.Replace("##DryingTimeValue##", _LPJobDescriptionDetails[0].DryingTime);
            TemplateString = TemplateString.Replace("##BlackLightDetailsValue##", _LPJobDescriptionDetails[0].BlackLightDetails);
            TemplateString = TemplateString.Replace("##FinalClearingValue##", _LPJobDescriptionDetails[0].FinalClearing);
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
        private void FillTestResultDetailsData(ref ReportTemplates tempReportTemplates, ref  ReportTemplates tableRowReportTemplates, List<LPTestResultDetail> _LPTestResultDetails)
        {
            string TemplateStrings = tableRowReportTemplates.TemplateStrings;
            StringBuilder s = new StringBuilder();
            s.Clear();
            if (_LPTestResultDetails != null && _LPTestResultDetails.Count > 0)
            {
                foreach (LPTestResultDetail LPTestResultDetail in _LPTestResultDetails)
                {
                    string TemplateString = TemplateStrings;

                    TemplateString = TemplateString.Replace("##Serial##", LPTestResultDetail.Serial);
                    TemplateString = TemplateString.Replace("##JobDescription##", LPTestResultDetail.JobDescription);
                    TemplateString = TemplateString.Replace("##LiquidQuantityX##", LPTestResultDetail.LiquidQuantityX);
                    TemplateString = TemplateString.Replace("##LiquidQuantityY##", LPTestResultDetail.LiquidQuantityY);
                    TemplateString = TemplateString.Replace("##Observations##", LPTestResultDetail.ObservationsId);
                    TemplateString = TemplateString.Replace("##Result##", LPTestResultDetail.Result);
                    TemplateString = TemplateString.Replace("##SketchReference##", LPTestResultDetail.SketchReference);
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
    public class LiquidPenetrantReportViewerHelper
    {
        public int ReportTemplateID { get; set; }
        public int ClientId { get; set; }
        public int ReportId { get; set; }
        public string TemplateString { get; set; }

    }

    public class LPTestResultDetail
    {
        public string TestId { get; set; }
        public string ReportId { get; set; }
        public string Serial { get; set; }
        public string JobDescription { get; set; }
        public string LiquidQuantityX { get; set; }
        public string LiquidQuantityY { get; set; }
        public string ObservationsId { get; set; }
        public string Result { get; set; }
        public string SketchReference { get; set; }
    }

    public class LPJobDescriptionDetails
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
        public string Penetrant { get; set; }
        public string PenetrantBatchNo { get; set; }
        public string ApplicationOfPenetrant { get; set; }
        public string PenetrantRemovalMethod { get; set; }
        public string Developer { get; set; }
        public string DeveloperBatchNo { get; set; }
        public string ApplicationOfDeveloper { get; set; }
        public string ViewingCondition { get; set; }
        public string MarkingOfIndication { get; set; }
        public string PreCleaning { get; set; }
        public string DwellTime { get; set; }
        public string DryingTime { get; set; }
        public string BlackLightDetails { get; set; }
        public string FinalClearing { get; set; }
    }
}