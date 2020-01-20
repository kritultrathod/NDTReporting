using System;
using System.Data;
using System.Data.SqlClient;
using NDTReporting.BusinessLayer;
using NDTReporting.Common;


namespace NDTReporting.DataLayer
{
    public class dataclass
    {
        SqlConnection _northcon = null;
        SqlDataReader _loginReader = null;
        SqlCommand _loginCMD = null;

        public dataclass()
        {
            _northcon = new SqlConnection(Connections.GetConnectionString());
            _northcon.Open();
        }
        /// <summary>
        /// Validates if mobile number,emailid,securityquestion and securityanswer matches
        /// </summary>
        /// <param name="emailid"></param>
        /// <param name="mobilenumber"></param>
        /// <returns>UserID</returns>
        public int validate(string emailid, string mobilenumber, string securityquestion, string securityanswer)
        {
            try
            {
                int _count;
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "[NDTUAT].[Validate]";
                _loginCMD.Parameters.AddWithValue("@emailid", emailid);
                _loginCMD.Parameters.AddWithValue("@mobilenumber", mobilenumber);
                _loginCMD.Parameters.AddWithValue("@securityquestion", securityquestion);
                _loginCMD.Parameters.AddWithValue("@securityanswer", securityanswer);
                _loginCMD.Connection = _northcon;

                SqlParameter param = new SqlParameter("@userid", Convert.ToInt32(System.Data.SqlDbType.Int));
                param.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(param);
                _loginCMD.ExecuteNonQuery();
                _count = Convert.ToInt32(param.Value);
                return _count;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
        public ReportUser Verify(string emailid, string userpassword)
        {
            ReportUser reportUser = new ReportUser(0, 0);
            try
            {
              
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "[NDTUAT].[Verify]";
                _loginCMD.Parameters.AddWithValue("@emailid", emailid);
                _loginCMD.Parameters.AddWithValue("@userpassword", userpassword);
                _loginCMD.Connection = _northcon;
                SqlParameter param = new SqlParameter("@userid", System.Data.SqlDbType.Int);
                param.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(param);
                SqlParameter isadminparam = new SqlParameter("@isadmin", System.Data.SqlDbType.Int);
                isadminparam.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(isadminparam);
                _loginCMD.ExecuteNonQuery();
                reportUser = new ReportUser(Convert.ToInt32(param.Value), Convert.ToInt32(isadminparam.Value));
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
            return reportUser;
        }
        public bool GetRegistrationDate(businessclass Myuser)
        {
            bool _count = false;
            try
            {
                string str = string.Format("SELECT RegistrationDate FROM [NDTUAT].[Registration] WHERE UserId = " + Myuser.userid);
                _loginCMD = new SqlCommand(str, _northcon);
                _loginReader = _loginCMD.ExecuteReader();
                

                if (_loginReader.Read() && DateTime.Now >= Convert.ToDateTime(_loginReader["registrationdate"]).AddDays(+30))
                {
                    _count = false;
                }
                else
                {
                    _count = true;
                }
                return _count;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
        public int Insert(string emailid, string userpassword, string name, string mobilenumber, DateTime registrationdate, string securityquestion, string securityanswer, int AppId, int clientid)
        {
            try
            {
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "[NDTUAT].[UsersDetail]";
                _loginCMD.Parameters.AddWithValue("@emailid", emailid);
                _loginCMD.Parameters.AddWithValue("@userpassword", userpassword);
                _loginCMD.Parameters.AddWithValue("@name", name);
                _loginCMD.Parameters.AddWithValue("@mobilenumber", mobilenumber);
                _loginCMD.Parameters.AddWithValue("@registrationdate", registrationdate);
                _loginCMD.Parameters.AddWithValue("@securityquestion", securityquestion);
                _loginCMD.Parameters.AddWithValue("@securityanswer", securityanswer);
                _loginCMD.Parameters.AddWithValue("@appid", AppId);
                _loginCMD.Parameters.AddWithValue("@clientid", clientid);
                _loginCMD.Connection = _northcon;
                return _loginCMD.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
        public int check(string emailid)
        {
            try
            {
                int _count;
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "NDTUAT.usercheck";
                _loginCMD.Parameters.AddWithValue("@emailid", emailid);
                _loginCMD.Connection = _northcon;

                SqlParameter param = new SqlParameter("@userid", Convert.ToInt32(System.Data.SqlDbType.Int));
                param.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(param);
                _loginCMD.ExecuteNonQuery();
                _count = Convert.ToInt32(param.Value);
                return _count;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
        public int setids(int i)
        {
            try
            {
                int _count;
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "NDTUAT.getIds";
                _loginCMD.Parameters.AddWithValue("@userid", i);
                _loginCMD.Connection = _northcon;

                SqlParameter param = new SqlParameter("@ClientID", Convert.ToInt32(System.Data.SqlDbType.Int));
                param.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(param);
                _loginCMD.ExecuteNonQuery();
                _count = Convert.ToInt32(param.Value);
                return _count;

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
        public int reset(string resetpassword, int userid)
        {
            try
            {
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "NDTUAT.resetpassword";
                _loginCMD.Parameters.AddWithValue("@resetpassword", resetpassword);
                _loginCMD.Parameters.AddWithValue("@userid", userid);
                _loginCMD.Connection = _northcon;
                return _loginCMD.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
        public string getEmailbyID(int userid)
        {
            try
            {
                string _count = null;
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "NDTUAT.getEmailbyID";
                _loginCMD.Parameters.AddWithValue("@userid", userid);
                _loginCMD.Connection = _northcon;
                SqlParameter param = new SqlParameter("@emailid", System.Data.SqlDbType.NVarChar, 50);
                param.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(param);
                _loginCMD.ExecuteNonQuery();
                _count = Convert.ToString(param.Value);
                return _count;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
        public string GetCompanyName(int UserId)
        {

            try
            {
                string _companyName = string.Empty;
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "[NDTUAT].[GetCompanyName]";
                _loginCMD.Parameters.AddWithValue("@UserId", UserId);
                _loginCMD.Connection = _northcon;
                SqlParameter param = new SqlParameter("@CompanyName", System.Data.SqlDbType.NVarChar, 50);
                param.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(param);
                int iRetCode = _loginCMD.ExecuteNonQuery();
                if (iRetCode != -1) 
                {
                    _companyName = Convert.ToString(param.Value);
                }
                return _companyName;

            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }

        public string GetUserName(int UserId)
        {

            try
            {
                string _companyName = string.Empty;
                _loginCMD = new SqlCommand();
                _loginCMD.CommandType = CommandType.StoredProcedure;
                _loginCMD.CommandText = "[NDTUAT].[GetUserName]";
                _loginCMD.Parameters.AddWithValue("@UserId", UserId);
                _loginCMD.Connection = _northcon;
                SqlParameter param = new SqlParameter("@UserName", System.Data.SqlDbType.NVarChar, 50);
                param.Direction = System.Data.ParameterDirection.Output;
                _loginCMD.Parameters.Add(param);
                int iRetCode = _loginCMD.ExecuteNonQuery();
                _companyName = Convert.ToString(param.Value);

                return _companyName;

            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                _northcon.Close();
            }
        }
    }
}
