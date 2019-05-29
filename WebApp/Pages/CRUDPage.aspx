<%@ Page Title="CRUD Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUDPage.aspx.cs" Inherits="WebApp.Pages.CRUDPage" %>

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
        UpdateMethod="UpdateProduct"
         OnDeleted="CheckForException"
         OnSelected="CheckForException"
         OnInserted="CheckForException"
         OnUpdated="CheckForException"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="CategoryODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Category_List" TypeName="GroceryListSystem.BLL.CategoryController"></asp:ObjectDataSource>

    <asp:ValidationSummary ID="ValidationSummaryInsert" runat="server" 
         HeaderText="Following are concerns with your data:" ValidationGroup="igroup"/>
    <asp:ValidationSummary ID="ValidationSummaryUpdate" runat="server" 
         HeaderText="Following are concerns with your data:" ValidationGroup="egroup"/>

    <asp:ListView ID="ProductListView" runat="server" DataSourceID="ProductODS" InsertItemPosition="LastItem" DataKeyNames="ProductID">
        <AlternatingItemTemplate>
            <tr class="table-striped" style="background-color: #FAFAD2; color: #284775;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" 
                        OnClientClick="return confirm('Are you sure to delete?')"/>
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" Enabled="false" Width="25px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" Width="120px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" Width="65px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount") %>' runat="server" ID="DiscountLabel" Width="65px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" Width="100px" /></td>
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
            <asp:RequiredFieldValidator ID="RequiredTitleTextBoxE" runat="server" 
                ErrorMessage="Description is required" Display="None" 
                ControlToValidate="DescriptionTextBoxE" ValidationGroup="egroup" >
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExTitleTextBoxE" runat="server"
                ErrorMessage="Description is limited to 100 characters" Display="None" 
                ControlToValidate="DescriptionTextBoxE" ValidationGroup="egroup"
                ValidationExpression="^.{1,100}$">
            </asp:RegularExpressionValidator>
            <asp:RangeValidator ID="RangePriceTextBoxE" runat="server" 
                ErrorMessage="Price should be between 0 and 100" 
                MinimumValue="0" MaximumValue="100" Type="Double"
                Display="None" ControlToValidate="PriceTextBoxE"
                ValidationGroup="egroup">
            </asp:RangeValidator>

            <asp:RangeValidator ID="RegExDiscountTextBoxE" runat="server" 
                ErrorMessage="Discount should be between 0 and 100" 
                MinimumValue="0" MaximumValue="100" Type="Double"
                Display="None" ControlToValidate="DiscountTextBoxE"
                ValidationGroup="egroup">
            </asp:RangeValidator>
            
            <asp:RequiredFieldValidator ID="RequiredUnitSizeE" runat="server" 
                ErrorMessage="Unit Size is required" Display="None" 
                ControlToValidate="UnitSizeTextBoxE" ValidationGroup="egroup" >
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExUnitSizeE" runat="server"
                ErrorMessage="Unit size is limited to 20 characters" Display="None" 
                ControlToValidate="UnitSizeTextBoxE" ValidationGroup="egroup"
                ValidationExpression="^.{1,20}$">
            </asp:RegularExpressionValidator>

            <tr style="background-color: #FFCC66; color: #000080;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" ValidationGroup="egroup" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBoxE" Enabled="false" Width="25px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBoxE" Width="120px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="PriceTextBoxE" Width="65px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="DiscountTextBoxE" Width="65px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBoxE" Width="100px" /></td>
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
            <asp:RequiredFieldValidator ID="RequiredTitleTextBoxI" runat="server" 
                ErrorMessage="Description is required" Display="None" 
                ControlToValidate="DescriptionTextBoxI" ValidationGroup="igroup" >
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExTitleTextBoxI" runat="server"
                ErrorMessage="Description is limited to 100 characters" Display="None" 
                ControlToValidate="DescriptionTextBoxI" ValidationGroup="igroup"
                ValidationExpression="^.{1,100}$">
            </asp:RegularExpressionValidator>
            <asp:RangeValidator ID="RangePriceTextBoxI" runat="server" 
                ErrorMessage="Price should be between 0 and 100" 
                MinimumValue="0" MaximumValue="100" Type="Double"
                Display="None" ControlToValidate="PriceTextBoxI"
                ValidationGroup="igroup">
            </asp:RangeValidator>

            <asp:RangeValidator ID="RegExDiscountTextBoxI" runat="server" 
                ErrorMessage="Discount should be between 0 and 100" 
                MinimumValue="0" MaximumValue="100" Type="Double"
                Display="None" ControlToValidate="DiscountTextBoxI"
                ValidationGroup="igroup">
            </asp:RangeValidator>
            
            <asp:RequiredFieldValidator ID="RequiredUnitSizeI" runat="server" 
                ErrorMessage="Unit Size is required" Display="None" 
                ControlToValidate="UnitSizeTextBoxI" ValidationGroup="igroup" >
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExUnitSizeI" runat="server"
                ErrorMessage="Unit size is limited to 20 characters" Display="None" 
                ControlToValidate="UnitSizeTextBoxI" ValidationGroup="igroup"
                ValidationExpression="^.{1,20}$">
            </asp:RegularExpressionValidator>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" ValidationGroup="igroup" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBoxI" Enabled="false" Width="25px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBoxI" Width="120px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="PriceTextBoxI" Width="65px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="DiscountTextBoxI" Width="65px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBoxI" Width="100px" /></td>
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
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" Width="120px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" Width="65px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Discount") %>' runat="server" ID="DiscountLabel" Width="65px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" Width="100px" /></td>
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
                        <table class="table table-striped" runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
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
                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333; padding:10px 0;">
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
        <%--<SelectedItemTemplate>
            <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" Width="75px" /></td>
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
        </SelectedItemTemplate>--%>
    </asp:ListView>
</asp:Content>
