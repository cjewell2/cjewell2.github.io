$(".punchline" ).css("color", "Red");

var main = function () {
          "use strict";
 
          //$("h2").show();
          
          $("button:nth-child(1)").show("fast");
 
          $("button:nth-child(1)").on("click", function (event) {
              $("button:nth-child(1)").hide("fast");
              $("button:nth-child(2)").show("slow");
          });
 
          $("button:nth-child(2)").on("click", function (event) {
              $("button:nth-child(2)").hide("fast");
              $("button:nth-child(3)").show("slow");
          });
 
          $("button:nth-child(3)").on("click", function (event) {
              $("button:nth-child(3)").hide("fast");
              $("button:nth-child(4)").show("slow");
          });
 
          $("button:nth-child(4)").on("click", function (event) {
              $("button:nth-child(4)").hide("fast");
              $("h3").show("slow");
          });
        };
 
    $(document).ready(main);

