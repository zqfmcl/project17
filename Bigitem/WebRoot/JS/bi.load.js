function manageView(jsonstr,nowp){
  	var json=eval('(' + jsonstr + ')');
  	var list=$("[data-num-p]");
  	var nowPage=json[nowp];
  	list.each(function(){
  		if(isnulljson(nowPage)||nowPage[$(this).attr("data-num-p")]!=1)$(this).remove();
  	});
  }
function isnulljson(x){
	if ((typeof x) == "undefined")return true;
	if ((typeof x) != "object")return true;
	if(!x)return true;
	return false;
}
function manageMenu(jsonstr){
	var json=eval('(' + jsonstr + ')');
	var list=$("[data-num-p]");
	list.each(function(){
		if(isnulljson(json)||isnulljson(json[$(this).attr("data-num-p")]))$(this).remove();
	});
}