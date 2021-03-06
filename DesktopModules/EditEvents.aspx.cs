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

    public partial class EditEvents : System.Web.UI.Page {
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
    
        int itemId = 0;
        int moduleId = 0;

        //****************************************************************
        //
        // The Page_Load event on this Page is used to obtain the ModuleId
        // and ItemId of the event to edit.
        //
        // It then uses the ASPNET.StarterKit.Portal.EventsDB() data component
        // to populate the page's edit controls with the event details.
        //
        //****************************************************************

        protected void Page_Load(object sender, System.EventArgs e) {

            // Determine ModuleId of Events Portal Module
            moduleId = Int32.Parse(Request.Params["Mid"]);

            // Verify that the current user has access to edit this module
            if (PortalSecurity.HasEditPermissions(moduleId) == false) {
                Response.Redirect("~/Admin/EditAccessDenied.aspx");
            }

            // Determine ItemId of Events to Update
            if (Request.Params["ItemId"] != null) {
                itemId = Int32.Parse(Request.Params["ItemId"]);
            }

            // If the page is being requested the first time, determine if an
            // event itemId value is specified, and if so populate page
            // contents with the event details

            if (Page.IsPostBack == false) {

                if (itemId != 0) {

                    // Obtain a single row of event information
                    ASPNET.StarterKit.Portal.EventsDB events = new ASPNET.StarterKit.Portal.EventsDB();
                    SqlDataReader dr = events.GetSingleEvent(itemId);
                
                    // Read first row from database
                    dr.Read();

					// Security check.  verify that itemid is within the module.
					int dbModuleID = Convert.ToInt32(dr["ModuleID"]);
					if (dbModuleID != moduleId)
					{
						dr.Close();
						Response.Redirect("~/Admin/EditAccessDenied.aspx");
					}

                    TitleField.Text = (String) dr["Title"];
                    DescriptionField.Text = (String) dr["Description"];
                    ExpireField.Text = ((DateTime) dr["ExpireDate"]).ToShortDateString();
                    CreatedBy.Text = (String) dr["CreatedByUser"];
                    WhereWhenField.Text = (String) dr["WhereWhen"];
                    CreatedDate.Text = ((DateTime) dr["CreatedDate"]).ToShortDateString();
                
                    dr.Close();
                }

                // Store URL Referrer to return to portal
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
            }
        }

        //****************************************************************
        //
        // The UpdateBtn_Click event handler on this Page is used to either
        // create or update an event.  It uses the ASPNET.StarterKit.Portal.EventsDB()
        // data component to encapsulate all data functionality.
        //
        //****************************************************************

        protected void UpdateBtn_Click(Object sender, EventArgs e) {

            // Only Update if the Entered Data is Valid
            if (Page.IsValid == true) {

                // Create an instance of the Event DB component
                ASPNET.StarterKit.Portal.EventsDB events = new ASPNET.StarterKit.Portal.EventsDB();

                if (itemId == 0) {

                    // Add the event within the Events table
                    events.AddEvent( moduleId, itemId, Context.User.Identity.Name, TitleField.Text, DateTime.Parse(ExpireField.Text), DescriptionField.Text, WhereWhenField.Text );
                }
                else {

                    // Update the event within the Events table
                    events.UpdateEvent( moduleId, itemId, Context.User.Identity.Name, TitleField.Text, DateTime.Parse(ExpireField.Text), DescriptionField.Text, WhereWhenField.Text );
                }

                // Redirect back to the portal home page
                Response.Redirect((String) ViewState["UrlReferrer"]);
            }
        }

        //****************************************************************
        //
        // The DeleteBtn_Click event handler on this Page is used to delete an
        // an event.  It  uses the ASPNET.StarterKit.Portal.EventsDB() data component to
        // encapsulate all data functionality.
        //
        //****************************************************************

        protected void DeleteBtn_Click(Object sender, EventArgs e) {

            // Only attempt to delete the item if it is an existing item
            // (new items will have "ItemId" of 0)

            if (itemId != 0) {

                ASPNET.StarterKit.Portal.EventsDB events = new ASPNET.StarterKit.Portal.EventsDB();
                events.DeleteEvent(itemId);
            }

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
        
        public EditEvents() {

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
