$(function () {
    var loginId=$(".weui_tab").eq(0).attr("contents");
    var openid=$(".weui_tab").eq(0).attr("openid");
    var id=$(".weui_tab").eq(0).attr("id");
    var page={
        init:function () {
            page.headerClick();
            page.footClick();
            page.selectClick();
        },
        headerClick:function () {
            $(".weui_navbar_item").click(function (e) {
                $(this).addClass('weui_bar_item_on').siblings('.weui_bar_item_on').removeClass('weui_bar_item_on');
                var index=$(this).index();
                $(".weui_tab_bd").eq(index).addClass('myui_change').siblings('.myui_change').removeClass('myui_change');
                if(1==index){
                    $("#loadingToast").show();
                    ajaxAction.myPending(index);
                }

            });
        },
        footClick:function () {
            $(".weui_tabbar_item").click(function (e) {
                $(this).addClass("weui_bar_item_on").siblings('.weui_bar_item_on').removeClass("weui_bar_item_on");
            })
        },
        selectClick:function () {
            $(".weui_select").change(function () {
                ajaxAction.systemChoose($(this).val());
            })
        },

    }
    var ajaxAction={
        systemChoose:function (index) {
            var url="/s/"+index+"/"+loginId+"/systemChoose.htm";
            $.post(url,function (data) {
                var num=parseInt(data);
                if((num-2)<0){
                    $(".myui_article_ul").show();
                }else{
                    $(".myui_article_ul").eq(num-2).show().siblings('.myui_article_ul').hide();
                }
            });
        },
        myPending:function (index) {
            var url="/s/"+loginId+"/userPending.htm";
            $.getJSON(url,function (data) {
                var html="";
                $.each(data,function (i,item) {
                    html=html+"<a href='http://www.wangjianw.com.cn/uc/userdb.htm?userId="+item.userid+"&id="+item.id+
                        "&openid="+openid+"&tablename="+item.tablename+"' class='weui_media_box weui_media_appmsg'>"+
                    "<div class='weui_media_hd'>"+
                        "<img class='weui_media_appmsg_thumb' " +
                        "src='/images/index.jpg' alt=''>"+
                        "</div>"+
                        "<div class='weui_media_bd'>"+
                        "<h4 class=\"weui_media_title\">"+item.title+"</h4>"+
                        "<p class=\"weui_media_desc\">"+item.title+"&nbsp;&nbsp;&nbsp;"+item.description+"</p>"+
                    "</div>"+
                    "</a>";
                });
                $('.weui_panel_bd').eq(0).html(html);
                $("#loadingToast").hide();
            });
        }
    }
    page.init();
    // .container 设置了 overflow 属性, 导致 Android 手机下输入框获取焦点时, 输入法挡住输入框的 bug
    // 相关 issue: https://github.com/weui/weui/issues/15
    // 解决方法:
    // 0. .container 去掉 overflow 属性, 但此 demo 下会引发别的问题
    // 1. 参考 http://stackoverflow.com/questions/23757345/android-does-not-correctly-scroll-on-input-focus-if-not-body-element
    // Android 手机下, input 或 textarea 元素聚焦时, 主动滚一把
    if (/Android/gi.test(navigator.userAgent)) {
        window.addEventListener('resize', function () {
            if (document.activeElement.tagName == 'INPUT' || document.activeElement.tagName == 'TEXTAREA') {
                window.setTimeout(function () {
                    document.activeElement.scrollIntoViewIfNeeded();
                }, 0);
            }
        })
    }
});

