using System;
using System.Globalization;
namespace NDTReporting.Domain
{
    [Serializable]
    public class RadiographicWeld
    {
        private int _ReportID = 0;
        public int ReportID
        { get { return _ReportID; } set { _ReportID = value; } }
        private string _Client = string.Empty;
        public string Client
        { get { return _Client; } set { _Client = value; } }
        private int _SubTestId = 0;
        public int SubTestId
        { get { return _SubTestId; } set { _SubTestId = value; } }
        private string _Location = string.Empty;
        public string Location
        { get { return _Location; } set { _Location = value; } }
        private string _ContractNumber = string.Empty;
        public string ContractNumber { get { return _ContractNumber; } set { _ContractNumber = value; } }
        private string _ContactPerson = string.Empty;
        public string ContactPerson
        { get { return _ContactPerson; } set { _ContactPerson = value; } }
        private string _ContactNumber = string.Empty;
        public string ContactNumber
        { get { return _ContactNumber; } set { _ContactNumber = value; } }
        private string _TestReportNumber = string.Empty;
        public string TestReportNumber
        { get { return _TestReportNumber; } set { _TestReportNumber = value; } }
        private string _JobDescription = string.Empty;
        public string JobDescription
        { get { return _JobDescription; } set { _JobDescription = value; } }
        private string _Code = string.Empty;
        public string Code
        { get { return _Code; } set { _Code = value; } }
        private string _Identification = string.Empty;
        public string Identification
        { get { return _Identification; } set { _Identification = value; } }
        private int _RadiationSourceId = 0;
        public int RadiationSourceId
        { get { return _RadiationSourceId; } set { _RadiationSourceId = value; } }
        private int _FilmMakeAndTypeId = 0;
        public int FilmMakeAndTypeId
        { get { return _FilmMakeAndTypeId; } set { _FilmMakeAndTypeId = value; } }
        private string _FilmMakeAndTypeShortName = string.Empty;
        public string FilmMakeAndTypeShortName
        { get { return _FilmMakeAndTypeShortName; } set { _FilmMakeAndTypeShortName = value; } }
        private string _TypeofIQI = string.Empty;
        public string TypeofIQI
        { get { return _TypeofIQI; } set { _TypeofIQI = value; } }
        private string _IQIBatchNo = string.Empty;
        public string IQIBatchNo
        { get { return _IQIBatchNo; } set { _IQIBatchNo = value; } }
        private string _GeometricalUnsharpness = string.Empty;
        public string GeometricalUnsharpness
        { get { return _GeometricalUnsharpness; } set { _GeometricalUnsharpness = value; } }
        private int _TechniqueId = 0;
        public int TechniqueId
        { get { return _TechniqueId; } set { _TechniqueId = value; } }
        private string _TechniqueShortName = string.Empty;
        public string TechniqueShortName
        { get { return _TechniqueShortName; } set { _TechniqueShortName = value; } }
        private string _ShimThickness = string.Empty;
        public string ShimThickness
        { get { return _ShimThickness; } set { _ShimThickness = value; } }
        private string _DensitometerNo = string.Empty;
        public string DensitometerNo
        { get { return _DensitometerNo; } set { _DensitometerNo = value; } }
        private string _MaterialSpecification = string.Empty;
        public string MaterialSpecification
        { get { return _MaterialSpecification; } set { _MaterialSpecification = value; } }
        private string _SurfaceCondition = string.Empty;
        public string SurfaceCondition
        { get { return _SurfaceCondition; } set { _SurfaceCondition = value; } }
        private string _SurfaceTemperature = string.Empty;
        public string SurfaceTemperature
        { get { return _SurfaceTemperature; } set { _SurfaceTemperature = value; } }
        private string _ExtentofExamination = string.Empty;
        public string ExtentofExamination
        { get { return _ExtentofExamination; } set { _ExtentofExamination = value; } }
        private string _Dimension = string.Empty;
        public string Dimension
        { get { return _Dimension; } set { _Dimension = value; } }
        private string _SFD = string.Empty;
        public string SFD
        { get { return _SFD; } set { _SFD = value; } }
        private string _WeldingMethod = string.Empty;
        public string WeldingMethod
        { get { return _WeldingMethod; } set { _WeldingMethod = value; } }
        private string _WeldThickness = string.Empty;
        public string WeldThickness
        { get { return _WeldThickness; } set { _WeldThickness = value; } }
        private string _WeldPreparation = string.Empty;
        public string WeldPreparation
        { get { return _WeldPreparation; } set { _WeldPreparation = value; } }
        private string _StageofExamination = string.Empty;
        public string StageofExamination
        { get { return _StageofExamination; } set { _StageofExamination = value; } }
        private string _ExposureTime = string.Empty;
        public string ExposureTime
        { get { return _ExposureTime; } set { _ExposureTime = value; } }
        private string _RemarksShortName = string.Empty;
        public string RemarksShortName
        { get { return _RemarksShortName; } set { _RemarksShortName = value; } }
        private int _RemarksId = 0;
        public int RemarksId
        { get { return _RemarksId; } set { _RemarksId = value; } }
        private string _ObservationsShortName = string.Empty;
        public string ObservationsShortName
        { get { return _ObservationsShortName; } set { _ObservationsShortName = value; } }
        private int _ObservationsId = 0;
        public int ObservationsId
        { get { return _ObservationsId; } set { _ObservationsId = value; } }
        private DateTime? _TestDate = null;
        public DateTime? TestDate
        { get { return _TestDate; } set { _TestDate = value; } }
        public string TestDateString
        {
            get
            {
                if (null != _TestDate)
                {
                    return _TestDate.Value.ToString("dd/MM/yyyy");
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
                    _TestDate = t;
                }
            }
        }
        private DateTime? _CalibrationDate = null;
        public DateTime? CalibrationDate
        { get { return _CalibrationDate; } set { _CalibrationDate = value; } }
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
        private string _FocalSpotSize = string.Empty;
        public string FocalSpotSize
        { get { return _FocalSpotSize; } set { _FocalSpotSize = value; } }

        private string _UnitofEnergy = string.Empty;
        public string UnitofEnergy
        { get { return _UnitofEnergy; } set { _UnitofEnergy = value; } }


        private string _ReferenceStandard = string.Empty;
        public string ReferenceStandard
        { get { return _ReferenceStandard; } set { _ReferenceStandard= value; } }

        private string _TestSpecification = string.Empty;
        public string TestSpecification
        { get { return _TestSpecification; } set { _TestSpecification = value; } }

        private string _AcceptanceCriteria = string.Empty;
        public string AcceptanceCriteria
        { get { return _AcceptanceCriteria; } set { _AcceptanceCriteria = value; } }

        private string _TechSheetNo = string.Empty;
        public string TechSheetNo
        { get { return _TechSheetNo; } set { _TechSheetNo = value; } }

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