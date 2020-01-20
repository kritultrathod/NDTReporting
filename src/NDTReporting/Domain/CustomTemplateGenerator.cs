using System;
using System.Collections.Generic;

namespace NDTReporting.Domain
{
    [Serializable]
    public class CustomTemplateGenerator
    {

        private int _SubTestId = 0;
        public int SubTestId
        {
            get { return _SubTestId; }
            set { _SubTestId = value; }
        }

        private int _CustomReportTemplateId = 0;
        public int CustomReportTemplateId
        {
            get { return _CustomReportTemplateId; }
            set { _CustomReportTemplateId = value; }
        }

        private int _BaseReportTemplateID = 0;
        public int BaseReportTemplateID
        {
            get { return _BaseReportTemplateID; }
            set { _BaseReportTemplateID = value; }
        }

        private string _ReportTemplateName = string.Empty;
        public string ReportTemplateName
        {
            get { return _ReportTemplateName; }
            set { _ReportTemplateName = value; }
        }

        private List<ReportTemplates> _ReportTemplates = null;
        public List<ReportTemplates> ReportTemplates
        {
            get { return _ReportTemplates; }
            set { _ReportTemplates = value; }
        }

        private int _ClientId = 0;
        public int ClientId
        {
            get { return _ClientId; }
            set { _ClientId = value; }
        }
        
        private int _CreatedBy = 0;
        public int CreatedBy
        {
            get { return _CreatedBy; }
            set { _CreatedBy = value; }
        }
    }
}