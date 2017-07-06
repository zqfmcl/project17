/**
 * Created by wangjian1 on 2016-5-26.
 */
$(function(){
    var pager={
        init:function () {
            pager.hide();
            $(".primary").on("touchend",function () {
                pager.hide();
            });

            $("#showTooltips").on("touchend",function () {
                pager.push();
            });
        },
        push:function () {
            var loginID=$("input[name='loginid']").eq(0).val();
            var password=$("input[name='password']").eq(0).val();
            if(""==loginID){
                $(".weui_dialog .weui_dialog_bd").html("请输入要绑定的账号！");
                pager.alert();
            }else if(""==password){
                $(".weui_dialog .weui_dialog_bd").html("请输入密码！");
                pager.alert();
            }else{
              pager.post();
            }
        },
        hide:function () {
            $(".weui_dialog_alert").hide();
        },
        alert:function () {
            $(".weui_dialog_alert").show();
        },
        post:function () {
            $(".login").eq(0).attr("action","/s/save.htm").submit();
        }
    }
    pager.init();
});
