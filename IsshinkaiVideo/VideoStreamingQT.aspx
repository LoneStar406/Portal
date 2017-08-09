<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoStreamingQT.aspx.cs" Inherits="ASPNET.StarterKit.Portal.Pages_VideoStreamingQT" %>

<%@ Register Assembly="ASPNetVideo.NET2" Namespace="ASPNetVideo" TagPrefix="ASPNetVideo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div>
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <ASPNetVideo:QuickTime ID="QuickTime1" runat="server" VideoURL="">
            <HTMLAlternativeTemplate>
                <!-- Place your HTML Alternative content here! -->
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="http://images.apple.com/about/webbadges/images/qt7badge_getQTfreeDownload.gif"
                    PostBackUrl="http://www.apple.com/quicktime/download/" />
            </HTMLAlternativeTemplate>
        </ASPNetVideo:QuickTime>
      </div>
    </form>
</body>
</html>
