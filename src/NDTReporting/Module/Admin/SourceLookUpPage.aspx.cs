using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using NDTReporting.Common;
using NDTReporting.Module.Admin;

namespace NDTReporting
{
    public partial class SourceLookUpPage : System.Web.UI.Page, IAdminContentPage
    {
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

        public void BindGrid()
        {
            try
            {
                string sQuery = "SELECT" +
                                " RadiationSourceId," +
                                " TypeofSource," +
                                " UnitofEnergy," +
                                " Identification," +
                                " FocalSpotSize" +
                                " FROM NDTUAT.RadiationSource r" +
                                " WHERE r.ClientID = " + this.Master.AppClientId +
                                " AND r.DeletedStatus = 0";
                SqlCommand comm = new SqlCommand(sQuery, con);
                comm.CommandType = CommandType.Text;
                con.Open();

                SqlDataReader reader = comm.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                reader.Close();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int LID = 0;
            int.TryParse(ParamKeyTB.Text, out LID);
            if (LID > 0)
            {
                UpdateLookUpCode(LID);
            }
            else
            {
                AddLookUpCode();
            }
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (GridView1.Rows.Count > 1)
                {
                    LinkButton btn = (LinkButton)sender;
                    GridViewRow row = (GridViewRow)btn.NamingContainer;
                    int LID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    con.Open();
                    string sQuery = "UPDATE NDTUAT.RadiationSource" +
                                    " SET DeletedStatus = 1" +
                                    " FROM NDTUAT.RadiationSource r" +
                                    " WHERE r.RadiationSourceId = " + LID +
                                    " AND r.ClientID = " + this.Master.AppClientId +
                                    " AND r.DeletedStatus = 0";
                    SqlCommand comm = new SqlCommand(sQuery, con);
                    comm.ExecuteNonQuery();
                    con.Close();
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Record Deleted Successfully!')", true);
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('At least one record should be present!')", true);
                }
                BindGrid();
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                int ID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                Session["LID"] = ID;

                string sQuery = "SELECT" +
                                " RadiationSourceId," +
                                " TypeofSource," +
                                " UnitofEnergy," +
                                " Identification," +
                                " FocalSpotSize" +
                                " FROM NDTUAT.RadiationSource r" +
                                " WHERE r.RadiationSourceId = " + ID +
                                " AND r.ClientID = " + this.Master.AppClientId +
                                " AND r.DeletedStatus = 0";
                SqlCommand comm = new SqlCommand(sQuery, con);
                con.Open();
                SqlDataReader sdr = comm.ExecuteReader();
                if (sdr.Read())
                {
                    ParamKeyTB.Text = sdr["RadiationSourceId"].ToString();
                    ParamSourceTB.Text = sdr["TypeofSource"].ToString();
                    ParamUnitofEnergyTB.Text = sdr["UnitofEnergy"].ToString();
                    ParamIdentificationTB.Text = sdr["Identification"].ToString();
                    ParamFocalSpotSize.Text = sdr["FocalSpotSize"].ToString();
                }
                con.Close();
            }
            catch
            {
                throw;
            }
        }
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            ClearEditControls();
        }
        #endregion
        #region Private Functions
        private void AddLookUpCode()
        {
            int id = Convert.ToInt32(Session["id"].ToString());

            string sQuery = "INSERT INTO [artha].[NDTUAT].[RadiationSource]" +
                            " ([TypeofSource],[UnitofEnergy],[Identification],[FocalSpotSize],[AppID],[ClientID],[CreatedBy],[CreatedDate],[DeletedStatus]) " +
                            " VALUES ('" +
                            ParamSourceTB.Text + "','" +
                            ParamUnitofEnergyTB.Text + "','" +
                            ParamIdentificationTB.Text + "','" +
                            ParamFocalSpotSize.Text + "',1,'" +
                            this.Master.AppClientId + "','" +
                            id + "',GETDATE(),0)";
            SqlCommand comm = new SqlCommand(sQuery, con);
            con.Open();
            comm.ExecuteNonQuery();
            con.Close();
            BindGrid();
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Record Saved Successfully!')", true);
            ClearEditControls();
        }
        private void UpdateLookUpCode(int LID)
        {
            try
            {
                con.Open();
                int id = Convert.ToInt32(Session["id"].ToString()); //user id
                string sQuery = "UPDATE NDTUAT.RadiationSource" +
                                " SET " +
                                " TypeofSource = '" + ParamSourceTB.Text + "', " +
                                " UnitofEnergy = '" + ParamUnitofEnergyTB.Text + "', " +
                                " Identification = '" + ParamIdentificationTB.Text + "', " +
                                " FocalSpotSize = '" + ParamFocalSpotSize.Text + "', " +
                                " UpdatedBy = '" + id + "', " +
                                " UpdatedDate = GETDATE()" +
                                " FROM NDTUAT.RadiationSource r" +
                                " WHERE r.RadiationSourceId = " + LID +
                                " AND r.ClientID = " + this.Master.AppClientId +
                                " AND r.DeletedStatus = 0";
                SqlCommand comm = new SqlCommand(sQuery, con);
                comm.ExecuteNonQuery();

                ClearEditControls();

                con.Close();
                BindGrid();
                System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Record Saved Successfully!')", true);
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void ClearEditControls()
        {
            ParamKeyTB.Text = "";
            ParamSourceTB.Text = "";
            ParamUnitofEnergyTB.Text = "";
            ParamIdentificationTB.Text = "";
            ParamFocalSpotSize.Text = "";
            Session["LID"] = 0;
        }
        #endregion
    }
}