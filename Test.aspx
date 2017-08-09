<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <link href="ASPNETPortal.css" type="text/css" rel="stylesheet">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <table><tr><td>Welcome to Photo Administration. You are currently administering photo browser <%=miModuleID%> </td></tr><tr><td>
    <div>
        <asp:GridView ID="gvAlbums" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsAlbums" Caption="Albums Attached to Module" OnRowCommand="gvAlbums_RowCommand" Width="100%">   <SelectedRowStyle CssClass="SelectedRowStyle" />

            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" Visible="False" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                <asp:BoundField DataField="title_photo_id" HeaderText="title_photo_id" SortExpression="title_photo_id" />
                <asp:CheckBoxField DataField="is_active" HeaderText="is_active" SortExpression="is_active" Visible="False" />
                <asp:BoundField DataField="created_by_id" HeaderText="created_by_id" SortExpression="created_by_id" Visible="False" />
                <asp:BoundField DataField="created_date" HeaderText="created_date" SortExpression="created_date" Visible="False" />
                <asp:BoundField DataField="updated_by_id" HeaderText="updated_by_id" SortExpression="updated_by_id" Visible="False" />
                <asp:BoundField DataField="updated_date" HeaderText="updated_date" SortExpression="updated_date" Visible="False" />
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:ButtonField CommandName="Delete" Text="Remove" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
            BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="odsPhotos"
            GridLines="Horizontal" PageSize="3">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />   <SelectedRowStyle CssClass="SelectedRowStyle" />

            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="location_small" HeaderText="location_small" SortExpression="location_small" />
                <asp:BoundField DataField="location_medium" HeaderText="location_medium" SortExpression="location_medium" />
                <asp:BoundField DataField="location_large" HeaderText="location_large" SortExpression="location_large" />
                <asp:BoundField DataField="location_original" HeaderText="location_original" SortExpression="location_original" />
                <asp:CheckBoxField DataField="is_active" HeaderText="is_active" SortExpression="is_active" />
                <asp:BoundField DataField="created_by_id" HeaderText="created_by_id" SortExpression="created_by_id" />
                <asp:BoundField DataField="created_date" HeaderText="created_date" SortExpression="created_date" />
                <asp:BoundField DataField="updated_by_id" HeaderText="updated_by_id" SortExpression="updated_by_id" />
                <asp:BoundField DataField="updated_date" HeaderText="updated_date" SortExpression="updated_date" />
            </Columns>
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
    
    </div>
        <asp:ObjectDataSource ID="odsPhotos" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPhotosByAlbumID"
            TypeName="PhotoBOTableAdapters.PhotosTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_timestamp" Type="Object" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="location_small" Type="String" />
                <asp:Parameter Name="location_medium" Type="String" />
                <asp:Parameter Name="location_large" Type="String" />
                <asp:Parameter Name="location_original" Type="String" />
                <asp:Parameter Name="is_active" Type="Boolean" />
                <asp:Parameter Name="created_by_id" Type="Int32" />
                <asp:Parameter Name="created_date" Type="DateTime" />
                <asp:Parameter Name="updated_by_id" Type="Int32" />
                <asp:Parameter Name="updated_date" Type="DateTime" />
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_timestamp" Type="Object" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="location_small" Type="String" />
                <asp:Parameter Name="location_medium" Type="String" />
                <asp:Parameter Name="location_large" Type="String" />
                <asp:Parameter Name="location_original" Type="String" />
                <asp:Parameter Name="is_active" Type="Boolean" />
                <asp:Parameter Name="created_by_id" Type="Int32" />
                <asp:Parameter Name="created_date" Type="DateTime" />
                <asp:Parameter Name="updated_by_id" Type="Int32" />
                <asp:Parameter Name="updated_date" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="album_id" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsAlbums" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlbumsByModuleID"
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
    </td></tr></table>
        <asp:Button ID="Button1" runat="server" Text="Attach New Album" /></form>
</body>
</html>
