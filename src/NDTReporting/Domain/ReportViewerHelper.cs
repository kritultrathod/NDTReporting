using System;
using System.Globalization;

namespace NDTReporting.Domain
{
    public class ReportViewerHelper
    {
        #region Public Properties
        public int ReportTemplateID { get; set; }
        public int ClientId { get; set; }
        public int ReportId { get; set; }
        public string TemplateString { get; set; }
        #endregion
    }
    public class JobDescriptionDetails
    {
        #region Public Properties
        public string ReportId { get; set; }
        public string Client { get; set; }
        public string ReportNo { get; set; }
        public string Location { get; set; }
        public string Description { get; set; }

        private DateTime _TestDate;
        public DateTime TestDate
        {
            get { return _TestDate; }
            set { _TestDate = value; }
        }

        public string TestDateString
        {
            get
            {
                return _TestDate.ToString("dd/MM/yyyy");
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
                    _TestDate = t;
                }
            }
        }

        public string ContactPerson1 { get; set; }
        public string ContractNo { get; set; }
        public string ContactPerson { get; set; }
        public string TypeofSource { get; set; }
        public string UnitofEnergy { get; set; }
        public string Identification { get; set; }
        public string FocalSpotSize { get; set; }

        public string FilmMakeAndType { get; set; }
        public string TypeofIQI { get; set; }
        public string IQIBatchNo { get; set; }
        public string TechniqueName { get; set; }
        public string ShimThickness { get; set; }
        public string DensitometerNo { get; set; }
        private DateTime? _CalibrationDate = DateTime.Now;
        public DateTime? CalibrationDate
        {
            get { return _CalibrationDate; }
            set { _CalibrationDate = value; }
        }

        public string CalibrationDateString
        {
            get
            {
                if (null != _CalibrationDate)
                {
                    return _CalibrationDate.Value.ToString("dd/MM/yyyy");
                }
                return string.Empty;
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
                    _CalibrationDate = t;
                }
            }
        }
        public string GeometricalUnsharpness { get; set; }
        public string MaterialSpecification { get; set; }
        public string SurfaceCondition { get; set; }
        public string SurfaceTemperature { get; set; }
        public string ExtentofExamination { get; set; }
        public string Dimension { get; set; }
        public string WeldThickness { get; set; }
        public string WeldPreparation { get; set; }
        public string StageofExamination { get; set; }
        public string SFD { get; set; }
        public string WeldingMethod { get; set; }
        public string ExposureTime { get; set; }

        public string ReferenceStandard { get; set; }
        public string TestSpecification { get; set; }
        public string AcceptanceCriteria { get; set; }
        public string TechSheetNo { get; set; }
        #endregion
    }
    public class TestResultDetail
    {
        public string SrNo { get; set; }
        public string TestId { get; set; }
        public string ReportId { get; set; }
        public string IdentificationNo { get; set; }
        public string JointNo { get; set; }
        public string Welder { get; set; }
        public string Segment { get; set; }
        public string FlimSizeX { get; set; }
        public string FlimSizeY { get; set; }
        public string Density { get; set; }
        public string Sensitivity { get; set; }
        public string Observations { get; set; }
        public string Remarks { get; set; }
    }

    public class ReportBillSummary
    {
        public string RunningInch { get; set; }
        public string RunningInchAmount { get; set; }
        public string SquareInch { get; set; }
        public string SquareInchAmount { get; set; }
    }

    public class TestType
    {
        private int _SubTestId = 0;
        public int SubTestId
        {
            get { return _SubTestId; }
            set { _SubTestId = value; }
        }

        private string _SubTestName = string.Empty;
        public string SubTestName
        {
            get { return _SubTestName; }
            set { _SubTestName = value; }
        }
    }
}
