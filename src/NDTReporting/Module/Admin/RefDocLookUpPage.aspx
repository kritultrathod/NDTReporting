<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RefDocLookUpPage.aspx.cs" Inherits="NDTReporting.RefDocLookUpPage" MasterPageFile="~/Module/Admin/Admin.Master" %>

<%@ MasterType VirtualPath="~/Module/Admin/Admin.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%" border="0">
        <%--RefDocumentId--%>
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
        <%--Code--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td style="width: 30%">
                <asp:Label ID="Label3" runat="server" CssClass="lookUpLabel">Code<div class="RedFont">*</div></asp:Label>
            </td>
            <td style="width: 30%">
                <asp:TextBox ID="ParamCodeTB" runat="server" Width="95%" CssClass="ltextbox" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ParamCodeTB" ErrorMessage="* Required!" runat="server" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--TestSpecification--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td style="width: 30%">
                <asp:Label ID="Label4" runat="server" CssClass="lookUpLabel">Technical Specification<div class="RedFont">*</div></asp:Label>
            </td>
            <td style="width: 30%">
                <asp:TextBox ID="ParamTechSpecTB" runat="server" Width="95%" CssClass="ltextbox" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ParamTechSpecTB" ErrorMessage="* Required!" runat="server" ValidationGroup="Group1" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--TestProcedureNo--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" CssClass="lookUpLabel">Technical Procedure No.<div class="RedFont">*</div></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ParamTechProcTB" runat="server" Width="95%" CssClass="ltextbox" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Group1" ControlToValidate="ParamTechProcTB" ErrorMessage="* Required!" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <%--AcceptanceStandard--%>
        <tr>
            <td style="width: 20%">
                &nbsp;
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="lookUpLabel">Acceptance Standard<div class="RedFont">*</div></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ParamAcceptStd" runat="server" Width="95%" CssClass="ltextbox" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Group1" ControlToValidate="ParamAcceptStd" ErrorMessage="* Required!" Display="Dynamic"></asp:RequiredFieldValidator>
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
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="RefDocumentId" Width="100%" CssClass="border" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="RefDocumentId" HeaderText="Identifier">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="Code" HeaderText="Code">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="TestSpecification" HeaderText="Technical Specification">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="TestProcedureNo" HeaderText="Technical Procedure No">
                    <ItemStyle CssClass="TableValue" />
                </asp:BoundField>
                <asp:BoundField DataField="AcceptanceStandard" HeaderText="Acceptance Standard">
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
