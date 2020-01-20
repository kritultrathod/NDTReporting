using System;
using System.Collections.Generic;

namespace NDTReporting.Domain
{
    [Serializable]
    public class SearchTestRecordResp
    {
        #region Public Properties
        public SearchTestRecordReq Req { get; set; }
        public List<TestRecordLight> TestRecordLightList { get; set; }
        public int PageCount { get; set; }
        public int PageIndex { get; set; }
        #endregion

        #region Constructors
        public SearchTestRecordResp()
        {
            Req = new SearchTestRecordReq();
            TestRecordLightList = new List<TestRecordLight>();
            PageCount = 1;
            PageIndex = 1;
        }
        #endregion
    }
}