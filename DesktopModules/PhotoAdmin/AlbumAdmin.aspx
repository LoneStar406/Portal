<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AlbumAdmin.aspx.cs" Inherits="DesktopModules_PhotoAdmin_AlbumAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="ASPNETPortal.css" type="text/css" rel="stylesheet">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    Welcome to Photo Administration. You are currently administering photo browser
                    <%=miModuleID%>
                </td>
            </tr>
            <tr><td>Filter: <asp:CheckBox ID="chkFilter" runat="server" Text="Only Show Attached Albums" /></td></tr>
            
            <tr>
                <td>
                    <div>
                        <asp:GridView ID="gvAlbums" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsAlbums" Caption="Albums Attached to Module"
                            OnRowCommand="gvAlbums_RowCommand" Width="100%">
                            <SelectedRowStyle CssClass="SelectedRowStyle" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                    SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                                <asp:BoundField DataField="title_photo_id" HeaderText="title_photo_id" SortExpression="title_photo_id" />
                                <asp:CheckBoxField DataField="is_active" HeaderText="is_active" SortExpression="is_active"
                                    Visible="False" />
                                <asp:BoundField DataField="created_by_id" HeaderText="created_by_id" SortExpression="created_by_id"
                                    Visible="False" />
                                <asp:BoundField DataField="created_date" HeaderText="created_date" SortExpression="created_date"
                                    Visible="False" />
                                <asp:BoundField DataField="updated_by_id" HeaderText="updated_by_id" SortExpression="updated_by_id"
                                    Visible="False" />
                                <asp:BoundField DataField="updated_date" HeaderText="updated_date" SortExpression="updated_date"
                                    Visible="False" />
                                <asp:CommandField ShowEditButton="True" />
                                <asp:ButtonField CommandName="Add" Text="Add" />
                                <asp:ButtonField CommandName="Delete" Text="Delete" />
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="odsAlbums" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlbumsByNotModuleID"
                            TypeName="PhotoBOTableAdapters.AlbumsTableAdapter" UpdateMethod="Update" OnSelecting="odsAlbums_Selecting">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id" Type="Int32" />
                                <asp:Parameter Name="Original_timestamp" Type="Object" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="description" Type="String" />
                                <asp:Parameter Name="title_photo_id" Type="Int32" />
                                <asp:Parameter Name="is_active" Type="Boolean" />
                                <asp:Parameter Name="created_by_id" Type="Int32" />
                                <asp:Parameter Name="created_date" Type="DateTime" />
                                <asp:Parameter Name="updated_by_id" Type="Int32" />
                                <asp:Parameter Name="updated_date" Type="DateTime" />
                                <asp:Parameter Name="Original_id" Type="Int32" />
                                <asp:Parameter Name="Original_timestamp" Type="Object" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:Parameter Name="module_id" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="description" Type="String" />
                                <asp:Parameter Name="title_photo_id" Type="Int32" />
                                <asp:Parameter Name="is_active" Type="Boolean" />
                                <asp:Parameter Name="created_by_id" Type="Int32" />
                                <asp:Parameter Name="created_date" Type="DateTime" />
                                <asp:Parameter Name="updated_by_id" Type="Int32" />
                                <asp:Parameter Name="updated_date" Type="DateTime" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </div>
                </td>
            </tr>
            <tr><td align="right" ><asp:Button ID="bntAdd" runat="server" Text="Create An Album" /></td></tr>
            <tr><td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                    DataSourceID="ObjectDataSource1">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                        <asp:BoundField DataField="title_photo_id" HeaderText="title_photo_id" SortExpression="title_photo_id" />
                        <asp:CheckBoxField DataField="is_active" HeaderText="is_active" SortExpression="is_active" />
                        <asp:BoundField DataField="created_by_id" HeaderText="created_by_id" SortExpression="created_by_id" />
                        <asp:BoundField DataField="created_date" HeaderText="created_date" SortExpression="created_date" />
                        <asp:BoundField DataField="updated_by_id" HeaderText="updated_by_id" SortExpression="updated_by_id" />
                        <asp:BoundField DataField="updated_date" HeaderText="updated_date" SortExpression="updated_date" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlbumsPlusModulesByModuleID"
                    TypeName="PhotoBOTableAdapters.AlbumsTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                        <asp:Parameter Name="Original_timestamp" Type="Object" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="title_photo_id" Type="Int32" />
                        <asp:Parameter Name="is_active" Type="Boolean" />
                        <asp:Parameter Name="created_by_id" Type="Int32" />
                        <asp:Parameter Name="created_date" Type="DateTime" />
                        <asp:Parameter Name="updated_by_id" Type="Int32" />
                        <asp:Parameter Name="updated_date" Type="DateTime" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                        <asp:Parameter Name="Original_timestamp" Type="Object" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter Name="ModuleID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="title_photo_id" Type="Int32" />
                        <asp:Parameter Name="is_active" Type="Boolean" />
                        <asp:Parameter Name="created_by_id" Type="Int32" />
                        <asp:Parameter Name="created_date" Type="DateTime" />
                        <asp:Parameter Name="updated_by_id" Type="Int32" />
                        <asp:Parameter Name="updated_date" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td></tr>
        </table>
    </form>
</body>
</html>
