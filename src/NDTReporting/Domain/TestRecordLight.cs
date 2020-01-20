using System;

namespace NDTReporting.Domain
{
    [Serializable]
    public class TestRecordLight
    {
        private int _ReportId = 0;
        public int ReportId { get { return _ReportId; } set { _ReportId = value; } }

        private string _ReportNo = string.Empty;
        public string ReportNo { get { return _ReportNo; } set { _ReportNo = value; } }

        private string _FabricatorName = string.Empty;
        public string FabricatorName { get { return _FabricatorName; } set { _FabricatorName = value; } }

        private string _ContactPerson = string.Empty;
        public string ContactPerson { get { return _ContactPerson; } set { _ContactPerson = value; } }

        private string _ContractNo = string.Empty;
        public string ContractNo { get { return _ContractNo; } set { _ContractNo = value; } }

        private string _DateofTestingString = string.Empty;
        public string DateofTestingString { get { return _DateofTestingString; } set { _DateofTestingString = value; } }

        private string _Location = string.Empty;
        public string Location { get { return _Location; } set { _Location = value; } }

        public bool IsAuthorized { get; set; }
    }
}