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

    public partial class DesktopDefault6 : System.Web.UI.Page {


        public int tabIndex;
        public bool ShowTabs = true;
        protected String LogoffLink = "";

        public DesktopDefault6() {
            Page.Init += new System.EventHandler(Page_Init);
        }

        protected void Page_Init(object sender, EventArgs e) {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();

            //*********************************************************************
            //
            // Page_Init Event Handler
            //
            // The Page_Init event handler executes at the very beginning of each page
            // request (immediately before Page_Load).
            //
            // The Page_Init event handler below determines the tab index of the currently
            // requested portal view, and then calls the PopulatePortalSection utility
            // method to dynamically populate the left, center and right hand sections
            // of the portal tab.
            //
            //*********************************************************************

            // Obtain PortalSettings from Current Context
            PortalSettings portalSettings = (PortalSettings) HttpContext.Current.Items["PortalSettings"];
        
            // Ensure that the visiting user has access to the current page
            if (PortalSecurity.IsInRoles(portalSettings.ActiveTab.AuthorizedRoles) == false) {
                Response.Redirect("~/Admin/AccessDenied.aspx");
            }

            // Dynamically inject a signin login module into the top left-hand corner
            // of the home page if the client is not yet authenticated
            if ((Request.IsAuthenticated == false) && (portalSettings.ActiveTab.TabIndex == 0)) {
                RightPane.Controls.Add(Page.LoadControl("~/DesktopModules/SignIn.ascx"));
                RightPane.Visible = true;             
            }

            // Dynamically Populate the Left, Center and Right pane sections of the portal page
            if (portalSettings.ActiveTab.Modules.Count > 0) {

                // Loop through each entry in the configuration system for this tab
                foreach (ModuleSettings _moduleSettings in portalSettings.ActiveTab.Modules) {
                
                    Control parent = Page.FindControl(_moduleSettings.PaneName);

                    // If no caching is specified, create the user control instance and dynamically
                    // inject it into the page.  Otherwise, create a cached module instance that
                    // may or may not optionally inject the module into the tree

                    if ((_moduleSettings.CacheTime) == 0) {

                        PortalModuleControl portalModule = (PortalModuleControl) Page.LoadControl(_moduleSettings.DesktopSrc);
                   
                        portalModule.PortalId = portalSettings.PortalId;                                  
                        portalModule.ModuleConfiguration = _moduleSettings;
                   
                        parent.Controls.Add(portalModule);
                    }
                    else {

                        CachedPortalModuleControl portalModule = new CachedPortalModuleControl();
                   
                        portalModule.PortalId = portalSettings.PortalId;                                 
                        portalModule.ModuleConfiguration = _moduleSettings;
 
                        parent.Controls.Add(portalModule);
                    }

                    // Dynamically inject separator break between portal modules
                    parent.Controls.Add(new LiteralControl("<" + "br" + ">"));
                    parent.Visible = true;
                }
            }
        }


        protected void Page_Load(object sender, System.EventArgs e)
        {

            // Obtain PortalSettings from Current Context
            PortalSettings portalSettings = (PortalSettings)HttpContext.Current.Items["PortalSettings"];

            // Dynamically Populate the Portal Site Name
            siteName.Text = portalSettings.PortalName;

            // If user logged in, customize welcome message
            if (Request.IsAuthenticated == true)
            {

                WelcomeMessage.Text = "Welcome " + Context.User.Identity.Name + "! <" + "span class=Accent" + ">|<" + "/span" + ">";

                // if authentication mode is Cookie, provide a logoff link
                if (Context.User.Identity.AuthenticationType == "Forms")
                {
                    LogoffLink = "<" + "span class=\"Accent\">|</span>\n" + "<" + "a href=" + Global.GetApplicationPath(Request) + "/Admin/Logoff.aspx class=SiteLink> Logoff" + "<" + "/a>";
                }
            }

            // Dynamically render portal tab strip
            if (ShowTabs == true)
            {

                tabIndex = portalSettings.ActiveTab.TabIndex;

                // Build list of tabs to be shown to user                                   
                ArrayList authorizedTabs = new ArrayList();
                int addedTabs = 0;

                for (int i = 0; i < portalSettings.DesktopTabs.Count; i++)
                {

                    TabStripDetails tab = (TabStripDetails)portalSettings.DesktopTabs[i];

                    if (PortalSecurity.IsInRoles(tab.AuthorizedRoles))
                    {
                        authorizedTabs.Add(tab);
                    }

                    if (addedTabs == tabIndex)
                    {
                        tabs.SelectedIndex = addedTabs;
                    }

                    addedTabs++;
                }

                // Populate Tab List at Top of the Page with authorized tabs
                tabs.DataSource = authorizedTabs;
                tabs.DataBind();
            }
        }

        #region Web Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion

    }
}


