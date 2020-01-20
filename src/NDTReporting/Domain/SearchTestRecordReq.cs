using System;

namespace NDTReporting.Domain
{
    [Serializable]
    public class SearchTestRecordReq
    {
        #region Public Properties
        public int CreatedBy { get; set; }
        public int PageIndex { get; set; }

        public int SortField { get; set; }
        public string SortDir { get; set; }

        public string TestReportNo { get; set; }
        public string Client { get; set; }
        public string Location { get; set; }
        public string ContactPerson { get; set; }
        public string ContractNo { get; set; }

        public string TestDateStartString { get; set; }
        public string TestDateEndString { get; set; }

        public string ReportId { get; set; }
        #endregion

        #region Constructors
        public SearchTestRecordReq()
        {
            CreatedBy = -1;
            PageIndex = -1;
            SortField = 5;
            SortDir = "D";

            ReportId = string.Empty;
            TestReportNo = string.Empty;
            Client = string.Empty;
            Location = string.Empty;
            ContactPerson = string.Empty;
            ContractNo = string.Empty;
            TestDateStartString = string.Empty;
            TestDateEndString = string.Empty;
        }
        #endregion
    }
}