CKEDITOR.dialog.add('flvPlayer',　function(editor){  
　　　　  
　　　　var　escape　=　function(value){  
　　　　　　　　return　value;  
　　　　};  
　　　　return　{  
　　　　　　　　title:'word转换flash',  
　　　　　　　　resizable:　CKEDITOR.DIALOG_RESIZE_BOTH,  
　　　　　　　　minWidth: 350,  
  	  		 minHeight: 300,  
　　　　　　　　contents:　[{  
　　　　　　　　　　id: 'info',    
                    label: '常规',  
                    accessKey: 'P',  
                    elements:[  
                        {  
                        type: 'hbox',  
                        widths : [ '80%', '20%' ],  
                        children:[{  
                                id: 'src',  
                                type: 'text',  
                                label: '源文件'  
                            }]  
                        },  
                        {  
                        type: 'hbox',  
                        widths : [ '35%', '35%', '30%' ],  
                        children:[]//children finish   
                        },]  
                    }, {  
                        id: 'Upload',  
                        hidden: true,  
                        filebrowser: 'uploadButton',  
                        label: '上传',  
                        elements: [{  
                            type: 'file',  
                            id: 'upload',  
                            label: '上传',  
                            size: 38  
                        },  
                        {  
                            type: 'fileButton',  
                            id: 'uploadButton',  
                            label: '发送且格式转换',  
                            filebrowser: 'info:src',  
                            'for': ['Upload', 'upload']//'page_id', 'element_id'    
                        }]  
　　　　　　　　}],  
　　　　　　　　onOk:　function(){  
　　　　　　　　　　　　
　　　　　　　　　　　　mysrc　=　this.getValueOf('info',　'src');  

　　　　　　　　　　　　html　=　''　+　escape(mysrc)　+　'';  
　　　　　　　　　　　　//editor.insertHtml("<pre　class=/"brush:"　+　lang　+　";/">"　+　html　+　"</pre>");   
					editor.insertHtml("<p><object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0\"><param name=\"allowFullScreen\" value=\"true\" /><param name=\"quality\" value=\"high\" /><param name=\"movie\" value=\""+mysrc+"\" /><embed allowfullscreen=\"true\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" quality=\"high\" src=\""+mysrc+"\" type=\"application/x-shockwave-flash\"></embed></object></p>");  

　　　　　　　　},  
　　　　　　　　onLoad:　function(){  
　　　　　　　　}  
　　　　};  
});  