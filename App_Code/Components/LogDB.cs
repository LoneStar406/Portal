using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Threading;
using ASPNET.StarterKit.Portal;

namespace ASPNET.StarterKit.Portal
{

    /// <summary>
    /// Summary description for LogDB
    /// </summary>
    public class LogDB
    {
        public LogDB()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static int AddActivityLog(string lsHostAddress, string lsHostName)
        {
            int liActivityLogID;
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_ActivityAdd", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@HostAddress", lsHostAddress));
                    command.Parameters.Add(new SqlParameter("@HostName", lsHostName));
                    SqlParameter parameterRoleID = new SqlParameter("@ActivityLogID", SqlDbType.Int, 4);
                    parameterRoleID.Direction = ParameterDirection.Output;
                    command.Parameters.Add(parameterRoleID);

                    // Open the database connection and execute the command
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    // return the activity log id 
                    liActivityLogID = (int)parameterRoleID.Value;
                }
            }
            return liActivityLogID;
        }

        public static void UpdateActivityLogIn(int liActivityLogID, string lsEmail)
        {
            //string lsUserName = Thread.CurrentPrincipal.Identity.Name;
            if (lsEmail.Length < 1)
            {
                lsEmail = "unknown";
            }
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_ActivityULogin", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@ActivityLogID", liActivityLogID));
                    command.Parameters.Add(new SqlParameter("@UserName", lsEmail));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public static void UpdateActivityLogOut(int liActivityLogID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_ActivityULogOut", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@ActivityLogID", liActivityLogID));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        //public static Hashtable GetActivityLogMetrics(DateTime ldtStartDate, DateTime ldtEndDate)
        //{
        //    using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
        //    {
        //        using (SqlCommand command = new SqlCommand("Portal_GetActivity", connection))
        //        {
        //            command.CommandType = CommandType.StoredProcedure;
        //            command.Parameters.Add(new SqlParameter("@StartDate", ldtStartDate));
        //            command.Parameters.Add(new SqlParameter("@EndDate", ldtEndDate));

        //            SqlParameter parameterRoleID = new SqlParameter("@ActivityLogID", SqlDbType.Int, 4);
        //            parameterRoleID.Direction = ParameterDirection.Output;
        //            command.Parameters.Add(parameterRoleID);

        //            // Open the database connection and execute the command
        //            connection.Open();
        //            command.ExecuteNonQuery();
        //            connection.Close();

        //            // return the activity log id 
        //            liActivityLogID = (int)parameterRoleID.Value;
        //        }
        //    }
        //    return liActivityLogID;
        //}
            
    }
}
