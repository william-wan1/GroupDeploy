//Uploading a picture
    // Get the modal

var picDiv = document.getElementById("uploadPictureDiv");
var tweetDiv = document.getElementById("uploadTweetDiv");

    // Get the button that opens the modal


    // When the user clicks the button, open the modal
$("#uploadPicture").click(function (e) {
    e.preventDefault();
    $(".designs").css("display", "block");
    $("#uploadPictureDiv").css("display", "block");
});

// When the user clicks on <span> (x), close the modal
$(".close").click(function () {
    $(".designs").css("display", "none");
    $(".modal").css("display", "none");
    //$("#uploadTweeetDiv").css("display", "block");

});
       
        // When the user clicks anywhere outside of the modal, close it
$(window).click(function (event) {
    if (event.target == picDiv || event.target == tweetDiv) {
            $(".modal").css("display", "none");
            $(".designs").css("display", "none");

        }
    });


function changeImage(input) {
   // console.log(input);

    var reader;

    if (input.files && input.files[0]) {
    reader = new FileReader();

        reader.onload = function (e) {
            $("#selectedDesign").attr('src', e.target.result);
           // console.log(e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}
$("#heartButton").click(function (e) {
    console.log("heart");
    $("#selectedDesign").removeClass();
    $("#selectedDesign").addClass("heartDesign");
    $("#selectedDesign").css("display", "block");
    $(".modal").css("display", "none");
    $(".designs").css("display", "none");
    e.preventDefault();


});
$("#chestButton").click(function (e) {
    console.log("chest");
    $("#selectedDesign").removeClass();
    $("#selectedDesign").addClass("chestDesign");
    $("#selectedDesign").css("display", "block");
    $(".modal").css("display", "none");
    $(".designs").css("display", "none");
    e.preventDefault();


});
$("#torsoButton").click(function (e) {
    console.log("chest");
    $("#selectedDesign").removeClass();
    $("#selectedDesign").addClass("torsoDesign");
    $("#selectedDesign").css("display", "block");
    $(".modal").css("display", "none");
    $(".designs").css("display", "none");
    e.preventDefault();


});
$("#fullButton").click(function (e) {
    console.log("full");
    $("#selectedDesign").removeClass();
    $("#selectedDesign").addClass("fullDesign");
    $("#selectedDesign").css("display", "block");
    $(".modal").css("display", "none");
    $(".designs").css("display", "none");
    e.preventDefault();


});

//uploading a tweet
$("#uploadTweet").click(function (e) {
    $("#uploadTweetDiv").css("display", "block");
    e.preventDefault();

});
$("#nightMode").click(function (e) {
    e.preventDefault();
    $("#selectedDesign").removeClass();
    $("#selectedDesign").addClass("chestDesign");
    $("#selectedDesign").attr('src', "../Pictures/customize/elonTweetDark.png");
    $("#selectedDesign").css("display", "block");
    $(".modal").css("display", "none");
});
$("#deamMode").click(function (e) {
    e.preventDefault();
    $("#selectedDesign").removeClass();
    $("#selectedDesign").addClass("chestDesign");
    $("#selectedDesign").attr('src', "../Pictures/customize/elonTweetDim.png");
    $("#selectedDesign").css("display", "block");
    $(".modal").css("display", "none");
});
$("#dayMode").click(function (e) {
    e.preventDefault();
    $("#selectedDesign").removeClass();
    $("#selectedDesign").addClass("chestDesign");
    $("#selectedDesign").attr('src', "../Pictures/customize/elonTweetDefault.png");
    $("#selectedDesign").css("display", "block");
    $(".modal").css("display", "none");
});

$("#blackButton").click(function (e) {
    e.preventDefault();
    var bg = $('.centerSection').css('background-image');
    var start = bg.lastIndexOf('/') + 1;
    var end = bg.indexOf('-') ;
    var black = "black";
    bg = bg.replace(bg.slice(start, end), black);
    console.log(bg);
    $('.centerSection').css("background-image", bg);  


});

$("#whiteButton").click(function (e) {
    e.preventDefault();
    var bg = $('.centerSection').css('background-image');
    var start = bg.lastIndexOf('/') + 1;
    var end = bg.indexOf('-');
    var white = "white";
    bg = bg.replace(bg.slice(start, end), white);
    console.log(bg);
    $('.centerSection').css("background-image", bg);


});

$("#longSleevesButton").click(function (e) {
    e.preventDefault();
    var bg = $('.centerSection').css('background-image');
    var start = bg.indexOf('-') + 1;
    var end = bg.lastIndexOf('-');
    var longSleeve = "long";
    bg = bg.replace(bg.slice(start, end), longSleeve);
    console.log(bg);
    $('.centerSection').css("background-image", bg);


});

$("#shortSleevesButton").click(function (e) {
    e.preventDefault();
    var bg = $('.centerSection').css('background-image');
    var start = bg.indexOf('-') + 1;
    var end = bg.lastIndexOf('-');
    var shortSleeve = "short";
    bg = bg.replace(bg.slice(start, end), shortSleeve);
    console.log(bg);
    $('.centerSection').css("background-image", bg);
});

$("#backButton").click(function (e) {
    e.preventDefault();
});
$("#frontButton").click(function (e) {
    e.preventDefault();
   
});
$("#makeDesignButton").click(function (e) {
    e.preventDefault();
});
$("#pickDesignButton").click(function (e) {
    e.preventDefault();

});