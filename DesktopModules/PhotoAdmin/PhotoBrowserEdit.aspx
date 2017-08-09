<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhotoBrowserEdit.aspx.cs"
    Inherits="ASPNET.StarterKit.Portal.PhotoAdmin.PhotoBrowserEdit" %>

<%@ Register Src="PhotoEdit.ascx" TagName="PhotoEdit" TagPrefix="uc4" %>
<%@ Register TagPrefix="ASPNETPortal" TagName="Banner" Src="~/DesktopPortalBanner.ascx" %>
<%@ Import Namespace="ASPNET.StarterKit.Portal" %>
<html>
<head id="Head1">
    <title>Photo Album Admin</title>
    <link rel="stylesheet" href='<%= Global.GetApplicationPath(Request) + "/ASPNETPortal.css" %>'
        type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%">
            <tr valign="top">
                <td colspan="1">
                        <ASPNETPortal:Banner ShowTabs="false" runat="server" id="Banner1" />
                </td>
            </tr>
            <tr><td>
                <uc4:PhotoEdit ID="ucPhotoEdit" runat="server" />
            </td></tr>
            </table>
    </form>
</body>
</html>
