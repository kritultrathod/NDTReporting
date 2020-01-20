using System;
using System.Web.UI;

using NDTReporting.BusinessLayer;

namespace NDTReporting.PresentationLayer
{
    public partial class ForgotPasswordForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
              EmailIDTextBox.Focus();
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GoButton_Click(object sender, EventArgs e)
        {
            try
            {
                businessclass lbal = new businessclass();
                string emailid = EmailIDTextBox.Text;
                string mobilenumber = MobileNumberTextBox.Text;
                string securityquestion = FSQDropDownList.Text;
                string securityanswer = FSATextBox.Text;
                lbal.mobilenumber = mobilenumber;
                lbal.emailid = emailid;
                lbal.securityquestion = securityquestion;
                lbal.securityanswer = securityanswer;
                
                int rect = lbal.validate();
                if (rect > 0)
                {
                    Session["userid"] = rect;
                    Response.Redirect("ResetPasswordForm.aspx",false);
                }
                else
                {
                    EmailIDTextBox.Text = "";
                    MobileNumberTextBox.Text = "";
                    FSATextBox.Text = "";
                    Rlblmsg.Text = "Your Information Do Not Match Up Pleace Try Again";
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
    }
}