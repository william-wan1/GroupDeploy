<%@ Page EnableEventValidation="false" Title=""  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="fashionUtilityApplication.ProductList" %>
<%@ MasterType VirtualPath="~/Site.Master" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

 
       
                  <script type="text/javascript">
                      $(document).ready(function () {
                          Page_BlockSubmit = false;

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
                          $("#sizeButton").click(function (e) {
                              e.preventDefault();
                              $("#sizeDiv").slideToggle("slow");
                          });
                          $("#brandButton").click(function (e) {
                              e.preventDefault();
                              $("#brandDiv").slideToggle("slow");
                          });
                          $("#colorButton").click(function (e) {
                              e.preventDefault();
                              $("#colorDiv").slideToggle("slow");
                          });
                      });
        </script>
        
        <div id="filterDiv">
            <div class="filterItem">
                   <asp:DropDownList  style="border:1px solid black;width:100%;" runat="server" id="sortList" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="sortList_SelectedIndexChanged">
                        <asp:ListItem>Order By</asp:ListItem>
                        <asp:ListItem Value="phtl">Price High To Low</asp:ListItem>
                        <asp:ListItem Value="plth">Price Low To High</asp:ListItem>
                    </asp:DropDownList>  
                
            </div>
                <div class="filterItem">
                    <button id="genderButton">Gender</button>
                   <div style="display:none;" id="genderDiv" class="filterItem-content">
                        <asp:ListView ID="ListView1" SelectionMode="Multiple" 
                        ItemType="fashionUtilityApplication.Models.Gender" 
                        
                             AutoPostBack="true"
                        runat="server"
                        SelectMethod="GetGenders">  
                         <ItemTemplate>
                             <asp:CheckBox runat="server" ID="genderList" Text=<%#: Item.GenderName %>  AutoPostBack="true" OnCheckedChanged="categoryList_CheckedChanged" Checked="false"  /><br />
                        </ItemTemplate>
                    </asp:ListView> 
                     </div>
                 </div>

                <div class="filterItem">
                    <button id="categoryButton">Category</button>
                    <div style="display:none;" id="categoryDiv" class="filterItem-content">
                        <asp:ListView ID="categoryListView" SelectionMode="Multiple" 
                        ItemType="fashionUtilityApplication.Models.Category" 
                        
                             AutoPostBack="true"
                        runat="server"
                        SelectMethod="GetCategories">  
                         <ItemTemplate>
                             <asp:CheckBox runat="server" ID="categoryList" Text=<%#: Item.CategoryName %>  AutoPostBack="true" OnCheckedChanged="categoryList_CheckedChanged" Checked="false"  /><br />
                        </ItemTemplate>
                    </asp:ListView> 
                     </div>
                  </div>

               <div class="filterItem"> 
                     <button id="sizeButton">Size</button>
                      <div style="display:none;" id="sizeDiv" class="filterItem-content">
                            <asp:ListView ID="sizeListView" SelectionMode="Multiple" 
                                ItemType="fashionUtilityApplication.Models.Size" 
                                runat="server" 
                                SelectMethod="GetSizes">  
                             <ItemTemplate>
                                <asp:CheckBox runat="server" ID="sizeList" Text="<%#: Item.SizeName %>" AutoPostBack="true" OnCheckedChanged="categoryList_CheckedChanged" Checked="false" /><br />
                            </ItemTemplate>
                        </asp:ListView> 
                       </div>
                </div>

                <div class="filterItem">
                  <button id="brandButton">Brand</button>
                    <div style="display:none;" id="brandDiv" class="filterItem-content">
                        <asp:ListView ID="brandListView" SelectionMode="Multiple" 
                        ItemType="fashionUtilityApplication.Models.Company" 
                        runat="server"
                        SelectMethod="GetCompanies">  
                         <ItemTemplate>
                            <asp:CheckBox runat="server" ID="brandList" Text="<%#: Item.CompanyName %>" AutoPostBack="true" OnCheckedChanged="categoryList_CheckedChanged" Checked="false" /><br />
                        </ItemTemplate>
                    </asp:ListView> 
                     </div>
                </div>

                <div class="filterItem">
                  <button id="colorButton">Color</button>
                    <div style="display:none;" id="colorDiv" class="filterItem-content">
                        <asp:ListView ID="colorListView" SelectionMode="Multiple" 
                        ItemType="fashionUtilityApplication.Models.Color" 
                        runat="server"
                        SelectMethod="GetColors">  
                         <ItemTemplate>
                            <asp:CheckBox runat="server" ID="colorList" Text="<%#: Item.ColorName %>" AutoPostBack="true" OnCheckedChanged="categoryList_CheckedChanged" Checked="false" /><br />
                        </ItemTemplate>
                    </asp:ListView> 
                     </div>
                </div>
        </div>
   <!-- "-->
     
            <div class="container body-content">
            <asp:ListView ID="productList" runat="server" 
                DataKeyNames="ProductID" GroupItemCount="2" 
                
                ItemType="fashionUtilityApplication.Models.Product">
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
</asp:Content>
