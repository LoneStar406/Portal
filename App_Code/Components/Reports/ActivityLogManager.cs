using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace ASPNET.StarterKit.Portal.Reports
{
    /// <summary>
    /// Summary description for ActivityLogManager
    /// </summary>
    public class ActivityLogManager
    {
        public ActivityLogManager()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        #region GetTotalNumberOfActivityLogs
        /// <summary>
        /// Retrieves the total number of rows availiable in the Activity Log Table
        /// </summary>
        /// <returns></returns>
        public int GetTotalNumberOfActivityLogs(string lsSearchExpression)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("toma_s_rpt_activity_get_count", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    if (lsSearchExpression != null && lsSearchExpression != string.Empty)
                        command.Parameters.Add(new SqlParameter("@searchExpression", lsSearchExpression));
                    connection.Open();
                    object result = command.ExecuteScalar();
                    try
                    {
                        return (int)result;
                    }
                    catch
                    {
                        return 0;
                    }
                }
            }
        }
        #endregion

        #region GetActivityLogs
        /// <summary>
        /// Retrieves logs from the Activity Log Table
        /// </summary>
        /// <returns></returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public List<ActivityLog> GetActivityLogs(int liStartRowIndex,
        int liMaximumRows,
        string lsSortExpression,
        string lsSearchExpression)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("toma_s_rpt_activity_get_logs", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@startRowIndex", liStartRowIndex));
                    command.Parameters.Add(new SqlParameter("@maximumRows", liMaximumRows));
                    if (lsSortExpression != null && lsSortExpression != string.Empty)
                        command.Parameters.Add(new SqlParameter("@sortExpression", lsSortExpression));
                    if (lsSearchExpression != null && lsSearchExpression != string.Empty)
                        command.Parameters.Add(new SqlParameter("@searchExpression", lsSearchExpression));
                    connection.Open();
                    List<ActivityLog> list = new List<ActivityLog>();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        int liActivityLogID;
                        string lsHostAddress;
                        string lsHostName;
                        DateTime ldtSessionStartTime;
                        string lsLoginInName;
                        string ldtLogInTime;
                        string ldtLogOutTime;
                        while (reader.Read())
                        {
                            try
                            {
                                liActivityLogID = (int)reader["ActivityLogID"];
                                lsHostAddress = (string)reader["HostAddress"];
                                lsHostName = (string)reader["HostName"];
                                ldtSessionStartTime = (DateTime)reader["SessionStartTime"];
                                lsLoginInName = reader["LogInName"].ToString();
                                ldtLogInTime = reader["LogInTime"].ToString();
                                ldtLogOutTime = reader["LogOutTime"].ToString();
                                ActivityLog temp = new ActivityLog(
                                    (int)reader["ActivityLogID"],
                                    (string)reader["HostAddress"],
                                    (string)reader["HostName"],
                                    (DateTime)reader["SessionStartTime"],
                                    (string)reader["LogInName"].ToString(),
                                    reader["LogInTime"].ToString(),
                                    reader["LogOutTime"].ToString());
                                list.Add(temp);
                            }
                            catch (Exception ex)
                            {
                                string s = ex.Message;
                            }
                        }
                    }
                    return list;
                }
            }
        }
        #endregion

        #region LoadActivityLogAggregatedTable
        /// <summary>
        /// Loads the Activity Log Aggregated Table
        /// </summary>
        /// <returns></returns>
        public void LoadActivityLogAggregatedTable()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("toma_s_rpt_activity_fill_agg", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    command.ExecuteScalar();
                }
            }
        }
        #endregion
    }
}