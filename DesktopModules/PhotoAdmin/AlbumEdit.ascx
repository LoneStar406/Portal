<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AlbumEdit.ascx.cs" Inherits="DesktopModules_PhotoAdmin_AlbumEdit" %>
<table width="100%">
    <tr>
        <td colspan=2>
           An album is a group of photos from the photo library. Here you can choose which
            album to see or create a new one.</td>
    </tr>
    <tr><td>
        Select Album To Display In PhotoBrowser:
        <asp:DropDownList ID="ddlAlbum" runat="server" DataSourceID="dsAlbum" DataTextField="Caption"
            DataValueField="Count">
        </asp:DropDownList><asp:ObjectDataSource ID="dsAlbum" runat="server" DeleteMethod="RemoveAlbum"
            InsertMethod="AddAlbum" SelectMethod="GetAlbums" TypeName="ASPNET.StarterKit.Portal.PhotosDB"
            UpdateMethod="EditAlbum">
            <DeleteParameters>
                <asp:Parameter Name="AlbumID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Caption" Type="String" />
                <asp:Parameter Name="IsPublic" Type="Boolean" />
                <asp:Parameter Name="AlbumID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Caption" Type="String" />
                <asp:Parameter Name="IsPublic" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </td><td></td></tr>
</table>