<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShirtsCustom.aspx.cs" Inherits="fashionUtilityApplication.ShirtsCustom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dropdown-content">     
           <div class="container" style="text-align:center;">
               <a href ="ShortsCustom.aspx">Shorts</a>
                <a href ="HatsCustom.aspx">Hats</a>
                <a href ="TrousersCustom.aspx">Trousers</a>
                
                </div>
        </div>
    <div class="container body-content">
        <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 trending-div text-center" >
                    <h1>CUSTOMIZE SHIRTS</h1>
                            <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
                    <div class="customDiv ">
                         <div class="topButton">
                
                            <button id="frontButton">Front</button>
                            <button id="backButton">Back</button>
                        </div>
                        <div class="leftButton">
                            <button id="uploadPicture">Upload Picture</button>
                            <button id="uploadTweet">Upload Tweet</button>
                            <button id="makeDesignButton">Make Design</button>
                            <button id="pickDesignButton">Pick Design</button>
                         </div>

                        <div class="centerSection">
                                <img id="selectedDesign" src="#" alt="your image" />

                            <div class="designs">
                                 <div id="" class="rotating heartDesign"><p>Heart Design</p></div>
                                 <div id="" class="rotating chestDesign"><p>Chest Design</p></div>
                                 <div id="" class="rotating torsoDesign"><p>Torso Design</p></div>
                                 <div id="" class="rotating fullDesign"><p>Full Design</p></div>
                             </div>
                        </div>
                         <div class="rightButton">
                            <button id="shortSleevesButton">Short sleeves</button>
                            <button id="longSleevesButton">Long sleeves</button>
                            <button id="blackButton">Black</button>
                            <button id="whiteButton">White</button>
                         </div>
                       
                        <div class="bottomButton">
                            <label for="size">Select Size</label>
                            <select name="size" id="size" runat="server" required>
                              <option value="">Size</option>
                              <option value="1">Small</option>
                              <option value="2">Medium</option>
                              <option value="3">Large</option>
                            </select><br />
                            <label for="qty">Quantity</label>
                            <input type="number" min="0" required name="qty" id="qty" runat="server"/><br />                            
                            <asp:Button  Text='Send Request' runat="server" ID="sendRequest" CssClass="sendRequestButton"  OnClick="sendRequest_Click"   CausesValidation="False"  > </asp:Button>
                        </div>
                    </div>
                    
                </div>
            
          </div>
        </div>
    

                <div id="uploadPictureDiv" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2>Upload a Picture</h2>
                        </div>
                        <div class="modal-body">
                            <label for="imageUpload">Choose Image</label>
                             <asp:FileUpload ID="imageUpload" runat="server"  class="txtTest" accept=".png,.jpg,.jpeg,.gif"  />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Image path required." ControlToValidate="imageUpload" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                          <!--  <input type='file' id="fileUpload" runat="server" accept="image/*" autofocus   />-->
                            <button id="heartButton">Heart Design</button>
                            <button id="torsoButton">Torso Design</button>
                            <button id="chestButton">Chest Design</button>
                            <button id="fullButton">Full Design</button>
                        </div>
                    </div>
                </div>

                 <div id="uploadTweetDiv" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2>Upload Tweet</h2>
                        </div>
                        <div class="modal-body">
                            <label for="tweetUrl">PASTE TWEET URL HERE:</label>
                            <input type="text" id="tweetUrl"  name="tweetUrl"  runat="server" autofocus   /><br />
                            <button id="nightMode">Dark Mode</button>
                            <button id="deamMode">Deam Mode</button>
                            <button id="dayMode">Light Mode </button>
                        </div>
                    </div>
                </div>

    <script>
        var imageUpload = document.getElementById('<%= imageUpload.ClientID %>');

        $("#<%= imageUpload.ClientID %>").change(function () {
            changeImage(this);
        });
    </script>
         <script src="../Scripts/Js/ShirtsCustom.js"> </script>
          

    
</asp:Content>
