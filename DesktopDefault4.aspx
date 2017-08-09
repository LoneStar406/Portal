<%@ Page Language="c#" Inherits="ASPNET.StarterKit.Portal.DesktopDefault4" CodeFile="DesktopDefault4.aspx.cs" %>

<%@ Import Namespace="ASPNET.StarterKit.Portal" %>
<%--

   The DesktopDefault.aspx page is used to load and populate each Portal View.  It accomplishes
   this by reading the layout configuration of the portal from the Portal Configuration
   system, and then using this information to dynamically instantiate portal modules
   (each implemented as an ASP.NET User Control), and then inject them into the page.

--%>
<html>
<head runat="server">
    <title>ASP.NET Portal Starter Kit</title>
    <link href="ASPNETPortal.css" type="text/css" rel="stylesheet">
    <link href="Frame.css" type="text/css" rel="stylesheet">
</head>
<body leftmargin="10" bottommargin="0" rightmargin="10" topmargin="10" marginheight="0"
    marginwidth="0">
    <form id="Form2" runat="server">
        <table width="800px" cellspacing="0" cellpadding="0" border="0">
            <tr height="150">
                <td colspan="10" style="height: 150px" align="center">
                    <span style='position: absolute; z-index: 3; left: 10px; top: 10px; width: 100%;
                        height: 50px;'>
                        <img src="images/kamakura-gateTOP.JPG" /></span><span
                            style='position: absolute; z-index: 3; left: 10px; top: 25px; width: 100%; height: 25px;'>
                            <asp:Label ID="siteName" CssClass="SiteTitle" EnableViewState="False" runat="server" /></span>
                </td>
            </tr>
            <tr>
                <td colspan="5" height="25" align="right">
                    <asp:Label ID="WelcomeMessage" ForeColor="#eeeeee" runat="server" />&nbsp;<a href="<%= Global.GetApplicationPath(Request) %>/DesktopDefault.aspx"
                        class="SiteLink">Portal Home</a> <span class="Accent">|</span> <a href="<%= Global.GetApplicationPath(Request) %>/Docs/Docs.htm"
                            target="_blank" class="SiteLink">Portal Documentation</a>
                    <%= LogoffLink %>
                    &nbsp;&nbsp;</td>
            </tr>
            <tr height="25px">
                <td><marquee scrollamount="3" scrolldelay="10" width="100%" height="100%" style="font-family: Verdana; font-size: 8pt;"> This is the dev environment of Traditional Okinawan Martial Arts. Work is still in progress</marquee>
</td>
            </tr>
            <tr height="*" valign="top">
                <td colspan="2" width="150px">
                    <asp:DataList ID="tabs" CssClass="OtherTabsBg" ItemStyle-Height="25" SelectedItemStyle-CssClass="TabBg"
                        ItemStyle-BorderWidth="1" EnableViewState="false" runat="server" Width="100%">
                        <ItemTemplate>
                            &nbsp;<a href='<%= Global.GetApplicationPath(Request) %>/DesktopDefault4.aspx?tabindex=<%# Container.ItemIndex %>&tabid=<%# ((TabStripDetails) Container.DataItem).TabId %>'
                                class="OtherTabs"><%# ((TabStripDetails) Container.DataItem).TabName %></a>&nbsp;
                        </ItemTemplate>
                        <SelectedItemTemplate>
                            &nbsp;<span class="SelectedTab"><%# ((TabStripDetails) Container.DataItem).TabName %></span>&nbsp;
                        </SelectedItemTemplate>
                        <SelectedItemStyle CssClass="TabBg" />
                        <ItemStyle BorderWidth="1px" Height="25px" />
                    </asp:DataList>
                </td>
                <td bgcolor="#cccccc" width="50px" style="background:#fff url(images/pillarslice.jpg) repeat-y;">
                <td width="400px">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td id="LeftPane" visible="false" runat="server">
                            </td>
                            <td style="width: 1px">
                            </td>
                            <td id="ContentPane" visible="false" width="*" runat="server"></td>
                        </tr>
                    </table>
                </td>
                <td bgcolor="#cccccc" width="50px" style="background:#fff url(images/pillarsliceright.jpg) repeat-y;">
                <td colspan="2" id="RightPane" visible="false" runat="server" width="150px">
                </td>
            </tr>
        </table>        
    </form>
</body>
</html>
