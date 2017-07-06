var videoWrapper = $('.u_video');
var videoHtml = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.maBarTransparent=100&cromedia.com/pub/shock　　　　　　　　　　wave/cabs/flash/swflash.cab#version=6,0,29,0" height="269" width="480">'+ 
                        
                        '<embed src="../image/video.flv" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="325" height="222" style="">'+ 
                        '</embed>'+ 
                    '</object>';
videoWrapper.html(videoHtml);
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