<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhotoBrowserEdit.aspx.cs"
    Inherits="ASPNET.StarterKit.Portal.PhotoBrowserEdit" %>

<%@ Register Src="PhotoAdmin/PhotoBrowserEdit.ascx" TagName="PhotoBrowserEdit" TagPrefix="uc2" %>
<%@ Register Src="PhotoAdmin/AlbumEdit.ascx" TagName="AlbumEdit" TagPrefix="uc3" %>

<%@ Register Src="PhotoAdmin/PhotoLibraryEdit.ascx" TagName="PhotoLibraryEdit" TagPrefix="uc1" %>

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
                <td colspan="3">
                        <ASPNETPortal:Banner ShowTabs="false" runat="server" id="Banner1" />
                </td>
            </tr>
            <tr>
                <td width=50% colspan = 2>
                    Welcome to the Photo Admin page. This page allows you to add, edit and remove photos from
                    the photo album. Click <asp:LinkButton id="lbCancelButton1" Text="Here" CausesValidation="False" runat="server" class="CommandButton" BorderStyle="none" onclick="CancelBtn_Click" /> to go back at any time.</td><td width=10%><asp:LinkButton id="lbCancelButton" Text="Go Back" CausesValidation="False" runat="server" class="CommandButton" BorderStyle="none" onclick="CancelBtn_Click" /></td>
            </tr>
            <tr><td>Please select a task from the following drop down:</td><td colspan = 2>
                <asp:DropDownList ID="ddlTask" runat="server" Width="100%" OnSelectedIndexChanged="ddlTask_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="0">Manage Current Photo Browser</asp:ListItem>
                    <asp:ListItem Value="1">Manage Album</asp:ListItem>
                    <asp:ListItem Value="2">Manage Library</asp:ListItem>
                </asp:DropDownList></td></tr>
            
            <tr>
                <td colspan="3">
                    <uc2:PhotoBrowserEdit ID="lucPhotoBrowserEdit" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <uc3:AlbumEdit ID="lucAlbumEdit" runat="server" Visible = false />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <uc1:PhotoLibraryEdit ID="lucPhotoLibraryEdit" runat="server" Visible = false/>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="DSPhotos" runat="server" TypeName="ASPNET.StarterKit.Portal.PhotosDB"
            SelectMethod="GetPhotos" DeleteMethod="RemovePhoto" UpdateMethod="EditPhoto">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="AlbumID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="PhotoID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Caption" Type="String" />
                <asp:Parameter Name="PhotoID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
