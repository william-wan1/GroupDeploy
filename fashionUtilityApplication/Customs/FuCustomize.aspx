<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FuCustomize.aspx.cs" Inherits="fashionUtilityApplication.FuCustomize"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

       <div class="container body-content">
        <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 trending-div text-center" >
                    <img src="../Pictures/trending.JPG" alt="image" class="img-responsive" 
                    />
                </div>
            
          </div>

           <div class="row">
                <asp:ListView ID="ListView1"  
                    ItemType="fashionUtilityApplication.Models.Custom" 
                    runat="server"
                    SelectMethod="GetCustoms" >
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-6 col-lg-6 trending-div text-center">
                            <a href="<%#: Item.CustomName%>Custom.aspx">
                                <h2><%#: Item.CustomName.ToUpper() %></h2>
                                <img src="../Pictures/customize/<%#: Item.CustomName.ToLower() %>.jpg" alt="image" class="img-responsive" 
                            /></a>
                           
                           <!-- <a href="MenProductList.aspx?id=<%#: Item.CustomID %>" class="buttonLink">SHOP <%#: Item.CustomName.ToUpper() %></a> -->
                    </div>
                    </ItemTemplate>
                </asp:ListView>
              
             </div>


        </div>

</asp:Content>
