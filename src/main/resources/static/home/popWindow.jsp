<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <title>My JSP 'popWindow.jsp' starting page</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
<!--

.con{margin:0 auto; overflow:hidden; width:760px;}
ol{list-style-type:disc;}
.red{color:#f00;}
.pop{overflow:hidden; width:310px; height:150px; line-height:20px; text-align:center; display:none;}
.pop_a{display:block;}
a.a1{color:#fff;}
a.a2{color:#000;}
-->
</style>	
	
	
<script type="text/javascript">
var Pop = function(options){
 this.isIE = (document.all) ? true : false;
 this.isIE6 = this.isIE && (navigator.userAgent.indexOf('MSIE 6.0') != -1);
 this.isIE6 ? this.position = "absolute" : this.position = "fixed";
 this.SetOptions(options);
 this.mode = this.options.mode;
 this.zIndex = this.options.zIndex;
 this.left = this.options.left;
 this.right = this.options.right;
 this.top = this.options.top;
 this.bottom = this.options.bottom;
 this.oPop = $("#" + this.options.oPop);
 this.oPop.css({ position:this.position, "z-index":this.zIndex });
 
 //页面载入时是否显示遮盖层
 if(this.options.beCover){
  this.Start();
  this.Initialization();
  this.FullScreen(this.heightDocument, this.widthDocument);
 }
 
 //是否添加浮动层收缩
 if(!!this.options.idShrink) this.Shrink(this.options.idShrink);
 
 /*关闭、打开浮动层*/
 if(this.options.idClose.length != 0) this.Close(this.options.idClose);
 !!this.options.idOpen ? this.Open(this.options.idOpen) : this.Start();
 
};
Pop.prototype = {
 SetOptions: function(options){
  this.options = {
   /*浮动框相关属性*/
   oPop: "idPop",            //浮动框id
   zIndex: "999",            //浮动框的z-index
   left: 0,                  //距离左边多少像素
   right: 0,                 //距离右边多少像素
   top: 0,                   //距离顶部多少像素
   bottom: 0,                //距离底部多少像素
   mode: ["left", "top"],    //浮动层默认定位左上
   
   /*遮罩层相关属性*/
   beCover: false,           //页面载入时是否显示遮盖层
   cover: false,             //是否显示遮盖层(遮盖层显示的必须条件)
   zIndexCover: 888,         //遮盖层的z-index
   colorCover: "#000",       //遮盖层的背景颜色
   opactiyCover: 0.5,        //遮盖层的透明度
   
   /*浮动框收缩相关属性*/
   idShrink: null,           //收缩按钮id
   minHeight: 0,            //收缩后的高度
   maxHeight: 0,       //展开后的高度
   classOne: null,           //切换用的class
   classTwo: null,           //切换用的class
   
   /*关闭、打开浮动层相关属性*/
   idOpen: null,             //打开按钮
   idClose: []               //关闭按钮
  };
  $.extend(this.options, options || {});
 },
 Initialization: function(){
  this.widthPop = this.oPop.width();
  this.heightPop = this.oPop.height();
  this.heightDocument = $(document).height();
  this.widthDocument = Math.min($(document).width(), $("body").width()); //避免ie6下加上滚动条的宽度
  this.heightWindow = $(window).height();
  this.widthWindow = $(window).width();
  this.topScroll = $(window).scrollTop();
  this.leftScroll = $(window).scrollLeft();
 },
 Start: function(){
  switch(this.mode[0].toLowerCase()) {
   case "left":
    this.LeftRightLocation();
    break;
   case "right":
    this.LeftRightLocation();
    break;
   default:
    this.CenterLocation();
  }
 },
 //mark等于false为水平垂直居中定位
 GetValue: function(mark){
  if(this.oPop.css("display") == "none") return; //浮动层显示时才动态计算其坐标(解决一个效率问题)
  var level = this.mode[0].toLowerCase(), vertical = this.mode[1].toLowerCase();
  this.Initialization();
  if(mark){
   if(!this.isIE6){
    level == "left" ? this.oPop.css({ left: this.left }) : this.oPop.css({ right: this.right });
    vertical == "top" ? this.oPop.css({ top: this.top }) : this.oPop.css({ bottom: this.bottom });
   }else{
    var x_final = level == "left" ? this.leftScroll + this.left : this.widthWindow + this.leftScroll - this.widthPop - this.right;
    var y_final = vertical == "top" ? this.topScroll + this.top : this.heightWindow + this.topScroll - this.heightPop - this.bottom;
    this.oPop.css({ top: y_final, left: x_final });
   }
  }else{
   if(!this.isIE6){
    var x_final = parseInt((this.widthWindow - this.widthPop) / 2);
    var y_final = parseInt((this.heightWindow - this.heightPop) / 2);
   }else{
    var x_final = (this.widthWindow - this.widthPop) / 2 + this.leftScroll;
    var y_final = (this.heightWindow - this.heightPop) / 2 + this.topScroll;
   }
   this.oPop.css({ top: y_final, left: x_final });
  }
  
  //IE6在浮动层中添加iframe
  if(this.isIE6){ this.AddIframe(this.oPop, this.heightPop, this.widthPop); }
 },
 LeftRightLocation: function(){
  this.GetValue(true);
  var _this = this;
  $(window).bind("scroll."+this.options.oPop, function(){
   _this.GetValue(true);
  }).bind("resize."+this.options.oPop, function(){
   _this.GetValue(true);
  })
 },
 CenterLocation: function(){
  this.GetValue(false);
  var _this = this;
  $(window).bind("scroll."+this.options.oPop, function(){
   _this.GetValue(false); 
  }).bind("resize."+this.options.oPop, function(){
   _this.GetValue(false); if(_this.oPop.css("display") != "none") _this.FullScreen(_this.heightDocument, _this.widthDocument);
  });
 },
 FullScreen: function(oHeight, oWidth){
  if(!this.options.cover) return;
  
  //遮盖层参数
  this.zIndexCover = this.options.zIndexCover;
  this.colorCover = this.options.colorCover;
  this.opactiyCover = this.options.opactiyCover;
  
  if($("#popMask").length == 0) $("body").append("<div id=\"popMask\"></div>");
  
  //ie6遮罩层定位absolute,非ie6遮罩层定位fixed
  if(this.isIE6){
   $("#popMask").css({ position: "absolute", "z-index": this.zIndexCover, top: 0, left: 0, height: oHeight, width: oWidth, opacity: this.opactiyCover, background: this.colorCover }); 
   //IE6在浮动层中添加iframe
   this.AddIframe($("#popMask"), oHeight, oWidth);
  }else{
   $("#popMask").css({ position: "fixed", "z-index": this.zIndexCover, top: 0, left: 0, height: "100%", width: "100%", opacity: this.opactiyCover, background: this.colorCover }); 
  }
 },
 //IE6覆盖select控件
 AddIframe: function(iElement, iHeight, iWidth){
  iElement.append("<iframe></iframe>");
  var oIframe = iElement.children("iframe");
  oIframe.css({ position: "absolute", top: 0, left: 0, opacity: 0, "z-index": -1, height: iHeight, width: iWidth, border: 0 });
 },
 //浮动层收缩
 Shrink: function(iShrink){
  this.minHeight = this.options.minHeight;
  this.maxHeight = this.options.maxHeight;
  this.classOne = this.options.classOne;
  this.classTwo = this.options.classTwo;
  var _this = this;
  $("#" + iShrink).toggle(
   function(){
    _this.oPop.height(_this.minHeight);
    $(this).removeClass();
    $(this).addClass(_this.classOne);
    if(_this.isIE6) _this.GetValue(true);
   },
   function(){
    _this.oPop.height(_this.maxHeight);
    $(this).removeClass();
    $(this).addClass(_this.classTwo);
    if(_this.isIE6) _this.GetValue(true);
   }
  );
 },
 Close: function(iClose){
  var _this = this;
  $.each(iClose, function(index, name){
   $("#" + name).click(function(){
    _this.oPop.css({ display: "none" });
    if(!!$("#popMask")[0]) { $("#popMask").remove(); }
    $(window).unbind("scroll."+_this.options.oPop);
    $(window).unbind("resize."+_this.options.oPop);
   })
  });
 },
 Open: function(iOpen){
  var _this = this;
  var oOpen = $("#" + iOpen);
  oOpen.click(function(){
   _this.oPop.css({ display: "block" });
   
   _this.Start();
   
   //遮罩层初始化
   _this.FullScreen(_this.heightDocument, _this.widthDocument);
  });
 }
};
</script>
<script type="text/javascript">
$(document).ready(function(){
	 var e = new Pop({ oPop: "idPop_e", zIndex: 1001, mode: ["center", "center"], idOpen: "open_e", idClose: ["close_e", "close_e_1"], cover: true, beCover: false, zIndexCover: 1000, colorCover: "#646437", opactiyCover: 0.5 });
	});

</script>
  </head>
  
  <body>
  <a href="#" id="open_e"></a>
<div class="pop" id="idPop_e" style="background:#efefd9; border:#90ba75 solid 1px;padding-top:1px;overflow-y:auto; overflow-x:hidden;position:absolute;scrollbar-face-color:#90ba75;scrollbar-3dlight-color:#90ba75;">
<div  style="width:310px;height:30px; background-color:#b6b665; padding-right:15px; color:red;" id="popTitle">请您先登录系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0" id="loginbox">
   <tr>
    <td colspan="3" align="left" style="padding-left:10px;"><s:fielderror /><s:actionerror/></td>
  </tr>
  <tr>
    <td width="60" align="right" height="25">用户名：</td>
    <td colspan="2" align="left"><s:textfield name="username" cssClass="inputtext" maxlength="32" id="userName"/></td>
  </tr>
  <tr>
    <td align="right" height="25">密&nbsp;&nbsp;码：</td>
    <td colspan="2" align="left"><s:password name="password" cssClass="inputtext" maxlength="32" id="password"/></td>
  </tr>
  <tr>
    <td align="right" height="25">验证码：</td>
    <td width="92"  align="left"><s:textfield name="captcha"  cssClass="inputtext" cssStyle="width:84px;" maxlength="4" value="" id="captcha"/></td>
    <td width="92"  align="left"><img src="<s:url action="captcha"/>" style="width:50px; height:20px;" /> </td>
  </tr>
  <tr>
    <td align="right"></td>
    <td height="25" colspan="2" align="left" valign="bottom">

    <input type="button" onclick="login()" style="background:url(images/login/tj.gif) no-repeat; width:56px; height:20px;  border:none; " value=""/>
    <input type="button" id="close_e"      style="background:url(images/login/cancel.gif) no-repeat; width:56px; height:20px; border:none; margin-left:32px;" value=""/>
    </td>
  	
  </tr>
  

  
</table></div>
           
  </body>
</html>
