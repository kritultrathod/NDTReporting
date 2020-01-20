using System;
using System.Collections.Generic;

namespace NDTReporting.Domain
{
    [Serializable]
    public class LiquidPenetrantTestTemplate
    {
        public LiquidPenetrantTest LiquidPenetrantTest { get; set; }
        public List<LiquidPenetrantTestResults> LiquidPenetrantTestResults { get; set; }
    }
}