using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Video_Video : System.Web.UI.Page
{
    private static string LogoffLink = @"http://www.isshinkai.net/";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void Logoff()
    {
        try
        {
            // Log User Off from Cookie Authentication System
            FormsAuthentication.SignOut();

            // Invalidate roles token
            Response.Cookies["portalroles"].Value = null;
            Response.Cookies["portalroles"].Expires = new System.DateTime(1999, 10, 12);
            Response.Cookies["portalroles"].Path = "/";

            // Clear Session Data
            Session.Abandon();
            // Redirect user back to the Portal Home Page
            Response.Redirect(LogoffLink);
        }
        catch (Exception)
        {
            //Do Nothing.
        }
    }
    protected void lbLogoff_Click(object sender, EventArgs e)
    {
        Logoff();
    }
}