using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPNET.StarterKit.Portal
{
    public partial class Pages_VideoStreaming : System.Web.UI.Page
    {
        public const string VideoID = "~\\Video\\AVI_to_MPEG-4.avi";
        public const string videoLocation = "..//Secure//";
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isIEBrowser = false;
            string videoName = null;
            try
            {
                //Validate Access
                //if (PortalSecurity.IsInRoles("Admins") == false)
                //{
                //    Response.Redirect("~/Admin/AccessDenied.aspx");
                //}
                //Detect whether this is an IE browser
                isIEBrowser = IsIE();
                if (Request.QueryString["VideoName"] != null)
                {
                    switch (Request.QueryString["VideoName"])
                    {
                        case "VideoSEISAN":
                            videoName = videoLocation + "AJA-1-SEISANxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoNaihanchi":
                            videoName = videoLocation + "AJA-2-NAIHANCHI5Kfnq1vMKmU83h8jQZniNiGPKvTnUMXh.mov";
                            break;
                        case "VideoSeiunchin":
                            videoName = videoLocation + "AJA-2-SEIUNCHIN1pn4BJkahS1Qn7XCq4SAd7ItPC4tI7zt.mov";
                            break;
                        case "VideoWansu":
                            videoName = videoLocation + "AJA-4-WANSUp69oiMlLIEM3sPWqIxy4BT9BVIQHUIr0.mov";
                            break;
                        case "VideoChinto":
                            videoName = videoLocation + "AJA-5-CHINTO2z8r4EG6TTpgxLaGbNiuOfDRoKucBPy0.mov";
                            break;
                        case "VideoKusanku":
                            videoName = videoLocation + "AJA-6-KUSANKUuG2QzvtCCU1qYuVGpN2VIKewmunNbIma.mov";
                            break;
                        case "VideoSUNUSU":
                            videoName = videoLocation + "AJA-7-SUNUSU2xXBFhoh9yKehBjO78sA2nr6IMy3NEnh.mov";
                            break;
                        case "VideoSEISANPISC":
                            videoName = videoLocation + "AJA-1-SEISAN-PISCxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoSEIUNCHINPISC":
                            videoName = videoLocation + "AJA-2-SEIUNC-PISCxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoNAIHANCHIPISC":
                            videoName = videoLocation + "AJA-3-NAIHAN-PISCxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoWANSUPISC":
                            videoName = videoLocation + "AJA-4-WANSU-PISCxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoSANCHIN1973":
                            videoName = videoLocation + "AJA-8-SANCHIN-1973xhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoSANCHIN":
                            videoName = videoLocation + "AJA-8-SANCHINxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoBobbyHollyOleMiss":
                            videoName = videoLocation + "AJABobbyHollyOleMissxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        case "VideoChinto2011":
                            videoName = videoLocation + "Chinto2011xhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;                  
						case "SenseiTeachesUsmcm4v":
                            videoName = videoLocation + "SenseiTeachesUsmcxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;              
						case "SenseiTeachesUsmcPart2":
                            videoName = videoLocation + "SenseiTeachesUsmcPart2OriginalxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;                  
						case "KataWorkshopStart":
                            videoName = videoLocation + "KataWorkshopStartOriginalxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;       
						case "KataWorkshopMiddle":
                            videoName = videoLocation + "KataWorkshopMiddleOriginalxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;      
						case "KataWorkshopEnd":
                            videoName = videoLocation + "KataWorkshopEndOriginalxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break; 
						case "BasicStance":
                            videoName = videoLocation + "BasicStancexhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;         
						case "LeadingMarinesInDemonstration":
                            videoName = videoLocation + "LeadingMarinesInDemonstrationxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;         
						case "SenseiWalksOverAMarine":
                            videoName = videoLocation + "SenseiWalksOverAMarinexhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;         
						case "SenseiDemonstratesDefenseAgainstTwoMarines":
                            videoName = videoLocation + "SenseiDemonstratesDefenseAgainstTwoMarinesxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
						case "VideoBoCover":
                            videoName = videoLocation + "BoCoverFinalxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;  
						case "VideoBoCoverLargeStreamed":
                            videoName = videoLocation + "BoCoverFinalMediumxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;         
						case "VideoBoCoverSmallStreamed":
                            videoName = videoLocation + "BoCoverFinalSmallStreamingxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;         
						case "VideoBoCoverMP4":
                            videoName = videoLocation + "BoCoverFinalxhjU232ZHEpiK344FIUsTx3A7ig5BfUnForWeb-Desktop.m4v";
                            break;     
						case "AdvinculaSenseiInterviewWithNakazatoSensei":
                            videoName = videoLocation + "AdvinculaSenseiInterviewWithNakazatoSensei1997ConvertedMediumStreamingxhjU232ZHEpiK344FIUsTx3A7ig5BfUn.mov";
                            break;
                        default:
                            videoName = videoLocation + Request.QueryString["VideoName"];
                            break;
                    }

                    ShowVideo(videoName, isIEBrowser);
                }
                else
                    ShowErrorMessage("Video failed to load.");

            }
            catch (Exception)
            {
                ShowErrorMessage("Video failed to load.");
            }
        }

        private bool IsIE()
        {
            bool result = false;
            System.Web.HttpBrowserCapabilities myBrowserCaps = Request.Browser;
            if (((System.Web.Configuration.HttpCapabilitiesBase)myBrowserCaps).Browser.ToUpper().IndexOf("IE") >= 0)
            {
                result = true;
            }
            else
            {
                result = false;
            }
            return result;
        }
        private void ShowVideo(string VideoName, bool isIEBrowser)
        {
            if (DoesVideoExist(VideoName))
            {
                //string VideoHTML = "<embed src='";
                //VideoHTML += VideoName;
                //VideoHTML += "' id='videoData' hidden='false' autostart='true' type='video/avi' loop='false' enablecontextmenu='True' stretchtofit='True' enabled='True' fullscreen='False'></embed>";
                //divVideo.InnerHtml = VideoHTML;
                if (isIEBrowser)
                {
                    WindowsMedia1.Visible = true;
                    WindowsMedia1.VideoURL = VideoName;
                }
                else
                {
                    QuickTime1.Visible = true;
                    QuickTime1.VideoURL = VideoName;
                }
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
            string VideoLocation = Request.PhysicalApplicationPath + "Secure\\" + VideoName;
            FileInfo imageFile = new FileInfo(VideoLocation);   
            return imageFile.Exists;
        }
    }
}