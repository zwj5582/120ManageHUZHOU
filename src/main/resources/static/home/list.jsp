<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/utils/tags.jsp" %>
<html >
<head>
<title>120急救管理系统</title>
<s:include value="/jsp/fragment/head.jsp"/>

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
<body>
<table width="805" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff">
<tr > <td height="8"></td></tr>
  <tr>
    <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
	
      <tr>
        <td width="80%" valign="top"><table width="805" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="805" background="home/images/picnews_24.png" height="31"><table width="97%" border="0" cellspacing="0">
                <tr>
                  <td width="6%">&nbsp;</td>
                  <td width="67%">当前位置： <a href="home/index.html"  target="_parent">首页</a> <s:if test="%{publishDirectory.publishDirectory.publishDirectory.id!=106}"> </s:if> 》  <a id="_id"  href="dangwu_01.html?id=${publishDirectory.publishDirectory.publishDirectory.id}"  target="iFrame1"  target="_parent">${publishDirectory.publishDirectory.publishDirectory.name}</a> 》  <a href="#">${publishDirectory.name}</a></td>
                  <td width="27%">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="649" align="center" valign="top"><table width="96%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100%" background="home/images/picdw_51.png"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="2%" background="home/images/picdw_37.png"><img src="home/images/picdw_36.png" width="13" height="37" alt="" /></td>
                      <td width="36%" background="home/images/picdw_37.png" class="dw">${publishDirectory.name}</td>
                      <td width="5%"background="home/images/picdw_39.png"><img src="home/images/picdw_38.png" width="14" height="37" alt="" /></td>
                      <td width="44%" background="home/images/picdw_39.png">&nbsp;</td>
                      <td width="13%" align="right" background="home/images/picdw_39.png"><img src="home/images/picdwd_40.png" alt="" width="49" height="37" border="0" /></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td ><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="2%" align="left" background="home/images/picdw1_51.png"><img src="home/images/picdw1_51.png" width="15" height="5" alt="" /></td>
                      <td width="96%"><table width="98%" border="0" align="center" cellspacing="0">
                          <s:iterator value="contentList">
                          <tr>
                            <td width="90%" height="25" align="left"><img src="home/images/picgong.jpg" width="6" height="7" alt="" /><span  title="${name}"> <a href="publish!view.action?id=${id}"  >${name}</a></span> </td>
                            <td width="10%" align="left"><s:date name="createTime" format="yyyy-MM-dd"/></td>
                          </tr>
                          </s:iterator>
                      </table></td>
                      <td width="2%" align="left" background="home/images/picdw1_53.png"><img src="home/images/picdw1_53.png" width="19" height="5" alt="" /></td>
                    </tr>
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
              <tr>
                <td>&nbsp;</td>
              </tr>
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
<script>	
	var val = ${publishDirectory.publishDirectory.publishDirectory.id};
	
	var _href1="home/dangwu_01new.html";
        var _href2="home/zhengwu_01new.html";
		var _href3="home/wenming_01new.html";
	
	if(val==1){
		document.getElementById("_id").href = _href1;
	}else if(val==36){
		document.getElementById("_id").href = _href2;
    }else if(val==60){
		document.getElementById("_id").href = _href3;
    }else{}

	//document.getElementById("bId").innerHTML= _val;

</script>
<map name="Map4">
<area shape="rect" coords="291,11,340,32" href="#">
</map>
</body>
</html>
