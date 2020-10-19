<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HatsCustom.aspx.cs" Inherits="fashionUtilityApplication.HatsCustom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="isd-content isd-clearfix ng-scope" ng-controller="DesignerController">
      <div class="isd-link-block ng-scope" ng-controller="ActionController">
        <div class="isd-header">
          <span id="isd-labelChooseProduct" class="ng-binding">Edit Product</span>
        </div>
        <ul ng-controller="ProductColorsController" ng-hide="disableEditProduct" class="ng-scope">
          <li class="isd-choose-product">
            <div>
              <a ng-click="openCategoryDrawer(category)" ng-hide="disableProducts" class="">
                <i class="material-icons" aria-hidden="true">local_offer</i>
                <span class="icon-label" id="isd-labelProducts">Change Product</span>
              </a>
            </div>
          </li>
          <li class="isd-product-colors" ng-init="showingInlineModal=0" ng-hide="artToolsMode || disableProductColors">
            <a ng-click="showingInlineModal=1" is-tooltip="25" is-hide-drawers="">
              <i class="material-icons" aria-hidden="true">palette</i>
              <span class="icon-label" id="isd-labelProductColors">Change Product Color</span>
            </a>

            <div class="isd-product-colors-hover-scroll isd-hide-popover ng-hide" ng-show="showingInlineModal" is-inline-modal="showingInlineModal">
              <div class="isd-sub-hover isd-product-colors-hover" style="border-top: 5px solid #afafaf;overflow:hidden;">
                <i class="isd-hover-close" ng-click="showingInlineModal=0">&nbsp;</i>

                <div class="isd-custom-selector" style="margin-top:0px;">
                  <div class="isd-color-picker">
                    <div class="isd-sub-header" style="margin-top:0px;">Current Color</div>
                    <p class="p ng-binding" style="margin-bottom:10px;font-size: 11px;line-height:22px;">
                      White</p>
                    <ul class="isd-clearfix isd-scrollbar" style="margin-bottom:17px;width: 136px;max-height: 392px;overflow-x: hidden;overflow-y: auto;">
                      <!-- ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Ath Heather" show-color-tooltip="" data-color="Ath Heather" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(204, 204, 204);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(204, 204, 204);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Black" show-color-tooltip="" data-color="Black" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(0, 0, 0);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(0, 0, 0);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Charcoal" show-color-tooltip="" data-color="Charcoal" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(102, 102, 102);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(102, 102, 102);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Dark Green" show-color-tooltip="" data-color="Dark Green" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(0, 51, 0);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(0, 51, 0);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Dk Hthr Grey" show-color-tooltip="" data-color="Dk Hthr Grey" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(84, 84, 84);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(84, 84, 84);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Gold" show-color-tooltip="" data-color="Gold" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(255, 193, 23);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(255, 193, 23);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Hthr Royal" show-color-tooltip="" data-color="Hthr Royal" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(62, 101, 164);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(62, 101, 164);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Kelly" show-color-tooltip="" data-color="Kelly" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(0, 102, 51);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(0, 102, 51);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Light Blue" show-color-tooltip="" data-color="Light Blue" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(148, 187, 255);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(148, 187, 255);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="LIME" show-color-tooltip="" data-color="LIME" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(185, 255, 79);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(185, 255, 79);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Maroon" show-color-tooltip="" data-color="Maroon" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(110, 0, 0);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(110, 0, 0);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Medium Grey" show-color-tooltip="" data-color="Medium Grey" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(207, 207, 207);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(207, 207, 207);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Navy" show-color-tooltip="" data-color="Navy" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(26, 41, 89);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(26, 41, 89);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Orange" show-color-tooltip="" data-color="Orange" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(255, 143, 15);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(255, 143, 15);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Purple" show-color-tooltip="" data-color="Purple" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(74, 18, 122);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(74, 18, 122);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Red" show-color-tooltip="" data-color="Red" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(204, 0, 0);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(204, 0, 0);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Royal" show-color-tooltip="" data-color="Royal" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(23, 74, 212);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(23, 74, 212);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Sangria" show-color-tooltip="" data-color="Sangria" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(201, 0, 81);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(201, 0, 81);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Sapphire" show-color-tooltip="" data-color="Sapphire" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(0, 153, 255);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(0, 153, 255);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Silver" show-color-tooltip="" data-color="Silver" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(205, 204, 198);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(205, 204, 198);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="White" show-color-tooltip="" data-color="White" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(255, 255, 255);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(255, 255, 255);"></div>
                      </li><!-- end ngRepeat: style in styles --><li class="isd-product-swatch ng-scope" ng-repeat="style in styles" data-title="Yellow" show-color-tooltip="" data-color="Yellow" style="border: 1px solid #c9ccd2;width: 30px;height: 30px;position:relative;">
                        <div style="position:absolute;" class="isd-flat-icons isd-white-checkmark ng-hide" ng-show="style.color == selectedColor"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor1" ng-style="{'background-color':'#' + style.html_color}" style="background-color: rgb(255, 255, 0);"></div>
                        <div ng-click="selectStyle(style)" class="isd-productStyleColor2" ng-style="{'background-color':'#' + (style.html_color2 || style.html_color)}" style="background-color: rgb(255, 255, 0);"></div>
                      </li><!-- end ngRepeat: style in styles -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li ng-controller="ProductRegionController" class="isd-art-location ng-scope" ng-init="showingInlineModal=0">
            <div class="isd-location-btn isd-design-btn">
              <a ng-hide="artToolsMode" ng-click="showProductSideModal()" is-disabled="(productSides.length == 1 &amp;&amp; productSides[0].regions.length < 2)" is-tooltip="26" is-hide-drawers="" class="">
                <i class="material-icons" aria-hidden="true">autorenew</i>
                <span class="icon-label" id="isd-labelProductsSides">Change Product Side</span>
              </a>
            </div>
          </li>
        </ul>
        <div class="isd-header" style="padding-top: 18px;" ng-hide="artToolsMode">
          <span id="isd-labelEditArtwork">Edit Design</span>
        </div>
        <ul>
          <li ng-controller="UploaderLandingController" class="isd-upload-image ng-scope" is-tooltip="1">
            <a ng-hide="(disableUploadImage || corruptedProduct)" ng-click="showUploadType()" is-hide-drawers="" class="">
              <i class="material-icons" aria-hidden="true">file_upload</i>
              <span class="icon-label" id="isd-labelUploadImage">Upload Image</span>
            </a>
          </li>
          <li class="isd-change-art ng-scope" ng-controller="ProductRegionController" ng-init="showingInlineModal=0">
            <div>
              <a ng-click="showingInlineModal=1" ng-hide="(disableAllArt || corruptedProduct)" is-hide-drawers="" class="">
                <i class="material-icons" aria-hidden="true">image</i>
                <span class="icon-label" id="isd-labelArtwork">Add Art</span>
              </a>
              <div class="isd-sub-hover isd-change-art-hover ng-hide" style="display:block;border-top: 5px solid #afafaf;" ng-show="showingInlineModal" is-inline-modal="showingInlineModal">
                <i class="isd-hover-close" ng-click="showingInlineModal=0">&nbsp;</i>
                <ul style="margin-top:6px;">
                  <li><a is-show-drawer="designIdeas" ng-click="showingInlineModal=0" is-tooltip="9" ng-hide="disableDesigns" class=""><span id="isd-labelDesignIdeas">Design Ideas</span></a></li>
                  <li><a is-show-drawer="clipArt" ng-click="showingInlineModal=0" is-tooltip="10" ng-hide="disableClipArt" class=""><span id="isd-labelClipArt">Clip Art</span></a></li>
                  <li><a is-show-drawer="myArt" ng-click="showingInlineModal=0" is-tooltip="13" ng-hide="disableUserArt" class=""><span id="isd-labelMySavedArt">My Saved Art</span></a></li>
                </ul>
              </div>
            </div>
          </li>
          <li is-tooltip="1" class="isd-add-text" ng-hide="corruptedProduct">
            <a is-hide-drawers="" ng-click="addTextFromUI()">
              <i class="material-icons" aria-hidden="true">text_fields</i>
              <span class="icon-label" id="isd-labelAddText">Add Text</span>
            </a>
          </li>
          <li class="isd-distress-efect ng-scope" is-disabled="!hasDesign(true)" ng-controller="DistressController">
            <a is-disabled="!hasDesign(true)" ng-hide="disableDistress" ng-click="showDistressList()" is-hide-drawers="" class="">
               <i class="material-icons" aria-hidden="true">texture</i>
               <span class="icon-label" id="isd-labelDistressEffects">Distress Effects</span></a>
            <div class="isd-sub-hover-scroll ng-hide" ng-show="showingInlineModal" is-inline-modal="showingInlineModal">
              <div class="isd-sub-hover isd-distress-efect-hover" style="display:block;padding: 0;width: 146px;border-top: 5px solid #afafaf; overflow: hidden;">
                <i class="isd-hover-close" ng-click="showingInlineModal=0">&nbsp;</i>
                <div class="isd-custom-control" ng-init="offset = 0; pageSize = 99;" style="width:100%;">
                  <div class="isd-custom-selector" style="margin-top:0px; overflow-x: hidden;overflow-y: auto;height:272px;margin-top:30px;">
                    <div class="isd-slider-block" style="margin-top:0px;">
                      <ul class="isd-clearfix isd-slider-image" style="margin-left:16px;">
                        <!-- ngRepeat: effect in distressEffects -->
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </li>
          <li ng-hide="(disableNamesNumbers || corruptedProduct)" class="">
            <a is-show-drawer="namesAndNumbers" is-drawer-width="759px">
              <i class="material-icons" aria-hidden="true">looks_one</i>
              <span class="icon-label" id="isd-labelNamesAndNumbers">Add Name &amp; Number</span></a>
          </li>
          <li class="background-color-controller ng-scope ng-hide" ng-show="artToolsMode" ng-controller="BackgroundColorController">
            <a ng-click="showingBackgroundColor = 1">
              <i class="material-icons" aria-hidden="true">palette</i>
              <span class="icon-label" id="isd-labelProductColors">Product Color</span>
            </a>

            <div class="isd-hide-popover ng-hide" ng-show="showingBackgroundColor" is-inline-modal="showingBackgroundColor">
              <div class="isd-sub-hover art-tools-mode" style="border-top: 5px solid #afafaf;width:auto;padding:15px 15px 0 15px;">
                <i class="isd-hover-close" ng-click="showingBackgroundColor=0">&nbsp;</i>
                <input type="text" is-color-picker="" ng-change="backgroundColorChanged()" ng-model="backgroundColor.color" class="ng-valid ng-dirty" style="display: none;"><div class="sp-container sp-light sp-flat sp-buttons-disabled sp-palette-buttons-disabled sp-palette-disabled sp-initial-disabled"><div class="sp-palette-container"><div class="sp-palette sp-thumb sp-cf"></div><div class="sp-palette-button-container sp-cf"><button type="button" class="sp-palette-toggle">less</button></div></div><div class="sp-picker-container"><div class="sp-top sp-cf"><div class="sp-fill"></div><div class="sp-top-inner"><div class="sp-color" style="background-color: rgb(255, 0, 0);"><div class="sp-sat"><div class="sp-val"><div class="sp-dragger" style="display: block; top: -5px; left: -5px;"></div></div></div></div><div class="sp-clear sp-clear-display" title="Clear Color Selection" style="display: none;"></div><div class="sp-hue"><div class="sp-slider" style="display: block; top: -3px;"></div></div></div><div class="sp-alpha" style=""><div class="sp-alpha-inner"><div class="sp-alpha-handle" style="display: block; left: 169px;"></div></div></div></div><div class="sp-input-container sp-cf"><input class="sp-input" type="text" spellcheck="false"></div><div class="sp-initial sp-thumb sp-cf"></div><div class="sp-button-container sp-cf"><a class="sp-cancel" href="#">cancel</a><button type="button" class="sp-choose">choose</button></div></div></div>
              </div>
            </div>
          </li>
        </ul>
        <div class="isd-header" style="padding-top: 18px;" ng-hide="artToolsMode || disableNotes">
          <span id="isd-labelFinalize">Finalize</span>
        </div>
        <ul>
          <li class="isd-notes ng-scope" is-tooltip="2" ng-controller="AddNoteController" ng-init="showingInlineModal=0" ng-hide="artToolsMode">

            <a style="margin-bottom:10px;" ng-click="showingInlineModal=1" ng-hide="disableNotes" is-hide-drawers="" class="">
              <i class="material-icons reverse">message</i>
              <span class="icon-label" id="isd-labelAddNotes">Add Note</span>
            </a>

            <div class="isd-sub-hover isd-notes-hover ng-hide" style="display:block;border-top: 5px solid #afafaf;" ng-show="showingInlineModal" is-inline-modal="showingInlineModal">
              <i class="isd-hover-close" ng-click="showingInlineModal=0">&nbsp;</i>
              <textarea ng-model="note" placeholder="Enter Message Here..." class="ng-pristine ng-valid"></textarea>
              <a class="isd-btn isd-button-primary" ng-click="saveNote()" style="float:right;padding:10px;">Save note</a>
            </div>

          </li>

        </ul>
      </div>

      <div class="isd-main-content ">
        <div class="isd-content-nav isd-clearfix ng-scope" ng-class="{'artTools': artToolsMode}" ng-controller="ActionController">
          <ul class="isd-clearfix isd-layers-nav">
            <li ng-hide="artToolsMode" class="">
              <a ng-click="(!hasDesign(true) ? '' : toggleZoom())" is-disabled="!hasDesign(true)" class="">
                <!-- ngIf: !isZoomedIn --><i class="material-icons ng-scope" aria-hidden="true" ng-if="!isZoomedIn" is-tooltip="24">zoom_in</i><!-- end ngIf: !isZoomedIn -->
                <!-- ngIf: isZoomedIn -->
                <span id="isd-labelZoom">Zoom</span>
              </a>
            </li>
            <li is-tooltip="21">
              <a ng-click="(!hasDesign(true) ? '' : selectAll())" is-disabled="!hasDesign(true)" class="">
                <i class="material-icons" aria-hidden="true">select_all</i>
                <span id="isd-labelSelectAll">Select All</span>
              </a>
            </li>
            <li is-tooltip="20">
              <a ng-click="(!hasDesign(true) ? '' : copySelection())" is-disabled="!hasDesign(true) || !canCopy" class="">
                <i class="material-icons" aria-hidden="true">content_copy</i>
                <span id="isd-labelDuplicate">Duplicate</span>
              </a>
            </li>
            <li is-tooltip="14">
              <a href="#/layers" is-disabled="!hasDesign(true)" class="">
                <i class="material-icons" aria-hidden="true">layers</i>
                <span id="isd-labelLayers">Layers</span>
              </a>
            </li>

            <li>
              <a href="#/layers" ng-click="undo()" is-disabled="!canUndo" class="">
                <i class="material-icons" aria-hidden="true">undo</i>
                <span id="isd-labelUndo">Undo</span>
              </a>
            </li>
            <li>
              <a href="#/layers" ng-click="redo()" is-disabled="!canRedo" class="isd-disabled">
                <i class="material-icons" aria-hidden="true">redo</i>
                <span id="isd-labelRedo">Redo</span>
              </a>
            </li>
          </ul>
        </div>


        <div class="isd-banner">
          <div id="designerContainer" style="width: 500px; height: 500px; margin-top: 0px; margin-left: 0px; background-color: rgb(255, 255, 255);">
          <svg style="border: 0px solid black; overflow: hidden" width="500" height="500" xmlns:xlink="http://www.w3.org/1999/xlink"><image height="500" width="476" xlink:href="//cdn.inksoft.com/images/products/756/products/PC54/White/front/500.png" x="12" y="0" visibility="visible"></image></svg></div>
          <!-- This overlaps designerContainer to show the loader and designs when appropriate. -->
          <div id="raphael" style="width: 500px; height: 500px; margin-top: 0px; margin-left: 0px;"><div id="side1" class="raphaelSide" style="display: block; top: 0px;"><svg style="border: 0px solid black; overflow: hidden; cursor: crosshair;" width="500" height="500" xmlns:xlink="http://www.w3.org/1999/xlink" id="svg1" viewBox="-156.5 -85.5 500 500"><g id="designGroup1" style="clip-path:url('#designMask1')"><g transform="skewX(0) skewY(0) rotate(0 92.75 171.5)  scale(1.2974004785702438 1.2974005509625437) translate(71.48910574028152,132.18739569114862) "><g type="image"><image height="129.85" width="94.14914841849148" xlink:href="data:image/png;base64,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" x="-47.07457420924574" y="-64.925" visibility="visible" preserveAspectRatio="none" id="DsElement1"></image></g></g></g><g id="bbGroup" transform="rotate(0,92.75,171.5)"><g id="BoundingBoxRectContainer" visibility="inherit"><rect x="31.67542579075426" y="87.26627516778525" width="122.14914841849148" height="168.4674496644295" rx="0" ry="0" fill="#000000" id="BoundingBoxRect" fill-opacity="0" vector-effect="non-scaling-stroke" stroke-width="1" stroke="#ffffff" style="cursor: url(&quot;//cdn.inksoft.com/designer/html5/ds/images/cur-files/cursor-grabbing.cur&quot;), auto;"></rect><rect x="31.67542579075426" y="87.26627516778525" width="122.14914841849148" height="168.4674496644295" rx="0" ry="0" fill="#000000" id="BoundingBoxRect" fill-opacity="0" vector-effect="non-scaling-stroke" stroke-dasharray="4,3" stroke-width="1" stroke="#00a5ff" style="cursor: url(&quot;//cdn.inksoft.com/designer/html5/ds/images/cur-files/cursor-grab.cur&quot;), auto;"></rect></g><g visibility="inherit"><image height="20" width="20" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="148.82457420924572" y="250.73372483221476" id="BoundingBoxRectGrasp0" style="cursor: url(&quot;//cdn.inksoft.com/designer/html5/ds/images/cur-files/cursor-resize.cur&quot;), move;"></image></g><g visibility="inherit"><image height="20" width="20" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="16.67542579075426" y="250.73372483221476" id="BoundingBoxRectGrasp1" style="cursor: url(&quot;//cdn.inksoft.com/designer/html5/ds/images/cur-files/cursor-resize.cur&quot;), move;"></image></g><g visibility="inherit"><image height="20" width="20" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="16.67542579075426" y="72.26627516778525" id="BoundingBoxRectGrasp2"></image></g><g visibility="inherit"><image height="20" width="20" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="148.82457420924572" y="72.26627516778525" id="BoundingBoxRectGrasp3"></image></g><g visibility="inherit"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="87.75" y="78.93294183445192" id="BoundingBoxRectGrasp4"></image></g><g visibility="inherit"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="87.75" y="254.06705816554808" id="BoundingBoxRectGrasp5"></image></g><g visibility="inherit"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="148.82457420924572" y="166.5" id="BoundingBoxRectGrasp6"></image></g><g visibility="inherit"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="26.67542579075426" y="166.5" id="BoundingBoxRectGrasp7" style="cursor: url(&quot;//cdn.inksoft.com/designer/html5/ds/images/cur-files/cursor-resize.cur&quot;), move;"></image></g><g visibility="inherit"><image height="40" width="40" xlink:href="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/rotate-tall.png?version=28" x="72.75" y="27.266275167785253" id="BoundingBoxRectRotate"></image></g><g visibility="inherit"><image height="30" width="30" xlink:href="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/delete.png?version=28" x="-13.324574209245739" y="42.26627516778525" id="BoundingBoxRectDelete"></image></g><g visibility="inherit"><image height="30" width="30" xlink:href="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/tools.png?version=28" x="168.82457420924572" y="42.26627516778525" id="BoundingBoxRectTools"></image></g></g><g id="snapUI"></g><clipPath id="designMask1"><rect id="designRectMask1" x="0" y="0" height="343" width="185.5" transform="rotate(0 92.75 171.5)" fill="#FFFFFF"></rect></clipPath></svg></div><div id="side2" class="raphaelSide" style="display: block; top: -10000px;"><svg style="border: 0px solid black; overflow: hidden" width="500" height="500" xmlns:xlink="http://www.w3.org/1999/xlink" id="svg2" viewBox="-170.5 -81 500 500"><g id="designGroup2" style="clip-path:url('#designMask2')"></g><g id="bbGroup" transform="rotate(0,0,0)"><g id="BoundingBoxRectContainer" visibility="hidden"><rect x="0" y="0" width="0" height="0" rx="0" ry="0" fill="#000000" id="BoundingBoxRect" fill-opacity="0" vector-effect="non-scaling-stroke" stroke-width="1" stroke="#ffffff"></rect><rect x="0" y="0" width="0" height="0" rx="0" ry="0" fill="#000000" id="BoundingBoxRect" fill-opacity="0" vector-effect="non-scaling-stroke" stroke-dasharray="4,3" stroke-width="1" stroke="#00a5ff"></rect></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp0"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp1"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp2"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp3"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp4"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp5"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp6"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/images/grasp_11px.png" x="0" y="0" id="BoundingBoxRectGrasp7"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/rotate-tall.png?version=28" x="0" y="0" id="BoundingBoxRectRotate"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/delete.png?version=28" x="0" y="0" id="BoundingBoxRectDelete"></image></g><g visibility="hidden"><image height="10" width="10" xlink:href="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/tools.png?version=28" x="0" y="0" id="BoundingBoxRectTools"></image></g></g><g id="snapUI"></g><clipPath id="designMask2"><rect id="designRectMask2" x="0" y="0" height="354" width="169" transform="rotate(0 84.5 177)" fill="#FFFFFF"></rect></clipPath></svg></div></div>

          <div class="isd-color-custom isd-clearfix ng-scope" id="colorsInDesignContainer" ng-controller="DesignColorsController" ng-init="showAllDesignColors = false" is-disabled="!hasDesign()" ng-style="{'visibility':colorsInUse.length || showPanel ? 'visible' : 'hidden'}" style="background-color: rgb(255, 255, 255); padding: 0px 10px; color: rgb(76, 76, 76); visibility: visible;">
            <span style="text-align:left;font-size: 12px;color: #848484;text-transform:none;" class="ng-binding">Colors In Design ( 2 )</span>
            <span style="text-align:left;font-size: 12px;color: #FF0000;text-transform:none;font-weight: bold" ng-show="!canPrint" class="ng-binding ng-hide">Max colors exceeded, reduce the total color count to 12 or fewer colors per side.</span>
            <i class="isd-hover-close ng-hide" ng-click="showAllDesignColors = false" ng-show="colorsInUse.length > 11 &amp;&amp; showAllDesignColors" style="top:0px;right:0px;">&nbsp;</i>
            <ul style="overflow: auto; max-height: 315px; margin-top: 0px;" ng-style="{'margin-top':showAllDesignColors ? '8px' : '0px'}">
              <!-- ngRepeat: color in colorsInUse --><li class="isd-border-for-white ng-scope" ng-repeat="color in colorsInUse" ng-style="{'background-color':color}" ng-class="transparentClass(color);" ng-show="$index < 11 || showAllDesignColors" style="background-color: rgb(253, 253, 253);">
                <a ng-click="showColorChangeModal(color)" data-color="#FDFDFD" show-color-tooltip="">&nbsp;</a>
              </li><!-- end ngRepeat: color in colorsInUse --><li class="isd-border-for-white ng-scope" ng-repeat="color in colorsInUse" ng-style="{'background-color':color}" ng-class="transparentClass(color);" ng-show="$index < 11 || showAllDesignColors" style="background-color: rgb(17, 16, 22);">
                <a ng-click="showColorChangeModal(color)" data-color="#111016" show-color-tooltip="">&nbsp;</a>
              </li><!-- end ngRepeat: color in colorsInUse -->
            </ul>
            <!-- <a class="isd-view" ng-click="showAllDesignColors = false" ng-show="colorsInUse.length > 11 && showAllDesignColors">Show Few</a> -->
            <a class="isd-view ng-hide" ng-click="showAllDesignColors = true" ng-show="colorsInUse.length > 11 &amp;&amp; !showAllDesignColors">View All</a>
          </div>

        </div>
        <div class="isd-nav-bottom ng-scope" ng-controller="ActionController">

          <div class="isd-save-share ng-hide" is-tooltip="4" ng-show="alphabroderEmbed">
            <a class="isd-btn isd-button-default" href="" target="_blank">
              Video Tutorials
            </a>
          </div>
          <div class="isd-save-share ng-hide" is-tooltip="4" ng-show="alphabroderEmbed">
            <a class="isd-btn isd-button-primary" href="http://www.inksoft.com" target="_blank">
              About InkSoft
            </a>
          </div>

          <div class="isd-save-share" is-tooltip="4" ng-hide="artToolsMode">
            <a class="isd-btn isd-button-default ng-binding" ng-click="showSaveModal()" is-disabled="!hasDesign()">
              Save &amp; Share
            </a>
          </div>

          <div class="isd-save-share ng-hide" is-tooltip="4" ng-show="artToolsMode" style="float:right;margin-right:10px;">
            <a class="isd-btn isd-button-primary" ng-click="showSaveModal()" is-disabled="!hasDesign()">
              Save
            </a>
          </div>
          <div is-tooltip="8" ng-hide="disableGetQuote || (!hasDesign() &amp;&amp; requireDesign)" class="">
            <a class="isd-btn isd-button-default" ng-show-modal="getQuote">
              <span id="isd-labelGetAQuote">Get a quote</span>
            </a>
          </div>
          <!-- <li class="isd-quote" is-tooltip="8">
              <a ng-show-modal="getQuote"><i class="isd-flat-icons "></i> get quote</a>
          </li> -->
          <div ng-show="allowCheckout &amp;&amp; (hasDesign() || !requireDesign)" class="">
            <a class="isd-btn isd-button-primary" ng-click="showCheckoutModal()">
              <span id="isd-labelCheckout">Checkout</span>
            </a>
          </div>

        </div>
      </div>


      <aside class="isd-sidebar ng-scope" ng-controller="ActionController">

        <!-- <div class="isd-check-btn" ng-show="allowCheckout">
            <a ng-click="showCheckoutModal()">Checkout</a>
        </div> -->
        <div id="rightSideLoader" style="display: none;">
          <div class="isd-custom-control">
            <div class="isd-header">
              <span id="isd-labelManageLayers">Manage Layers</span>
            </div>
            <div class="isd-slider-2">
            </div>
          </div>

        </div>
        <!-- ngView:  --><div ng-view="" class="ng-scope"><div class="isd-custom-control ng-scope">
  <div class="isd-header ng-binding">
     Image
  </div>

  <div class="isd-custom-selector">
    <div ng-show="colors.length" class="isd-element-color-list"><span>Colors:</span><br>

      <!-- ngRepeat: color in colors track by $index --><div class="isd-color-selector ng-scope" ng-repeat="color in colors track by $index" style="float:none;display:inline-block;height:40px;" ng-click="showChangeColorModal($index)">
        <a ng-style="{'background-color':color}" ng-class="transparentClass(color)" data-color="#FDFDFD" ng-click="showColorModal($index)" show-color-tooltip="" style="background-color: rgb(253, 253, 253);">&nbsp;</a>
      </div><!-- end ngRepeat: color in colors track by $index --><div class="isd-color-selector ng-scope" ng-repeat="color in colors track by $index" style="float:none;display:inline-block;height:40px;" ng-click="showChangeColorModal($index)">
        <a ng-style="{'background-color':color}" ng-class="transparentClass(color)" data-color="#111016" ng-click="showColorModal($index)" show-color-tooltip="" style="background-color: rgb(17, 16, 22);">&nbsp;</a>
      </div><!-- end ngRepeat: color in colors track by $index -->
    </div>
    <ul class="isd-outline-size">
      <!--			<li class="isd-last">
                      <span>Alignment</span>
                      <a><img ng-src="{{ezdLocation}}/ds/images/align-right.jpg" width="38" height="37" alt="" title="" ng-click="changeAlignment('right')"/></a>
                      <a><img ng-src="{{ezdLocation}}/ds/images/align-center.jpg" width="38" height="37" alt="" title="" ng-click="changeAlignment('mid')"/></a>
                      <a><img ng-src="{{ezdLocation}}/ds/images/align-left.jpg" width="38" height="37" alt="" title="" ng-click="changeAlignment('left')"/></a>
                  </li>-->
      <li class="isd-last isd-nudge">
        <span style="width:238px; float:left;text-align:left; margin-top:10px;">Nudge</span>

        <div style="width:238px; float:left; ">
          <a class="isd-flat-icons fi-down" style="margin-left:0px;" ng-click="nudge('down')"></a>
          <a class="isd-flat-icons fi-up" ng-click="nudge('up')"></a>
          <a class="isd-flat-icons fi-left" ng-click="nudge('left')"></a>
          <a class="isd-flat-icons fi-right" ng-click="nudge('right')" style="clear:right;"></a>
        </div>
      </li>
      <li class="isd-last ng-hide" ng-hide="disableResolutionMeter">
        <span style="width:238px; float:left;text-align:left; margin-top:10px;">Layer Print Quality</span>

        <div style="width:238px; float:left; ">
          <img style="float:left;text-align:left; margin-top:10px;" ng-src="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/quality-meter.png" alt="" title="" src="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/quality-meter.png">
          <img style="width: 11px; float: left; text-align: left; margin-top: -28px; margin-left: 232px;" ng-style="{'margin-left': qualityWidth}" ng-src="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/gauge.png" width="11" alt="" title="" src="//cdn.inksoft.com/designer/html5/ds/themes/flat/images/gauge.png">
          <!--<span style="width:238px; float:left;text-align:left; margin-top:10px;">{{quality}}</span>-->
          <span style="width:238px; float:left;text-align:left; margin-top:10px;">To improve the print quality, click and drag the blue circles to shrink dimensions.</span>
        </div>
      </li>
    </ul>
  </div>
</div>
</div>
      </aside>

      <div class="isd-powered-by" ng-show="showBranding">
        <a href="http://www.inksoft.com" target="_blank"><span>Powered by</span> <img ng-src="//cdn.inksoft.com/designer/html5/ds/images/footer-logo.png" alt="" src="//cdn.inksoft.com/designer/html5/ds/images/footer-logo.png"></a>
      </div>

    </div>
</asp:Content>
