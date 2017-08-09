<%@ Control Language="C#" AutoEventWireup="true" Inherits="ASPNET.StarterKit.Portal.ActivityLog"
    CodeFile="ActivityLog.ascx.cs" CodeFileBaseClass="ASPNET.StarterKit.Portal.PortalModuleControl" %>
<%@ Register TagPrefix="ASPNETPortal" TagName="Title" Src="~/DesktopModuleTitle.ascx" %>
<ASPNETPortal:Title EditText="" EditUrl=""
    runat="server" ID="Title1" />
    
    <table width = 600px>
    <tr><td>Filter By User:<asp:CheckBox ID="cbFilterUser" runat="server" OnCheckedChanged="cbFilterUser_CheckedChanged" AutoPostBack="True" />
        <asp:DropDownList id="ddlAllUsers" DataTextField="Email" DataValueField="UserID" runat="server" OnSelectedIndexChanged="ddlAllUsers_SelectedIndexChanged" AutoPostBack="True" /></td></tr><tr><td>
        <asp:GridView ID="gvActivityLog" runat="server" AllowPaging="True" AllowSorting="True" DataKeyNames="ActivityLogID" DataSourceID="odsActivityLog"
            PageSize="20" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <PagerSettings Position="Top" />
            <Columns>
                <asp:BoundField DataField="ActivityLogID" HeaderText="ActivityLogID" InsertVisible="False"
                    ReadOnly="True" SortExpression="ActivityLogID" Visible=False/>
                <asp:BoundField DataField="SessionStartTime" HeaderText="First Request" SortExpression="SessionStartTime"/>
                <asp:BoundField DataField="HostAddress" HeaderText="Host Address" SortExpression="HostAddress" />
                <asp:BoundField DataField="HostName" HeaderText="Host Name" SortExpression="HostName" />
                <asp:BoundField DataField="LogInName" HeaderText="Login Name" SortExpression="LogInName" NullDisplayText="Did Not Login" />
                <asp:BoundField DataField="LogInTime" HeaderText="Login Time" SortExpression="LogInTime" NullDisplayText="Did Not Login" />
                <asp:BoundField DataField="LogOutTime" HeaderText="Logout Time" SortExpression="LogOutTime" NullDisplayText="Did Not Logout" />
            </Columns>
            <RowStyle Font-Names="Times New Roman" Font-Size="10pt" BackColor="#F7F6F3" ForeColor="#333333" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </td></tr></table>
<asp:ObjectDataSource ID="odsActivityLog" runat="server" SelectMethod="GetActivityLogs"
    TypeName="ASPNET.StarterKit.Portal.Reports.ActivityLogManager" EnablePaging="True" SelectCountMethod="GetTotalNumberOfActivityLogs" SortParameterName="lsSortExpression" StartRowIndexParameterName="liStartRowIndex" MaximumRowsParameterName="liMaximumRows" OnSelecting="odsActivityLog_Selecting">
    <SelectParameters>
        <asp:FormParameter DefaultValue=""  Name="lsSearchExpression"
            Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
