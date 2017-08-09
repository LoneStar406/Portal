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
using System.Web.Services;
using System.Data.SqlClient;

namespace ASPNET.StarterKit.Portal
{
    public partial class Testimonials : ASPNET.StarterKit.Portal.PortalModuleControl {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Obtain the selected item from the HtmlText table
            ASPNET.StarterKit.Portal.TestimonialsDB testimonials = new ASPNET.StarterKit.Portal.TestimonialsDB();
            DataSet lds = testimonials.GetTestimonials(ModuleId);

            string lsHTML = string.Empty;
            lsHTML += "<table width='100%' id='tblTestimonialSummary' style='CURSOR: hand' cellSpacing='0' cellPadding='0' border='0' style='PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px;'>";

            //Iterate through list to create html string
            if (lds.Tables.Count > 0)
            {
                bool lCanEdit = false;
                if (PortalSecurity.HasEditPermissions(ModuleId) == true)
                    lCanEdit = true;

                int li = 0;
                foreach (DataRow lrow in lds.Tables[0].Rows)
                {

                    // Dynamically add the file content into the page
                    int liItemID = (int)lrow["ItemID"];
                    String content = Server.HtmlDecode((String)lrow["SummaryHTML"]);
                    lsHTML += "<tr><td>";
                    if(lCanEdit)
                    {
                        lsHTML += "<a href='DesktopModules/EditTestimonial.aspx?ItemID=";
                        lsHTML += liItemID.ToString();
                        lsHTML += "&mid=";
                        lsHTML += ModuleId.ToString();
                        lsHTML += "'><img style='cursor: hand'  src='images/edit.gif'></a>&nbsp;";
                    }
                    lsHTML += "<a onmouseover='DisplayTestimonial(";
                    lsHTML += liItemID.ToString();
                    lsHTML += ",";
                    lsHTML += li.ToString();
                    lsHTML += ")'>";
                    lsHTML += content;
                    lsHTML += "</a></td></tr><tr height='5px'><td><HR width='80%' SIZE='1'></td></tr>";
                    li++;
                }
            }
            lsHTML += "</table>";
            HtmlHolder.Controls.Add(new LiteralControl(lsHTML));
        }
    }
}
