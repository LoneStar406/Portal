<%@ Control Language="C#" AutoEventWireup="true" Inherits="ASPNET.StarterKit.Portal.ActivityLogAggregated"
    CodeFile="ActivityLogAggregated.ascx.cs" CodeFileBaseClass="ASPNET.StarterKit.Portal.PortalModuleControl" %>
<%@ Register TagPrefix="ASPNETPortal" TagName="Title" Src="~/DesktopModuleTitle.ascx" %>
<ASPNETPortal:Title EditText="" EditUrl=""
    runat="server" ID="Title1" />
    <table width = "600px"><tr><td>
        <asp:GridView ID="gvActivityAgg" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="sdsActivityAgg"
            ForeColor="#333333" GridLines="None" Width="100%" PageSize="20">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerSettings Position="Top" />
            <Columns>
                <asp:BoundField DataField="DateOf" HeaderText="Date" SortExpression="DateOf" DataFormatString="{0:d}" HtmlEncode="false" />
                <asp:BoundField DataField="TotalHits" HeaderText="Total Hits" SortExpression="TotalHits" />
                <asp:BoundField DataField="TotalLogIns" HeaderText="Total Logins" SortExpression="TotalLogIns" />
                <asp:BoundField DataField="TotalDistinctLogIns" HeaderText="Total Distinct Hits"
                    SortExpression="TotalDistinctLogIns" />
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" VerticalAlign="Top" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </td></tr><tr><td align=right>
        <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="Refresh Data" /></td></tr></table>
<asp:SqlDataSource ID="sdsActivityAgg" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [DateOf], [TotalHits], [TotalLogIns], [TotalDistinctLogIns] FROM [toma_t_rpt_activity_agg] WHERE ([IsActive] = ?) ORDER BY [DateOf] DESC">
    <SelectParameters>
        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>
