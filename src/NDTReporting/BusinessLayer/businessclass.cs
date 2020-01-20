using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using NDTReporting.DataLayer;

namespace NDTReporting.BusinessLayer
{
    public class businessclass
    {
        public bool isValidUser { get; set; }
        public DateTime registrationdate { get; set; }
        public string emailid { get; set; }
        public string userpassword { get; set; }
        public string mobilenumber { get; set; }
        public string companyname { get; set; }
        public string securityquestion { get; set; }
        public string securityanswer { get; set; }
        public int userid { get; set; }
        public string UserName { get; set; }


        public ReportUser Verify()
        {
           
            dataclass ldal = new dataclass();
            ReportUser reportUser = new ReportUser(0, 0);
            try
            {
                if (this.emailid != null && this.userpassword != null)
                    reportUser = ldal.Verify(this.emailid, this.userpassword);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
            return reportUser;
        }
        public int Setids(int i)
        {
            dataclass ldal = new dataclass();
            try
            {
                return ldal.setids(i);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public bool getdate(int userid)
        {
            isValidUser = false;

            dataclass ldal = new dataclass();
            try
            {
                return isValidUser = ldal.GetRegistrationDate(this);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public int Insert(string emailid, string userpassword, string name, string mobilenumber, DateTime registrationdate, string securityquestion, string securityanswer, int AppId, int clientid)
        {
            dataclass ldal = new dataclass();
            try
            {
                if (emailid != null && userpassword != null && name != null &&
                    mobilenumber != null && securityquestion != null && securityanswer != null)
                    return ldal.Insert(emailid, userpassword, name, mobilenumber, registrationdate, securityquestion, securityanswer, AppId, clientid);
                else
                {
                    return -1;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public int check()
        {
            dataclass ldal = new dataclass();
            try
            {
                if (this.emailid != null)
                    return ldal.check(this.emailid);
                else
                {
                    return -1;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public int validate()
        {
            dataclass ldal = new dataclass();
            try
            {
                if (this.emailid != null && this.mobilenumber != null && this.securityquestion != null &&
                this.securityanswer != null)
                    return ldal.validate(this.emailid, this.mobilenumber, this.securityquestion, this.securityanswer);
                else
                {
                    return -1;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public int reset(string resetpassword, int userid)
        {
            dataclass ldal = new dataclass();
            try
            {
                if (resetpassword != null && userid > 0)
                    return ldal.reset(resetpassword, userid);
                else
                {
                    return -1;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public string getEmailbyID(int userid)
        {
            dataclass ldal = new dataclass();
            try
            {
                return ldal.getEmailbyID(userid);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public string GetCompanyName(int UserId)
        {
            dataclass ldal = new dataclass();
            try
            {
                return ldal.GetCompanyName(UserId);

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
        public string GetUserName(int UserId)
        {
            dataclass ldal = new dataclass();
            try
            {
                return ldal.GetUserName(UserId);

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ldal = null;
            }
        }
    }

    public class ReportUser
    {
        private int userId = 0;
        private int isAdmin = 0;

        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        public int IsAdmin
        {
            get { return isAdmin; }
            set { isAdmin = value; }
        }

        public ReportUser(int userIdParam, int isAdminParam)
        {
            UserId = userIdParam;
            IsAdmin = isAdminParam;
        }
    }
}
