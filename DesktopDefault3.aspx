<%@ Page Language="c#" Inherits="ASPNET.StarterKit.Portal.DesktopDefault3" CodeFile="DesktopDefault3.aspx.cs" %>

<%@ Import Namespace="ASPNET.StarterKit.Portal" %>
<%--

   The DesktopDefault.aspx page is used to load and populate each Portal View.  It accomplishes
   this by reading the layout configuration of the portal from the Portal Configuration
   system, and then using this information to dynamically instantiate portal modules
   (each implemented as an ASP.NET User Control), and then inject them into the page.
<img src="images/BackgroundTora.JPG" />
--%>
<html>
<head id="Head1" runat="server">
    <title>ASP.NET Portal Starter Kit</title>
    <link href="ASPNETPortal.css" type="text/css" rel="stylesheet">
    <link type="text/css" rel="stylesheet">
</head>
<body leftmargin="20" bottommargin="0" rightmargin="10" topmargin="0" marginheight="0"
    marginwidth="0" style="background:#000000 url(images/BackgroundTora.JPG) no-repeat; padding: 0px 0px 0px 0px;  width: 850px;height: 600px;" >
    <form id="Form2" runat="server">
        <br />
            <table width="800px" cellspacing="0" cellpadding="0" border="0">
                <tr height="50">
                    <td colspan="10" align="center">
                        <asp:Label ID="siteName" CssClass="SiteTitle" EnableViewState="False" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td width="400px">
                    </td>
                    <td bgcolor="#000000" align="right" style="height: 25px; filter: alpha(opacity=70);">
                        <asp:Label ID="WelcomeMessage" ForeColor="#eeeeee" runat="server" />&nbsp;<a href="<%= Global.GetApplicationPath(Request) %>/DesktopDefault.aspx"
                            class="SiteLink">Portal Home</a> <span class="Accent">|</span> <a href="<%= Global.GetApplicationPath(Request) %>/Docs/Docs.htm"
                                target="_blank" class="SiteLink">Portal Documentation</a>
                        <%= LogoffLink %>
                        &nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td height="50px">
                    </td>
                </tr>
                <tr height="25px">
                    <td colspan="2" style="padding: 0px 100px 0px 100px;">
                        <marquee scrollamount="3" scrolldelay="10" width="100%" height="100%" style="color=#eeeeee;  font-family: Verdana;
                            font-size: 8pt; filter: alpha(opacity=70);" bgcolor="#000000">
                            This is the dev environment of Traditional Okinawan Martial Arts. Work is still
                            in progress</marquee>
                    </td>
                </tr>
                <tr>
                    <td height="50px">
                    </td>
                </tr>
                <tr height="*" valign="top">
                    <td colspan="2">
                        <table cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td width=160px style="filter: alpha(opacity=70)" bgcolor="#000000" valign="top">
                                    <asp:DataList ID="tabs" CssClass="OtherTabsBg" ItemStyle-Height="25" SelectedItemStyle-CssClass="TabBg"
                                        ItemStyle-BorderWidth="1" EnableViewState="false" runat="server" Width="160px">
                                        <ItemTemplate>
                                            &nbsp;<a href='<%= Global.GetApplicationPath(Request) %>/DesktopDefault3.aspx?tabindex=<%# Container.ItemIndex %>&tabid=<%# ((TabStripDetails) Container.DataItem).TabId %>'
                                                class="OtherTabs"><%# ((TabStripDetails) Container.DataItem).TabName %></a>&nbsp;
                                        </ItemTemplate>
                                        <SelectedItemTemplate>
                                            &nbsp;<span class="SelectedTab"><%# ((TabStripDetails) Container.DataItem).TabName %></span>&nbsp;
                                        </SelectedItemTemplate>
                                        <SelectedItemStyle CssClass="TabBg" />
                                        <ItemStyle BorderWidth="1px" Height="25px" />
                                    </asp:DataList>
                                </td>
                                <td width = 60px>
                                    &nbsp;&nbsp;&nbsp;</td>
                                <td width="330" valign="top">
                                    <table width = 330px height=100% cellspacing="0" cellpadding="0" border="0">
                                        <tr>
                                            <td id="LeftPane" visible="false" width="200" runat="server" bgcolor="#000000" style="filter: alpha(opacity=90);">
                                            </td>
                                            <td style="width: 1px">
                                            </td>
                                            <td id="ContentPane" visible="false" width="*" runat="server" bgcolor="#000000" style="filter: alpha(opacity=90);">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width = 60px>
                                    &nbsp;</td>
                                <td width = 190 id="RightPane" visible="false" runat="server" bgcolor="#000000" style="filter: alpha(opacity=70);" valign="top">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
