<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PhotoEdit.ascx.cs" Inherits="DesktopModules_PhotoAdmin_PhotoEdit" %>
<table width="100%"><tr><td>
    <asp:GridView ID="gvPhotos" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        DataSourceID="odsPhotos" Width="100%">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="id" />
                <asp:TemplateField HeaderText="Photo">
                        <ItemTemplate>
                            <img alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' class="photo_198" src='Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S'
                                style="border: 4px solid white" />
                        </ItemTemplate>
                    </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="tags" HeaderText="Tags" SortExpression="tags" />
        </Columns>
    </asp:GridView>
</td></tr></table>
<asp:ObjectDataSource ID="odsPhotos" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PhotoBOTableAdapters.PhotosTableAdapter"
    UpdateMethod="Update">
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
</asp:ObjectDataSource>
