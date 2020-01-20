using System.Collections;
using NDTReporting.Common;
using NDTReporting.DataLayer;

namespace NDTReporting.Domain
{
    public class DbTemplateGenerator
    {
        string sConnString = Connections.GetConnectionString();
        DALHelper objDalHelper;
        Hashtable hTable = new Hashtable();
        string sQuery = string.Empty;
        //TODO: KTR - Remove all reference to _con

        public string InsertCustomTemplate(CustomTemplateGenerator _P)
        {
            string sQuery, ReturnString = "An error occurred while executing InsertCustomTemplate routine.";
            int CustomReportTemplateId = 0;

            if (_P.CustomReportTemplateId == 0) // This is a check for Insert of record.
            {
                HandleError.HandleInternalError(() =>
                {

                    hTable.Clear();
                    hTable.Add("@SubTestId", _P.SubTestId);
                    hTable.Add("@BaseReportTemplateId", _P.BaseReportTemplateID);
                    hTable.Add("@TemplateName", _P.ReportTemplateName);
                    hTable.Add("@AppID", 1);
                    hTable.Add("@ClientId", _P.ClientId);
                    hTable.Add("@CreatedBy", _P.CreatedBy);

                    using (objDalHelper = new DALHelper(sConnString))
                    {
                        sQuery = "[NDTUAT].[prc_InsertCustomReportTemplate]";
                        CustomReportTemplateId = ConversionHandler.Instance.ConvertTo<int>(objDalHelper.GetExecuteSave(sQuery, hTable));
                    }

                    foreach (ReportTemplates _T in _P.ReportTemplates)
                    {
                        hTable.Clear();
                        hTable.Add("@CustomReportTemplateId", CustomReportTemplateId);
                        hTable.Add("@ReportTemplate", _T.TemplateStrings);
                        hTable.Add("@SectionsID", _T.SectionsID);
                        hTable.Add("@AppID", 1);
                        hTable.Add("@ClientId", _P.ClientId);
                        hTable.Add("@CreatedBy", _P.CreatedBy);

                        using (objDalHelper = new DALHelper(sConnString))
                        {
                            sQuery = "[NDTUAT].[prc_InsertCustomReportTemplateDetails]";
                            ConversionHandler.Instance.ConvertTo<int>(objDalHelper.GetExecuteSave(sQuery, hTable));
                        }
                    }
                }, (m, e) =>
                {
                    CustomReportTemplateId = -99;
                    ReturnString = e.Message;
                }); ;
            }
            else //This is a check for Update of records.
            {

                HandleError.HandleInternalError(() =>
                {
                    foreach (ReportTemplates _T in _P.ReportTemplates)
                    {
                        hTable.Clear();

                        hTable.Add("@CustomReportTemplateId", _P.CustomReportTemplateId);
                        hTable.Add("@ReportTemplateName", _P.ReportTemplateName);
                        hTable.Add("@ReportTemplate", _T.TemplateStrings);
                        hTable.Add("@SectionsID", _T.SectionsID);
                        hTable.Add("@UpdatedBy", _P.CreatedBy);

                        using (objDalHelper = new DALHelper(sConnString))
                        {
                            sQuery = "[NDTUAT].[prc_UpdateCustomReportTemplateRecord]";
                            CustomReportTemplateId = ConversionHandler.Instance.ConvertTo<int>(objDalHelper.GetExecuteSave(sQuery, hTable));
                        }
                    }
                }, (m, e) =>
                {
                    CustomReportTemplateId = -99;
                    ReturnString = e.Message;
                }); ;
            }

            if (CustomReportTemplateId > 0)
            {
                ReturnString = "Record Sucessfully Saved";
            }
            else if (CustomReportTemplateId == -99)
            { }
            else
                ReturnString = "Record not Afftected to DataBase";

            return ReturnString;

        }
    }
}