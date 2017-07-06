/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	
	// 上传文件时浏览服务文件夹                                                                                                       
	config.filebrowserBrowseUrl ='ckfinder/ckfinder.html';                                                           
	// 上传图片时浏览服务文件夹                                                                                                        
	config.filebrowserImageBrowseUrl ='ckfinder/ckfinder.html?Type=Images';                                          
	// 上传Flash时浏览服务文件夹                                                                                                     
	config.filebrowserFlashBrowseUrl ='ckfinder/ckfinder.html?Type=Flash'; 
	
	
	config.toolbarGroups = [
	                		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
	                		{ name: 'forms', groups: [ 'forms' ] },
	                		{ name: 'document', groups: [ 'document', 'mode', 'doctools' ] },
	                		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	                		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
	                		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
	                		{ name: 'insert', groups: [ 'insert' ] },
	                		'/',
	                		{ name: 'links', groups: [ 'links' ] },
	                		'/',
	                		{ name: 'styles', groups: [ 'styles' ] },
	                		{ name: 'colors', groups: [ 'colors' ] },
	                		{ name: 'tools', groups: [ 'tools' ] },
	                		{ name: 'others', groups: [ 'others' ] },
	                		{ name: 'about', groups: [ 'about' ] }
	                	];

	                	config.removeButtons = 'Source,Find,Replace,Scayt,Button,CreateDiv,Language,Anchor,Unlink,Link,Smiley,Iframe,Blockquote,BidiLtr,BidiRtl,ShowBlocks,About,Print,NewPage,Textarea,TextField,Radio,Checkbox,ImageButton,Subscript,Superscript,Strike,PageBreak,SpecialChar';

	config.width ='980px';
	
	// 上传文件按钮(标签)                                                                                                         
	config.filebrowserUploadUrl = '/Bigitem/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	
	// 上传图片按钮(标签)                                                                                                         
    config.filebrowserImageUploadUrl = '/Bigitem/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
    
	// 上传Flash按钮(标签)                                                                                                      
    config.filebrowserFlashUploadUrl = '/Bigitem/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
    

	
	
	// 上传文件按钮(标签)                                                                                                         
	//config.filebrowserUploadUrl ='ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';       
	// 上传图片按钮(标签)                                                                                                         
	//config.filebrowserImageUploadUrl ='ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';  
	// 上传Flash按钮(标签)                                                                                                      
	//config.filebrowserFlashUploadUrl ='ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
	
    
    
      
	
};
