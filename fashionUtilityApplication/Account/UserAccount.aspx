<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="fashionUtilityApplication.Account.UserAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <aside id="dashboard">
            <header>
               <h1>Fashion Utility</h1>
            </header>
            <div>
                <a>My Account</a>
                <a>Account Information</a>
                <a>My Orders</a>
                <a>Address Book</a>
                <a>Payment Method</a>
                <a>Change Password</a>
            </div>

        </aside>
        <div id="mainDiv">
            <asp:GridView ID="accountGridView" runat="server" AutoGenerateColumns="False" ShowHeader="false" ShowFooter="False" GridLines="Vertical" CellPadding="4"
            ItemType="fashionUtilityApplication.Models.User" SelectMethod="GetAccountInfomation" 
             >   
            <Columns>
                <asp:TemplateField ControlStyle-BorderColor="Red" ItemStyle-Width="25%" >            
                    <ItemTemplate >
                        <h2>My Account</h2>
                        <p>Username and Phone Number can be edited</p>
                         <asp:Label runat="server" AssociatedControlID="UsernameTextbox" CssClass="col-md-2 control-label">USERNAME</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="UsernameTextbox" runat="server"  CssClass="form-control" TextMode="SingleLine"   Text="<%#:Item.Username %>" />
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
            ItemType="fashionUtilityApplication.Models.User" SelectMethod="GetAddressInformation" 
             >   
            <Columns>
                <asp:TemplateField ControlStyle-BorderColor="Red" ItemStyle-Width="25%" >            
                    <ItemTemplate >
                        <h2>Address Book</h2>
                         <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID ="addAddress" runat="server" OnClick="AddAddressFunction" Text="ADD NEW ADDRESS" CssClass="btn btn-default"/>
                            </div>
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
                                <asp:Button ID ="updateInfoButton" runat="server" OnClick="UpdateAccountInformation" Text="Update Information" CssClass="btn btn-default"  ViewStateMode="Disabled"/>
                            </div>
                        </div>
                       
                 </ItemTemplate>        
                </asp:TemplateField>  
            </Columns>
                </asp:GridView>
            <!--Orders gridview-->
            
        </div>
    </div>
</asp:Content>
