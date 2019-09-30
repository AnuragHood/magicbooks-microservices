$(document).ready(function () {

    var bookList = JSON.parse(localStorage.getItem("bookList"));

    if (bookList == null) {
        console.log('bookList is null');
        bookList = [];
    } else {
        $(".shoppingbasket").append("<div class=\"basketitems\">" + bookList.length + "</div>")
    }

    $('.add-to-cart').click(function () {
        var count = 0;
        for (var i = 0; i < bookList.length; i++) {
            if (parseInt($(this).attr('id')) == bookList[i]) {
                count++;
            }
        }

        if (count < parseInt($(this).attr('value'))) {
            bookList.push($(this).attr('id'));
            localStorage.setItem("bookList", JSON.stringify(bookList));
            if (localStorage.getItem("bookList") != null) {
                $(".shoppingbasket").append("<div class=\"basketitems\">" + bookList.length + "</div>")
                M.toast({html: 'Book Added to cart!!', classes: 'rounded'})
            }
        }


    });
    $('.shoppingbasket').click(function () {
        var serviceUrl = "/magicbooks/home/magicbooks/cartFeature";
        var baseUrl = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
        var url_tmp = baseUrl + serviceUrl;

        $.ajax({
            type: "POST",
            url: url_tmp,
            data: {
                bookids: JSON.parse(localStorage.getItem("bookList"))
            },
            success: function (msg) {
                console.log("Ajax Success")
                $('body').html(msg);
            }
        });

    });
    $('.increaseValue').click(function () {
        var value = parseInt($(this).closest('td').find('input[type=text]').val(), 10)
        value = isNaN(value) ? 0 : value;
        if (value < parseInt($(this).attr('value'))) {
            value++;
            $(this).closest('td').find('input[type=text]').val(value);
            bookList.push(parseInt($(this).closest('td').attr('class'), 10));
            console.log($(this).closest('td').attr('class'))
            localStorage.setItem("bookList", JSON.stringify(bookList));
        }

    });

    $('.decreaseValue').click(function () {
        var value = parseInt($(this).closest('td').find('input[type=text]').val(), 10)
        value = isNaN(value) ? 0 : value;
        value < 1 ? value = 1 : '';
        if (value > 1) {
            value--;
        }
        $(this).closest('td').find('input[type=text]').val(value);
        bookList.splice(value, 1)
        localStorage.setItem("bookList", JSON.stringify(bookList));
    });

});