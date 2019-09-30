$(document).ready(function () {
	$("#toast-container").css('align-items','center !important');
	$("#toast-container").css('justify-content','center !important')
    $(".sidenav").sidenav();
    $('select').formSelect();
    $('.modal').modal();
    $(".dropdown-trigger").dropdown();
    $('select').not('.disabled').formSelect();
    $('.datepicker').datepicker();
    $("input[name=bookPrice]").change(function () {
        $("#bookPriceText").val($('input[name=bookPrice]').val())
    });


    $('.showCarousalPictures').click(function () {
        console.log('inside' + $(this).attr('data-picures'));


        let data = $(this).attr('data-picures').replace(']', '').replace('[', '');
        let dataArr = data.split(',');
        console.log(dataArr);
        let innerHtml = '';
        for (var i = 0; i < dataArr.length; i++) {
            if (dataArr[i] != '') {
                innerHtml = innerHtml + '<a class=carousel-item href="#" onclick="return false;"><img class="responsive-img" style ="height:300px;width:auto" src=' + dataArr[i] + '></a>'
            }
        }
        $('.carousel.carousel-slider.center').html(innerHtml);
        $('#modal1').modal();
        $('#modal1').modal('open');
        initCarouselModal();


    })

    function initCarouselModal() {
        console.log($('#carouselModal').val('id'));
        $('.carousel.carousel-slider.center').carousel({
            fullWidth: true,
            indicators: true,
            duration: 200,

        });
    }

    $("#container").css({minHeight: $(window).innerHeight() + "px"});
    $(window).resize(function () {
        $("#container").css({minHeight: $(window).innerHeight() + "px"});
    });
    $('#filterRecords').click(function () {
        $('#filter').show();
    });
    $('input[type=checkbox]').each(function () {

        var name = $(this).attr('name');
        $('[name="' + '_' + name + '"]').remove();

    });
    
});
