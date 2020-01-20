using System;
using System.Collections.Generic;

namespace NDTReporting.Domain
{
    [Serializable]
    public class MagneticParticleTestTemplate
    {
        public MagneticParticleTest MagneticParticleTest { get; set; }
        public List<MagneticParticleTestResults> MagneticParticleTestResults { get; set; }
    }
}