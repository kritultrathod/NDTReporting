<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SourceLookUpPage.aspx.cs" Inherits="NDTReporting.SourceLookUpPage" MasterPageFile="~/Module/Admin/Admin.Master" %>

<%@ MasterType VirtualPath="~/Module/Admin/Admin.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%" border="0">
        <%--RadiationSourceId--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td style="width: 30%">
                <asp:Label ID="Label2" runat="server" CssClass="lookUpLabel">Identifier</asp:Label>
            </td>
            <td style="width: 30%">                
                    <asp:TextBox ID="ParamKeyTB" style="background-color:#cccccc !important" Enabled="False"  runat="server"></asp:TextBox>
                
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--TypeofSource--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" CssClass="lookUpLabel">Type of Source<div class="RedFont">*</div></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ParamSourceTB" runat="server" Width="95%" CssClass="ltextbox" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ParamSourceTB" ErrorMessage="* Required!" runat="server" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--UnitofEnergy--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" CssClass="lookUpLabel" Visible="False">Unit of Energy<div class="RedFont">*</div></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ParamUnitofEnergyTB" runat="server" Width="95%" 
                    CssClass="ltextbox" MaxLength="50" Visible="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                    ControlToValidate="ParamUnitofEnergyTB" ErrorMessage="* Required!" 
                    runat="server" ValidationGroup="Group1" Display="Dynamic" Visible="False"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--Identification--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" CssClass="lookUpLabel">Source Identification.<div class="RedFont">*</div></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ParamIdentificationTB" runat="server" Width="95%" CssClass="ltextbox" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Group1" ControlToValidate="ParamIdentificationTB" ErrorMessage="* Required!" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--FocalSpotSize--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="lookUpLabel" Visible="False">Focal Spot Size<div class="RedFont">*</div></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ParamFocalSpotSize" runat="server" Width="95%" 
                    CssClass="ltextbox" MaxLength="50" Visible="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ValidationGroup="Group1" ControlToValidate="ParamFocalSpotSize" 
                    ErrorMessage="* Required!" Display="Dynamic" Visible="False"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--Buttons--%>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="2" align="center">
                <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="SAVE" ValidationGroup="Group1" class="classname" />
                <asp:Button ID="ClearButton" runat="server" OnClick="ClearButton_Click" Text="CLEAR" class="classname" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <br />
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="RadiationSourceId" Width="100%" CssClass="border" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="RadiationSourceId" HeaderText="Radiation Source ID">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="TypeofSource" HeaderText="Type Of Source">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitofEnergy" HeaderText="Unit Of Energy">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="Identification" HeaderText="Identification">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="FocalSpotSize" HeaderText="Focal Spot Size">
                    <ItemStyle CssClass="TableValue" />
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
