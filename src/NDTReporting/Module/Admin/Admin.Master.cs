using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NDTReporting.Module.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /** Remove this find better solution here **/
            if (!Page.IsPostBack)
            {
                if (string.IsNullOrEmpty(SubTestTypeID))
                    this.SubTestTypeID = "STT1";

                setTestTypeGreeting();
                setUserGreeting();
            }
        }

        private void setUserGreeting()
        {
            txtUserGreeting.Text = "Welcome: " + this.UserName;

        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx", false);
        }
        protected void btnLookupCode_Click(object sender, EventArgs e)
        {
            var btn = ((Control)sender);
            this.LookupCode = btn.ID;
            if (this.LookupCode == "RadiationSource")
            {
                Server.Transfer("~/Module/Admin/SourceLookUpPage.aspx", false);
            }
            if (this.LookupCode == "RefDocuments")
            {
                Server.Transfer("~/Module/Admin/RefDocLookUpPage.aspx", false);
            }
            else
            {
                //TODO: KTR Remove this not all lookups should call bind grid
                Server.Transfer("~/Module/Admin/LookUpPage.aspx", false);
            }
        }
        protected void btnSubTestType_Click(object sender, EventArgs e)
        {
            Button btn = ((Button)sender);
            this.SubTestTypeID = btn.ID;
        }

        #region Public Properties
        #region SubTestTypeID
        public string SubTestTypeID
        {
            get
            {
                string sSubTestTypeID = string.Empty;
                try
                {
                    sSubTestTypeID = Session["TestType"].ToString();

                }
                catch (Exception)
                {
                    //// Probably Session Timed Out;
                    Response.Redirect("~/PresentationLayer/LoginPage.aspx");
                }
                return sSubTestTypeID;
            }
            set
            {
                string subTestTypeId = value.Replace("STT", "");
                Session["TestType"] = subTestTypeId;
                ApplySelectedSubTestTypeCss();
                var p = ContentPlaceHolder1.Page;
                if (p != null)
                {
                    var ip = p as IAdminContentPage;
                    ip.BindGrid();
                }
            }
        }
        #endregion
        #region LookupCode
        public string LookupCode
        {
            get
            {
                string ssnLookupCode = string.Empty;
                try
                {
                    ssnLookupCode = Session["LookupCode"].ToString();

                }
                catch (Exception)
                {
                    //// Probably Session Timed Out;
                    Response.Redirect("~/PresentationLayer/LoginPage.aspx");
                }
                return ssnLookupCode;
            }
            set
            {
                string ssnLookupCode = value;
                Session["LookupCode"] = ssnLookupCode;
            }
        }
        #endregion
        #region ClientId
        public string AppClientId
        {
            get
            {
                string sClientId = string.Empty;
                try
                {
                    sClientId = Session["ClientId"].ToString();
                }
                catch (Exception)
                {
                    //// Probably Session Timed Out;
                    Response.Redirect("~/PresentationLayer/LoginPage.aspx");
                }
                return sClientId;
            }
            set
            {
                Session["ClientId"] = value;
            }
        }
        #endregion

        #region ClientId
        private string UserName
        {
            get
            {
                string sUserName = string.Empty;
                try
                {
                    sUserName = Session["UserName"].ToString();
                }
                catch (Exception)
                {
                    //// Probably Session Timed Out;
                    Response.Redirect("~/PresentationLayer/LoginPage.aspx");
                }
                return sUserName;
            }
        }
        #endregion
        #endregion

        #region Public Methods
      
        public void ApplySelectedItemsCss()
        {
            ApplySelectedLookupCodeCss();
            ApplySelectedSubTestTypeCss();
        }

        public void ApplySelectedLookupCodeCss()
        {
            string sLookupCode = this.LookupCode;
            ((Button)this.FindControl(sLookupCode)).CssClass = "lookup-code selectedItem";
        }
        public void ApplySelectedSubTestTypeCss()
        {
            STT1.CssClass = "navTestTypeBtn";
            STT3.CssClass = "navTestTypeBtn";
            STT5.CssClass = "navTestTypeBtn";
            STT7.CssClass = "navTestTypeBtn";

            string sSubTestType = "STT" + this.SubTestTypeID;
            ((Button)this.FindControl(sSubTestType)).CssClass = "navTestTypeBtn selectedItem";

            setTestTypeGreeting();
        }

        private void setTestTypeGreeting()
        {
            var testTypeName = "Error: No Test Type Selected!";
            switch (this.SubTestTypeID)
            {
                case "1":
                    testTypeName = "RadioGraphicWeld";
                    break;
                case "3":
                    testTypeName = "UltraSonic";
                    break;
                case "5":
                    testTypeName = "Magnetic";
                    break;
                case "7":
                    testTypeName = "Liquid";
                    break;
            }
            txtTestType.Text = "Test Type: " + testTypeName;
        }

        #endregion

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Context.Session.RemoveAll();
            Context.Session.Abandon();
            Context.Session.Clear();
            Response.Redirect(@"~\PresentationLayer\LoginPage.aspx");
        }

    }

    public interface IAdminContentPage
    {
        void BindGrid();
    }
}