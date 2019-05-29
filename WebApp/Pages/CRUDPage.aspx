<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUDPage.aspx.cs" Inherits="WebApp.Pages.CRUDPage" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>CRUD QUERY </h1>
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />

    <asp:ObjectDataSource ID="ProductODS" 
        runat="server" 
        DataObjectTypeName="GroceryList.Data.Entities.Product" 
        OldValuesParameterFormatString="original_{0}" 
        TypeName="GroceryListSystem.BLL.ProductController"
        DeleteMethod="DeleteProduct" 
        InsertMethod="AddProduct"
        SelectMethod="Product_List" 
        UpdateMethod="UpdateProduct"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="CategoryODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Category_List" TypeName="GroceryListSystem.BLL.CategoryController"></asp:ObjectDataSource>

    <asp:ListView ID="ProductListView" runat="server" DataSourceID="ProductODS" InsertItemPosition="LastItem" DataKeyNames="ProductID">
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2; color: #284775;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" Enabled="false" Width="25px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount") %>' runat="server" ID="DiscountLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" /></td>
                <%--<td>
                    <asp:Label Text='<%# Eval("CategoryID") %>' runat="server" ID="CategoryIDLabel" /></td>
                <td>--%>
                <td>
                    <asp:DropDownList ID="CategoryIDList" runat="server" 
                        DataSourceID="CategoryODS" DataTextField="Description" 
                        DataValueField="CategoryID" 
                        SelectedValue='<%# Eval("CategoryID") %>' 
                        Enabled="false"></asp:DropDownList>
                    </td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" /></td>
                <%--<td>
                    <asp:Label Text='<%# Eval("DescriptionUnitSize") %>' runat="server" ID="DescriptionUnitSizeLabel" /></td>
                --%></tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66; color: #000080;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBox" Enabled="false" Width="25px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="PriceTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="DiscountTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBox" /></td>
               <%-- <td>
                    <asp:TextBox Text='<%# Bind("CategoryID") %>' runat="server" ID="CategoryIDTextBox" /></td>
                <td>--%>
                <td>
                    <asp:DropDownList ID="CategoryIDList" runat="server" 
                        DataSourceID="CategoryODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                        SelectedValue='<%# Bind("CategoryID") %>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">Select</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="TaxableCheckBox" /></td>
                <%--<td>
                    <asp:TextBox Text='<%# Bind("DescriptionUnitSize") %>' runat="server" ID="DescriptionUnitSizeTextBox" /></td>
                --%></tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBox" Enabled="false" Width="25px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="PriceTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="DiscountTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBox" /></td>
                <%--<td>
                    <asp:TextBox Text='<%# Bind("CategoryID") %>' runat="server" ID="CategoryIDTextBox" /></td>
                <td>--%>
                <td>
                    <asp:DropDownList ID="CategoryIDList" runat="server" 
                        DataSourceID="CategoryODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                        SelectedValue='<%# Bind("CategoryID") %>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">Select</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="TaxableCheckBox" /></td>
                <%--<td>
                    <asp:TextBox Text='<%# Bind("DescriptionUnitSize") %>' runat="server" ID="DescriptionUnitSizeTextBox" /></td>
               --%> </tr>
        </InsertItemTemplate>
        <ItemTemplate>


            <tr style="background-color: #FFFBD6; color: #333333;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" Enabled="false" Width="25px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount") %>' runat="server" ID="DiscountLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" /></td>
                <%--<td>
                    <asp:Label Text='<%# Eval("CategoryID") %>' runat="server" ID="CategoryIDLabel" /></td>
                <td>--%>
                <td>
                    <asp:DropDownList ID="CategoryIDList" runat="server" 
                        DataSourceID="CategoryODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                        SelectedValue='<%# Eval("CategoryID") %>'
                        Enabled="false">
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" /></td>
                <%--<td>
                    <asp:Label Text='<%# Eval("DescriptionUnitSize") %>' runat="server" ID="DescriptionUnitSizeLabel" /></td>
                --%>

            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">ProductID</th>
                                <th runat="server">Description</th>
                                <th runat="server">Price</th>
                                <th runat="server">Discount</th>
                                <th runat="server">UnitSize</th>
                                <th runat="server">CategoryID</th>
                                <th runat="server">Taxable</th>
                                <%--<th runat="server">DescriptionUnitSize</th>--%>
                                <%--<th runat="server">Category</th>--%>
                                <%--<th runat="server">OrderLists</th>--%>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                <asp:NumericPagerField></asp:NumericPagerField>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount") %>' runat="server" ID="DiscountLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" /></td>
                <td>
                    <asp:DropDownList ID="CategoryIDList" runat="server" 
                        DataSourceID="CategoryODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                        SelectedValue='<%# Eval("CategoryID") %>'
                        Enabled="false">
                        <asp:ListItem Value="">Select</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
