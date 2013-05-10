
$(document).ready(function (){
    $("#popup .closer").click(function(){
        $(this).parent().fadeTo('slow',0,function(){
            $(this).hide();
        });
    });
    $(".popup_link").click(function(){
        $("#loader").show();
        $.ajax({
            type:"GET",
            url:"/news/news/showajax",
            data:"title="+$(this).attr("href"),
            success: function(result){
                $("#popup .content").html(result);
                $("#loader").hide();
                $("#popup").css('opacity','0').show().fadeTo("slow",1);
            }
        })
        return false;
    });
});