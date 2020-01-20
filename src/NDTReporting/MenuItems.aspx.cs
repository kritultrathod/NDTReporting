using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using NDTReporting.Common;

namespace NDTReporting
{
    public partial class MenuItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateMenuItem();
            }
        }
        private void populateMenuItem()
        {
            DataTable menuData = GetMenuData();
            AddTopMenuItems(menuData);
        }
        
        private void AddTopMenuItems(DataTable menuData)
        {
            DataView view = new DataView(menuData);
            view.RowFilter = "ParentID IS NULL";
            foreach (DataRowView row in view)
            {
               
                MenuItem newMenuItem = new MenuItem(row["MenuName"].ToString(), row["MenuId"].ToString());

                Menu1.Items.Add(newMenuItem);
                AddChildMenuItems(menuData, newMenuItem);
            }

        }
        //This code is used to recursively add child menu items by filtering by ParentID
        private void AddChildMenuItems(DataTable menuData, MenuItem parentMenuItem)
        {
            DataView view = new DataView(menuData);
            view.RowFilter = "ParentID=" + parentMenuItem.Value;
            foreach (DataRowView row in view)
            {
                MenuItem newMenuItem = new MenuItem(row["MenuName"].ToString(), row["MenuId"].ToString());
                parentMenuItem.ChildItems.Add(newMenuItem);
                AddChildMenuItems(menuData, newMenuItem);
            }
        }
        private DataTable GetMenuData()
        {
            using (SqlConnection con = new SqlConnection(Connections.GetConnectionString()))
            {
                int id = Convert.ToInt32(Session["id"].ToString());
                using (SqlCommand cmd = new SqlCommand("SELECT * from NDTUAT.MenuItems M join NDTUAT.UserMenu U on M.MenuId = u.menuid where userid =" + id, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
    }
}