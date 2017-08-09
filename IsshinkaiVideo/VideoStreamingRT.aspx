<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoStreamingRT.aspx.cs" Inherits="ASPNET.StarterKit.Portal.Pages_VideoStreamingRT" %>

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
    <ASPNetVideo:RealPlayer ID="RealPlayer1" runat="server" VideoURL="">
            <HTMLAlternativeTemplate>
                <!-- Place your HTML Alternative content here! -->
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="http://i.realone.com/assets/rn/img/3/8/1/1/45441183.png"
                    PostBackUrl="http://www.real.com/freeplayer/?rppr=rnwk" />
            </HTMLAlternativeTemplate>
        </ASPNetVideo:RealPlayer>

      </div>

    </form>
</body>
</html>
