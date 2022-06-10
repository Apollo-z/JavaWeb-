/**
 * Created with JetBrains WebStorm.
 * User: Hxx
 * Date: 14-11-26
 * 首页页面效果.
 */
$(document).ready(function(){
    SetShortCutEffect();//设置顶部快捷菜单效果
    SetCartEffect();//设置购物车效果
    SetCategory();//设置分类导航面板效果
    SetScrollAdvBig(); //设置轮播效果
    SetFixedButtonsAction(); //设置回到顶部动作及微信动画显示
    SetFloorLunBo();//楼层广告轮播
    SetFixedSearch();//固定顶部搜索
    addImage();
});

function SetShortCutEffect(){
    $('.shortcut_v2013').find(".menu").hover(function(){
        $(this).addClass('hover');
    },function(){
        $(this).removeClass('hover');
    });
};

function SetCartEffect(){
    $("#cart_box").hover(
        function(){
            $(this).addClass("car-current");
        },
        function(){
            $(this).removeClass("car-current");
        }
    );

};

function SetCategory(){
    $("#category>li").hover(
        function(){
            $(this).addClass("hover");
        },
        function(){
            $(this).removeClass("hover");
        }
    );
}

function SetScrollAdvBig(){
    var $slidey = $("#slide-scroll-adv").unslider({
        delay: 3000,//轮播间隔，单位：毫秒
        dots: true
    });
    var data = $slidey.data('unslider');
    $(".scroll_adv_left").click(function(){
        data.prev();
    });
    $(".scroll_adv_right").click(function(){
        data.next();
    });
};

function  addImage(){
    var index = 0;

    var count = $("table tr").eq(0).find("td img").length;

    setInterval(function() {

        var obj = $("table tr").eq(0).find("td img").eq(index);

        $("#defaultImg").attr("src", obj.attr("src"));

        if ($("#defaulta").length > 0) {

            $("#defaulta").attr("href", obj.attr("_href"));

        } else {

            $("#defaultImg").wrap('<a id="defaulta" href="' + obj.attr("_href") + '"></a>');

        }

        if (++index >= count) {

            index = 0;
        }
    }, 3000);
}

function SetFixedButtonsAction(){
    $("#imgBtn-to-top").on("click", function(){
        var _ele = document.documentElement.scrollTop ? document.documentElement : document.body;
        $(_ele).animate({"scroll-top":0},200);
    });
    var $fixedWeixin = $(".fixed-weixin"),
        $weixinPic = $fixedWeixin.find(".weixin-pic");
    $fixedWeixin.on("transitionend", function(){
        if(!$fixedWeixin.hasClass("show")){
           //$weixinPic.css("display", "none");
        }
    });
    $fixedWeixin.hover(
        function(){
            //$weixinPic.css("display", "block");
            $fixedWeixin.addClass("show");
        },
        function(){
            $fixedWeixin.removeClass("show");
        }
    );

}

//楼层广告轮播
function SetFloorLunBo(){
    $(".f_lunbo").each(function(){
        var obj=$(this);
        if(obj.find("img").size()>0){
            var $slidey = obj.unslider({
                delay: 3000,//轮播间隔，单位：毫秒
                dots: true
            });
            var data = $slidey.data('unslider');
            obj.find(".f_lunbo_left").click(function(){
                data.prev();
            });
            obj.find(".f_lunbo_right").click(function(){
                data.next();
            });
        }
    });
};

function SetFixedSearch(){
    var _top = 200,
        $bg = $(".fixed-bar-bg"),
        $bar = $(".fixed-bar");;
    $(window).scroll(function(){
       if($(window).scrollTop() >= 200){
           if(!$bg.hasClass("show")){
               $bg.addClass("show");
               $bar.addClass("show");
           }
       }else if($bg.hasClass("show")){
           $bg.removeClass("show");
           $bar.removeClass("show");
       }
    });
}


