// $(document).ready(function(){
//    $('.accordion').click(function () {
//         $(this).next().toggle();
//    });
// });
$(document).ready(function (){
    $('.about').click(function () {
        $('#'+this.id+'.book_about').toggle();
    });

    $('.good_seller').click(function () {
        $('#'+this.id+'.book_user_login').toggle();
    });
    $('.bad_seller').click(function () {
        $('#'+this.id+'.book_user_login').toggle();
    });
});