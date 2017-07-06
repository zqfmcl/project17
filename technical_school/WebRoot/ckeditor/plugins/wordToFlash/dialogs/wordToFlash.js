(function() {  
    CKEDITOR.dialog.add("wordToFlash",   
    function(a) {  
    	  a.ui.addButton("wordToFlash", {  
              label: "word转flash格式",//调用dialog时显示的名称  
              command: "wordToFlash",  
              icon: this.path + "/images/wordtoflash.ico"//在toolbar中的图标  
 
          });  
        return {  
            title: "word转flash格式",  
            minWidth: "500px",  
            minHeight:"500px",  
            contents: [{  
                id: "tab1",  
                label: "",  
                title: "",  
                expand: true,  
                width: "500px",  
                height: "500px",  
                padding: 0,  
                elements: [{  
                    type: "html",  
                    style: "width:500px;height:30px",  
                    html: '<iframe name="message">sss</iframe><form id="form1" name="form1" method="post" action="servlet/fileServlet" enctype="multipart/form-data" target="message"><input name="file" type="file" size="20" ><input name="submit" type="submit" value="提交"><input type="reset" name="reset" value="重置" ></from>'  
                }]  
            }],  
            onOk: function() {  
            	//alert("");

                //点击确定按钮后的操作  
                //a.insertHtml("编辑器追加内容");  
            	//window.navigate("../../../../UpLoad.jsp"); 
            	//window.location.href="../../../../UpLoad.jsp?backurl="+window.location.href; 
            
            	
            }  
        }  
    })  
})();  