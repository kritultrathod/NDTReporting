using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Xml;

namespace NDTReporting.DataLayer
{
    public class DALHelper : IDisposable
    {
        private SqlConnection DbConn;
        static string ConnectionString;
        public string strConnectionString
        {
            set { ConnectionString = value; }
        }

        #region Constructor(s)
        public DALHelper(string connectionString)
        {
            ConnectionString = connectionString;
            DbConn = new SqlConnection();
        }

        #endregion

        #region GetExecuteNonQuery
        public int GetExecuteNonQuery(string strQuery)
        {
            return GetExecuteNonQuery(strQuery, null);
        }
        public int GetExecuteNonQuery(string strQuery, Hashtable htable)
        {
            try
            {
                _CheckConnection();
                SqlCommand objCom = new SqlCommand(strQuery, DbConn);
                AddParameters(htable, objCom);
                return objCom.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                DbConn.Close();
            }
        }

        private static void AddParameters(Hashtable htable, SqlCommand objCom)
        {
            if (htable != null && htable.Count > 0)
            {
                foreach (DictionaryEntry dist in htable)
                {
                    objCom.Parameters.AddWithValue((string) dist.Key, dist.Value);
                }
            }
        }

        public int GetExecuteNonQueryWithSP(string strQuery, Hashtable htable)
        {
            try
            {
                _CheckConnection();
                SqlCommand objCom = new SqlCommand(strQuery, DbConn);
                objCom.CommandType = CommandType.StoredProcedure;
                AddParameters(htable, objCom);
                return objCom.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                DbConn.Close();
            }
        }
        #endregion

        #region GetExecuteScalar
        public string GetExecuteScalar(string strQuery)
        {
            return GetExecuteScalar(strQuery, null);
        }
        public string GetExecuteScalar(string strQuery, Hashtable htable)
        {
            try
            {
                _CheckConnection();
                SqlCommand objCom = new SqlCommand(strQuery, DbConn);
                if (htable != null && htable.Count > 0)
                {
                    foreach (DictionaryEntry dist in htable)
                    {
                        objCom.Parameters.AddWithValue((string)dist.Key, dist.Value);
                    }
                }
                return objCom.ExecuteScalar().ToString();
            }
            catch
            {
                throw;
            }
            finally
            {
                DbConn.Close();
            }
        }
        #endregion

        #region GetExecuteReader
        public SqlDataReader GetExecuteReader(string strQuery)
        {
            _CheckConnection();
            SqlCommand CMD = new SqlCommand(strQuery, DbConn);
            return CMD.ExecuteReader();
        }

        public SqlDataReader GetExecuteReader(string strQuery, Hashtable htable)
        {
            _CheckConnection();
            SqlCommand objCom = new SqlCommand(strQuery, DbConn);
            objCom.CommandType = CommandType.StoredProcedure;
            objCom.CommandTimeout = 30;
            foreach (DictionaryEntry dist in htable)
            {
                objCom.Parameters.AddWithValue((string)dist.Key, dist.Value);
            }
            return objCom.ExecuteReader();
        }
        #endregion

        #region [Obsolete Methods]
        [Obsolete("Method1 is deprecated, please use GetExecuteReader instead.", true)]
        public XmlReader GetExecuteXmlReader(string strQuery)
        {
            try
            {
                _CheckConnection();
                SqlCommand CMD = new SqlCommand(strQuery, DbConn);
                return CMD.ExecuteXmlReader();
            }
            catch
            {
                throw;
            }
            finally
            {
                DbConn.Close();
            }
        }
        [Obsolete("Method1 is deprecated, please use GetExecuteReader instead.", true)]
        public DataSet GetDataSet(string strQuery)
        {
            DataSet DS = new DataSet();
            try
            {
                _CheckConnection();
                SqlCommand CMD = new SqlCommand(strQuery, DbConn);
                SqlDataAdapter DA = new SqlDataAdapter(CMD);
                DA.Fill(DS);
                return DS;

            }
            catch
            {
                throw;
            }
            finally
            {
                DbConn.Close();
            }
        }
        #endregion

        #region GetExecuteSave
        /// <summary>
        /// GetExecuteSave: use for Upsert operations [update and insert]
        /// </summary>
        /// <param name="strQuery"></param>
        /// <param name="htable"></param>
        /// <returns></returns>
        public object GetExecuteSave(string strQuery, Hashtable htable)
        {
            try
            {
                _CheckConnection();
                SqlCommand objCom = new SqlCommand(strQuery, DbConn);
                objCom.CommandType = CommandType.StoredProcedure;
                objCom.CommandTimeout = 30;
                foreach (DictionaryEntry dist in htable)
                {
                    objCom.Parameters.AddWithValue((string)dist.Key, dist.Value);
                }
                return objCom.ExecuteScalar();
            }
            catch
            {
                throw;
            }
            finally
            {
                DbConn.Close();
            }
        }
        #endregion

        #region "Inner Function"
        private void _CheckConnection()
        {
            try
            {
                if (DbConn == null) { DbConn.ConnectionString = ConnectionString; }
                if (DbConn.State == ConnectionState.Closed)
                {
                    DbConn.ConnectionString = ConnectionString;
                    DbConn.Open();
                }
            }
            catch
            {
                throw;
            }
        }

        public void CloseConnection()
        {
            try
            {
                if (DbConn.State == ConnectionState.Open)
                {
                    DbConn.Close();
                }
            }
            catch
            {
                throw;
            }
        }
        #endregion


        public void Dispose()
        {
            this.CloseConnection();
            DbConn = null;
        }
    }
}