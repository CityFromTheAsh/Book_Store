$(document).ready(function(){
   $('.accordion').click(function () {
        $(this).next().toggle();
   });
});