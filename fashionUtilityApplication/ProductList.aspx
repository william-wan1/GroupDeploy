<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="fashionUtilityApplication.ProductList" %>



<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <section>
         <br />
          <br /> <br />
          <br />
  <!-- <audio id="music" runat="server" controls  loop >
      <source src="Media/Music/327.mp3"  type="audio/ogg">
      <source src="Media/Music/327.mp3" type="audio/mpeg">
    Your browser does not support the audio element.
    </audio>
    -->
         <embed src="Media/Music/327.mp3" width="180"  height="90" loop="true" autostart="true" hidden="true" />

            <div id="filterDiv">
                <div class="filterItem">
                    <button id="sortByButton">Sort By</button>
                    <div style="display:none;" id="sortByDiv" class="filterItem-content">
                        <input type="radio" id="featured" name="sortBy" value="featured ">
                        <label for="featured">Featured</label><br>
                        <input type="radio" id="new" name="sortBy" value="new">
                        <label for="new">New in Store</label><br>
                        <input type="radio" id="highToLow" name="sortBy" value="highToLow"> 
                        <label for="highToLow">Price High To Low</label><br />
                        <input type="radio" id="lowToHigh" name="sortBy" value="lowToHigh">
                        <label for="lowToHigh">Price Low To High</label>
                    </div>
                    </div>
                <div class="filterItem">
                    <button id="genderButton">Gender</button>
                    <div style="display:none;" id="genderDiv" class="filterItem-content">
                        <input type="radio" id="male" name="gender" value="male">
                        <label for="male">Male</label><br>
                        <input type="radio" id="female" name="gender" value="female">
                        <label for="female">Female</label><br>
                        <input type="radio" id="unisex" name="gender" value="unisex">
                        <label for="unisex">Unisex</label>
                    </div>
                 </div>

                <div class="filterItem">
                    <button id="categoryButton">Category</button>
                    <div style="display:none;" id="categoryDiv" class="filterItem-content">
                        <input type="checkbox" id="tees" name="category" value="tees" runat="server" onClick="" AutoPostBack="true">
                        <label for="tees">Tees</label><br>

                        <input type="checkbox" id="bottoms" name="category" value="bottoms"  runat="server">
                        <label for="bottoms">Bottoms</label><br>

                        <input type="checkbox" id="shirts" name="category" value="shirts"  runat="server">
                        <label for="shirts">Shirts</label><br>

                        <input type="checkbox" id="skirts" name="category" value="skirts"  runat="server">
                        <label for="skirts">Skirts</label><br>

                        <input type="checkbox" id="tshirts" name="category" value="tshirts"  runat="server">
                        <label for="tshirts">T-Shirts</label><br>

                        <input type="checkbox" id="accessories" name="category" value="accessories" runat="server">
                        <label for="accessories">Accessories</label><br>

                        <input type="checkbox" id="coats" name="category" value="coats" runat="server">
                        <label for="coats">Coats</label><br>

                        <input type="checkbox" id="hoodies" name="category" value="hoodies" runat="server">
                        <label for="hoodies">Hoodies</label><br>

                        <input type="checkbox" id="dresses" name="category" value="dresses" runat="server">
                        <label for="dresses">Dresses</label><br>

                        <input type="checkbox" id="jeans" name="category" value="jeans" runat="server">
                        <label for="jeans">Jeans</label><br>
                     </div>
                  </div>

               <div class="filterItem"> 
                     <button id="sizeButton">Size</button>
                </div>

                <div class="filterItem">
                  <button id="brandButton">Brand</button>
                </div>

                <div class="filterItem">
                  <button id="colorButton">Color</button>
                </div>
        </div>
               <script type="text/javascript">
     $(document).ready(function () {
         $("#sortByButton").click(function (e) {
             e.preventDefault();
             $("#sortByDiv").slideToggle("slow");
         });
         $("#genderButton").click(function (e) {
             e.preventDefault();
             $("#genderDiv").slideToggle("slow");
         });
         $("#categoryButton").click(function (e) {
             e.preventDefault();
             $("#categoryDiv").slideToggle("slow");
         });
     });
</script>
            <div class="container body-content">
            <asp:ListView ID="productList" runat="server" 
                DataKeyNames="ProductID" GroupItemCount="2" 
                ItemType="fashionUtilityApplication.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
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
                                <td style="border: solid"  >
                                    <a href="/ProductDetails.aspx?productID=<%#:Item.ProductID%>">
                                        <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath%>"
                                            style="width:100%" /></a>
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
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
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
