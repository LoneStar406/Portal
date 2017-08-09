<%@ Page validateRequest="false"  Language="c#" Inherits="ASPNET.StarterKit.Portal.EditRichText" CodeFile="editrichtext.aspx.cs" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register TagPrefix="portal" TagName="Banner" Src="~/DesktopPortalBanner.ascx" %>
<%@ Import Namespace="ASPNET.StarterKit.Portal" %>

<html>
    <head>
        <link rel="stylesheet" href='<%= Global.GetApplicationPath(Request) + "/ASPNetPortal.css" %>' type="text/css" />
    </head>
    <body leftmargin="0" bottommargin="0" rightmargin="0" topmargin="0" marginheight="0" marginwidth="0">
        <form runat="server">
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tr valign="top">
                    <td colspan="2">
                        <portal:Banner id="SiteHeader" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <table width="98%" cellspacing="0" cellpadding="4" border="0">
                            <tr valign="top">
                                <td width="100">
                                    &nbsp;
                                </td>
                                <td width="*">
                                    <table width="750" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="left" class="Head">
                                                Rich Text Settings - Warning Image Browser and upload is not currently functional</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <hr noshade size="1">
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="750" cellspacing="0" cellpadding="0">
                                        <tr valign="top">
                                            <td>
                                                Please enter content:
                                            </td>
                                            </tr><tr>
                                            <td align=center width= 95%>
                                                <FCKeditorV2:FCKeditor ID="FCKEDesktop" BasePath="~/FCKeditor/" runat="server" Height="600px">
                                                </FCKeditorV2:FCKeditor>
                                            </td>
                                        </tr>
                                    </table>
                                    <p>
                                        <asp:LinkButton id="updateButton" Text="Update" runat="server" class="CommandButton" BorderStyle="none" onclick="UpdateBtn_Click" />
                                        &nbsp;
                                        <asp:LinkButton id="cancelButton" Text="Cancel" CausesValidation="False" runat="server" class="CommandButton" BorderStyle="none" onclick="CancelBtn_Click" />
                                        &nbsp;
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
