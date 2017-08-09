<%@ Page Language="c#" Inherits="ASPNET.StarterKit.Portal.DesktopDefault2" CodeFile="DesktopDefault2.aspx.cs" %>

<%@ Import Namespace="ASPNET.StarterKit.Portal" %>
<%--

   The DesktopDefault.aspx page is used to load and populate each Portal View.  It accomplishes
   this by reading the layout configuration of the portal from the Portal Configuration
   system, and then using this information to dynamically instantiate portal modules
   (each implemented as an ASP.NET User Control), and then inject them into the page.

--%>
<html>
<head runat="server">
    <title>TOMA</title>
    <link href="ASPNETPortal.css" type="text/css" rel="stylesheet">
    <link href="Frame.css" type="text/css" rel="stylesheet">
</head>
<body leftmargin="10" bottommargin="0" rightmargin="10" topmargin="10" marginheight="0"
    marginwidth="0">
    <form id="Form2" runat="server">
        <table width="1024px" cellspacing="0" cellpadding="0" border="0">
            <tr height="50">
                <td colspan="10" style="height: 50px" align="center">
                    <span style='position: absolute; z-index: 3; left: 10px; top: 10px; width: 100%;
                        height: 50px;'>
                        <img height="100%" width="100%" src="images/TopKarateBarFill.gif" /></span><span
                            style='position: absolute; z-index: 3; left: 10px; top: 17px; width: 100%; height: 100px;'>
                            <asp:Label ID="siteName" CssClass="SiteTitle" EnableViewState="False" runat="server" Width="550px" /></span>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="5" height="25" bgcolor="#af0000" align="right">
                    <asp:Label ID="WelcomeMessage" ForeColor="#eeeeee" runat="server" />&nbsp;<a href="<%= Global.GetApplicationPath(Request) %>/DesktopDefault.aspx"
                        class="SiteLink">Portal Home</a> <span class="Accent">|</span> <a href="<%= Global.GetApplicationPath(Request) %>/Docs/Docs.htm"
                            target="_blank" class="SiteLink">Portal Documentation</a>
                    <%= LogoffLink %>
                    &nbsp;&nbsp;</td>
                <td>
                </td>
            </tr>
            <tr height="25px">
                <td width=87px>
                <td width=50px>
                <td bgcolor="#af0000" width="75px">
                <td width="600px"><marquee scrollamount="3" scrolldelay="10" height="100%" style="font-family: Papyrus;  font-weight: bold; font-size: 16pt;"> This is the dev environment of Traditional Okinawan Martial Arts. Work is still in progress</marquee>
</td>
                <td width="75px" bgcolor="#af0000">
                <td width=50px>
                <td width=87px>
            </tr>
            <tr height="25px">
                <td>
                <td bgcolor="#af0000">
                <td bgcolor="#af0000">
                <td bgcolor="#af0000">
                <td bgcolor="#af0000">
                <td bgcolor="#af0000">
                <td>
            </tr>
            <tr height="*" valign="top">
                <td colspan="2" width="137px">
                    <asp:DataList ID="tabs" CssClass="MenuItemStyle" ItemStyle-Height="25" SelectedItemStyle-CssClass="TabBg"
                        ItemStyle-BorderWidth="1" EnableViewState="false" runat="server"  width="100%">
                        <ItemTemplate>
                            &nbsp;<a href='<%= Global.GetApplicationPath(Request) %>/DesktopDefault2.aspx?tabindex=<%# Container.ItemIndex %>&tabid=<%# ((TabStripDetails) Container.DataItem).TabId %>'
                                class="OtherTabs"><%# ((TabStripDetails) Container.DataItem).TabName %></a>&nbsp;
                        </ItemTemplate>
                        <SelectedItemTemplate>
                            &nbsp;<span class="SelectedTab"><%# ((TabStripDetails) Container.DataItem).TabName %></span>&nbsp;
                        </SelectedItemTemplate>
                        <SelectedItemStyle CssClass="TabBg" />
                        <ItemStyle BorderWidth="1px" Height="25px" BackColor="#920000" BorderStyle="Groove"/>
                    </asp:DataList>
                </td>
                <td bgcolor="#af0000" align="center"><img align=middle src="images/toma kanji..no redsmall.jpg" width="55px">
                <td width="600px">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td id="LeftPane" visible="false" runat="server">
                            </td>
                            <td style="width: 1px">
                            </td>
                            <td id="ContentPane" visible="false" width="600px" runat="server">
                            </td>
                        </tr>
                    </table>
                </td>
                <td bgcolor="#af0000" align="center"><img align=middle src="images/isshinryu..no red.jpg" width="75px" />
                <td colspan="2" id="RightPane" visible="false" runat="server" width="137px">
                </td>
            </tr>
        </table>        
    </form>
</body>
</html>
