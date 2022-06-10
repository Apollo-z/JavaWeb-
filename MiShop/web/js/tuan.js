/**
 * Created with JetBrains WebStorm.
 * User: Hxx
 * Date: 14-11-30
 * 团购页面效果.
 */
$(document).ready(function(){
    SetShortCutEffect();//设置顶部快捷菜单效果
    SetCartEffect();//设置购物车效果
    SetCategory();//设置分类导航面板效果
    SetFixedButtonsAction(); //设置回到顶部动作及微信动画显示
    PanicNavInit(); //设置抢购点击效果
    BannerInit(); //设置大幅广告滚动效果
    SetFixedSearch();//固定顶部搜索
    FloorInit(); //楼层效果
    KillInit(); //秒杀活动效果
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

function PanicNavInit(){
    var _w = 105;

    var _setCur = function($li){
        var _size = $li.find(".sub_list").children().size();
        $li.addClass("cur").find(".sub_list").css({width:0}).stop().animate({ width: _w * _size});
    }

    $("#panic-nav").on("click", "span.title", function(){
        var _$li = $(this).parent();
        if(_$li.hasClass("cur")){
            return false;
        }
        var _$current = _$li.parent().find(".cur");
        if(_$current.size() > 0){
            _$current.find(".sub_list").stop().animate({width:0}, 300,function(){
                _$current.removeClass("cur");
                _setCur(_$li);
            });
        }else{
            _setCur(_$li);
        }
    });
}

function BannerInit(){
    var _$banner = $("#js_banner"),
        _$banner_img = $("#js_banner_img"),
        _$item_inner_items = $(".fx_banner_inner", _$banner_img).children(),
        _current_index = 0,
        _items_len = 3,
        _delay = 4000, // 滚动间隔
        _speed = 500, // 动画执行时间
        _$controls = $(".control", _$banner),
        _$controlsBtns = _$controls.children(),
        _bodyWidth = $(document.body).innerWidth(),
        _timer;

    function setBannersWidth(){
        _$banner_img.width(_bodyWidth * _items_len + 2000);
        _$banner_img.children().width(_bodyWidth);
    }

    $(window).on("resize", function(){
        _bodyWidth = $(document.body).innerWidth();
        setBannersWidth();
    });

    function scrollUL(){
        _$banner_img.stop().animate({
            "margin-left" : - _bodyWidth * _current_index
        }, _speed, function(){
            scrollActive();
            _$controls.find(".current").removeClass("current");
            _$controlsBtns.eq(_current_index).addClass("current");
        });
    }

    function scrollLeft(_index){
        var _startInnerIndex = _index * _items_len,
            _prev_index = _current_index,
            _prevStartInnerIndex = _prev_index * _items_len;
        _current_index = _index;
        _$item_inner_items.eq(_startInnerIndex).css({
            left : 500
        });
        _$item_inner_items.eq(_startInnerIndex + 1).css({
            left : 1500
        });
        _$item_inner_items.eq(_startInnerIndex + 2).css({
            left : 1800
        });
        _$item_inner_items.eq(_prevStartInnerIndex).stop().animate({
            left : -20
        });
        _$item_inner_items.eq(_prevStartInnerIndex + 1).stop().animate({
            left : -100
        });
        _$item_inner_items.eq(_prevStartInnerIndex + 2).stop().animate({
            left : 400
        });
        setTimeout(function(){
            scrollUL()
            setTimeout(function(){
                _$item_inner_items.eq(_startInnerIndex).stop().animate({
                    left : 0
                }, _speed / 3);
                _$item_inner_items.eq(_startInnerIndex + 1).stop().animate({
                    left : 0
                }, _speed / 1.6);
                _$item_inner_items.eq(_startInnerIndex + 2).stop().animate({
                    left : 495
                }, _speed / 1.3);
            }, _speed / 1.2);
        }, _speed / 2);
    }

    function scrollRight(_index){
        var _startInnerIndex = _index * _items_len,
            _prev_index = _current_index,
            _prevStartInnerIndex = _prev_index * _items_len;
        _current_index = _index;
        _$item_inner_items.eq(_startInnerIndex).css({
            left : -500
        });
        _$item_inner_items.eq(_startInnerIndex + 1).css({
            left : -1500
        });
        _$item_inner_items.eq(_startInnerIndex + 2).css({
            left : -1800
        });
        _$item_inner_items.eq(_prevStartInnerIndex).stop().animate({
            left : 20
        });
        _$item_inner_items.eq(_prevStartInnerIndex + 1).stop().animate({
            left : 100
        });
        _$item_inner_items.eq(_prevStartInnerIndex + 2).stop().animate({
            left : 600
        });
        setTimeout(function(){
            scrollUL()
            setTimeout(function(){
                _$item_inner_items.eq(_startInnerIndex).stop().animate({
                    left : 0
                }, _speed / 3);
                _$item_inner_items.eq(_startInnerIndex + 1).stop().animate({
                    left : 0
                }, _speed / 1.6);
                _$item_inner_items.eq(_startInnerIndex + 2).stop().animate({
                    left : 495
                }, _speed / 1.3);
            }, _speed / 1.2);
        }, _speed / 2);
    }

    _$controls.on("click", "li[class!=current]", function(){
        clearTimeout(_timer);
        var _index = parseInt($(this).text(), 10) - 1;
        if(_current_index > _index){
            scrollRight(_index);
        }else{
            scrollLeft(_index);
        }
    });

    _$banner.find(".fx_banner_common").on("click", "a", function(){
        clearTimeout(_timer);
        var _$a = $(this);
        var _index;
        if(_$a.hasClass("fx_banner_pre")){
            _index = _current_index - 1;
        }else{
            _index = _current_index + 1;
        }
        if(_index < 0){
            _index = _items_len - 1;
        }else if(_index >= _items_len){
            _index = 0;
        }
        if(_current_index > _index){
            scrollRight(_index);
        }else{
            scrollLeft(_index);
        }
    });

    _$banner_img.hover(
        function(){
            clearTimeout(_timer);
        },
        function(){
            scrollActive();
        }
    );

    function scrollActive(){
        _timer = setTimeout(function(){
            var _index = _current_index + 1;
            if(_index >= _items_len){
                _index = 0;
                scrollRight(_index);
            }else{
                scrollLeft(_index);
            }
        }, _delay);
    }

    function action(){
        setBannersWidth();
        scrollActive();
    }

    action();
};

function FloorInit(){
    var _$floor_container = $(".J_floor"),
        _$floors = _$floor_container.children(".floor-item"),
        _$floor_nav = $(".J_floor_nav"),
        _$floor_nav_items = _$floor_nav.find("ul.Fix>li"),
        _offset_tops = [];

    $.each(_$floors, function(i, ele){
        _offset_tops.push($(ele).offset().top);
    });

    _offset_tops.reverse();
    $(window).load(function(){
        var _L=_$floor_container.offset().left-50;
        _L=_L<0?0:_L;
        _$floor_nav.css({left:_L+"px"});
    });
    $(window).resize(function(){
        var _L=_$floor_container.offset().left-50;
        _L=_L<0?0:_L;
        _$floor_nav.css({left:_L+"px"});
    });
    $(window).on("scroll", function(){
        var _scrollTop =  $(window).scrollTop(),
            _minTop = _$floor_container.offset().top - 40,
            _maxTop = _offset_tops[0] + 40,
            _top = 0;
        if(_minTop > _scrollTop){
            _top = _minTop - _scrollTop;
        }else if(_maxTop < _scrollTop){
            _top = _maxTop - _scrollTop;
        }
        _$floor_nav.css({
            top :_top
        });
        $.each(_offset_tops, function(i, v){
            if(v <= _scrollTop + 400){
                _$floor_nav.find("a.on").removeClass("on");
                _$floor_nav_items.eq(_$floor_nav_items.size() - i - 1).find("a").addClass("on");
                return false;
            }
        });
    });

    var _ele = document.documentElement.scrollTop ? document.documentElement : document.body;

    _$floor_nav.on("click", "ul.Fix>li", function(){
        var _$li = $(this);
        if(_$li.find("a.on").size() > 0){
            return false;
        }
        var _top = _$floors.eq(_$li.index()).offset().top;
        $(_ele).stop().animate({"scroll-top":_top - 40}, 500, function(){
//            _$floor_nav.find("a.on").removeClass("on");
//            _$li.find("a").addClass("on");
        });
    });
    _$floor_nav.css({
        top :_$floor_container.offset().top - 40 - $(window).scrollTop()
    });
}

function KillInit(){
    var _$clock = $("#seckilling .sk-clock");
}