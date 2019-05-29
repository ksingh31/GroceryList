<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODSQuery.aspx.cs" Inherits="WebApp.Pages.ODSQuery" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>ODS Query</h1>
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />

    <asp:DropDownList ID="CategoryList" runat="server" DataSourceID="CategoryListData"
        DataTextField="Description" DataValueField="CategoryID" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Select..</asp:ListItem>
    </asp:DropDownList>

    &nbsp;<asp:Button ID="FetchButton" runat="server" Text="Fetch" />
    
    <asp:GridView ID="ProductGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ProductListData">
        <Columns>
            <asp:TemplateField HeaderText="ProductID" SortExpression="ProductID">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("ProductID") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ProductID") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Description") %>' ID="TextBox2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Description") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Price") %>' ID="TextBox3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Price") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Discount" SortExpression="Discount">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Discount") %>' ID="TextBox4"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Discount") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UnitSize" SortExpression="UnitSize">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("UnitSize") %>' ID="TextBox5"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("UnitSize") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="CategoryID" SortExpression="CategoryID">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("CategoryID") %>' ID="TextBox6"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("CategoryID") %>' ID="Label6"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Taxable" SortExpression="Taxable">
                <EditItemTemplate>
                    <asp:CheckBox runat="server" Checked='<%# Bind("Taxable") %>' ID="CheckBox1"></asp:CheckBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox runat="server" Checked='<%# Bind("Taxable") %>' Enabled="false" ID="CheckBox1"></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="DescriptionUnitSize" SortExpression="DescriptionUnitSize">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("DescriptionUnitSize") %>' ID="Label1"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("DescriptionUnitSize") %>' ID="Label7"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>

        </Columns>

        <EmptyDataTemplate>
            <h4>No data to display.</h4>
        </EmptyDataTemplate>
    </asp:GridView>


    <asp:ObjectDataSource ID="CategoryListData" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Category_List" TypeName="GroceryListSystem.BLL.CategoryController">

    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ProductListData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProductByCategory" TypeName="GroceryListSystem.BLL.ProductController">
        <SelectParameters>
            <asp:ControlParameter ControlID="CategoryList" PropertyName="SelectedValue" DefaultValue="0" Name="categoryid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
