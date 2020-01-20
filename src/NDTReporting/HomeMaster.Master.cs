using System;
using System.Reflection;

namespace NDTReporting
{
	public partial class HomeMaster : System.Web.UI.MasterPage
	{
		public string AssemblyVersionInfo { get; set; }
		protected void Page_PreInit(object sender, EventArgs e)
		{
		   
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			SetAssemblyVersionInfo();
			if (Session["id"] == null)
			{
				Response.Redirect("~/PresentationLayer/LoginPage.aspx");
			}
            if(Request.QueryString["Page"] != null)
            {
                
            }
		}
		private void SetAssemblyVersionInfo()
		{
			Assembly assembly = Assembly.LoadFrom(Server.MapPath("bin\\NDTReporting.dll"));
			Version ver = assembly.GetName().Version;
			AssemblyVersionInfo = "Version : " + ver.Major.ToString()
				+ "." + ver.Minor.ToString()
				+ "." + ver.Build.ToString()
				+ "." + ver.Revision.ToString();
		}
	}
}