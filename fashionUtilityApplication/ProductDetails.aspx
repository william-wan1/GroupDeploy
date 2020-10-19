<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="fashionUtilityApplication.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:FormView ID="productDetail" runat="server" ItemType="fashionUtilityApplication.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
                    <h2 style="margin: 10px 0 0 10%;"><a href="/ProductList.aspx">Go Back</a></h2>

            <div class="productDetails">
                <table>
                    <tr>
                        <td  style="width:70%;">
                            <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath %>" style="width: 100%; height:600px;" alt="<%#:Item.ProductName %>"/>
                        </td>
                        <td>&nbsp;</td>  
                        <td style="vertical-align: top; text-align:left; width:50%;">
                            <div>
                    <h1><%#:Item.ProductName %></h1>
                </div>
                <br />
                          <!--  <b>Description:</b><br /><%#:Item.Description %>-->
                            <br />
                            <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %></span>
                            <br />
                           <!-- <span><b>Product Number:</b>&nbsp;<%#:Item.ProductID %></span>-->
                            <br />
            	            <div>
                                 <button class="selector-wrapper" value="S">S</button>
                                    <button class="selector-wrapper" value="M">M</button>
                                    <button class="selector-wrapper" value="L">L</button>
                                    <button class="selector-wrapper" value="XL">XL</button>
                          </div>
           
                             <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">               
                                            <span class="ProductListItem">
                                                <b>Add To Cart<b>
                                      </span>           
                              </a>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
