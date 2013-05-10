
$(document).ready(function (){
    var scroll_position;
    $("#popup .closer").on("click",function(){
        history.pushState({}, "", "/"+language);

        $(".wrap_site").show();
        $("#popup").css("top",scroll_position);
        $(document).scrollTop(scroll_position);

        $(this).parent().fadeTo('slow',0,function(){
            $(this).hide();
        });
    });

//Клікаєм по новинах
    $(".container").on("click","a.popup_link",function(e){
        $("#loader").show();
        var alias = $(this).parent().attr("alt");
        var block = $(this).attr("alt");
        var id=$(this).attr("href");
        $("#popup").css("top",0);
        $.ajax({
            type:"GET",
            url:"/uk/news/news/showajax",
            data:"id="+id+"&view_model="+block,
            success: function(result){
                $(".wrap_popup_body").html(result);
                history.pushState({}, "/", "/"+language+"/"+block+"/"+alias );

                $("#loader").hide();
                scroll_position=$(document).scrollTop();

                $("#popup").scrollTop(-100);
                $("#popup").css('opacity','0').show().fadeTo("slow",1);

                $(".wrap_site").hide();


            }
        })
        return false;
    });

//Клікаєм по статичних сторінках
    $(".container").on("click","a.popup_static_page",function(e){
        $("#loader").show();
        var alias = $(this).attr("href");
        $("#popup").css("top",0);
        $.ajax({
            type:"GET",
            url:"/page/page/show",
            data:"slug="+$(this).attr("href"),
            success: function(result){
                $(".wrap_popup_body").html(result);
                history.pushState({}, "/", "/"+language+"/static/"+alias );
                $("#loader").hide();
                $("#popup").css('opacity','0').show().fadeTo("slow",1);
                scroll_position=$(document).scrollTop();
                $(".wrap_site").hide();
            }
        })
        return false;
    });

//клікаєм по блогах
    $(".popup_link_blog").on("click",function(){
        $("#loader").show();
        $("#popup").css("top",0);
        $.ajax({
            type:"GET",
            url:"/blog/blog/ajaxlist",
            data:"blogID="+$(this).attr("href"),
            success: function(result){
                $(".wrap_popup_body").html(result);
                $("#loader").hide();

                var blog_slug = $(".post_detail").attr("data-slug");
                var post_slug = $(".post_info").attr("data-slug");
                history.pushState({}, "/", "/"+language+"/blogs/"+blog_slug+"/"+post_slug );

                $("#popup").css('opacity','0').show().fadeTo("slow",1);
                scroll_position=$(document).scrollTop();
                $(".wrap_site").hide();
            }
        })
        return false;
    });

// ПАГІНАЦІЯ в новинах
    $(".container").on("click",".pagination",function(){
        $("#loader").show();
        var alias=$(this).parent().attr("alt");
        $.ajax({
            type:"GET",
            url:"/news/news/ajaxpopup",
            data:"alias="+alias+"&page="+$(this).text(),
            success: function(result){
                $("."+alias).html(result);
                $("#loader").hide();
            }
        })
        return false;
    });

    $(".container").on("click",".prev",function(){
        $("#loader").show();
        var alias=$(this).attr("alt");
        var page=$(this).parent().attr("alt");
        if(page>1){
            page--;
            $.ajax({
            type:"GET",
            url:"/news/news/ajaxpopup",
            data:"alias="+alias+"&page="+page,
            success: function(result){
            $("."+alias).html(result);
            $("#loader").hide();
            }
        })
        }
        return false;
        });
    $(".container").on("click",".next",function(){
            $("#loader").show();
            var alias=$(this).attr("alt");
            var page=$(this).parent().attr("alt");
            var max=$("."+alias+" .max").attr("alt");
            if(page<max){
            page++;
            $.ajax({
            type:"GET",
            url:"/news/news/ajaxpopup",
            data:"alias="+alias+"&page="+page,
            success: function(result){
                $("."+alias).html(result);
            $("#loader").hide();
            }
        })
        }
        return false;
        });

// ПАГІНАЦІЯ в блогах
    $("#popup").on("click",".blog_pagination a.pagination",function(){
        $("#loader").show();
        var alias=$(this).parent().attr("alt");
        var page = $(this).text();
        var new_post_id=$("#popup .post_detail").attr("alt");
        $.ajax({
            type:"GET",
            url:"/blog/blog/ajaxlist",
            data:"blogID="+alias+"&page="+page+"&new_post_id="+new_post_id,
            success: function(result){
                $(".wrap_popup_body").html(result);
                $("#loader").hide();
            }
        })
        return false;
    });

    $("#popup").on("click","button.next",function(){
        $("#loader").show();
        var alias=$(this).attr("alt");
        var page=$(this).parent().attr("alt");
        var max=$(this).parent().find(".max").attr("alt");
        var new_post_id=$(".post_detail").attr("alt");
        console.log(max);
        if(page<max){
            page++;
            $.ajax({
                type:"GET",
                url:"/blog/blog/ajaxlist",
                data:"blogID="+alias+"&page="+page+"&new_post_id="+new_post_id,
                success: function(result){
                    $(".wrap_popup_body").html(result);
                    $("#loader").hide();
                }
            })
        }
        return false;
    });

    $("#popup").on("click","button.prev",function(){
        $("#loader").show();
        var alias=$(this).attr("alt");
        var page=$(this).parent().attr("alt");
        var new_post_id=$(".post_detail").attr("alt");
        if(page>1){
            page--;
            $.ajax({
                type:"GET",
                url:"/blog/blog/ajaxlist",
                data:"blogID="+alias+"&page="+page+"&new_post_id="+new_post_id,
                success: function(result){
                    $(".wrap_popup_body").html(result);
                    $("#loader").hide();
                }
            })
        }
        return false;
    });

    $("#popup").on("click",".link_post",function(){
        $("#loader").show();
        var id = $(this).attr("alt");
            $.ajax({
                type:"GET",
                url:"/blog/blog/ajaxpost",
                data:"postid="+id,
                success: function(result){
                    $("#popup .wrap_popup_body .post_detail").html(result);

                    var blog_slug = $(".post_detail").attr("data-slug");
                    var post_slug = $(".post_info").attr("data-slug");
                    history.pushState({}, "/", "/"+language+"/blogs/"+blog_slug+"/"+post_slug );

                    $(".post_detail").attr("alt",id);
                    $("#loader").hide();
                }
            })
        return false;
    });
});