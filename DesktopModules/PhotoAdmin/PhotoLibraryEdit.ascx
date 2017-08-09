<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PhotoLibraryEdit.ascx.cs"
    Inherits="DesktopModules_PhotoAdmin_PhotoLibraryEdit" %>
<table width="100%">
    <tr>
        <td colspan=2>
           The photo library contains all photos in the system. Here you can add new photos to the library, delete photos from the library and edit the properties of photos.</td>
    </tr>
    <tr>
        <td>
            Add A Photo (This may take some time):</td>
    </tr>
    <tr>
        <td width="70%">
            <asp:FileUpload ID="FileUpload1" runat="server" Width="100%" /></td>
        <td>
            <asp:Button ID="btnAddPhoto" runat="server" OnClick="btnAddPhoto_Click" Text="Add Photo" /></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblReport" runat="server" Visible="False" Width="100%"></asp:Label></td>
    </tr>
    <tr>
        <td>
            Manage Existing Photos:</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="gvPhotos" runat="server" AutoGenerateColumns="False" DataKeyNames="PhotoID"
                DataSourceID="DSPhotos" Width="100%" AllowPaging="True" PageSize="20">
                <Columns>
                    <asp:BoundField DataField="PhotoID" HeaderText="PhotoID" ReadOnly="True" SortExpression="PhotoID" />
                    <asp:TemplateField HeaderText="Photo">
                        <ItemTemplate>
                            <img alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' class="photo_198" src='Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S'
                                style="border: 4px solid white" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Caption" HeaderText="Caption" SortExpression="Caption" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
<asp:ObjectDataSource ID="DSPhotos" runat="server" DeleteMethod="RemovePhoto" SelectMethod="GetPhotos"
    TypeName="ASPNET.StarterKit.Portal.PhotosDB" UpdateMethod="EditPhoto">
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
