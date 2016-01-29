$(document).ready(function(){
    var index = 0;
    var path = $(location).attr('pathname');

    var number_DB_products = $('span#number_DB_products').text();
    var number_products = $('.product').length;


    $(window).scroll(function() {

         var numberItems = 5;
         var offset = 0;


         if($(window).scrollTop() == $(document).height() - $(window).height())
         {
             //if($(window).scrollTop() + $(window).height() == $(document).height())
             //{
             //    alert("bottom!");
             //}

             number_products = $('.product').length;
             //alert(number_DB_products);
             //alert(number_products);

             //alert($('.product').length);
             if(number_products == number_DB_products)
             {
                 $("#endpage").removeClass('visually-hidden');

                 return false;
             }
             else if(number_products < numberItems)
             {
                 return false;
             }
             else
             {
                 $('a#infiniteLoader').show('fast');
                 var url = path+'/scroll';
                 //alert(url);
                 index++;
                 offset = index*numberItems;
                 //alert(offset + numberItems);
                 $.ajax({
                     type: 'POST',
                     url: url,
                     datatype: "json",
                     data: {
                         'number_products': number_products,
                         'url': url,
                         'numberItems': numberItems,
                         'offset': offset,
                     },
                     success: function(data){
                         //alert(data.data);
                         number_DB_products = data.data;
                         //alert(number_DB_products);
                         var view = data.html;

                         if(number_products < number_DB_products)
                         {
                             $(".product:last").after(view);
                             $('a#infiniteLoader').hide('1000');
                         }
                         else{
                             return false;
                         }
                     },
                 });
             }
         }
    });


    //var url = $('a.test').attr('href');
    $('#tri a').on('click', function(){
        url = $(this).attr('href');
        //alert(url);
        //alert(url.indexOf('desc'));
        if(url.indexOf('asc') > 0){
            url = url.replace('asc', 'desc');
            //alert(toto);
            $(this).attr('href', url);
            //alert(url);
        }
        else {
            url = url.replace('desc', 'asc');
            $(this).attr('href', url);
            //alert(url);
        }
    });

    $('input#delete').on('click', function(){
        if (confirm("Vous désirez vraiment supprimer le produit?")) {
        }
        else {
            return false;
        }
    });
});