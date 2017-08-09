using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using ASPNET.StarterKit.Portal;

namespace ASPNET.StarterKit.Portal {

    //*********************************************************************
    //
    // TestimonialsDB Class
    //
    // Class that encapsulates all data logic necessary to add/query/delete
    // Testimonials within the Portal database.
    //
    //*********************************************************************

    public class TestimonialsDB {

        //*********************************************************************
        //
        // GetTestimonials Method
        //
        // The GetTestimonials method returns a DataSet containing all of the
        // contacts for a specific portal module from the Testimonials
        // database.
        //
        //*********************************************************************

        public DataSet GetTestimonials(int moduleId)
        {

            // Create Instance of Connection and Command Object
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
            SqlDataAdapter myCommand = new SqlDataAdapter("Portal_GetTestimonials", myConnection);

            // Mark the Command as a SPROC
            myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

            // Add Parameters to SPROC
            SqlParameter parameterModuleId = new SqlParameter("@ModuleID", SqlDbType.Int, 4);
            parameterModuleId.Value = moduleId;
            myCommand.SelectCommand.Parameters.Add(parameterModuleId);

            // Create and Fill the DataSet
            DataSet myDataSet = new DataSet();
            myCommand.Fill(myDataSet);

            // Return the DataSet
            return myDataSet;
        }

        //*********************************************************************
        //
        // GetSingleTestimonialMethod
        //
        // The GetSingleTestimonial method returns a SqlDataReader containing details
        // about a specific Testimonial from the Testimonial database table.
        //
        //*********************************************************************

        public SqlDataReader GetSingleTestimonial(int itemId)
        {
            // Create Instance of Connection and Command Object
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
            SqlCommand myCommand = new SqlCommand("Portal_GetSingleTestimonial", myConnection);

            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.StoredProcedure;

            // Add Parameters to SPROC
            SqlParameter parameterItemId = new SqlParameter("@ItemID", SqlDbType.Int, 4);
            parameterItemId.Value = itemId;
            myCommand.Parameters.Add(parameterItemId);

            // Execute the command
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            
            // Return the datareader 
            return result;
        }

        //*********************************************************************
        //
        // DeleteTestimonial Method
        //
        // The DeleteContact method logically deletes the specified Testimonial from
        // the Testimonials database table.
        //
        //*********************************************************************

        public void DeleteTestimonial(int itemID)
        {

            // Create Instance of Connection and Command Object
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
            SqlCommand myCommand = new SqlCommand("Portal_DeleteTestimonial", myConnection);

            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.StoredProcedure;

            // Add Parameters to SPROC
            SqlParameter parameterItemID = new SqlParameter("@ItemID", SqlDbType.Int, 4);
            parameterItemID.Value = itemID;
            myCommand.Parameters.Add(parameterItemID);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        //*********************************************************************
        //
        // AddTestimonial Method
        //
        // The AddTestimonial method adds a new Testimonial to the Testimonials
        // database table, and returns the ItemId value as a result.
        //
        //
        //*********************************************************************

        public int AddTestimonial(int moduleId, String userName, String summaryHTML, String detailsHTML, int liPriority)
        {
            
            if (userName.Length < 1) {
                userName = "unknown";
            }

            // Create Instance of Connection and Command Object
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
            SqlCommand myCommand = new SqlCommand("Portal_AddTestimonial", myConnection);

            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.StoredProcedure;

            // Add Parameters to SPROC
            SqlParameter parameterItemID = new SqlParameter("@ItemID", SqlDbType.Int, 4);
            parameterItemID.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterItemID);

            SqlParameter parameterModuleID = new SqlParameter("@ModuleID", SqlDbType.Int, 4);
            parameterModuleID.Value = moduleId;
            myCommand.Parameters.Add(parameterModuleID);

            SqlParameter parameterUserName = new SqlParameter("@CreatedBy", SqlDbType.NVarChar, 100);
            parameterUserName.Value = userName;
            myCommand.Parameters.Add(parameterUserName);

            SqlParameter parameterName = new SqlParameter("@SummaryHTML", SqlDbType.NText);
            parameterName.Value = summaryHTML;
            myCommand.Parameters.Add(parameterName);

            SqlParameter parameterRole = new SqlParameter("@DetailsHTML", SqlDbType.NText);
            parameterRole.Value = detailsHTML;
            myCommand.Parameters.Add(parameterRole);

            if (liPriority > 0)
            {
                SqlParameter parameterPriority = new SqlParameter("@Priority", SqlDbType.Int, 4);
                parameterPriority.Value = liPriority;
                myCommand.Parameters.Add(parameterPriority);
            }
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            return (int)parameterItemID.Value;
        }

        //*********************************************************************
        //
        // UpdateTestimonial Method
        //
        // The UpdateTestimonial method updates the specified Testimonial within
        // the Testimonials database table.
        //
        //*********************************************************************

        public void UpdateTestimonial(int moduleId, int itemId, String userName, String summaryHTML, String detailsHTML, int liPriority)
        {

            if (userName.Length < 1) {
                userName = "unknown";
            }

            // Create Instance of Connection and Command Object
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
            SqlCommand myCommand = new SqlCommand("Portal_UpdateTestimonial", myConnection);

            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.StoredProcedure;

            // Add Parameters to SPROC
            SqlParameter parameterItemID = new SqlParameter("@ItemID", SqlDbType.Int, 4);
            parameterItemID.Value = itemId;
            myCommand.Parameters.Add(parameterItemID);

            SqlParameter parameterUserName = new SqlParameter("@UpdatedBy", SqlDbType.NVarChar, 100);
            parameterUserName.Value = userName;
            myCommand.Parameters.Add(parameterUserName);

            SqlParameter parameterName = new SqlParameter("@SummaryHTML", SqlDbType.NText);
            parameterName.Value = summaryHTML;
            myCommand.Parameters.Add(parameterName);

            SqlParameter parameterRole = new SqlParameter("@DetailsHTML", SqlDbType.NText);
            parameterRole.Value = detailsHTML;
            myCommand.Parameters.Add(parameterRole);

            if (liPriority > 0)
            {
                SqlParameter parameterPriority = new SqlParameter("@Priority", SqlDbType.Int, 4);
                parameterPriority.Value = liPriority;
                myCommand.Parameters.Add(parameterPriority);
            }
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }
    }
}

