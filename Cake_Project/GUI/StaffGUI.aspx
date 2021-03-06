<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Form.Master" AutoEventWireup="true" CodeBehind="StaffGUI.aspx.cs" Inherits="Cake_Project.GUI.StaffGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblId_staff" runat="server" Text="ID Staff :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtIdStaff" runat="server"></asp:TextBox></td>
            <td>
                <asp:Label ID="lblNameStaff" runat="server" Text="Name Staff :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtName_Staff" runat="server"></asp:TextBox></td>
            <td>
                <asp:Label ID="lblNumber_Phone" runat="server" Text="Number Phone :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtNumber_Phone" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            <td>
                <asp:Label ID="lblAddress" runat="server" Text="Address :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <table style="margin-left:500px;">
        <tr>
            <td>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click"   /></td>
            <td style="padding-left:60px;">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"   /></td>
            <td style="padding-left:60px;">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"   /></td>
            <td style="padding-left:60px;">
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click"   /></td>
        </tr>
    </table>
    <asp:GridView ID="ViewStaff" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" OnSelectedIndexChanged="ViewCustomer_SelectedIndexChanged" 
        OnRowDataBound="ViewStaff_RowDataBound" OnRowDeleting="ViewStaff_RowDeleting" DataKeyNames="AID_STAFF">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField HeaderText="ID Staff" DataField="AID_STAFF"/>
            <asp:BoundField HeaderText="Name Staff" DataField="ANAME_STAFF" />
            <asp:BoundField HeaderText="Email" DataField="AEMAIL" />
            <asp:BoundField HeaderText="Address" DataField="AADDRESS"/>
            <asp:BoundField HeaderText="Phone Number" DataField="ANUMBER_PHONE" />
            <asp:ButtonField ButtonType="Button" HeaderText="Chọn" Text="Chọn" CommandName="Select" />
            <asp:TemplateField HeaderText="Del" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton  ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField> 
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
