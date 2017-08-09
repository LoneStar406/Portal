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
    public partial class ActivityLogAggregated : ASPNET.StarterKit.Portal.PortalModuleControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Reports.ActivityLogManager lALM = new ASPNET.StarterKit.Portal.Reports.ActivityLogManager();
            lALM.LoadActivityLogAggregatedTable();
            gvActivityAgg.DataBind();
        }
    }
}
