using System;
using System.Data;
using System.Data.SqlClient;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class BillSummaryRepository
    {
        public void GetReportSummaryData(string ClientId,
                                        ReportBillSummary _ReportBillSummary, string SpName, int reportId, SqlCommand cmdBillSummary)
        {
            //Fillup the testc Results
            cmdBillSummary.CommandText = SpName;
            cmdBillSummary.CommandType = CommandType.StoredProcedure;

            cmdBillSummary.Parameters.Add(new SqlParameter("@ClientID", Convert.ToInt32(ClientId)));
            cmdBillSummary.Parameters.Add(new SqlParameter("@ReportId", reportId));

            SqlDataReader _BillSummaryReader = cmdBillSummary.ExecuteReader();
            while (_BillSummaryReader.Read())
            {
                _ReportBillSummary.RunningInch = ConversionHandler.Instance.ConvertTo<string>(
                    _BillSummaryReader["TotalQuantumOfJobInch"]);
            }
            _BillSummaryReader.NextResult();
            //( Running Inch X Per Unit Rate ) + Per Date Rate = Total 
            while (_BillSummaryReader.Read())
            {
                _ReportBillSummary.RunningInchAmount = " ( " + ConversionHandler.Instance.ConvertTo<string>(
                    _BillSummaryReader["TotalQuantumOfJobInch"]) + " X " + ConversionHandler.Instance.ConvertTo<string>(
                        _BillSummaryReader["PerUnitRate"]) + " ) + " + ConversionHandler.Instance.ConvertTo<string>(
                            _BillSummaryReader["PerDayUnitRate"]) + " = " + ConversionHandler.Instance.ConvertTo<string>(
                                _BillSummaryReader["Total"]);
            }
            _BillSummaryReader.NextResult();
            while (_BillSummaryReader.Read())
            {
                _ReportBillSummary.SquareInch = ConversionHandler.Instance.ConvertTo<string>(
                    _BillSummaryReader["TotalQuantumOfJobSquareInch"]);
            }
            _BillSummaryReader.NextResult();
            while (_BillSummaryReader.Read())
            {
                _ReportBillSummary.SquareInchAmount = " ( " + ConversionHandler.Instance.ConvertTo<string>(
                    _BillSummaryReader["TotalQuantumOfJobSquareInch"]) + " X " + ConversionHandler.Instance.ConvertTo<string>(
                        _BillSummaryReader["PerUnitRate"]) + " ) + " + ConversionHandler.Instance.ConvertTo<string>(
                            _BillSummaryReader["PerDayUnitRate"]) + " = " + ConversionHandler.Instance.ConvertTo<string>(
                                _BillSummaryReader["Total"]);
            }
        }
    }
}