using System;
using System.Configuration;
using System.Web.UI;

using NDTReporting.BusinessLayer;

namespace NDTReporting.PresentationLayer
{
    public partial class ResetPasswordForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               ResetPasswordTextBox.Focus();
            }
        }     
        protected void LogInButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
        protected void SendButton_Click1(object sender, EventArgs e)
        {
            int intResult = 0;
            businessclass lbal = new businessclass();
            lbal.userid = Convert.ToInt32(Session["userid"].ToString());
            string resetpassword = ResetPasswordTextBox.Text;

            try
            {
                intResult = lbal.reset(resetpassword, lbal.userid);
                if (intResult > 0)
                {
                    string From = ConfigurationManager.AppSettings["email"].ToString();
                    string To = lbal.getEmailbyID(lbal.userid);
                    string Subject = "Reset password";
                    string Body = "Dear User Your New Password Is " + ResetPasswordTextBox.Text;
                    mailclass mail = new mailclass();

                    bool ract = mail.sendmail(From, To, Subject, Body);
                    if (ract == true)
                    {
                        ResetPasswordTextBox.Text = "";
                        ConfrimResetPasswordTextBox.Text = "";
                        lblmsg1.Text = "";
                        lblmsg.Text = "Your Password Is successfully Upadeted And Send To Your Mail Add Please Check And Login Again.";
                    }
                    else
                    {
                        ResetPasswordTextBox.Text = "";
                        ConfrimResetPasswordTextBox.Text = "";
                        lblmsg1.Text = "Your Password Is Not Send To Your Mail Add.";
                    }
                }
                else
                {
                    ResetPasswordTextBox.Text = "";
                    ConfrimResetPasswordTextBox.Text = "";
                    lblmsg1.Text = "Record Not Updated Succesfully";
                }
            }
            catch (Exception)
            {
                lblmsg1.Text = "Sending Mail Faild";
            }
            finally
            {
                lbal = null;
            }
        }
    }
}