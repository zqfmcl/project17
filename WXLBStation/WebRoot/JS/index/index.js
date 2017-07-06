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
    // .container ������ overflow ����, ���� Android �ֻ���������ȡ����ʱ, ���뷨��ס������ bug
    // ��� issue: https://github.com/weui/weui/issues/15
    // �������:
    // 0. .container ȥ�� overflow ����, ���� demo �»������������
    // 1. �ο� http://stackoverflow.com/questions/23757345/android-does-not-correctly-scroll-on-input-focus-if-not-body-element
    // Android �ֻ���, input �� textarea Ԫ�ؾ۽�ʱ, ������һ��
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

