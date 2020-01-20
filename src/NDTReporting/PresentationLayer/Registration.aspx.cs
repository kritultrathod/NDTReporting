using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using NDTReporting.BusinessLayer;
using NDTReporting.Common;

namespace NDTReporting.PresentationLayer
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Connections.GetConnectionString());
   
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {
                FillDropDownList();
            }
        }
        private void FillDropDownList()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = " select ClientId,CompanyName From [artha].[NDTUAT].[CompanyDetails] ";
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds, "example");
                DropDownList1.Items.Clear();
                DropDownList1.DataSource = ds;
                DropDownList1.DataTextField = "CompanyName";
                DropDownList1.DataValueField = "ClientId";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--choose one--", "0"));
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void RSignUpButton_Click(object sender, EventArgs e)
        {
            
            if (!Page.IsValid)
                return;
            int intResult = 0;

            businessclass lbal = new businessclass();
            string emailid = REmailIDTextbox.Text;
            string userpassword = RPasswordTextBox.Text;
            string name = RNameTextBox.Text;
            string mobilenumber = RMobileNOTextBox.Text;
            DateTime registrationdate = System.DateTime.Now;
            string securityquestion = SQDropDownList.Text;
            string securityanswer = SATextBox.Text;
            lbal.emailid = emailid;
            lbal.mobilenumber = mobilenumber;
            int AppId = Convert.ToInt32(ConfigurationManager.AppSettings["appid"]);
            int clientid = Convert.ToInt32(DropDownList1.SelectedValue);

            try
            {
                int rect = lbal.check();
                if (rect != 0)
                {
                    lblmsg1.Text = "";
                    lblmsg2.Text = "* This EmailID Alredy Exists, Try Another EmailID";
                }
                else
                {
                    intResult = lbal.Insert(emailid, userpassword, name, mobilenumber, registrationdate, securityquestion, securityanswer, AppId, clientid);
                    if (intResult > 0)
                    {
                        string From = ConfigurationManager.AppSettings["email"].ToString();
                        string To = REmailIDTextbox.Text;
                        string Subject = "Registration Conformation";
                        string Body = "Welcome<br/><br/>" + RNameTextBox.Text;
                        mailclass mail = new mailclass();

                        bool ract = mail.sendmail(From, To, Subject, Body);
                        if (ract == true)
                        {

                            REmailIDTextbox.Text = "";
                            RPasswordTextBox.Text = "";                            
                            RNameTextBox.Text = "";
                            RMobileNOTextBox.Text = "";
                            SATextBox.Text = "";
                            //lblmsg1.Text = "Thank You,Your SignUp Confirmation Message Successfully Sent To Your Mail Add.,Please SignIn Here";
                            lblmsg1.Text = "Registration successful, please check your mailbox for activation.";
                        }
                        else
                        {
                            lblmsg2.Text = "Some Problem in Sending Mail";
                        }
                        //Response.Redirect("LoginForm.aspx",false);
                    }
                    else
                    {
                        lblmsg2.Text = "Record Not Inserted Succesfully";
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg1.Text = ex.Message.ToString();
            }
            finally
            {
                lbal = null;
            }
        }

        protected void RCancelButton_Click(object sender, EventArgs e)
        {
            lblmsg1.Text = "";
            lblmsg2.Text = "";
            REmailIDTextbox.Text = "";
            RPasswordTextBox.Text = "";
            RNameTextBox.Text = "";
            RMobileNOTextBox.Text = "";
            SATextBox.Text = "";
            Response.Redirect("LoginPage.aspx", false);
        }
    }
       
}
