<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="fashionUtilityApplication.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div id="mangeConatiner">
        <aside id="accountInfoLinks">
            <header>
               <h1>Fashion Utility</h1>
            </header>
            <div>
                <a href="#accountGridView">My Account</a>
                <a href="#addressGridView">Address Book</a>
                <a href="#orderGridView">My Orders</a>
                <a href="#passwordView">Change Password</a>
            </div>

        </aside>
        <div id="accountInfoDiv">
                <asp:GridView ID="accountGridView" runat="server" AutoGenerateColumns="False" ShowHeader="false" ShowFooter="False" GridLines="Vertical" CellPadding="4"
                ItemType="fashionUtilityApplication.Models.User" SelectMethod="GetAccountInfomation" 
                 >   
                <Columns>
                    <asp:TemplateField ControlStyle-BorderColor="Black" ItemStyle-Width="25%" >            
                        <ItemTemplate >
                            <h2>My Account</h2>
                            <p>Username and Phone Number can be edited</p>
                             <asp:Label runat="server" AssociatedControlID="UsernameTextbox" CssClass="col-md-2 control-label">USERNAME</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="UsernameTextbox" runat="server"  CssClass="form-control" TextMode="SingleLine"  MaxLength="25"  Text="<%#:Item.Username %>" />
                                </div>

                              <asp:Label runat="server" AssociatedControlID="EmailTextbox" CssClass="col-md-2 control-label">EMAIL ADDRESS</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="EmailTextbox" runat="server"  CssClass="form-control" TextMode="Email"  ReadOnly="true"  Text="<%#:Item.EmailAddress %>" />
                                </div>

                             <asp:Label runat="server" AssociatedControlID="PhoneTextbox" CssClass="col-md-2 control-label">PHONE NUMBER</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="PhoneTextbox" runat="server" CssClass="form-control" TextMode="Phone" Text="<%#:Item.PhoneNumber %>" />
                                </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button ID ="updateInfoButton" runat="server" OnClick="UpdateAccountInformation" Text="Update Information" CssClass="btn btn-default" ViewStateMode="Disabled" />
                                </div>
                            </div>
                       
                     </ItemTemplate>        
                    </asp:TemplateField>  
                </Columns>
                    </asp:GridView>

            
                 <asp:GridView ID="addressGridView" runat="server" AutoGenerateColumns="False" ShowHeader="false" ShowFooter="False" GridLines="Vertical" CellPadding="4"
                ItemType="fashionUtilityApplication.Models.Address" SelectMethod="GetAddressInformation" 
                 >   
                <Columns>
                    <asp:TemplateField ControlStyle-BorderColor="Black" ItemStyle-Width="25%" >            
                        <ItemTemplate >
                            <h2>Address Book</h2>
                             <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button ID ="addAddress" runat="server" OnClick="AddAddressFunction" Text="ADD NEW ADDRESS" CssClass="btn btn-default"/>
                                </div>
                            </div>
                              <asp:Label runat="server" AssociatedControlID="AddressUsernameTextbox" CssClass="col-md-2 control-label">Username</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="AddressUsernameTextbox" runat="server"  CssClass="form-control" TextMode="Email"  ReadOnly="true"  Text="<%#:Item.UserName %>" />
                                </div>

                             <asp:Label runat="server" AssociatedControlID="AddressTextbox" CssClass="col-md-2 control-label">Street Address</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="AddressTextbox" runat="server" CssClass="form-control" TextMode="SingleLine" Text="<%#:Item.AddressLine1 %>" />
                                </div>
                            <asp:Label runat="server" AssociatedControlID="CityTextbox" CssClass="col-md-2 control-label">City</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="CityTextBox" runat="server" CssClass="form-control" TextMode="SingleLine" Text="<%#:Item.City %>" />
                                </div>
                            <asp:Label runat="server" AssociatedControlID="PostalCodeTextbox" CssClass="col-md-2 control-label">Postal Code</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="PostalCodeTextbox" runat="server" CssClass="form-control" TextMode="SingleLine" Text="<%#:Item.PostalCode %>" />
                                </div>
                             <asp:Label runat="server" AssociatedControlID="StateTextbox" CssClass="col-md-2 control-label">State</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="StateTextbox" runat="server" CssClass="form-control" TextMode="SingleLine" Text="<%#:Item.State %>" />
                                </div>
                             <asp:Label runat="server" AssociatedControlID="CountryTextBox" CssClass="col-md-2 control-label">Country</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="CountryTextBox" runat="server" CssClass="form-control" TextMode="SingleLine" Text="<%#:Item.Country %>" />
                                </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button ID ="updateAddressButton" runat="server" OnClick="UpdateAddressInformation" Text="Update Address" CssClass="btn btn-default"  ViewStateMode="Disabled"/>
                                </div>
                            </div>
                       
                     </ItemTemplate>        
                    </asp:TemplateField>  
                </Columns>
                    </asp:GridView>
                <!--Orders gridview-->

                  <asp:GridView ID="orderGridView" runat="server" AutoGenerateColumns="False" ShowHeader="false" ShowFooter="False" GridLines="Vertical" CellPadding="4"
                ItemType="fashionUtilityApplication.Models.Order" SelectMethod="GetOrderInformation" 
                 >   
                <Columns>
                    <asp:TemplateField ControlStyle-BorderColor="Black" ItemStyle-Width="25%" >            
                        <ItemTemplate >
                            <h2>My Orders</h2>
                             <div class="form-group">
                            </div>
                              <asp:Label runat="server" AssociatedControlID="OrderDetails" CssClass="col-md-2 control-label">Order Details</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="OrderDetails" runat="server"  CssClass="form-control" TextMode="MultiLine"  ReadOnly="true"  Text="<%#:Item.OrderDetails %>" />
                                </div>

                             <asp:Label runat="server" AssociatedControlID="TotalTextBox" CssClass="col-md-2 control-label">Total Amount</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="TotalTextBox" runat="server" CssClass="form-control" TextMode="SingleLine" Text="<%#:Item.Total %>" />
                                </div>
                            <asp:Label runat="server" AssociatedControlID="ShippedTextBox" CssClass="col-md-2 control-label">Order Shipped</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox  ID="ShippedTextBox" runat="server" CssClass="form-control" TextMode="SingleLine" Text="<%#:Item.HasBeenShipped %>" />
                                </div>
                       
                     </ItemTemplate>        
                    </asp:TemplateField>  
                </Columns>
                    </asp:GridView>

         <!--   <div id="passwordView">
                <div>
                    <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                        <p class="text-success"><%: SuccessMessage %></p>
                    </asp:PlaceHolder>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-horizontal">
                            <h2>Account settings</h2>
                            <hr />
                            <dl class="dl-horizontal">
                                <dt>Password:</dt>
                                <dd>
                                    <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                                    <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                                </dd>
                                <dt>External Logins:</dt>
                                <dd><%: LoginsCount %>
                                    <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server" />

                                </dd>
                                <%--
                                    Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                                    See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                                    for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                                    Uncomment the following blocks after you have set up two-factor authentication
                                --%>
                                <%--
                                <dt>Phone Number:</dt>
                                <% if (HasPhoneNumber)
                                   { %>
                                <dd>
                                    <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                                </dd>
                                <% }
                                   else
                                   { %>
                                <dd>
                                    <asp:Label Text="" ID="PhoneNumber" runat="server" />
                                    <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" /> &nbsp;|&nbsp;
                                    <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                                </dd>
                                <% } %>
                                --%>

                              <!  <dt>Two-Factor Authentication:</dt>
                                <dd>
                                    <p>
                                        There are no two-factor authentication providers configured. See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                                        for details on setting up this ASP.NET application to support two-factor authentication.
                                    </p>
                                    if (TwoFactorEnabled)
                                      { 
                                    Enabled
                                    <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        
                                     }
                                      else
                                      { 
                        
                                    Disabled
                                    <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                                    }
                                </dd> 
                            </dl>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
</asp:Content>
