using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using NDTReporting.Common;
using NDTReporting.Module.Admin;

namespace NDTReporting
{
    public partial class LookUpPage : System.Web.UI.Page, IAdminContentPage
    {
        //UseDALHelper: Make this to user DALHelper and using constructs
        SqlConnection con = new SqlConnection(Connections.GetConnectionString());
        #region ContentPageFunctions
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (string.IsNullOrEmpty(this.Master.LookupCode))
                    this.Master.LookupCode = "Technique";
            }
            BindGrid();
            this.Master.ApplySelectedItemsCss();
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int lookupRowId = Convert.ToInt32(Session["LID"]);
            if (lookupRowId > 0)
            {
                UpdateLookUpCode(lookupRowId);
            }
            else
            {
                AddLookUpCode();
            }
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            HandleError.HandleInternalError(() =>
                {
                    if (GridView1.Rows.Count > 1)
                    {
                        LinkButton btn = (LinkButton)sender;
                        GridViewRow row = (GridViewRow)btn.NamingContainer;
                        int LID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                        string lookupCode = this.Master.LookupCode;
                        con.Open();
                        string sql = "update [NDTUAT].[LookUpMaster] set DeletedStatus = 1 where " +
                                     "LookupCodeID = " + LID + " AND ";
                        if (lookupCode != "SortField" && lookupCode != "RateType")
                            sql += "SubTestId= " + this.Master.SubTestTypeID + " AND ";
                        sql += "ClientId= " + this.Master.AppClientId;
                        SqlCommand comm = new SqlCommand(sql, con);
                        comm.ExecuteNonQuery();
                        con.Close();
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Record Deleted Successfully!')", true);
                    }
                    else
                    {
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('At least one record should be present!')", true);
                    }
                    BindGrid();
                }, (m, er) =>
                {
                    //Hand or rethrow. Anyways its logged in db.
                    throw er;
                });
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            HandleError.HandleInternalError(() =>
                {

                    LinkButton btn = (LinkButton)sender;
                    GridViewRow row = (GridViewRow)btn.NamingContainer;
                    int lookupRowId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    string lookupCode = this.Master.LookupCode;
                    Session["LID"] = lookupRowId;
                    string sql = "SELECT ParamKey,ParamDesc1,ParamDesc2,SortOrder FROM [NDTUAT].[LookUpMaster] " +
                                 "WHERE DeletedStatus = 0 AND LookupCodeID=" + lookupRowId;
                    if (lookupCode != "SortField" && lookupCode != "RateType")
                        sql += " AND SubTestId=" + this.Master.SubTestTypeID;
                    sql += " AND ClientId=" + this.Master.AppClientId + " ";

                    SqlCommand comm = new SqlCommand(sql, con);
                    con.Open();
                    SqlDataReader sdr = comm.ExecuteReader();
                    if (sdr.Read())
                    {
                        ParamKeyTB.Text = sdr["ParamKey"].ToString();
                        ParamDesc1TB.Text = sdr["ParamDesc1"].ToString();
                        ParamDesc2TB.Text = sdr["ParamDesc2"].ToString();
                        SortOrderTB.Text = sdr["SortOrder"].ToString();
                    }
                    con.Close();
                }, (m, er) =>
                    {
                        throw er;
                    });
        }
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            ClearEditControls();
        }

        private void ClearEditControls()
        {
            ParamKeyTB.Text = "";
            ParamDesc1TB.Text = "";
            ParamDesc2TB.Text = "";
            SortOrderTB.Text = "";

            Session["LID"] = 0;
        }

        #endregion

        #region Public Functions
        public void BindGrid()
        {
            HandleError.HandleInternalError(() =>
                           {
                               string lookupCode = this.Master.LookupCode;

                               SqlCommand comm = new SqlCommand("[NDTUAT].[prc_GetLookUpGridResults]", con);
                               comm.CommandType = CommandType.StoredProcedure;
                               con.Open();
                               comm.Parameters.AddWithValue("@LookupCode", lookupCode);
                               if (lookupCode != "SortField" && lookupCode != "RateType")
                                   comm.Parameters.AddWithValue("@SubTestId", Convert.ToInt32(this.Master.SubTestTypeID));
                               comm.Parameters.AddWithValue("@ClientId", Convert.ToInt32(this.Master.AppClientId));
                               SqlDataReader reader = comm.ExecuteReader();
                               GridView1.DataSource = reader;
                               GridView1.DataBind();

                               if (GridView1.Rows.Count == 0)
                                   pnlDataEntryFields.Enabled = false;
                               else
                                   pnlDataEntryFields.Enabled = true;
                               reader.Close();
                               con.Close();
                           }, (m, e) =>
                           {
                               throw e;
                           });
        }
        #endregion

        #region Private Functions
        private void AddLookUpCode()
        {
            HandleError.HandleInternalError(() =>
                {
                    con.Open();

                    int AppID = Convert.ToInt32(ConfigurationManager.AppSettings["appid"]);
                    int id = Convert.ToInt32(Session["id"].ToString());
                    string lookupCode = this.Master.LookupCode;
                    SqlCommand comm = new SqlCommand();
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "[NDTUAT].[AddLookupData]";
                    comm.Parameters.Add(new SqlParameter("@lookupcode", this.Master.LookupCode));/// Session["LookupCode"].ToString())); // DropDownList1.Text));
                    comm.Parameters.Add(new SqlParameter("@paramdesc1", ParamDesc1TB.Text));
                    comm.Parameters.Add(new SqlParameter("@paramdesc2", ParamDesc2TB.Text));
                    comm.Parameters.Add(new SqlParameter("@sortorder", SortOrderTB.Text));
                    comm.Parameters.Add(new SqlParameter("@appid", AppID));
                    if (lookupCode != "SortField" && lookupCode != "RateType")
                        comm.Parameters.Add(new SqlParameter("@SubTestid", this.Master.SubTestTypeID));
                    comm.Parameters.Add(new SqlParameter("@clientid", this.Master.AppClientId));
                    comm.Parameters.Add(new SqlParameter("@createdby", id));
                    comm.Parameters.Add(new SqlParameter("@createddate", DateTime.Now));
                    comm.Connection = con;
                    comm.ExecuteNonQuery();
                    con.Close();
                    BindGrid();
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Record Saved Successfully!')", true);
                    ClearEditControls();
                }, (m, e) =>
                {
                    throw e;
                });
        }
        private void UpdateLookUpCode(int LID)
        {
            HandleError.HandleInternalError(() =>
                {
                    con.Open();
                    int id = Convert.ToInt32(Session["id"].ToString());
                    string lookupCode = this.Master.LookupCode;
                    string sql = "update [NDTUAT].[LookUpMaster]" +
                                 " set LookupCode='" + this.Master.LookupCode + "'," +
                                 " ParamKey='" + ParamKeyTB.Text + "'," +
                                 " ParamDesc1='" + ParamDesc1TB.Text + "'," +
                                 " ParamDesc2='" + ParamDesc2TB.Text + "',";
                    if (lookupCode != "SortField" && lookupCode != "RateType")
                        sql += " SubTestid='" + this.Master.SubTestTypeID + "',";
                    sql += " clientid='" + this.Master.AppClientId + "'," +
                           " SortOrder='" + SortOrderTB.Text + "'," +
                           " UpdatedBy='" + id + "'," +
                           " UpdatedDate=GETDATE() " +
                           " where LookupCodeID = " + LID;

                    SqlCommand comm = new SqlCommand(sql, con);
                    comm.ExecuteNonQuery();
                    con.Close();
                    BindGrid();
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Record Saved Successfully!')", true);
                    ClearEditControls();
                }, (m, e) =>
                    {
                        throw e;
                    });
        }
        #endregion
    }
}