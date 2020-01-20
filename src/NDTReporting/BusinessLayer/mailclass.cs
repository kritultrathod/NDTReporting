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
using System.Net.Mail;
using NDTReporting.PresentationLayer;

namespace NDTReporting.BusinessLayer
{
    public class mailclass
    {
        /// <summary>
        /// we are sending a mail non-local mail add also like gmail,yahoo
        /// </summary>
        /// <param name="From"></param>
        /// <param name="To"></param>
        /// <param name="Subject"></param>
        /// <param name="Body"></param>
        /// <returns></returns>
        public bool sendmail(string From,string To,string Subject,string Body)
        {
            try
            {
                bool sent = false;
                //if (From == null) throw new ApplicationException("Send email needs From Address");
                //if (To == null) throw new ApplicationException("Send email needs To Address");
                //if (Subject == null) throw new ApplicationException("Send email needs Subject");
                //if (Body == null) throw new ApplicationException("Send email needs Body");
                if (From != null && To != null && Subject != null && Body != null &&
                    From != "\r\n" && To != "\r\n" && Subject != "\r\n" && Body != "\r\n" &&
                    From != ".." && To != ".." && Subject != ".." && Body != "..")
                    
                {
                 
                    if (sent == false)
                    {
                        MailMessage mail = new MailMessage();
                        if (From.Trim() == String.Empty) throw new ArgumentException("Add From Address to send email");
                        mail.From = new MailAddress(From);
                        if (To.Trim() == String.Empty) throw new ArgumentException("Add To Address to send email");
                        mail.To.Add(new MailAddress(To));

                        if (Subject.Trim() == String.Empty) throw new ArgumentException("Add Subject to send email");
                        mail.Subject = Subject;
                        if (Body.Trim() == String.Empty) throw new ArgumentException("Add Body to send email");
                        mail.Body = Body;
                        mail.IsBodyHtml = true;
                        mail.Priority = MailPriority.Normal;
                        SmtpClient client = new SmtpClient();
                        client.Host = "mail.teamartha.com";
                        client.UseDefaultCredentials = true;
                        client.Port = 25;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.Credentials = new System.Net.NetworkCredential("hitesh.dabhi@teamartha.com", "M1H1t3sh");
                            //here username and password is ceo@teamartha.com.. 
                        client.Send(mail);
                        sent = true;
                    }
                    else
                    {
                        sent = false;
                    }
                }
                return sent;
            }
            catch 
            {
                throw;
            }
        }      
    }
}
