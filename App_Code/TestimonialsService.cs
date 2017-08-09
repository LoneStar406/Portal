using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Web.Script.Services;

namespace ASPNET.StarterKit.Portal.WebServices
{
    /// <summary>
    /// Summary description for TestimonialsService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class TestimonialsService : System.Web.Services.WebService
    {

        public TestimonialsService()
        {

            //Uncomment the following line if using designed components 
            //InitializeComponent(); 
        }

        [WebMethod]
        public string GetTestimonial(int liTestimonialID)
        {
            // Obtain the selected item from the HtmlText table
            ASPNET.StarterKit.Portal.TestimonialsDB testimonials = new ASPNET.StarterKit.Portal.TestimonialsDB();
            SqlDataReader dr = testimonials.GetSingleTestimonial(liTestimonialID);

            string lsHTMLText = string.Empty;
            if (dr.Read())
            {
                lsHTMLText = Server.HtmlDecode((String)dr["DetailsHTML"]);
            }
            dr.Close();
            return lsHTMLText;
        }

    }
}

