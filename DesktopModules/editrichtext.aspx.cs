using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace ASPNET.StarterKit.Portal {

    public partial class EditRichText : System.Web.UI.Page {
    

        int moduleId = 0;

        //****************************************************************
        //
        // The Page_Load event on this Page is used to obtain the ModuleId
        // of the xml module to edit.
        //
        // It then uses the ASPNET.StarterKit.Portal.HtmlTextDB() data component
        // to populate the page's edit controls with the text details.
        //
        //****************************************************************

        protected void Page_Load(object sender, System.EventArgs e) {

            // Determine ModuleId of Announcements Portal Module
            moduleId = Int32.Parse(Request.Params["Mid"]);

            // Verify that the current user has access to edit this module
            if (PortalSecurity.HasEditPermissions(moduleId) == false) {
                Response.Redirect("~/Admin/EditAccessDenied.aspx");
            }

            if (Page.IsPostBack == false) {

                // Obtain a single row of text information
                ASPNET.StarterKit.Portal.HtmlTextDB text = new ASPNET.StarterKit.Portal.HtmlTextDB();
                SqlDataReader dr = text.GetHtmlText(moduleId);
            
                if (dr.Read()) {

                    FCKEDesktop.Value = Server.HtmlDecode((String) dr["DesktopHtml"]);
                }
                else {
            
                    FCKEDesktop.Value = "Todo: Add Content...";
                }
            
                dr.Close();
                // Store URL Referrer to return to portal
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
            }
        }

        //****************************************************************
        //
        // The UpdateBtn_Click event handler on this Page is used to save
        // the text changes to the database.
        //
        //****************************************************************

        protected void UpdateBtn_Click(Object sender, EventArgs e) {

            // Create an instance of the HtmlTextDB component
            ASPNET.StarterKit.Portal.HtmlTextDB text = new ASPNET.StarterKit.Portal.HtmlTextDB();
        
            // Update the text within the HtmlText table
            text.UpdateHtmlText(moduleId, FCKEDesktop.Value, string.Empty, string.Empty);

            // Redirect back to the portal home page
            Response.Redirect((String) ViewState["UrlReferrer"]);
        }

        //****************************************************************
        //
        // The CancelBtn_Click event handler on this Page is used to cancel
        // out of the page, and return the user back to the portal home
        // page.
        //
        //****************************************************************

        protected void CancelBtn_Click(Object sender, EventArgs e) {

            // Redirect back to the portal home page
            Response.Redirect((String) ViewState["UrlReferrer"]);
        }

        public EditRichText()
        {
            Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Init(object sender, EventArgs e) {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
        }

		#region Web Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {    

        }
		#endregion
    }
}
