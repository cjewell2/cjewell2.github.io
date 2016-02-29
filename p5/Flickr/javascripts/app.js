var evntHandler = function(){

    var prefixURL = "http://api.flickr.com/services/feeds/photos_public.gne?tags=";
    var suffixURL = "&format=json&jsoncallback=?";
    var flickrTag = $("input").val();
    var requestURL = prefixURL + flickrTag + suffixURL;
    //clear old photos
    $(".photos").html("");

    //Index is used to increase the picture index by one each time after displaying current picture.
    var Index = 1; 
    var displayPic = function (Index) {
        $.getJSON(requestURL,function(flickrResponse) {
            console.log(flickrResponse);
            var $img = $("<img>").hide();
            $img.attr("src", flickrResponse.items[Index].media.m);
            $("main .photos").html($img);
            $img.fadeIn();

             setTimeout(function () {
               Index = Index + 3;
               displayPic(Index);
            }, 3000);      
      });

  };
  displayPic(0);
};

$("button").on("click", evntHandler);

$("input").on("keypress", function (event) {
    if (event.keyCode === 13) {
         evntHandler();
    }
});