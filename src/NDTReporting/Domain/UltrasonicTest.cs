using System;
using System.Globalization;

namespace NDTReporting.Domain
{
    
    [Serializable]
    public class UltrasonicTest
    {
        private int _ReportId = 0;
        public int ReportId { get { return _ReportId; } set { _ReportId = value; } }

        private string _FabricatorName = string.Empty;
        public string FabricatorName { get { return _FabricatorName; } set { _FabricatorName = value; } }

        private int _SubTestId = 0;
        public int SubTestId { get { return _SubTestId; } set { _SubTestId = value; } }

        private string _Location = string.Empty;
        public string Location { get { return _Location; } set { _Location = value; } }

        private string _ReportNo = string.Empty;
        public string ReportNo { get { return _ReportNo; } set { _ReportNo = value; } }

        private string _ContractNo = string.Empty;
        public string ContractNo { get { return _ContractNo; } set { _ContractNo = value; } }

        private string _ContactPerson = string.Empty;
        public string ContactPerson { get { return _ContactPerson; } set { _ContactPerson = value; } }

        private DateTime _DateofTesting = DateTime.Now;
        public DateTime DateofTesting { get { return _DateofTesting; } set { _DateofTesting = value; } }

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

        private string _Equipment = string.Empty;
        public string Equipment { get { return _Equipment; } set { _Equipment = value; } }

        private string _CalibrationStatus = string.Empty;
        public string CalibrationStatus { get { return _CalibrationStatus; } set { _CalibrationStatus = value; } }

        private string _CouplingMedia = string.Empty;
        public string CouplingMedia { get { return _CouplingMedia; } set { _CouplingMedia = value; } }

        private string _SurfaceCondition = string.Empty;
        public string SurfaceCondition { get { return _SurfaceCondition; } set { _SurfaceCondition = value; } }

        private string _ReferenceStandard = string.Empty;
        public string ReferenceStandard { get { return _ReferenceStandard; } set { _ReferenceStandard = value; } }
        
        private string _TestSpecification = string.Empty;
        public string TestSpecification { get { return _TestSpecification; } set { _TestSpecification = value; } }
        
        private string _AcceptanceCriteria = string.Empty;
        public string AcceptanceCriteria { get { return _AcceptanceCriteria; } set { _AcceptanceCriteria = value; } }

        private string _TechSheetNo = string.Empty;
        public string TechSheetNo { get { return _TechSheetNo; } set { _TechSheetNo = value; } }

        private string _ExtentofCoverage = string.Empty;
        public string ExtentofCoverage { get { return _ExtentofCoverage; } set { _ExtentofCoverage = value; } }

        private string _ConsumablesType = string.Empty;
        public string ConsumablesType { get { return _ConsumablesType; } set { _ConsumablesType = value; } }
        private int _ConsumablesTypeId = 0;
        public int ConsumablesTypeId { get { return _ConsumablesTypeId; } set { _ConsumablesTypeId = value; } }
        
        private string _CalibrationBlock = string.Empty;
        public string CalibrationBlock { get { return _CalibrationBlock; } set { _CalibrationBlock = value; } }
        
        private string _ReferenceBlock = string.Empty;
        public string ReferenceBlock { get { return _ReferenceBlock; } set { _ReferenceBlock = value; } }

        private string _SearchUnit = string.Empty;
        public string SearchUnit { get { return _SearchUnit; } set { _SearchUnit = value; } }

        private string _Frequency = string.Empty;
        public string Frequency { get { return _Frequency; } set { _Frequency = value; } }

        private string _BeamAngle = string.Empty;
        public string BeamAngle { get { return _BeamAngle; } set { _BeamAngle = value; } }

        private string _BeamIndex = string.Empty;
        public string BeamIndex { get { return _BeamIndex; } set { _BeamIndex = value; } }

        private string _MaxBeamPath = string.Empty;
        public string MaxBeamPath { get { return _MaxBeamPath; } set { _MaxBeamPath = value; } }

        private string _TimeBaseRange = string.Empty;
        public string TimeBaseRange { get { return _TimeBaseRange; } set { _TimeBaseRange = value; } }

        private string _Reflector = string.Empty;
        public string Reflector { get { return _Reflector; } set { _Reflector = value; } }

        private string _Gain = string.Empty;
        public string Gain { get { return _Gain; } set { _Gain = value; } }

        private string _Correction = string.Empty;
        public string Correction { get { return _Correction; } set { _Correction = value; } }

        private string _Scan = string.Empty;
        public string Scan { get { return _Scan; } set { _Scan = value; } }

        private string _RejectionLevel = string.Empty;
        public string RejectionLevel { get { return _RejectionLevel; } set { _RejectionLevel = value; } }

        private string _RecordingLevel = string.Empty;
        public string RecordingLevel { get { return _RecordingLevel; } set { _RecordingLevel = value; } }
        
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