<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" src="js/alertnew.js" charset="gbk"></script> 
<link rel="icon" href="images/home/favicon.ico" TYPE="images/home/favicon.ico"/>
<link rel="shortcut icon" href="images/home/favicon.ico"> 
<title>120急救管理系统</title>
<s:include value="/jsp/fragment/head.jsp"/>
<link rel="stylesheet" type="text/css" href="css/styleai.css">
<script type="text/javascript" src="js/website.js"></script>
<style>
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #FFFFFF;
	background-image: url(images/ti1_14.png);
	background-repeat: repeat-y;
}
a.a2 {color:#000;}
</style> 
<script>

</script>

</head>

<body>
<table width="806" border="0" align="center" cellpadding="0" cellspacing="0" background="images/ti1_14.png">


  <tr>
    <td width="806" ><table width="100%" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
      </tr>
      <tr>
        <td width="78%" height="362" valign="top"><iframe id="iFrame3" name="iFrame3" height="880"  width="600" frameborder="0" src="forum!forumMain.action"></iframe></td>
        <td width="22%" valign="top"><table width="199" border="0" cellpadding="0" cellspacing="0">
          
           
         
            <tr>
              <td  align="center" background="images/ti1_22.png"><img src="images/ti1_17.png" width="206" height="50" /></td>
            </tr>
            <tr>
              <td height="27" style=" font-size:12px;padding-left:8px;" background="images/ti1_22.png"><table width="186" border="0" align="center" cellspacing="0">
                  
                  <s:iterator value="hoterTopicList.list">
                  	  <tr>
                      <td width="184"  height="27"><a href="forum!topicDetail.action?topicId=${id}"  class="a2" target="iFrame3">
                        <s:property value="name"/></a><span style=" color:#999999"> (<s:property value="replynum"/>)</span></td>
	                  </tr>
                  </s:iterator>
              </table></td>
            </tr>
            <tr><td align="right" background="images/ti1_22.png" style=" padding-right:8px;"> <a href="forum!topicList.action?flag=hot" style="color:green"  target="iFrame3">更多..</a></td>	</tr>
             <tr>
               <td height="10" ><img src="images/ti1_27.png" width="206" height="10" /></td>
             </tr>
             <tr>
               <td height="13" >&nbsp;</td>
             </tr>
             <tr>
              <td height="27" ><img src="images/xin_17.png" width="206" height="50" /></td>
            </tr>
            <tr>
              <td height="27" style=" font-size:12px;padding-left:8px;"background="images/ti1_22.png">
			  <table width="186" border="0" align="center" cellspacing="0">
                  <s:iterator value="topicList.list">
                  	  <tr>
                      <td width="184"  height="27"><a href="forum!topicDetail.action?topicId=${id}"  class="a2" target="iFrame3">
                        <s:property value="name"/></a><span style=" color:#999999"> (<s:date name="createTime" format="yyyy-MM-dd HH:mm"/>)</span></td>
	                  </tr>
                  </s:iterator>
              </table>			  </td>
            </tr>
            <tr><td align="right" background="images/ti1_22.png"style=" padding-right:8px;"> <a href="forum!topicList.action?flag=new" style="color:green"  target="iFrame3">更多..</a></td>	</tr>
            <tr>
              <td align="center" background="images/leftbg_14.jpg"><img src="images/ti1_27.png" width="206" height="10" /></td>
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


