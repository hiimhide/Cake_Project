<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Form.Master" AutoEventWireup="true" CodeBehind="ProductGUI.aspx.cs" Inherits="Cake_Project.GUI.ProductManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .images{
            width:180px;
            height:220px;
        }
        p{
            margin:30px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td><asp:Label ID="lblIdProduct" runat="server" Text="ID Product :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtIdProduct" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblNameProduct" runat="server" Text="Name Product :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtNameProduct" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblImages" runat="server" Text="Images :"></asp:Label></td>
            <td>
                <asp:FileUpload ID="fulImages" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPrice" runat="server" Text="Price :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblDescride" runat="server" Text="Descride :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDescride" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblDiscount" runat="server" Text="Discount :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDiscount" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblDateStart" runat="server" Text="Date Start :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDateStart" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblDateEnd" runat="server" Text="Date End :"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDateEnd" runat="server"></asp:TextBox></td>
            <td class="w100 h27x">
                        <asp:Label ID="lblfloor" runat="server" CssClass="fL mT6 clw s12 b">Sàn :</asp:Label>
                    </td>
                    <td class="w100 h27x">
                        <asp:DropDownList ID="ddlfloor" runat="server" Width="140px" TabIndex="2"  CssClass="w95 textcenter margin0" AutoPostBack="True" OnSelectedIndexChanged="ddlfloor_SelectedIndexChanged">
                            <asp:ListItem Value="ALL">ALL</asp:ListItem>
                            <asp:ListItem Value="HSX" >HSX</asp:ListItem>
                            <asp:ListItem Value="N" >HNX.LISTED</asp:ListItem>
                            <asp:ListItem Value="UC">HNX.UPCOM</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="w100 h27x">
                        <asp:Label ID="lblbuysell" runat="server" CssClass="fL mT6 clw s12 b">Mua/bán :</asp:Label>
                    </td>
                    <td class="w100 h27x">
                        <asp:DropDownList ID="ddlbuysell" runat="server" Width="140px" TabIndex="3" CssClass="w95 textcenter margin0">
                            <asp:ListItem Value="ALL">ALL</asp:ListItem>
                            <asp:ListItem Value="B">Buy</asp:ListItem>
                            <asp:ListItem Value="S">Sell</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="w100 h27x">
                        <asp:Label ID="lbllenh" runat="server" CssClass="fL mT6 clw s12 b" Visible="false">Option :</asp:Label>
                    </td>
                    <td class="btn-w100">
                        <asp:DropDownList ID="ddlLenh" runat="server" Width="140px" TabIndex="3" Visible ="false" CssClass="w95 textcenter margin0" >
                            <asp:ListItem Value="ALL">ALL</asp:ListItem>
                            <asp:ListItem Value="B">LO & MP</asp:ListItem>
                            <asp:ListItem Value="S">ATC</asp:ListItem>
                        </asp:DropDownList>
                    </td>
        </tr>
        </table>

    <table style="margin-left:500px;">
        <tr>
            <td>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" /></td>
            <td style="padding-left:60px;">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /></td>
            <td style="padding-left:60px;">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /></td>
            <td style="padding-left:60px;">
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" /></td>
            <td style="padding-left:60px;">
                <asp:Button ID="Button1" runat="server" Text="test" /></td>
        </tr>
    </table>
    <asp:GridView ID="viewProduct" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="viewProduct_SelectedIndexChanged" DataKeyNames="AID_PRODUCT" OnRowDataBound="viewProduct_RowDataBound" OnRowDeleting="viewProduct_RowDeleting" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField HeaderText="ID Product" DataField="AID_PRODUCT">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Name Product" DataField="ANAME_PRODUCT">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Price" DataField="APRICE">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Descride" DataField="ADESCRIDE" />
            <asp:BoundField HeaderText="Discount" DataField="ADISCOUNT" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Date Start" DataFormatString = "{0:d}"  DataField="ADATE_START"/>
            <asp:BoundField HeaderText="Date End" DataFormatString = "{0:d}"  DataField="ADATE_END"/>
            <asp:ImageField HeaderText="Images" ControlStyle-CssClass="images" DataImageUrlField="AIMAGES">
<ControlStyle CssClass="images"></ControlStyle>
            </asp:ImageField>
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
