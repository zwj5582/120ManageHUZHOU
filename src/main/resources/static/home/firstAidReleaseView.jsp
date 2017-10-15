<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/utils/tags.jsp" %>
<html >
<head>
<title>120急救管理系统</title>
<s:include value="/jsp/fragment/head.jsp"/>

<script type="text/javascript">
function   init() {  //替换空格为换行
        var content =  document.getElementById('h_content').value;
        content = content.replace(/ /g,'&nbsp;'); 
        content = content.replace(/\r/g,'<br>'); 
	    document.getElementById('_content').innerHTML = content;  
}

</script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #ffffff;
}
.a1:link{
	color:#003399;
	text-decoration: none;
}
.a1:visited{color:#FF0000}
.a1:hover{
	color:#CC0000;
	text-decoration: underline;
}
.imgh{border:2px solid #ddd;

background: #fff; }

-->
</style>
<link rel="stylesheet" type="text/css" href="home/css/ven.css">
<script language="JavaScript" src="home/js/swfobject.js" type="text/javascript"></script>
</head>
<body onLoad="init()" bgcolor="#FFFFFF">
<table width="805" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr > <td height="8"></td></tr>
  <tr>
    <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
	
      <tr>
        <td width="80%" valign="top"><table width="805" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="805" background="home/images/picnews_24.png" height="31"><table width="97%" border="0" cellspacing="0">
                <tr>
                  <td width="6%">&nbsp;</td>
                  <td width="67%">当前位置： <a href="home/index.html"  target="_parent">首页</a> <s:if test="%{publishDirectory.publishDirectory.publishDirectory!=106}"> </s:if> 》  <a href="#">${publishDirectory.name}</a></td>
                  <td width="27%">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="649" align="center" valign="top">
   
			<s:hidden name="publishDirectory.id" />
            <table width="96%" border="0" cellspacing="0" cellpadding="0">
            
              <tr>
                <td ><table width="100%" border="0" cellpadding="0" cellspacing="0">
                   
                    
                    
                </table></td>
              </tr>
              
              <tr>
                <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="2%" align="left" background="home/images/picdw_53.png"><img src="home/images/picdw_53.png" width="15" height="14" alt="" /></td>
                      <td width="96%" background="home/images/picdw_54.png"></td>
                      <td width="2%" align="right"><img src="home/images/picdw_55.png" width="19" height="14" alt="" /></td>
                    </tr>
                </table></td>
              </tr>
              <s:if test="%{model != null}">
              
             <tr>
             	
              	<td width="731" align="center" height="55px;" style="font-size:19px;font-weight:bold;letter-spacing:2px;word-break:break-all;">
              	<s:property value="name"/>
              	</td>
              </tr>
              <tr><td align="right" height="36" style=" font-size:12px;width:750px;word-wrap:break-word">日期：
              <s:date name="createTime" format="yyyy-MM-dd"/></td></tr>
                          
              <tr ><td align="center">
              <s:if test="%{content!= null && type =='image'}">
               <s:iterator begin="0" end="size-1" status="vs" > 
					<img src="publish!showImage.action?id=${id}&index=<s:property value='#vs.index'/> " alt="${name}" width="400"     class="imgh"/><br/>
				</s:iterator>
              </s:if>
				</td>
				</tr>
				<tr>
              	<td  style="font-size:12px; line-height:35px; padding-left:12px;">
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="hidden" id="h_content" value="<s:property  value="contentText" />"/>
          <span id="_content" style="width:745px;word-wrap:break-word"></span>
   
          </td>
              </tr>
				
				</s:if>
				<s:else>
				<tr ><td width="731" align="center" height="55px;" style="font-size:19px;font-weight:bold;letter-spacing:2px;word-break:break-all;">
              	<s:text name="没有内容"></s:text>
              	</td>
				</tr>
				
				</s:else>
            </table>

              </td>
          </tr>
          <tr>
            <td height="19">&nbsp;</td>
          </tr>
        </table></td>
      
      </tr>
    </table></td>
  </tr>
</table>

<map name="Map4">
<area shape="rect" coords="291,11,340,32" href="#">
</map>
</body>
</html>
