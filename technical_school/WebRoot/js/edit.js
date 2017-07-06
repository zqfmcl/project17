	 	
		var int=self.setInterval("disptime()",1000);
		function disptime(){
		 var now = new Date(); //获得当前时间
		 var hh = now.getHours();  //获得小时、分钟、秒
		 var mm = now.getMinutes();
		 var ss = now.getSeconds();
		 var yy = now.getFullYear();
		 var mo = now.getMonth()+1;
		 var dd = now.getDate();
		 /*设置div的内容为当前时间*/
		 if(mm<10){
			 if(ss<10){
				 document.getElementById("time").value=yy+"-"+mo+"-"+dd+" "+hh+":0"+mm+":0"+ss;
			 }
			 else{	 
				 document.getElementById("time").value=yy+"-"+mo+"-"+dd+" "+hh+":0"+mm+":"+ss;
			 }
		 }
		 else{
			 if(ss<10){
				 document.getElementById("time").value=yy+"-"+mo+"-"+dd+" "+hh+":"+mm+":0"+ss;
			 }
			 else{	 
				 document.getElementById("time").value=yy+"-"+mo+"-"+dd+" "+hh+":"+mm+":"+ss;
			 }
		 }
		/*
		  使用setTimeout在函数disptime()体内再次调用setTimeout
		  设置定时器每隔1秒（1000毫秒），调用函数disptime()执行，刷新时钟显示
		*/
		}

        function check(){  
            var tittleValue=window.document.getElementById("tittle").value;  
            var timeValue=window.document.getElementById("time").value;  

            if (tittleValue == "") // 或者是!tittleValue  
            {  
                window.alert("文章标题不能为空!");  
                return false;  
            }
	  		else if (timeValue == "") 
            {  
                window.alert("发布时间不能为空!");  
                return false;  
            }
			
			else{
				return true;
			}  
        }  
		