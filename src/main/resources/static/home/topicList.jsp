<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
     <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styleai.css">
	<script type="text/javascript" src="js/alertnew.js" charset="gbk"></script> 
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;

}

</style>
<style type="text/css">
<!--
#demo ul{
text-align: left;
margin:0px;
padding:0px;
width:205px;
}
#demo ul li{
   margin-left:0px;
   display:block;
   list-style:none;
   font-size:13px;
   height:60px;
   width:205px;
   padding-top:5px;
   
}
#demo{
overflow:hidden;
width: 205px;
height: 270px;
margin: 0px;
float: left;
display: inline;
}

</style>
<script type="text/javascript">
function setPage(pageNumber) {
	if(!isNaN(pageNumber)){
		document.forms[0]["topicList.pageNumber"].value=pageNumber;
		document.forms[0].submit();
	}
	else{
		alert("请输入数字");
	}
}
</script>
  </head>
  
  <body>
  <s:form action="forum!topicList">
  <s:hidden name="topicList.pageNumber"></s:hidden>
  <s:hidden name="flag"></s:hidden>
    <table width="599" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/rhua.jpg" height="33" ><table width="98%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="5%">&nbsp;</td>
        <s:if test="%{flag=='hot'}"> <td width="62%"  valign="middle" style="font-size:13px; font-weight:bold; padding-top:4px; color:#222222">热门话题</td>
        </s:if>
        <s:else><td width="62%" height="13" valign="middle" style="font-size:13px; font-weight:bold;padding-top:4px; color:#222222">最新话题</td>
        </s:else>
        <td width="33%" align="right"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="599" height="96"   background="images/lun_30.png" ><br />
        <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px">
         
          
          <s:iterator value="topicList.list">
         	<tr>
            <td height="89"><table width="98%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  
                  <td width="14%" align="center">
                  <s:if test="%{content==null || content==''}">
	            		<img src="images/home/luntantubg.jpg" width="50" height="50" class="imgname" />	              </s:if>
	             <s:else>
	            		<img name="pict" src="../${content}" width="50" height="50" class="imgname" />	             </s:else>	             </td>
                  <td width="86%" height="59" align="left" valign="top" style=" line-height:20px;">
                  		<a href="forum!topicDetail.action?topicId=${id}" target="iFrame3" class="name"><s:property value="name"/></a>：
                  		<s:property value="contentText"/>               		</td>
                </tr>
                <tr> 
                	<td ></td>
                	<td height="20" align="right" ><span style=" color:#999999">发起时间：</span> <span style=" color:#333333"><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></span>&nbsp;&nbsp;                	</td>
                </tr>
                <tr> 
                	<td ></td>
                	<td height="20" align="right">
                	<span style=" color:#999999">点击次数：</span><s:property value="viewnum"/>&nbsp;&nbsp;
                	<span style=" color:#999999">评论次数：</span><s:property value="replynum"/></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="13" align="center"  ><img src="images/weibo_12.jpg" width="544" height="6" border="0" /></td>
            </tr>
         </s:iterator>
         

          <tr>
            <td  colspan="3" align="left">&nbsp;</td>
          </tr>
        </table>
         <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0"  style="font-size:12px">
	      <tr><td width="53%"><a id="open_e" ></a></td>
	      </tr>
                 <tr>
                    <td >&nbsp;&nbsp;&nbsp;共有 ${topicList.fullListSize} 条记录，当前第 ${topicList.pageNumber}/${topicList.totalPages} 页 </td>
                    <td width="47%"><table width="318" border="0" align="right" cellpadding="0" cellspacing="0"  style="font-size:12px">
                      <tr>
                        <td width="42"><img src="images/first.gif" width="37" height="15" onClick="setPage(1)"/></td>
                        <td width="47"><img src="images/back.gif" width="43" height="15" onClick="setPage(${topicList.pageNumber-1})"/></td>
                        <td width="50"><img src="images/next.gif" width="43" height="15" onClick="setPage(${topicList.pageNumber+1})"/></td>
                        <td width="40"><img src="images/last.gif" width="37" height="15" onClick="setPage(${topicList.totalPages})"/></td>
                        <td width="97">转到第
                        <input name="inputPageNumber" type="text" size="4" style="height:19px; width:35px; border:1px solid #999999;" />页</td>
                        <td width="42"><img src="images/go.gif" width="37" height="15" onClick="setPage(document.forms[0].inputPageNumber.value)"/></td>
                      </tr>
                   </table></td>
           </tr>
        </table>
      <br /></td>
  </tr>
  <tr>
    <td><img  src="images/lun_34.png" width="599" height="13" /></td>
  </tr>
</table>
</s:form>
  </body>
</html>
<script>
var obj=document.getElementsByName('pict');
for(var i=0;i<obj.length;i++){	
		obj[i].src=obj[i].src+"?random="+Math.random();	
}


</script>