//-------------格式化日期输出-----------------------------
Date.prototype.format = function(format){
var o = { 
"M+" : this.getMonth()+1, //month 
"d+" : this.getDate(), //day 
"h+" : this.getHours(), //hour 
"m+" : this.getMinutes(), //minute 
"s+" : this.getSeconds(), //second 
"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
"S" : this.getMilliseconds() //millisecond 
}
if(/(y+)/i.test(format)) { 
format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
}
for(var k in o) { 
if(new RegExp("("+ k +")").test(format)) { 
format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
}
}
return format; 
}
//-------------------图片无限滚动---------------------------
jQuery.fn.extend({
   pic_scroll:function (s){
       $(this).each(function(){
           var _this=$(this);//存储对象
           var ul=_this.find("ul");//获取ul对象
           var li=ul.find("li");//获取所有图片所有的li
           var w=li.size()*li.width();//统计图片的长度
           var len=w+li.size()*parseInt(li.css("margin-left"))+li.size()*parseInt(li.css("padding-left"));
           li.clone().prependTo(ul);//克隆图片一份放入ul里
           ul.width(2*len);//设置ul的长度，使所有图片排成一排
           var i=1,l;
           _this.hover(function(){i=0},function(){i=1});//鼠标经过时设置i=0达到鼠标经过停止效果
           setInterval(function(){
               //定时滚动函数
               l = _this.scrollLeft();
               if (l < len) {
                   _this.scrollLeft(l+i);
               } else {
                   _this.scrollLeft(0);
               }
           },s);
       })
   }
});
function show_jian(){
        $('#lib_content1_nav').find(".lib_lib").each(function(){
          $(this).hover(function(){
            $(this).next().css('display','block');
          },function(){
            $(this).next().css('display','none');
          })
        });
};
jQuery.fn.extend({
   scroll_up:function (s){
       $(this).each(function(){
           var _this=$(this);//存储对象
           var ul=_this.find("ul");//获取ul对象
           var li=ul.find("li");//获取所有图片所有的li
           var w=li.size()*li.height();//统计图片的长度
           var len=w+li.size()*parseInt(li.css("margin-top"))+li.size()*parseInt(li.css("padding-top"));
           li.clone().prependTo(ul);//克隆图片一份放入ul里
           ul.height(2*len);//设置ul的长度，使所有图片排成一排
           var i=1,l;
           _this.hover(function(){i=0},function(){i=1});//鼠标经过时设置i=0达到鼠标经过停止效果
           setInterval(function(){
               //定时滚动函数
               l = _this.scrollTop();
               if (l < len) {
                   _this.scrollTop(l+i);
               } else {
                   _this.scrollTop(0);
               }
           },s);
       })
   }
});