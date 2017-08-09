using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class DesktopModules_PhotoAdmin_AlbumAdmin : System.Web.UI.Page
{
    public int miModuleID
    {
        get
        {
            int liModuleID = -1;
            if (ViewState["miModuleID"] != null)
                liModuleID = Convert.ToInt32(ViewState["miModuleID"]);
            return liModuleID;
        }
        set
        {
            ViewState["miModuleID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["module_id"] != null)
            miModuleID = Convert.ToInt32(Request.QueryString["module_id"].Trim());
    }
    protected void odsAlbums_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["module_id"] = miModuleID;

    }
    protected void gvAlbums_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Add")
        {

        }
        else if (e.CommandName == "Delete")
        {
        }
    }
}
