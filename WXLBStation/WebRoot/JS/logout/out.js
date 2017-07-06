/**
 * Created by wangjian1 on 2016-5-26.
 */
$(function () {
   var page={
       init:function () {
           $("#showTooltips").on("click",function(){
               page.post();
           });
       },
       post:function () {
           $(".form").eq(0).attr("action","/s/delete.htm").submit();
       }
   }
    page.init();
});
