$(document).ready(function(){
    console.log('ready')
    $('.menu').click(function () {
        console.log('clicked')
        $(this).next().toggle();
    });
});
$(document).ready(function(){
    $('.accordion-menu').accordion();
});