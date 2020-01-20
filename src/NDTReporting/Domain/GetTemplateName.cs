using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class GetTemplateName 
    {
        private SqlConnection _con = new SqlConnection(Connections.GetConnectionString());
     
        public List<getTemplateName> GetRadiographicWeldReportById(int ReportId)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
               
                _cmd.CommandText = "NDTUAT.prc_getclientId";
                _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                _cmd.Parameters.Add(new SqlParameter("@ReportId",ReportId));
                SqlDataReader _Reader = _cmd.ExecuteReader();

                List<getTemplateName> _template = new List<getTemplateName>();
                getTemplateName _templatename = null;
                while (_Reader.Read())
                {
                    _templatename = new getTemplateName();
                    _templatename.Id = Convert.ToInt32(_Reader["ID"].ToString());
                    _templatename.SubTestId = Convert.ToInt32(_Reader["SubTestId"].ToString());
                    _templatename.ReportTemplateName = Convert.ToString(_Reader["ReportTemplateName"].ToString());
                    _templatename.ReportTemplate = Convert.ToString(_Reader["ReportTemplate"].ToString());
                    _templatename.SectionId = Convert.ToInt32(_Reader["SectionsID"].ToString());
                    _templatename.ClientId = Convert.ToInt32(_Reader["ClientID"].ToString());
                    _template.Add(_templatename);
                }
                return _template;
            }
            catch 
            {
                throw ;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }
        public string UpdateCustomTemplate(getTemplateName _editTemplate)
        {
            string sCommand, ReturnString = "An error occurred while executing InsertCustomTemplate routine.";

            if (_editTemplate.ClientId == 0)
            {
                sCommand = null;
            }
            else
            {
                sCommand = "UPDATE NDTUAT.CustomReportTemplates set SubTestId=@SubTestId ,ReportTemplateName=@ReportTemplateName,ReportTemplate=@ReportTemplate where ClientId = @ClientId and SectionsID=@SectionsId ";
            }
            foreach (ReportTemplates _T in _editTemplate.ReportTemplates)
            {
                try
                {
                    if (_con.State != System.Data.ConnectionState.Open)
                        _con.Open();

                    SqlCommand _cmd = _con.CreateCommand();
                    _cmd.CommandText = sCommand;
                    _cmd.Parameters.Add(new SqlParameter("@Id", _editTemplate.Id));
                    _cmd.Parameters.Add(new SqlParameter("@SubTestId", _editTemplate.SubTestId));
                    _cmd.Parameters.Add(new SqlParameter("@ReportTemplateName", _editTemplate.ReportTemplateName));
                    _cmd.Parameters.Add(new SqlParameter("@ReportTemplate", _T.TemplateStrings));
                    _cmd.Parameters.Add(new SqlParameter("@SectionsId", _T.SectionsID));
                    _cmd.Parameters.Add(new SqlParameter("@ClientId", _editTemplate.ClientId));

                    int reportId = Convert.ToInt32(_cmd.ExecuteScalar());

                    if (reportId > 0)
                    {
                        ReturnString = "Record Sucessfully Updated";
                    }
                    else
                        ReturnString = "Record not Afftected to DataBase";
                }
                catch
                {
                    throw;
                }
                finally
                {
                    if (_con.State != System.Data.ConnectionState.Closed)
                        _con.Close();
                }
            }
            return ReturnString;
        }
        public string deleteRadiographicTemplate(int TemplateId)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();

                _cmd.CommandText = " UPDATE NDTUAT.CustomReportTemplate SET DeletedStatus= 1 where CustomReportTemplateId=@TemplateId";
                _cmd.Parameters.Add(new SqlParameter("@TemplateId", TemplateId));
                if (_cmd.ExecuteNonQuery() > 0)
                    return "Records Sucessfully Delete";
                else
                    return "Records not Afftected to DataBase";
            }
            catch 
            {
                throw;
            }
            finally
            {
                if (_con.State != System.Data.ConnectionState.Closed)
                    _con.Close();
            }
        }
    }
}