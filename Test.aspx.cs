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

public partial class Test : System.Web.UI.Page
{
    public static int miModuleID = 1;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void odsAlbums_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["module_id"] = miModuleID;
    }
    protected void gvAlbums_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
        }
    }
}
