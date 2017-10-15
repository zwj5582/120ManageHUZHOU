<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/utils/tags.jsp" %>
<html>
<head>
<title>120急救管理系统</title>
<s:include value="/jsp/fragment/head.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<script type="text/javascript">
function AutoResizeImage(maxWidth,maxHeight,objImg){
var img = new Image();
img.src = objImg.src;
var hRatio;
var wRatio;
var Ratio = 1;
var w = img.width;
var h = img.height;
wRatio = maxWidth / w;
hRatio = maxHeight / h;
if (maxWidth ==0 && maxHeight==0){
Ratio = 1;
}else if (maxWidth==0){//
if (hRatio<1) Ratio = hRatio;
}else if (maxHeight==0){
if (wRatio<1) Ratio = wRatio;
}else if (wRatio<1 || hRatio<1){
Ratio = (wRatio<=hRatio?wRatio:hRatio);
}
if (Ratio<1){
w = w * Ratio;
h = h * Ratio;
}
objImg.height = h;
objImg.width = w;
}
</script>
<style> 
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#msg_weibo {width:160px;height:340px;*height:350px;_height:340px;margin:5px auto 0;zoom:1; overflow:hidden;font-size:12px;line-height:20px;margin-bottom:4px;background:#ffffff;text-align:center}
#msg_weibo a{margin-right:6px;color:#003C71;text-decoration:none;}
#msg_weibo a:hover{color:#c00;text-decoration:underline;}
#msg_weibo img{margin-top:1px;}
#msg_weibo span{color: #888;}
#msg_weibo div{padding:0px 0 5px 0 ;overflow:hidden;zoom:1;}
#msg_weibo span a{display:block;}
#msg_weibo img{float:left; padding:0px; border:#D6D6D6 1px solid;}
#msg_weibo p{float:left;width:160px; text-align:center; }
</style>
</head>
<body>
<div>
<table width="160" height="350" align="left"  cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
<tr>
<td align="center" valign="top">
<div class="Contentnr auto">
<div id="msg_weibo">
<s:iterator value="contentList" status="vs">
<div>
 <s:if test="%{content !=null}">
      <a href="publish!view.action?id=${id}"  target="iFrame1">
<%--      <img src="publish!showImage.action?id=${id}&index=0" alt="${name}" width="155" height="100"  class="imgh" />--%>
        <s:set name="fimgpath" value="content.split('\\\\|')[0]"> </s:set>
       <img src="${fimgpath }" width="155" height="100"  class="imgh" />
      
      </a>
    </s:if>
</div>
<div>
<a href="publish!view.action?id=${id}"  target="iFrame1">${name}</a>
</div>
 </s:iterator>
</div>
      </div>
         </td>
      </tr>
</table>
<script language="javascript"> 
var $ = function (d){
    typeof d == "string" &&(d = document.getElementById(d)); 
    return $.fn.call(d);
};
$.fn = function (){        
        this.addEvent = function (sEventType,fnHandler){
                if (this.addEventListener) {this.addEventListener(sEventType, fnHandler, false);} 
            else if (this.attachEvent) {this.attachEvent("on" + sEventType, fnHandler);} 
            else {this["on" + sEventType] = fnHandler;}
        }
        this.removeEvent = function (sEventType,fnHandler){
                if (this.removeEventListener) {this.removeEventListener(sEventType, fnHandler, false);} 
            else if (this.detachEvent) {this.detachEvent("on" + sEventType, fnHandler);} 
            else { this["on" + sEventType] = null;}
        }
        return this;
};
var Class = {create: function() {return function() { this.initialize.apply(this, arguments); }}};
var Bind = function (obj,fun,arr){return function() {return fun.apply(obj,arr);}}
var Marquee = Class.create();
Marquee.prototype = {
  initialize: function(id,name,out,speed) {
    this.name = name;
        this.box = $(id);
        this.out  = 0;//滚动间隔时间,单位秒
        this.speed = speed;
        this.d = 1;
        this.box.style.position = "relative";
        this.box.scrollTop = 0;
        var _li = this.box.firstChild;
        while(typeof(_li.tagName)=="undefined")_li = _li.nextSibling;
        this.lis = this.box.getElementsByTagName(_li.tagName);
        this.len = this.lis.length;        
        for(var i=0;i<this.lis.length;i++){
            var __li = document.createElement(_li.tagName);
                __li.innerHTML = this.lis[i].innerHTML;
                this.box.appendChild(__li);//cloneNode
                if(this.lis[i].offsetTop>=this.box.offsetHeight)break;
        }
        this.Start();
        this.box.addEvent("mouseover",Bind(this,function(){clearTimeout(this.timeout);},[]));
        this.box.addEvent("mouseout",Bind(this,this.Start,[]));
  },
  Start:function (){
          clearTimeout(this.timeout);
          this.timeout = setTimeout(this.name+".Up()",this.out*1000)
  },
  Up:function(){
          clearInterval(this.interval);
          this.interval = setInterval(this.name+".Fun()",100);
  },
  Fun:function (){
      this.box.scrollTop+=this.speed;
          if(this.lis[this.d].offsetTop <= this.box.scrollTop){
            clearInterval(this.interval);
                this.box.scrollTop = this.lis[this.d].offsetTop;
                this.Start();
                this.d++;
          }
          if(this.d >= this.len + 1){
             this.d = 1;
             this.box.scrollTop = 0;
          }
  }
};
$(window).addEvent("load",function (){
marquee = new Marquee("msg_weibo","marquee",1,2);
});
 
</script>
</div>
</body>
</html>