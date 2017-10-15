var LODOP; // 声明为全局变量
function prn_preview12() {
	CreateOnePage2();
	LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "");
	LODOP.SET_PREVIEW_WINDOW(1, 0, 0, 0, 0, "");
	LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	LODOP.PREVIEW();
}
function prn_preview11() {
	CreateOnePage();
	LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "");
	LODOP.SET_PREVIEW_WINDOW(1, 0, 0, 0, 0, "");
	LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	LODOP.PREVIEW();
}
function prn_preview7() {
	CreateOnePage();
	LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "");// 2横向时的正向显示
	LODOP.SET_PREVIEW_WINDOW(1, 0, 0, 0, 0, "");
	LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	LODOP.PREVIEW();
}
function CreateOnePage() {
	 
	LODOP = getLodop(document.getElementById('LODOP_OB'), document
			.getElementById('LODOP_EM'));
	if(!LODOP){
		checkBrowser();
	}
	LODOP.PRINT_INIT("打印预览");
	var strStyleCSS = "<link href='css/Print.css' type='text/css' rel='stylesheet'>";
	var strHTML = strStyleCSS + "<body leftmargin=0 topmargin=0>"
			+ document.getElementById('div01').innerHTML + "</body>";
	// LODOP.ADD_PRINT_HTM("0%","0%","100%","100%",strHTML)
	LODOP.ADD_PRINT_HTM("8.4mm", 13, "RightMargin:0.9cm", "BottomMargin:9mm",
			strHTML);// 设置上边距和左边距分别为5mm和13px
	LODOP.SET_PREVIEW_WINDOW(0, 0, 0, 0, 0, "");
}
function CreateOnePage2() {
	 
	LODOP = getLodop(document.getElementById('LODOP_OB'), document
			.getElementById('LODOP_EM'));
	if(!LODOP){
		checkBrowser();
	}
	LODOP.PRINT_INIT("打印预览");
	var strStyleCSS = "<link href='css/Print.css' type='text/css' rel='stylesheet'>";
	var strHTML = strStyleCSS + "<body leftmargin=0 topmargin=0>"
			+ document.getElementById('div01').innerHTML + "</body>";
	// LODOP.ADD_PRINT_HTM("0%","0%","100%","100%",strHTML)
	LODOP.ADD_PRINT_HTM("5mm", 20, "RightMargin:0.2cm", "BottomMargin:2mm",
			strHTML);// 设置上边距和左边距分别为5mm和13px
	LODOP.SET_PREVIEW_WINDOW(0, 0, 0, 0, 0, "");
}
function prn_preview8() {
	CreateOnePage1();
	LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "");// 横向时的正向显示
	LODOP.SET_PREVIEW_WINDOW(1, 0, 0, 0, 0, "");
	LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	LODOP.PREVIEW();
}
function CreateOnePage1() {
	 
	LODOP = getLodop(document.getElementById('LODOP_OB'), document
			.getElementById('LODOP_EM'));
	if(!LODOP){
		checkBrowser();
	}
	LODOP.PRINT_INIT("打印预览");
	var strStyleCSS = "<link href='css/Print.css' type='text/css' rel='stylesheet'>";
	var strHTML = strStyleCSS + "<body leftmargin=0 topmargin=0>"
			+ document.getElementById('div01').innerHTML + "</body>";
	LODOP.ADD_PRINT_HTM("3mm", 13, "RightMargin:0.9cm", "BottomMargin:3.5mm",
			strHTML);// 设置上边距和左边距分别为5mm和13px
	LODOP.SET_PREVIEW_WINDOW(0, 0, 0, 0, 0, "");

}

function prn_preview9() {
	CreateOnePage3();
	LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "");// 2横向时的正向显示
	LODOP.SET_PREVIEW_WINDOW(1, 0, 0, 0, 0, "");
	LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	LODOP.PREVIEW();
}
function CreateOnePage3() {
	 
	LODOP = getLodop(document.getElementById('LODOP_OB'), document
			.getElementById('LODOP_EM'));
	if(!LODOP){
		checkBrowser();
	}
	LODOP.PRINT_INIT("打印预览");
	var strStyleCSS = "<link href='css/Print.css' type='text/css' rel='stylesheet'>";
	var strHTML = strStyleCSS + "<body leftmargin=0 topmargin=0>"
			+ document.getElementById('div02').innerHTML + "</body>";
	// LODOP.ADD_PRINT_HTM("0%","0%","100%","100%",strHTML)
	LODOP.ADD_PRINT_HTM("6.8mm", 13, "RightMargin:0.9cm", "BottomMargin:9mm",
			strHTML);// 设置上边距和左边距分别为5mm和13px
	LODOP.SET_PREVIEW_WINDOW(0, 0, 0, 0, 0, "");
}

function prn_preview_new1() {
	CreateOnePage_new1();
	LODOP.SET_PRINT_PAGESIZE(2, 0, 0, "");// 2横向时的正向显示
	LODOP.SET_PREVIEW_WINDOW(1, 0, 0, 0, 0, "");
	LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);
	LODOP.PREVIEW();
}

function CreateOnePage_new1() {
	LODOP = getLodop(document.getElementById('LODOP_OB'), document
			.getElementById('LODOP_EM'));
	if(!LODOP){
		checkBrowser();
	}
	LODOP.PRINT_INIT("打印预览");
	var strStyleCSS = "<link href='css/Print.css' type='text/css' rel='stylesheet'>";
	var strHTML = strStyleCSS + "<body leftmargin=0 topmargin=0>"
			+ document.getElementById('listContent').innerHTML + "</body>";
	// LODOP.ADD_PRINT_HTM("0%","0%","100%","100%",strHTML)
	LODOP.ADD_PRINT_HTM("8.4mm", 13, "RightMargin:0.9cm", "BottomMargin:9mm",
			strHTML);// 设置上边距和左边距分别为5mm和13px
	LODOP.SET_PREVIEW_WINDOW(0, 0, 0, 0, 0, "");
}


function  checkBrowser(){
	 var browser=getBrowserType();
	 if(browser.type == "Chrome"){
		 var version=browser.version;
	     if(version>44){
	    	 alert("非常抱歉，您的谷歌浏览器版本太高，最新的谷歌浏览器停止了打印插件的支持，请更换其他浏览器打印,谢谢！");
	     }else{
	    	 alert("非常抱歉，您的谷歌浏览器限制了打印插件的运行，请访问地址chrome://flags/#enable-npapi,启用 NPAPI,谢谢！");
	     }
	 }
}

function getBrowserType() {
    var ret = {};  
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    if(navigator.appVersion.match(/MSIE 6./i) == "6.") {
        ret.type = "IE";
        ret.version = 6;
        return ret;
    } else {
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
            (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
                (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
                    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
                        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
    }
     
    if (Sys.ie) {
        ret.type = "IE";
        ret.version = Sys.ie;
    } else if (Sys.firefox) {
        ret.type = "Firefox";
        ret.version = Sys.firefox;
    } else if (Sys.chrome) {
        ret.type = "Chrome";
        ret.version = Sys.chrome;
    } else if (Sys.opera) {
        ret.type = "Opera";
        ret.version = Sys.opera;
    } else if (Sys.safari) {
        ret.type = "Safari";
        ret.version = Sys.safari;
    }
     
    return ret;
}