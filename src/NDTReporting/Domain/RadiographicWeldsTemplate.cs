using System;
using System.Collections.Generic;

namespace NDTReporting.Domain
{
    [Serializable]
    public class RadiographicWeldsTemplate
    {
        public RadiographicWeld RadiographicWeld { get; set; }
        public List<RadiographicWeldsTestResult> RadiographicWeldsTestResult { get; set; }
        public List<getTemplateName> TemplateName { get; set; }
    }
}