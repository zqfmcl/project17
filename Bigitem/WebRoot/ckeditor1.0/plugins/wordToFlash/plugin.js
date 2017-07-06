(function() {  
    CKEDITOR.plugins.add("wordToFlash", {  
        requires: ["dialog"],  
        init: function(a) {  
            a.addCommand("wordToFlash", new CKEDITOR.dialogCommand("wordToFlash"));  
            a.ui.addButton("wordToFlash", {  
                label: "word转flash格式",//调用dialog时显示的名称  
                command: "wordToFlash",  
                icon: this.path + "/images/wordtoflash.ico"//在toolbar中的图标  
            });  
            CKEDITOR.dialog.add("wordToFlash", this.path + "dialogs/wordToFlash.js")  //加入对话框
   
        }  
   
    })  
   
})(); 