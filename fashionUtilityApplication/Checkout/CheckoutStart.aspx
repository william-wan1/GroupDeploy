<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutStart.aspx.cs" Inherits="fashionUtilityApplication.Checkout.CheckoutStart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <fieldset></fieldset>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
    <style>
      #locationField, #controls {
        position: relative;
        width: 480px;
      }
      #autocomplete {
        position: absolute;
        top: 0px;
        left: 0px;
        width: 99%;
      }
      .label {
        text-align: right;
        font-weight: bold;
        width: 100px;
        color: #303030;
        font-family: "Roboto";
      }
      #address {
        border: 1px solid #000090;
        background-color: #f0f9ff;
        width: 480px;
        padding-right: 2px;
      }
      #address td {
        font-size: 10pt;
      }
      .field {
        width: 99%;
      }
      .slimField {
        width: 80px;
      }
      .wideField {
        width: 200px;
      }
      #locationField {
        height: 20px;
        margin-bottom: 2px;
      }
    </style>
      

    <!-- Note: The address components in this sample are typical. You might need to adjust them for
               the locations relevant to your app. For more information, see
         https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform
    -->
    
    <div class="container authorization">
        <fieldset class="form-horizontal">
            <legend>Shipping Address</legend>
            <div class="form-group ">
                <div id="locationField" class="col-md-10 center-block">
                    <input id="autocomplete" placeholder="Enter your address" onFocus="geolocate()" type="text" class="form-control"/>
                </div>
            </div>
             <div class="form-group">
                    <label for="street_number" class="col-md-2 control-label">Street Number:</label>
                <div class="col-md-10">
                   <input class="field form-control" id="street_number"  name="street_number" disabled="true"/>
                 </div>
              </div>
             <div class="form-group">
                    <label for="route" class="col-md-2 control-label">Street Name:</label>
                <div class="col-md-10">
                   <input class="field form-control" id="route"  name="route" disabled="true"/>
                </div>
              </div>

             <div class="form-group">
                    <label for="locality" class="col-md-2 control-label">City:</label>
                <div class="col-md-10">
                   <input class="field form-control"  id="locality"  name="locality" disabled="true"/>
                </div>
              </div>

             <div class="form-group">
                    <label for="administrative_area_level_1" class="col-md-2 control-label">State:</label>
                <div class="col-md-10">
                   <input class="field form-control"   id="administrative_area_level_1"  name="administrative_area_level_1" disabled="true"/>
                </div>
              </div>

             <div class="form-group">
                    <label for="postal_code" class="col-md-2 control-label">Postal Code:</label>
                <div class="col-md-10">
                   <input class="field form-control"  id="postal_code"  name="postal_code" disabled="true"/>
                </div>
              </div>

             <div class="form-group">
                    <label for="country" class="col-md-2 control-label">Country:</label>
                <div class="col-md-10">
                   <input class="field form-control" id="country"  name="country" disabled="true"/>
                </div>
              </div>
          </fieldset>

    <script>
// This sample uses the Autocomplete widget to help the user select a
// place, then it retrieves the address components associated with that
// place, and then it populates the form fields with those details.
// This sample requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script
// src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1PNzrjeQzMhs_OxrqsJZ1F9capO5UC2s&libraries=places">

var placeSearch, autocomplete;

var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};

function initAutocomplete() {
  // Create the autocomplete object, restricting the search predictions to
  // geographical location types.
  autocomplete = new google.maps.places.Autocomplete(
      document.getElementById('autocomplete'), {types: ['geocode']});

  // Avoid paying for data that you don't need by restricting the set of
  // place fields that are returned to just the address components.
  autocomplete.setFields(['address_component']);

  // When the user selects an address from the drop-down, populate the
  // address fields in the form.
  autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() {
  // Get the place details from the autocomplete object.
  var place = autocomplete.getPlace();

    for (var component in componentForm) {
        document.getElementById(component).value = '';
        document.getElementById(component).disabled = false;
  }

  // Get each component of the address from the place details,
  // and then fill-in the corresponding field on the form.
  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType]) {
      var val = place.address_components[i][componentForm[addressType]];
        document.getElementById(addressType).value = val;
    }
  }
}

// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var circle = new google.maps.Circle(
          {center: geolocation, radius: position.coords.accuracy});
      autocomplete.setBounds(circle.getBounds());
    });
  }
        }

    </script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyATZzVpjqK7eHF0MrW20fNhXEstJ1Jzer0&libraries=places&callback=initAutocomplete"
        async defer></script>
   <!-- <asp:ImageButton ID="checkkk"  
        ImageUrl="~/Pictures/socials/checkout_button.jpg" 
                      Width="145" AlternateText="Check out!!!" 
                      OnClick="CheckoutBtn_Click" 
                       BorderWidth="0" />  -->
        <button id="checkkk" class="sendRequestButton">Complete payment</button>
        
        <br />
    <fieldset id="btCont" runat="server" visible="false">
        <legend>Payment Information</legend>

        <div class="bt-drop-in-wrapper">
            <div ID="bt-dropin"></div>
                    <button id="payment-button">Complete payment</button>
        </div>
    </fieldset>
        
    <%--<script src="https://js.braintreegateway.com/web/dropin/1.22.0/js/dropin.min.js"></script>

    <script type="text/javascript">
        function callservermethod() {
            PageMethods.CreatePurchase();

        }

        var randomString = function (length) {
            var text = "";
            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
            for (var i = 0; i < length; i++) {
                text += possible.charAt(Math.floor(Math.random() * possible.length));
            }
            return text;
        }

        var client_token = "<%=Clients%>";
        var button = document.querySelector("#payment-button");
  
        braintree.dropin.create({
            authorization: client_token,
            container: '#bt-dropin'
        }, function (createErr, instance) {
                button.addEventListener('click', function (event) {
                    event.preventDefault();
                    instance.requestPaymentMethod(function (err, payload) {
                        if (err) {
                            return;
                        }
                        $('#nonce').val(payload.nonce);
                        var nonceValue = $('#nonce').val();
                        var streetNumberValue = $('#street_number').val();
                        var routeValue = $('#route').val();
                        var cityValue = $('#locality').val();
                        var stateValue = $('#administrative_area_level_1').val();
                        var postalCodeValue = $('#postal_code').val();
                        var countryValue = $('#country').val();
                        var obj = { "nonceValue": nonceValue, "streetNumberValue": streetNumberValue, "routeValue": routeValue, "cityValue": cityValue, "stateValue": stateValue, "postalCodeValue": postalCodeValue, "countryValue": countryValue };
                             $(document).ready(function () {
                             $.ajax({
                               type: "POST",
                                 url: "/Checkout/CheckoutStart.aspx/CreatePurchase",
                                 data: JSON.stringify(obj),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                 success: function (result) {
                                     //alert(nonceValue + " " + streetNumberValue + " " + routeValue + " " + cityValue + " " + stateValue + " " + postalCodeValue + " " + countryValue);

                                   // testFunc();
                                   // window.location.href = "CheckoutBraintreeComplete.aspx";
                                   //alert('Method Called Sucess fully' + result);
                                },
                                 error: function(XMLHttpRequest, textStatus, errorThrown) {
                                     alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                                    window.location.href = "/Checkout/CheckoutError.aspx";
                                }
                           });
                        });
                    });

                });
             }
       )

    </script>--%>
    <script src="https://js.stripe.com/v3/"></script>
     <script>
         $("#autocomplete").keyup(function () {
             var route = $('#autocomplete').val();
             var button = document.getElementById('checkkk');
             if (route == "") {
                 button.style.visibility = "hidden";
             } 
         });
         $("#autocomplete").change(function () {
             var route = $('#autocomplete').val();
             var button = document.getElementById('checkkk');
             if (route == "") {
                 button.style.visibility = "hidden";
             } else {
                 button.style.visibility = "visible";
             }
         });
         document.addEventListener("DOMContentLoaded", function (event) {
             var route = $('#route').val();
             var button = document.getElementById('checkkk');
             if (route == "") {
                 button.style.visibility = "hidden";
             } else {
                 button.style.visibility = "visible";
             }
         });
         var stripe = Stripe('pk_test_51H28PVFQksPvZrqnyQv7j7v2yA1t41lXMk5BiRwl6M46XJKQ5HrhJrb17GwkOminvzkkLXdGll1qoxS4JzEYnCCc00eIfHoqZ2');
         var button = document.getElementById('checkkk');
         button.addEventListener('click', function (e) {
             e.preventDefault();
             stripe.redirectToCheckout({
                 sessionId: "<%= sessionId %>",
             })
                var streetNumberValue = $('#street_number').val();
                var routeValue = $('#route').val();
                var cityValue = $('#locality').val();
                var stateValue = $('#administrative_area_level_1').val();
                var postalCodeValue = $('#postal_code').val();
                var countryValue = $('#country').val();
                var obj = { "streetNumberValue": streetNumberValue, "routeValue": routeValue, "cityValue": cityValue, "stateValue": stateValue, "postalCodeValue": postalCodeValue, "countryValue": countryValue };
                $(document).ready(function () {
                    $.ajax({
                        type: "POST",
                        url: "/Checkout/CheckoutStart.aspx/CreatePurchase",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                            window.location.href = "/Checkout/CheckoutError.aspx";
                        }
                    });
                });
            })
     </script>

       </div>
</asp:Content>
