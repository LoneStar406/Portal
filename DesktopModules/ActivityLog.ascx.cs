using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace ASPNET.StarterKit.Portal
{

    public partial class ActivityLog : ASPNET.StarterKit.Portal.PortalModuleControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        private void BindData()
        {
            // Get the list of registered users from the database
            RolesDB roles = new RolesDB();
           
            // bind all portal users to dropdownlist
            ddlAllUsers.DataSource = roles.GetUsers();
            ddlAllUsers.DataBind();
        }
        protected void odsActivityLog_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (cbFilterUser.Checked && ddlAllUsers.SelectedItem.Value != "-1")
                e.InputParameters["lsSearchExpression"] = "LogInName = '" + ddlAllUsers.SelectedItem.Text +"'";
        }
        protected void ddlAllUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvActivityLog.PageIndex = 0;
            gvActivityLog.DataBind();
        }
        protected void cbFilterUser_CheckedChanged(object sender, EventArgs e)
        {
            gvActivityLog.PageIndex = 0;
            gvActivityLog.DataBind();
        }
}
}
