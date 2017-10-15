<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/utils/tags.jsp" %>
<%@ include file="/jsp/fragment/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>120急救管理系统</title>
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
<link rel="stylesheet" type="text/css" href="<%=basePath%>home/css/ven.css">
<script language="JavaScript" src="<%=basePath%>home/js/swfobject.js" type="text/javascript"></script>
 <script language="JavaScript" type="text/javascript">
			                 function huiyi()
			                    {  
				                   	document.getElementById("huiyi").style.display="block";
				                    document.getElementById("caigou").style.display="none";		                    
				                    document.getElementById('tdhuiyi').style.background='url(<%=basePath%>home/images/picp1_23.png)';
				                    document.getElementById('tdcaigou').style.background='url(<%=basePath%>home/images/picp1_22.png)';   
				                    document.getElementById('tdhuiyi').className='';
				                    document.getElementById('tdcaigou').className='font12w';	
			                    }
								function caigou()
			                    {   
				                    document.getElementById("huiyi").style.display="none";
				                    document.getElementById("caigou").style.display="block";
				                    document.getElementById('tdhuiyi').style.background='url(<%=basePath%>home/images/picp_23.png)';
				                    document.getElementById('tdcaigou').style.background='url(<%=basePath%>home/images/picp_22.png)';
				                    document.getElementById('tdhuiyi').className='font12w';
				                    document.getElementById('tdcaigou').className='';		
			                    }
                                  </script>
</head>

<body>
<table width="805" border="0" align="center" cellpadding="0" cellspacing="0">
<tr > <td height="8"></td></tr>
  <tr>
    <td width="805" background="<%=basePath%>home/images/picnews_24.png" height="31"><table width="97%" border="0" cellspacing="0">
      <tr>
        <td width="6%">&nbsp;</td>
        <td width="61%">当前位置： <a href="index.html"  target="_parent">首页</a> 》 <a href="#">工团之窗</a> 》 </td>
        <td width="33%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" ><table width="96%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%" background="home/images/picdw_51.png"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="13" align="left" background="home/images/picdw_37.png"><img src="home/images/picdw_36.png" width="13" height="37" alt="" /></td>
              <td width="103" align="left" background="home/images/picdw_37.png" class="dw">工团之窗</td>
              <td width="14"background="home/images/picdw_39.png"><img src="home/images/picdw_38.png" width="14" height="37" alt="" /></td>
              <td width="543" background="home/images/picdw_39.png">&nbsp;</td>
              <td width="100" align="right" background="home/images/picdw_39.png"><img src="home/images/picdwd_40.png" alt="" width="49" height="37" border="0" /></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td ><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="2%" align="left" background="home/images/picdw1_51.png"><img src="home/images/picdw1_51.png" width="15" height="5" alt="" /></td>
              <td width="96%"><table width="98%" border="0" align="center" cellspacing="0">
                <tr>
                  <td width="88%" height="25" align="left"><img src="images/picgong.jpg" width="6" height="7" alt="" /><span  title="职代会 "> <a href="publish!publicListPaged.action?publishDirectory.id=115" target="iFrame1"  >职代会 </a></span> </td>
                </tr>
                <tr>
                  <td width="88%" height="25" align="left"><img src="images/picgong.jpg" width="6" height="7" alt="" /><span  title="职工活动 "> <a href="publish!publicListPaged.action?publishDirectory.id=116" target="iFrame1"   >职工活动 </a></span> </td>
                </tr>
                <tr>
                  <td width="88%" height="25" align="left"><img src="images/picgong.jpg" width="6" height="7" alt="" /><span  title="职工帮困慰问"> <a href="publish!publicListPaged.action?publishDirectory.id=117" target="iFrame1"   >职工帮困慰问</a></span> </td>
                </tr>
                <tr>
                  <td width="88%" height="25" align="left"><img src="images/picgong.jpg" width="6" height="7" alt="" /><span  title="职工思想动态"> <a href="publish!publicListPaged.action?publishDirectory.id=118" target="iFrame1"   >职工思想动态</a></span> </td>
                </tr>
                <tr>
                  <td width="88%" height="25" align="left"><img src="images/picgong.jpg" width="6" height="7" alt="" /><span  title="职工关心热点"> <a href="publish!publicListPaged.action?publishDirectory.id=119" target="iFrame1"   >职工关心热点</a></span> </td>
                </tr>
                <tr>
                  <td width="88%" height="25" align="left"><img src="images/picgong.jpg" width="6" height="7" alt="" /><span  title="团青年活动"> <a href="publish!publicListPaged.action?publishDirectory.id=120" target="iFrame1"   >团青年活动</a></span> </td>
                </tr>
                <tr>
                  <td width="88%" height="25" align="left"><img src="images/picgong.jpg" width="6" height="7" alt="" /><span  title="志愿者风采"> <a href="publish!publicListPaged.action?publishDirectory.id=121" target="iFrame1"   >志愿者风采</a></span> </td>
                </tr>
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
    <br /></td>
  </tr>
    </table></td>
  </tr>
  <tr>
    <td height="19">&nbsp;</td>
  </tr>
</table>
<map name="Map4">
  <area shape="rect" coords="291,11,340,32" href="#">
</map>
</body>
</html>
