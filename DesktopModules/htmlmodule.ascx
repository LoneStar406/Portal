<%@ Control language="c#" Inherits="ASPNET.StarterKit.Portal.HtmlModule" CodeFile="HtmlModule.ascx.cs" CodeFileBaseClass="ASPNET.StarterKit.Portal.PortalModuleControl" %>
<%@ Register TagPrefix="Portal" TagName="Title" Src="~/DesktopModuleTitle.ascx"%>
<portal:title EditText="Edit" EditUrl="~/DesktopModules/EditHtml.aspx" runat="server" id=Title1 />

<table id="t1" runat="server">
    <tr valign="top">
        <td id="HtmlHolder" runat="server">
        </td>
    </tr>
</table>
