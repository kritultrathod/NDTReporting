using System;
using System.Configuration;
using System.Web.UI;
using NDTReporting.BusinessLayer;

namespace NDTReporting.PresentationLayer
{
    public partial class FeedbackForm : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               CommentsTextBox.Focus();
            }
            if (Session["id"] != null)
            {
                businessclass lbal = new businessclass();
                lbal.userid = Convert.ToInt32(Session["id"].ToString());
                CompanyNameTextBox.Text = lbal.GetCompanyName(lbal.userid);
                EmailIDTextBox.Text = lbal.getEmailbyID(lbal.userid);
            }
        }
        public void Reset()
        {
            CommentsTextBox.Text = "";
            NewFeatureTextBox.Text = "";
            TypesOfNDTTextBox.Text = "";
            EmailIDTextBox.Text = "";
            CompanyNameTextBox.Text = "";
        }
        protected void SendMailButton_Click(object sender, EventArgs e)
        {
            try
            {
                businessclass lbal = new businessclass();
                lbal.userid = Convert.ToInt32(Session["id"].ToString());
                string From = ConfigurationManager.AppSettings["email"].ToString();
                string To = ConfigurationManager.AppSettings["email"].ToString();
                string Subject = "Feed back";
                string Body = "Company Name : " + CompanyNameTextBox.Text + "<br/><br/>" + "EmailID :" + EmailIDTextBox.Text + "<br/><br/>" + "Comments : " + CommentsTextBox.Text + " <br/><br/>" + "New Features Required : " + NewFeatureTextBox.Text + " <br/><br/>" + "Types Of NDT Performed : " + TypesOfNDTTextBox.Text + " <br/>";
                mailclass mail = new mailclass();

                bool ract = mail.sendmail(From,To,Subject,Body);
                if (ract == true)
                {
                    lblmsg1.Text = "Your Feed Back Is successfully Send";
                }
                else
                {
                    lblmsg.Text = "Some Problem To Sending Mail";
                }
            }
            catch (Exception)
            {
                lblmsg.Text = "Your Message Failed To Send, Please Try Again.";
            }
           Reset();
        }
        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Response.Redirect("WelcomeForm.aspx");
            }
            else
            {
                Response.Redirect("LoginPage.aspx?mode=logout");
            }
        }
    }
}