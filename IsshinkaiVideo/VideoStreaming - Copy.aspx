<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoStreaming.aspx.cs" Inherits="ASPNET.StarterKit.Portal.Pages_VideoStreaming" %>

<%@ Register Assembly="ASPNetVideo.NET2" Namespace="ASPNetVideo" TagPrefix="ASPNetVideo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<style type="text/css">
<!--
p.MsoNormal {
margin:0in;
margin-bottom:.0001pt;
font-size:12.0pt;
font-family:"Times New Roman";
}
.style6 {
	font-family: "Times New Roman", Times, serif;
	font-size: 14px;
}
#Layer1 {
	position:absolute;
	left:604px;
	top:262px;
	width:226px;
	height:320px;
	z-index:1;
	clip: rect(auto,auto,auto,12);
}
.style13 {font-family: "Times New Roman", Times, serif; font-size: 12px; }
.style28 {
	font-family: "Times New Roman", Times, serif;
	font-size: 14px;
}
.style30 {font-family: "Times New Roman", Times, serif; font-size: 11px; font-style: italic; }
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
<div>
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

        <ASPNetVideo:WindowsMedia ID="WindowsMedia1" runat="server" VideoURL="" Visible = "false" Width="640" Height="480">
            <HTMLAlternativeTemplate>
                <!-- Place your HTML Alternative content here! -->
                <asp:ImageButton ID="ImageButton1" runat="server" Height="56px" Width="68px" ImageUrl="http://www.microsoft.com/windows/windowsmedia/images/logos/getwm/mp11_68x56_static.gif"
                    PostBackUrl="http://www.microsoft.com/windows/windowsmedia/player/download/" />
            </HTMLAlternativeTemplate>
        </ASPNetVideo:WindowsMedia>
        <ASPNetVideo:QuickTime ID="QuickTime1" runat="server" VideoURL="" Visible = "false">
            <HTMLAlternativeTemplate>
                <!-- Place your HTML Alternative content here! -->
                <asp:ImageButton ID="ImageButton1" runat="server" Height="56px" Width="68px" 
                    ImageUrl="http://images.apple.com/about/webbadges/images/qt7badge_getQTfreeDownload.gif"
                    PostBackUrl="http://www.apple.com/quicktime/download/" />
            </HTMLAlternativeTemplate>
        </ASPNetVideo:QuickTime>
        <a class="style30" >Note: Please be patient as the video downloads.<br>
(Right click for video options)</a>
      </div>

    </form>
</body>
</html>
