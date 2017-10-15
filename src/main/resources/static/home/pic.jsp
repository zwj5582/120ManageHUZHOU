<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/utils/tags.jsp" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<style type="text/css">
*{margin:0; padding:0;}
#pic{position:relative; margin:0px 0 0 0px;}
#pic a{display:block; padding:2px; width:230px; height:197px;background:#fff;}
#pic a img{width:230px; height:175px; border:1px solid #ccc;}
#pic a.none{display:none;}
#pic a.block{display:block;}
#pic ul{
	position:absolute;
	left:115px;
	top:157px;
	z-index:2;
}
#pic ul li {display:inline; font-size:14px; float:left; margin:1px 3px; padding:0px 4px; background:#fff; text-decoration:none; color:#39C;cursor:pointer;border:1px #39C solid;}
#pic ul li.focus{background:#39C; color:#fff;border:1px #39C solid; font-size:14px;}
#pic p{
	position:absolute;
	left:1px;
	top:182px;
	z-index:3;
	width:232px;
	background:#ffffff;
	text-align:center;
	height: 12px;
	font-size:12px;
}
#pic input,#pic select{margin-top:10px;}
</style>
<script language="javascript">
//[!CDATA[
 //页面加载完成时执行多个函数
 function addLoadEvent(func){
  var oldLoad=window.onload;
  if(typeof oldLoad!="function"){
   window.onload=func; 
  }
  else{
   window.onload=function(){
    oldLoad();
    func();
   } 
  }
 }
 function $(obj,element){ return document.getElementById(obj).getElementsByTagName(element);}
 //根据传递的参数显示不同的图片
 function displayWhich(data){
  for(var i=0;i<pic.length;i++){//遍历所有的图片
   if(i==data){
    pic[i].className="block";
    btn[i].className="focus";
    p[0].childNodes[0].nodeValue=btn[i].title;//因为只有一个段落P
   }
   else{
    pic[i].className="none";
    btn[i].className="";
   }
  }
 }
 function init(){
  btn=$("pic","li");
  pic=$("pic","a");
  p=$("pic","p");
  for(var i=0;i<btn.length;i++){//遍历所有的图片添加事件
   pic[i].onmousemove=function(){ clearTimeout(timer);}
   pic[i].onmouseout=function(){ timer=window.setTimeout("auto()",4000);}
   btn[i].suf=i;//给按钮(li)增加一个属性
   //遍历所有的按钮(li)添加事件
   btn[i].onclick=function(){n=this.suf;auto();clearTimeout(timer);tmpclass=this.className="focus";}
   btn[i].onmouseover=function(){ clearTimeout(timer);tmpclass=this.className;this.className="focus";}
   btn[i].onmouseout=function(){ timer=window.setTimeout("auto()",4000);this.className=tmpclass;}
  }
  auto()
 }
 function auto(){
  displayWhich(n);
  n++;
  n=(n>pic.length-1)?0:n;//如果大于最大数组下标，重新开始循环
  timer=window.setTimeout("auto()",4000); 
 }
 //全局变量
 var n=0;
 var btn, pic, p;
 addLoadEvent(init);
//]]
</script>   

</head>
<body>
<div id="pic">
<s:iterator value="contentList" status="vs">
<s:if test="%{#vs.count < 6 && content!= null }">
<s:set name="fimgpath" value="content.split('\\\\|')[0]"> </s:set>
<a href="publish!generalInfoView.action?id=<s:property value='id'/>" target="iFrame1">
<%-- <img class="block" src="publish!showImage.action?id=<s:property value='id'/>&index=0" />--%>
 <img class="block" src="${fimgpath }" />
 </a>
</s:if>
</s:iterator>
    <ul>
    <s:iterator value="contentList" status="vs">
    	<s:if test="%{#vs.count<6 && content!= null }">
      		<li title="<s:property value='name'/>">${vs.count}</li>
       </s:if>
      </s:iterator>
    </ul>
    <p>title</p>
</div>
</body>
</html>

