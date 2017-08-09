using System;
namespace ASPNET.StarterKit.Portal.Reports
{
    /// <summary>
    /// Describes the Activity Log Object
    /// </summary>
    public class ActivityLog
    {
        #region Private Properties
        private int miActivityLogID;
        private string msHostAddress;
        private string msHostName;
        private DateTime mdtSessionStartTime;
        private string msLogInName;
        private string mdtLogInTime;
        private string mdtLogOutTime;
        #endregion

        #region Public Accessors
        /// <summary>
        /// Activity Log ID
        /// </summary>
        public int ActivityLogID { get { return miActivityLogID; } }
        /// <summary>
        /// Host Address
        /// </summary>
        public string HostAddress { get { return msHostAddress; } }
        /// <summary>
        /// Host Name
        /// </summary>
        public string HostName { get { return msHostName; } }
        /// <summary>
        /// Session Start Time
        /// </summary>
        public DateTime SessionStartTime { get { return mdtSessionStartTime; } }
        /// <summary>
        /// LoginIn Name
        /// </summary>
        public string LogInName { get { return msLogInName; } }
        /// <summary>
        /// LogIn Time
        /// </summary>
        public string LogInTime { get { return mdtLogInTime; } }
        /// <summary>
        /// LogOut Time
        /// </summary>
        public string LogOutTime { get { return mdtLogOutTime; } }
        #endregion

        /// <summary>
        /// Loads an Activity Log Object
        /// </summary>
        /// <param name="liActivityLogID"></param>
        /// <param name="lsHostAddress"></param>
        /// <param name="lsHostName"></param>
        /// <param name="ldtSessionStartTime"></param>
        /// <param name="lsLoginInName"></param>
        /// <param name="ldtLogInTime"></param>
        /// <param name="ldtLogOutTime"></param>
        public ActivityLog(int liActivityLogID, 
            string lsHostAddress,
            string lsHostName,
            DateTime ldtSessionStartTime,
            string lsLogInName,
            string ldtLogInTime,
            string ldtLogOutTime)
        {
            miActivityLogID = liActivityLogID;
            msHostAddress = lsHostAddress;
            msHostName = lsHostName;
            mdtSessionStartTime = ldtSessionStartTime;
            msLogInName = lsLogInName;
            mdtLogInTime = ldtLogInTime;
            mdtLogOutTime = ldtLogOutTime;
        }
    }
}
