/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	 config.removePlugins = 'elementspath';
	 config.removeDialogTabs = 'image:advanced;link:target;'//隐藏高级选择
     //config.removeDialogTabs = 'link:advanced;link:target;image:advanced;image:target;';
    config.resize_maxWidth = 300;//改变大小的最大宽度
	config.enterMode = CKEDITOR.ENTER_BR;//编辑器中回车产生的标籤br
	config.forcePasteAsPlainText =false;//否强制复制来的内容去除格式
	config.filebrowserUploadUrl = "publish!uploadImg.action";
};
