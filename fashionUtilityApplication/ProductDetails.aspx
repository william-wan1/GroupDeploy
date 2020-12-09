<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="fashionUtilityApplication.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <asp:FormView ID="productDetail" runat="server" ItemType="fashionUtilityApplication.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
                    <h2 style="margin: 10px 0 0 10%;"><a href="/ProductList.aspx">Go Back</a></h2>

            <div class="productDetails">
                <table>
                    <tr>
                        <td  style="width:70%;">
                            <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath %>" style="width: 100%; " alt="<%#:Item.ProductName %>"/>
                        </td>
                        <td>&nbsp;</td>  
                        <td style="vertical-align: top; text-align:left; width:50%;">
                            <div>
                    <h1><%#:Item.ProductName %></h1>
                </div>
                       <br />
                          <b>Description:</b><br /><%#:Item.Description %> <br /> <br />
                           <b>Size: </b> <%#:Item.Size.SizeName %>
                            <br />
                            <h4><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %></h4>
                            <br />
                            <br />
            	   
                             <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">               
                                            <span class="ProductListItem">
                                                <b class="sendRequestButton">Add To Cart</b>
                                      </span>           
                              </a>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
