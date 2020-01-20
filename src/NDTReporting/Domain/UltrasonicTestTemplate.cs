using System;
using System.Collections.Generic;

namespace NDTReporting.Domain
{
    [Serializable]
    public class UltrasonicTestTemplate
    {
        public UltrasonicTest UltrasonicTest { get; set; }
        public List<UltrasonicTestResults> UltrasonicTestResults { get; set; }
    }
}