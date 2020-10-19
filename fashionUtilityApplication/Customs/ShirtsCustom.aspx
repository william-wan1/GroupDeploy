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
                    <div class="customDiv ">
                         <div class="topButton">
                
                            <button>Front</button>
                            <button>Back</button>
                        </div>
                        <div class="leftButton">
                            <button id="uploadPicture">Upload Picture</button>
                            <button id="uploadTweet">Upload Tweet</button>
                            <button>Make Design</button>
                            <button>Pick Design</button>
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
                            <button><span class="glyphicon glyphicon-heart"></span></button>
                            <button><span class="glyphicon glyphicon-shopping-cart"></span></button>
                            <button>Size</button>
                            <button>Qty</button>
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
                            <label for="fileUpload">Choose Image</label>
                            <input type='file' id="fileUpload" accept="image/*" autofocus   />
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
                            <label for="tweetUrl">PASTE TWEET URL HERE:</label><br />
                            <input type="url" id="tweetUrl" autofocus   /><br />
                            <button id="nightMode">Dark Mode</button>
                            <button id="deamMode">Deam Mode</button>
                            <button id="dayMode">Light Mode </button>
                        </div>
                    </div>
                </div>


         <script src="../Scripts/Js/ShirtsCustom.js"> </script>
          

    
</asp:Content>
