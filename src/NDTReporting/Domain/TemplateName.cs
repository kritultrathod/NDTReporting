using System;
using System.Collections.Generic;

namespace NDTReporting.Domain
{
     [Serializable]
    public class getTemplateName
    {
        private int _Id = 0;
        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        private int _SubTestId = 0;
        public int SubTestId
        {
            get { return _SubTestId; }
            set { _SubTestId = value; }
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
        private string _ReportTemplate = string.Empty;
        public string ReportTemplate
        {
            get { return _ReportTemplate; }
            set { _ReportTemplate = value; }
        }
        private int _ClientId = 0;
        public int ClientId
        {
            get { return _ClientId; }
            set { _ClientId = value; }
        }

        private int _SectionId = 0;
        public int SectionId
        {
            get { return _SectionId; }
            set { _SectionId = value; }
        }
       
    }
}