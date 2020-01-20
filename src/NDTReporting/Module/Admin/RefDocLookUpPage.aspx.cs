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
    public partial class RefDocLookUpPage : System.Web.UI.Page, IAdminContentPage
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
                string sQuery = "SELECT RefDocumentId, Code, TestSpecification, TestProcedureNo, AcceptanceStandard " +
                                " FROM NDTUAT.RefDocuments r " +
                                " WHERE r.SubTestId = " + this.Master.SubTestTypeID + " AND" +
                                " r.ClientID = " + this.Master.AppClientId + " AND" +
                                " r.DeletedStatus = 0";
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
            int LID = Convert.ToInt32(Session["LID"]);
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
                    string sQuery = "UPDATE NDTUAT.RefDocuments " +
                                    " SET DeletedStatus = 1 " +
                                    " WHERE RefDocumentId = " + LID + " AND" +
                                    " SubTestId = " + this.Master.SubTestTypeID + " AND" +
                                    " ClientID = " + this.Master.AppClientId + " AND" +
                                    " DeletedStatus = 0";
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

                string sQuery = "SELECT RefDocumentId, Code, TestSpecification, TestProcedureNo, AcceptanceStandard " +
                    " FROM NDTUAT.RefDocuments r " +
                    " WHERE RefDocumentId = " + ID + " AND r.DeletedStatus = 0";
                SqlCommand comm = new SqlCommand(sQuery, con);
                con.Open();
                SqlDataReader sdr = comm.ExecuteReader();
                if (sdr.Read())
                {
                    ParamKeyTB.Text = sdr["RefDocumentId"].ToString();
                    ParamCodeTB.Text = sdr["Code"].ToString();
                    ParamTechSpecTB.Text = sdr["TestSpecification"].ToString();
                    ParamTechProcTB.Text = sdr["TestProcedureNo"].ToString();
                    ParamAcceptStd.Text = sdr["AcceptanceStandard"].ToString();
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
            int AppID = Convert.ToInt32(ConfigurationManager.AppSettings["appid"]);
            int id = Convert.ToInt32(Session["id"].ToString());

            string sQuery = "INSERT INTO artha.NDTUAT.RefDocuments " +
                            "(SubTestId,Code,TestSpecification,TestProcedureNo,AcceptanceStandard,AppID,ClientID,CreatedBy1,CreatedDate1,DeletedStatus)" +
                            " VALUES ('" +
                            this.Master.SubTestTypeID + "','" +
                            ParamCodeTB.Text + "','" +
                            ParamTechSpecTB.Text + "','" +
                            ParamTechProcTB.Text + "','" +
                            ParamAcceptStd.Text + "',1,'" +
                            this.Master.AppClientId + "','" +
                            id + "',GETDATE(),'0')";

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
                //int LID = Convert.ToInt32(Session["LID"]);
                con.Open();
                int id = Convert.ToInt32(Session["id"].ToString());
                string sQuery = "UPDATE NDTUAT.RefDocuments" +
                                " SET  " +
                                " Code = @Code, " +
                                " TestSpecification = @TestSpecification, " +
                                " TestProcedureNo = @TestProcedureNo," +
                                " AcceptanceStandard = @AcceptanceStandard, " +
                                " UpdatedBy = @updatedby," +
                                " UpdatedDate = GETDATE()" +
                                " FROM NDTUAT.RefDocuments r " +
                                " WHERE RefDocumentId = @RefDocumentId AND " +
                                " r.DeletedStatus = 0";
                SqlCommand comm = new SqlCommand(sQuery, con);
                comm.Parameters.Add(new SqlParameter("@Code", ParamCodeTB.Text));
                comm.Parameters.Add(new SqlParameter("@TestSpecification", ParamTechSpecTB.Text));
                comm.Parameters.Add(new SqlParameter("@TestProcedureNo", ParamTechProcTB.Text));
                comm.Parameters.Add(new SqlParameter("@AcceptanceStandard", ParamAcceptStd.Text));
                comm.Parameters.Add(new SqlParameter("@RefDocumentId", ParamKeyTB.Text));
                comm.Parameters.Add(new SqlParameter("@clientid", this.Master.AppClientId));
                comm.Parameters.Add(new SqlParameter("@updatedby", id));
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
            ParamCodeTB.Text = "";
            ParamTechSpecTB.Text = "";
            ParamTechProcTB.Text = "";
            ParamAcceptStd.Text = "";
            ParamKeyTB.Text = "";
            Session["LID"] = 0;
        }
        #endregion
    }
}