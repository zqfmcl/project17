 
	CKEDITOR.plugins.add('flvPlayer',  
			{  
			    init: function(editor)      
			    {          
			        //plugin code goes here   
			        var pluginName = 'flvPlayer';   
			        editor.ui.addButton('flvPlayer',  
			        {                 
			            label: 'word转换flash',  
			            command: pluginName ,
			            icon: this.path + "/images/wordtoflash.ico"//在toolbar中的图标  
			        });  
			    	CKEDITOR.dialog.add(pluginName, this.path + 'dialogs/flvPlayer.js');          
			    	editor.addCommand(pluginName, new CKEDITOR.dialogCommand(pluginName));  
			    }  
			}); 

