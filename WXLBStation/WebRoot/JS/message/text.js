/**
 * Created by wangjian on 2016-9-18.
 */
$(function(){
    var build={
        init:function () {
            $(window).scroll(function () {
                var scrollTop = $(this).scrollTop();
                var scrollHeight = $(document).height();
                var windowHeight = $(this).height();
                if(scrollHeight=scrollTop+windowHeight){
                    build.post();
                }
            });
        },
        post:function () {
            $("#loadingToast").show();
            var currentPage=$("#loadingToast").attr("content");
            var openid=$("#loadingToast").attr("open");
            var pageNum=parseInt(currentPage)+1;
            var url="/s/text/"+openid+"/"+pageNum+"/message.htm";
            $.post(url,function (data) {
                if(null!=data&&""!=data&&undefined!=data){
                    data=decodeURIComponent(data);
                    var jsonData=JSON.parse(data);
                    var html="";
                    $.each(jsonData,function (i) {
                        html=html+"<a class='weui_cell' content='"+jsonData[i].id+"'>"+
                        "<div class='weui_cell_bd weui_cell_primary'>"+
                            "<span>"+jsonData[i].content+"</span></div>"+
                            "<div class='weui_cell_ft'>"+jsonData[i].format+"</div></a>";
                    });
                    $(".weui_cells_access").append(html);
                    $("#loadingToast").attr("content",currentPage);
                }
                $("#loadingToast").hide();
            });

        }
    }
    build.init();
});
