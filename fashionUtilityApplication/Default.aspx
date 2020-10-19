<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="fashionUtilityApplication._Default"  %>

    <asp:Content ContentPlaceHolderID="headContent" runat="server">
        <link href="Content/Site.css" runat="server" rel="Stylesheet" type="text/css" />
      
    </asp:Content>
  
    <asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server"  >
       
           

       <div class="dropdown-content">     
           <div class="container" >
               <a href="#">All</a>
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
        <div  class="container body-content">
        <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 trending-div text-center" >
                    <img src="Pictures/trending.JPG" alt="image" class="img-responsive" 
                    />
                </div>
            
          </div>

           <div class="row">
                <asp:ListView ID="ListView1"  
                    ItemType="fashionUtilityApplication.Models.Category" 
                    runat="server"
                    SelectMethod="GetCategories" >
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-6 col-lg-6 trending-div text-center">
                            <a href="MenProductList.aspx?id=<%#: Item.CategoryID %>"><img src="Pictures/men/<%#: Item.CategoryName.ToLower() %>.jpg" alt="image" class="img-responsive" 
                            /></a>
                           <h2><%#: Item.CategoryName.ToUpper() %></h2>
                            <a href="MenProductList.aspx?id=<%#: Item.CategoryID %>" class="buttonLink">SHOP <%#: Item.CategoryName.ToUpper() %></a>
                    </div>
                    </ItemTemplate>
                </asp:ListView>
              
             </div>


        </div>
</asp:Content>
