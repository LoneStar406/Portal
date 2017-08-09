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

namespace ASPNET.StarterKit.Portal
{

    public partial class PhotoBrowserEdit : System.Web.UI.Page
    {
        int moduleId = 0;

        protected void Page_Load(object sender, System.EventArgs e)
        {

            // Determine ModuleId of Contacts Portal Module
            moduleId = Int32.Parse(Request.Params["Mid"]);

            // Verify that the current user has access to edit this module
            if (PortalSecurity.HasEditPermissions(moduleId) == false)
            {
                Response.Redirect("~/Admin/EditAccessDenied.aspx");
            }

            if (Page.IsPostBack == false)
            {
                // Store URL Referrer to return to portal
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
            }
        }

        protected void CancelBtn_Click(Object sender, EventArgs e)
        {

            // Redirect back to the portal home page
            Response.Redirect((String)ViewState["UrlReferrer"]);
        }
        protected void ddlTask_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlTask.SelectedIndex)
            {
                case 0:
                    lucPhotoBrowserEdit.Visible = true;
                    lucAlbumEdit.Visible = false;
                    lucPhotoLibraryEdit.Visible = false;
                    break;
                case 1:
                    lucPhotoBrowserEdit.Visible = false;
                    lucAlbumEdit.Visible = true;
                    lucPhotoLibraryEdit.Visible = false;
                    break;
                case 2:
                    lucPhotoBrowserEdit.Visible = false;
                    lucAlbumEdit.Visible = false;
                    lucPhotoLibraryEdit.Visible = true;
                    break;
            }
        }
}
}