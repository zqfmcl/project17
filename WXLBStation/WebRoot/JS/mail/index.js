/**
 * Created by wangjian on 2016-9-1.
 */
$(function () {
    var init={
        bind:function () {
            if($("#search_input").val()!=""){
                $('#search_text').hide();
            }else{
                $('#search_text').show();
            }
            $("#search_cancel").on('touchend',function () {
                init.search();
            });
            $('#search_clear').on('touchend', function () {
                $('#search_input').val('');
            });
            $('#search_input').on('focus',function () {
                var $weuiSearchBar = $('#search_bar');
                $weuiSearchBar.addClass('weui_search_focusing');
                $("#search_clear").show();
            });
            $("#search_input").on("blur",function () {
                $("#search_clear").hide();
                $('#search_bar').removeClass('weui_search_focusing');
                if($("#search_input").val()!=""){
                    $('#search_text').hide();
                }else{
                    $('#search_text').show();
                }
                init.search();
            });
            $(".my_user").on("touchend",function () {
                var loginID=$(this).parents(".weui_media_box").attr("loginID");//用户账户
                var my_title=$(this).siblings(".my_title").html();//用户手机号码
                var my_station=$(this).siblings(".my_station").html();//用户职位
                var my_user=$(this).html();//用户姓名
                if(""==my_user||undefined==my_user){
                    my_user=null;
                }
                if(""==my_station||undefined==my_station){
                    my_station=null;
                }
                if(""==my_title||undefined==my_title){
                    my_title=null;
                }
                var url="/u/"+my_user+"/"+my_station+"/"+my_title+"/"+loginID+"/user.htm";
                window.location.href=url;
            });
        },
        search:function () {
            var uname=$("#search_input").val();
            if(uname==""){
                uname="null";
            }
            var URL="/u/"+uname+"/queryList.htm";
            $(".weui_search_outer").eq(0).attr("action",URL).submit();
           /* $.post(URL,function (data) {
                var html="";
                if(null!=data&&""!=data){
                   data= decodeURIComponent(data);
                    var jsonData=JSON.parse(data);
                    $.each(jsonData,function (i) {
                        var url=jsonData[i].user.userimageurl;
                        if(undefined==url){
                            url="";
                        }
                        var name=jsonData[i].name;
                        if(undefined==name){
                            name="";
                        }
                        var zw=jsonData[i].zw;
                        if(zw==undefined){
                            zw="";
                        }
                        var sj=jsonData[i].sj;
                        if(undefined==sj){
                            sj="";
                        }
                        html=html+"<a href='javascript:void(0);' class='weui_media_box weui_media_appmsg'>"+
                        "<div class='weui_media_hd'>"+"<img class='weui_media_appmsg_thumb' src='"+url+"'/>"+ "</div>"+
                            "<div class='weui_media_bd'>"+
                            "<div class='my_user'>"+name+"</div>"+
                            "<div class='my_station'>"+zw+"</div>"+
                            "<div class='my_title'>"+sj+"</div>"+
                            "</div>"+
                            "</a>";
                    });
                }
                $(".weui_panel_bd").html(html);
            });*/
        }
    }
    init.bind();
});