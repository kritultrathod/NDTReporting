<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LookUpPage.aspx.cs" Inherits="NDTReporting.LookUpPage" MasterPageFile="~/Module/Admin/Admin.Master" %>

<%@ MasterType VirtualPath="~/Module/Admin/Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="pnlDataEntryFields">
        <table style="width: 100%; text-align: center" border="0">
            <tr>
                <td style="width: 20%">
                    &nbsp;
                </td>
                <td style="width: 30%">
                    <asp:Label ID="Label2" runat="server" CssClass="lookUpLabel">Identifier</asp:Label>
                </td>
                <td style="width: 30%">
                    <asp:TextBox ID="ParamKeyTB" runat="server" Style="background-color: #cccccc !important" Enabled="False" MaxLength="200"></asp:TextBox>
                </td>
                <td style="width: 20%">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" CssClass="lookUpLabel">Description<div class="RedFont">*</div></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="ParamDesc1TB" runat="server" MaxLength="200"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Group1" ControlToValidate="ParamDesc1TB" ErrorMessage="* Required!" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" CssClass="lookUpLabel">Alternate Description</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="ParamDesc2TB" runat="server" MaxLength="200"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" CssClass="lookUpLabel">Sequence<div class="RedFont">*</div></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="SortOrderTB" runat="server" MaxLength="200"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Group1" ControlToValidate="SortOrderTB" ErrorMessage="* Required!" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" Type="Integer" MinimumValue="1" MaximumValue="255" ErrorMessage="* Please enter a number in range 1 to 255" runat="server" ValidationGroup="Group1" ControlToValidate="SortOrderTB"
                        Display="Dynamic"></asp:RangeValidator>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td colspan="2">
                    <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="SAVE" ValidationGroup="Group1" class="classname" />
                    <asp:Button ID="ClearButton" runat="server" OnClick="ClearButton_Click" Text="CLEAR" class="classname" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="LookupCodeID" Width="100%" AutoGenerateColumns="False" CssClass="border">
        <Columns>
            <asp:BoundField DataField="LookupCodeID" HeaderText="Lookup Code ID">
                <ItemStyle CssClass="TableValue" />
            </asp:BoundField>
            <asp:BoundField DataField="Code" HeaderText="Code">
                <ItemStyle CssClass="TableValue" />
            </asp:BoundField>
            <asp:BoundField DataField="Identifier" HeaderText="Identifier">
                <ItemStyle CssClass="TableValueCenter" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description">
                <ItemStyle CssClass="TableValue" />
            </asp:BoundField>
            <asp:BoundField DataField="AltDescription" HeaderText="Alternate Description">
                <ItemStyle CssClass="TableValue" />
            </asp:BoundField>
            <asp:BoundField DataField="Sequence" HeaderText="Sequence">
                <ItemStyle CssClass="TableValueCenter" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="Button1" Text="Edit" OnClick="btnEdit_Click" color="#EEEEEE" Style="font-weight: bold" />
                </ItemTemplate>
                <ItemStyle CssClass="TDHeader" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" OnClick="DeleteButton_Click" color="#EEEEEE" Style="font-weight: bold" OnClientClick="if(!confirm('Are you sure you want delete this?')) return false;" />
                </ItemTemplate>
                <ItemStyle CssClass="TDHeader" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
