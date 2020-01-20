using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using NDTReporting.BusinessLayer;

namespace NDTReporting.PresentationLayer
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LogCurrentContextUser();
                if (Request.QueryString["Logout"] != null)
                {
                    if (Request.QueryString["Logout"].ToString().ToUpper() == "YES")
                    {
                        Session["id"] = null;
                        Session.RemoveAll();
                        Session.Abandon();
                    }
                }

#if DEBUG
                //PasswordTextBox.TextMode = TextBoxMode.SingleLine;
                //PasswordTextBox.Text = "12345";
                //EmailIDTextBox.Text = "hitesh@gmail.com";
#endif
                EmailIDTextBox.Focus();
            }
        }

        private static void LogCurrentContextUser()
        {
            Common.HandleError.HandleInternalError(() =>
            {
                Common.HandleError.LogAppMessage(HttpContext.Current.Request.LogonUserIdentity.Name);
            },
            (s, exception) =>
            {
                // Do nothing
            });
        }

        protected void LogInButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                    return;
                ReportUser reportUser;
                businessclass lbal = new businessclass();
                lbal.emailid = EmailIDTextBox.Text;
                lbal.userpassword = PasswordTextBox.Text;

                reportUser = lbal.Verify();
                if (null != reportUser && reportUser.UserId > 0)
                {
                    Session["emailid"] = lbal.emailid;
                    Session["id"] = reportUser.UserId;
                    Session["IsAdmin"] = reportUser.IsAdmin;
                    int IDS = lbal.Setids(reportUser.UserId);
                    Session["ClientId"] = IDS;
                    Session["Date"] = DateTime.Now;
                    Session["AppId"] = ConfigurationManager.AppSettings["appid"].ToString();

                    #region SetDefaultNavigationSessionValues
                    Session["TestType"] = "1";
                    Session["CurrentPageId"] = "96";
                    #endregion

                    bool j;
                    lbal.userid = Convert.ToInt32(Session["id"].ToString());
                    j = lbal.getdate(lbal.userid);
                    lbal.UserName = lbal.GetUserName(lbal.userid);
                    Session["UserName"] = lbal.UserName;
                    if (j == true)
                    {
                        Response.Redirect("~/Home.aspx", false);
                    }
                    else
                    {
                        lblmsg.Text = "* Dear user your membership is over please contact&nbsp'ceo@teamartha.com'";
                        EmailIDTextBox.Text = "";
                        PasswordTextBox.Text = "";
                    }
                }
                else
                {
                    lblmsg.Text = string.Format("* Invalid UserName/Password!    ");
                    EmailIDTextBox.Text = "";
                    PasswordTextBox.Text = "";

                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void KeepmeloggedinCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (this.KeepmeloggedinCheckBox.Checked)
            {
                HttpCookie cookie = new HttpCookie(EmailIDTextBox.Text, PasswordTextBox.Text);
                cookie.Expires.AddDays(7);
                Response.Cookies.Add(cookie);
            }
            else
            {
                KeepmeloggedinCheckBox.Text = "yes";
            }
        }
    }
}