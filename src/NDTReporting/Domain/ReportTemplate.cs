using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using NDTReporting.Common;
using System.Data;

namespace NDTReporting.Domain
{
    /// <summary>
    /// DataBase Communications and Data Modeling Responsibilities Here
    /// </summary>
    public class ReportTemplateOperations
    {
        #region Private Properties
        private SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        private SqlCommand _cmd;
        #endregion

        #region Public Properties
        private ReportTemplate _ReportTemplate;
        #endregion

        #region Constructor
        public ReportTemplateOperations()
        {
            _ReportTemplate = new ReportTemplate();
        }
        #endregion

        #region Public Methods
        public ReportTemplate GetRadiographicWeldReportTemplate(ReportTemplate _ReportTemplateReq)
        {
            ReportTemplate _ReportTemplateResp = new ReportTemplate();
            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                _cmd.CommandText = "NDTUAT.prc_GetReportTemplateByClientIDAndReportID";
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.Add(new SqlParameter("@CustomReportTemplateId", _ReportTemplateReq.CustomReportTemplateId));
                _cmd.Parameters.Add(new SqlParameter("@ReportId", _ReportTemplateReq.ReportId));

                SqlDataReader _Reader = _cmd.ExecuteReader();
                while (_Reader.Read())
                {
                    _ReportTemplateResp.SubTestId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["SubTestId"]);
                    _ReportTemplateResp.ReportId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["ClientId"]);
                    _ReportTemplateResp.CustomReportTemplateId = ConversionHandler.Instance.ConvertTo<Int32>(_Reader["CustomReportTemplateId"].ToString());
                    _ReportTemplateResp.Templates.Add(
                        new ReportTemplates(
                            ConversionHandler.Instance.ConvertTo<int>(_Reader["SectionsID"]),
                            ConversionHandler.Instance.ConvertTo<string>(_Reader["Section"]),
                            ConversionHandler.Instance.ConvertTo<string>(_Reader["ReportTemplate"])
                        ));
                }
            }, (m, e) =>
            {
                throw e;
            },
            _closeDBConnection
            );

            return _ReportTemplateResp;
        }
        public string SaveTemplateByReportID(ReportTemplate _ReportTemplate)
        {
            HandleError.HandleInternalError(() =>
            {
                _openDBConnection();
                //TODO: KTR - Replace with an SP here
                _cmd.CommandText = "UPDATE NDTUAT.ReportTemplates SET ReportTemplate=@ReportTemplate WHERE ID = @ID";
                _cmd.Parameters.Add(new SqlParameter("@ID", _ReportTemplate.CustomReportTemplateId));
                //TODO: KTR*** - Fix Template Collection
                _cmd.ExecuteNonQuery();

            }, (m, e) =>
            {
                _logException(m, e);
                throw e;
            },
            _closeDBConnection
            );

            return "Saved Sucessfully";
        }
        #endregion

        #region Private Methods
        private void _openDBConnection()
        {
            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            _cmd = _con.CreateCommand();
        }
        private void _closeDBConnection()
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();
        }
        private void _logException(string message, Exception ex)
        {
            HandleError.LogAppError(message, ex);
        }
        #endregion
    }

    public class ReportTemplate
    {
        #region Public Properties
        public int CustomReportTemplateId { get; set; }
        public int SubTestId { get; set; }
        public int ClientId { get; set; }
        public int ReportId { get; set; }
        public string TemplateName { get; set; }
        public List<ReportTemplates> Templates { get; set; }
        #endregion

        #region Constructors
        public ReportTemplate()
        {
            this.Templates = new List<ReportTemplates>();
        }
        #endregion
    }

    public class ReportTemplateWithData
    {
        #region Public Properties
        public int CustomReportTemplateId { get; set; }
        public int ReportId { get; set; }
        public List<ReportTemplates> Templates { get; set; }
        #endregion

        #region Constructors
        public ReportTemplateWithData()
        {
            this.Templates = new List<ReportTemplates>();
        }
        #endregion
    }

    [Serializable]
    public class ReportTemplates
    {
        #region Public Properties
        public int SectionsID { get; set; }
        public string Sections { get; set; }
        public string TemplateStrings { get; set; }
        #endregion


        #region Constructors
        public ReportTemplates()
        {
        }
        public ReportTemplates(int SectionsID, string Sections, string TemplateStrings)
        {
            this.SectionsID = SectionsID;
            this.Sections = Sections;
            this.TemplateStrings = TemplateStrings;
        }
        #endregion
    }
}