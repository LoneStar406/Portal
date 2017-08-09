<%@ Page validateRequest=false Language="C#" AutoEventWireup="true" CodeFile="EditTestimonial.aspx.cs" Inherits="ASPNET.StarterKit.Portal.EditTestimonial" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Import Namespace="ASPNET.StarterKit.Portal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Add\Edit Testimonial</title>
</head>
<body>
    <form id="form1" runat="server">
<table width="98%" cellspacing="0" cellpadding="4" border="0">
                            <tr valign="top">
                                <td width="100">
                                    &nbsp;
                                </td>
                                <td width="*">
                                    <table width="750" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="left" class="Head">
                                                Testimonial Settings
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <hr noshade size="1">
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="720" cellspacing="0" cellpadding="0">
                                        <tr valign="top">
                                            <td class="SubHead">
                                                Testimonial Summary:
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
                                                &nbsp;<FCKeditorV2:FCKeditor ID="FCKeditorSummary" BasePath="~/FCKeditor/" runat="server" Height="300px">
                                                </FCKeditorV2:FCKeditor>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="SubHead">
                                                Testimonial:
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
                                                &nbsp;<FCKeditorV2:FCKeditor ID="FCKeditorTestimonial" BasePath="~/FCKeditor/" runat="server" Height="400px">
                                                </FCKeditorV2:FCKeditor>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="SubHead">
                                                Priority:
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox id="PriorityText" columns="75" width="650" rows="1" runat="server" /><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="PriorityText"
                                                    ErrorMessage="Please enter a number between 0 and 100" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
                                        </tr>
                                    </table>
                                    <p>
                                        <asp:LinkButton id="deleteButton" Text="Delete" runat="server" class="CommandButton" BorderStyle="none" onclick="DeleteBtn_Click" />
                                &nbsp;
                                        <asp:LinkButton id="updateButton" Text="Update" runat="server" class="CommandButton" BorderStyle="none" onclick="UpdateBtn_Click" />
                                        &nbsp;
                                        <asp:LinkButton id="cancelButton" Text="Cancel" CausesValidation="False" runat="server" class="CommandButton" BorderStyle="none" onclick="CancelBtn_Click" />
                                        &nbsp;&nbsp;&nbsp;</p></td>
                            </tr>
                        </table>
    </form>
</body>
</html>
