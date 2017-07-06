/**
 * Created by admin on 2016-5-27.
 */
$(function () {
    var page={
        init:function () {
            $(".weui_btn").on("click",function () {
                page.post();
            })
        },
        post:function () {
            $(".form").eq(0).attr("action","/s/login.htm").submit();
        }
    }
    page.init();
});
