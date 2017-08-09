using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPNET.StarterKit.Portal
{
    public partial class Pages_VideoStreamingQT : System.Web.UI.Page
    {
        public string VideoID = "~\\Video\\AVI_to_MPEG-4.avi";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Validate Access
                //if (PortalSecurity.IsInRoles("Admins") == false)
                //{
                //    Response.Redirect("~/Admin/AccessDenied.aspx");
                //}
                if (Request.QueryString["VideoName"] != null)
                {
                    ShowVideo(Request.QueryString["VideoName"]);
                }
                else
                    ShowErrorMessage("Video failed to load.");
                
            }
            catch (Exception)
            {
                ShowErrorMessage("Video failed to load.");
            }
        }

        private void ShowVideo(string VideoName)
        {
            if (DoesVideoExist(VideoName))
            {
                //string VideoHTML = "<embed src='";
                //VideoHTML += VideoName;
                //VideoHTML += "' id='videoData' hidden='false' autostart='true' type='video/avi' loop='false' enablecontextmenu='True' stretchtofit='True' enabled='True' fullscreen='False'></embed>";
                //divVideo.InnerHtml = VideoHTML;
                QuickTime1.VideoURL = VideoName;
            }
            else ShowErrorMessage("Video failed to load.");
        }
        private void ShowErrorMessage(string Message)
        {
            //string MessageHTML = Message;
            //divVideo.InnerHtml = MessageHTML;
            lblError.Text = Message;
        }

        private bool DoesVideoExist(string VideoName)
        {
            string VideoLocation = Request.PhysicalApplicationPath + "video\\" + VideoName;
            FileInfo imageFile = new FileInfo(VideoLocation);   
            return imageFile.Exists;
        }
    }
}