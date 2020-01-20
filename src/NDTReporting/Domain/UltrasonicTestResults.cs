using System;

namespace NDTReporting.Domain
{
    [Serializable]
    public class UltrasonicTestResults
    {
        private int _TestId = 0;
        public int TestId { get { return _TestId; } set { _TestId = value; } }

        private int _ReportId = 0;
        public int ReportId { get { return _ReportId; } set { _ReportId = value; } }

        private int _Serial = 0;
        public int Serial { get { return _Serial; } set { _Serial = value; } }

        private string _JobDescription = string.Empty;
        public string JobDescription { get { return _JobDescription; } set { _JobDescription = value; } }

        private string _Material = string.Empty;
        public string Material { get { return _Material; } set { _Material = value; } }

        private string _UltrasonicQuantityX = string.Empty;
        public string UltrasonicQuantityX { get { return _UltrasonicQuantityX; } set { _UltrasonicQuantityX = value; } }

        private string _UltrasonicQuantityY = string.Empty;
        public string UltrasonicQuantityY { get { return _UltrasonicQuantityY; } set { _UltrasonicQuantityY = value; } }

        private string _Dimension = string.Empty;
        public string Dimension { get { return _Dimension; } set { _Dimension = value; } }

        private int _Length = 0;
        public int Length { get { return _Length; } set { _Length = value; } }

        private int _Depth = 0;
        public int Depth { get { return _Depth; } set { _Depth = value; } }

        private int _ObservationsId = 0;
        public int ObservationsId { get { return _ObservationsId; } set { _ObservationsId = value; } }

        private int _Result = 0;
        public int Result { get { return _Result; } set { _Result = value; } }

        private string _SketchReference = string.Empty;
        public string SketchReference { get { return _SketchReference; } set { _SketchReference = value; } }

        private int _AppId = 0;
        public int AppId { get { return _AppId; } set { _AppId = value; } }

        private int _ClientId = 0;
        public int ClientId { get { return _ClientId; } set { _ClientId = value; } }

        private int _CreatedBy = 0;
        public int CreatedBy { get { return _CreatedBy; } set { _CreatedBy = value; } }

        private DateTime _CreatedDate = DateTime.Now;
        public DateTime CreatedDate { get { return _CreatedDate; } set { _CreatedDate = value; } }

        private int _UpdatedBy = 0;
        public int UpdatedBy { get { return _UpdatedBy; } set { _UpdatedBy = value; } }

        private DateTime _UpdatedDate = DateTime.Now;
        public DateTime UpdatedDate { get { return _UpdatedDate; } set { _UpdatedDate = value; } }

        private int _DeletedStatus = 0;
        public int DeletedStatus { get { return _DeletedStatus; } set { _DeletedStatus = value; } }
    }
}