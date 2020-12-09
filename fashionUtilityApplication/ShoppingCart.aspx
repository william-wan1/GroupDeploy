<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="fashionUtilityApplication.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container authorization">
        <br /><br />
        <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Shopping Cart</h1></div>
        <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowHeader="True" ShowFooter="False" GridLines="Vertical" CellPadding="4"
            ItemType="fashionUtilityApplication.Models.CartItem" SelectMethod="GetShoppingCartItems" 
             >   
            <Columns>
                <asp:TemplateField ControlStyle-BorderColor="Red" ItemStyle-Width="30%" >            
                    <ItemTemplate >
                        <a href="/ProductDetails.aspx?productID=<%#:Item.ItemId%>">
                 <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath%>"
                                                style="width:100%"/></a>
             </ItemTemplate>        
            </asp:TemplateField>    
           <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" ShowHeader="false" />        
            <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />        
            <asp:BoundField DataField="Product.Size.SizeName" HeaderText="Size" />        
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}"/>  
            <asp:TemplateField   HeaderText="Quantity">            
                    <ItemTemplate>
                        <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox> 
                    </ItemTemplate>        
            </asp:TemplateField>     
            <asp:TemplateField HeaderText="Item Total">            
                    <ItemTemplate>
                        <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                    </ItemTemplate>        
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Remove Item">            
                    <ItemTemplate>
                        <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                    </ItemTemplate>        
            </asp:TemplateField>      
            </Columns>    

        </asp:GridView>
        <div>
            <p></p>
            <strong>
                <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
                <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
            </strong> 
        </div>
        <br />
        <div> 
    
            <asp:Button ID="UpdateBtn" runat="server" CssClass="btn btn-secondary" Text="Update" OnClick="UpdateBtn_Click" />
            <br /><br />
   
             <asp:ImageButton ID="BrainetreeBtn" runat="server" 
                          ImageUrl="~/Pictures/socials/visa.png" 
                          Width="145" AlternateText="Check out with stripe" 
                          OnClick="BraintreeCheckout" 
                          BackColor="Transparent" BorderWidth="0" />    
        
            <br />
      
             <asp:ImageButton ID="CheckoutImageBtn" runat="server" 
                          ImageUrl="~/Pictures/socials/pay-pal.png" 
                          Width="145" AlternateText="Check out with PayPal" 
                          OnClick="PaypalCheckout" 
                          BackColor="Transparent" BorderWidth="0" />    
        
            <br />

      
        
        </div>
      </div>
</asp:Content>
