namespace NDTReporting.Domain
{
    public class MPTestResultDetail
    {
        public string TestId { get; set; }
        public string ReportId { get; set; }
        public string Serial { get; set; }
        public string JobDescription { get; set; }
        public string Section { get; set; }
        public string MagneticDimensionL { get; set; }
        public string MagneticDimensionB { get; set; }
        public string MagneticDimensionH { get; set; }
        public string ObservationsId { get; set; }
        public string Result { get; set; }
        public string SketchReference { get; set; }
    }
}