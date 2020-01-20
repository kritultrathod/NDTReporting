using System;
using System.Data.SqlClient;
using NDTReporting.Common;

namespace NDTReporting.Domain
{
    public class ExceptionLogger
    {
        private SqlConnection _con = new SqlConnection(Connections.GetConnectionString());

        public void InsertException(string StackTrace, string Message, string InnerException)
        {
            try
            {
                if (_con.State != System.Data.ConnectionState.Open)
                    _con.Open();
                SqlCommand _cmd = _con.CreateCommand();
                _cmd.CommandText = "Insert Into NDTUAT.NdtExceptionLog" +
                    "(StackTrace,Message,InnerException,CreatedBy,CreatedDate,AppID)Values" +
                      "(@StackTrace,@Message,@InnerException,@CreatedBy,@CreatedDate,@AppID) ; ";
                _cmd.Parameters.Add(new SqlParameter("@StackTrace", StackTrace));
                _cmd.Parameters.Add(new SqlParameter("@Message", Message));
                _cmd.Parameters.Add(new SqlParameter("@InnerException",
                                                     string.IsNullOrEmpty(InnerException) ? "N/A" : InnerException.Substring(0, InnerException.Length >= 4000 ? 4000 : InnerException.Length)));
                _cmd.Parameters.Add(new SqlParameter("@CreatedBy", 1));
                _cmd.Parameters.Add(new SqlParameter("@CreatedDate", DateTime.Now));
                _cmd.Parameters.Add(new SqlParameter("@AppID", 1));
                _cmd.ExecuteNonQuery();

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
