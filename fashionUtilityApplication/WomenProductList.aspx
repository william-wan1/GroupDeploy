<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WomenProductList.aspx.cs" Inherits="fashionUtilityApplication.WomenProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="dropdown-content">     
           <div class="container" >
               <a href="/ProductList.aspx">All</a>
            <asp:ListView ID="categoryList"  
                ItemType="fashionUtilityApplication.Models.Category" 
                runat="server"
                SelectMethod="GetCategories" >
                <ItemTemplate>
                        <a href="/MenProductList.aspx?id=<%#: Item.CategoryID %>">
                        <%#: Item.CategoryName %>
                        </a>
                </ItemTemplate>
            </asp:ListView>
                </div>
        </div>
     <section>
        <div class="container body-content">
           

            <asp:ListView ID="productList" runat="server" 
                DataKeyNames="ProductID" GroupItemCount="2"
                ItemType="fashionUtilityApplication.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td><h3>No data was returned.</h3></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td style="border:solid;width:550px;height:500px;"  >
                                    <a href="/ProductDetails.aspx?productID=<%#:Item.ProductID%>">
                                        <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath%>"
                                            style="width:100%;height:100%;"  /></a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="/ProductDetails.aspx?productID=<%#:Item.ProductID%>">
                                        <span>
                                            <%#:Item.ProductName%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b><i>Size: </i></b><%#:Item.Size.SizeName%>
                                    </span>
                                    <br />
                                    <h4>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </h4>
                                    <br />
                          
                                   
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>
