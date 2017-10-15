<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="icon" href="images/home/favicon.ico" TYPE="images/home/favicon.ico"/>
    <link rel="shortcut icon" href="images/home/favicon.ico">
    <script type="text/javascript" src="js/website.js"></script>
<s:include value="/home/popWindow.jsp"/>
<title>120急救管理系统</title>



<link rel="stylesheet" type="text/css" href="css/styleai.css">

<style type="text/css">
<!--

.con{margin:0 auto; overflow:hidden; width:600px;}
ol{list-style-type:disc;}
.red{color:#f00;}
a.a1{color:#fff;}
a.a2{color:#000;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#wrap{white-space:normal; width:100%;line-height: 20px; word-break:break-all;}
-->
</style>


</head>

<body>
<table width="580" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td  ><img src="images/lun_15.png" width="599" height="14" /></td>
  </tr>
  <tr>
    <td width="100%" height="96" background="images/lun_17.jpg" >
    <s:form action="forum!publishComment">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="images/lun_17.png">
      
      <tr>
        <td  align="center" valign="top" background="images/lun_17.png">
			<table width="540" border="0" cellpadding="0" cellspacing="0" >
              <tr>
                <td width="540" height="21" ><s:textarea name="comment" id="comment" style="width:540px; height:66px; border:#FFFFFF 0px;overflow:auto;"  onKeyDown="checkMaxInput(this)" onKeyUp="checkMaxInput(this)" ></s:textarea></td>
              </tr>
            </table>     
        </td>
      </tr>
      <tr>
        <td background="images/lun_23.png" height="41"><table width="98%" border="0">
          <tr>
            <td width="88%" align="left" id="remLen" style="color:#000000; padding-left:25px;">还剩下140字</td>
            <td width="12%" align="right" style="padding-right:8px;"><a href="javascript:toPublish(document.getElementById('comment').value)"  onfocus="this.blur()" ><img src="images/weibo01.png" width="82" height="27" border="0" onmouseover="this.src='images/weibo02.png'" onmouseout="this.src='images/weibo01.png'" /></a></td>
          </tr>
          
        </table></td>
      </tr>
    </table>
    </s:form>
        
        <table width="100%" border="0" align="top" cellpadding="0" cellspacing="0">
         
          <tr>
            <td height="15" align="center"><img src="images/lun_27.png" width="599" height="15" border="0" /></td>
          </tr>
         <s:iterator value="forumCommentList.list">
         	<tr>
            <td  align="center"  background="images/lun_30.png"><table width="539" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;word-break:break-all;word-wrap:break-word;" > 
                <tr>
                	
                  <td height="48" align="left" valign="top" style="word-break:break-all;">
                  	<div id="wrap">	<span style="font-weight:bold; font-size:13px; color:#155d8d;">
               		<s:property value="account.username"/></span>：
                  		<s:if test="%{publishContent.name != null || publishContent.name != ''}"><a href="forum!topicDetail.action?topicId=${publishContent.id}" style="color:red" >#<s:property value="publishContent.name"/>#</a></s:if><s:property value="content"/></div>
                  			
           		  </td>
                </tr>
                <tr>
                  <td width="539" height="16" align="right" valign="bottom" style="color:#ababab"><s:date name="publishTime" format="yyyy-MM-dd HH:mm"/></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="13" align="center"  background="images/lun_30.png"><img src="images/weibo_12.jpg" width="544" height="6" border="0" /></td>
          </tr>
         
         
         </s:iterator>
        </table>
      </td>
  </tr>
  <tr>
    <td><img  src="images/lun_34.png" width="599" height="13"  /></td>
  </tr>
  <tr>
    <td  >&nbsp;</td>
  </tr>
</table>
</body>
</html>
<script>
	document.getElementById("comment").value='';
	maxLen = 140;	//定义用户可以输入的最多字数
	function checkMaxInput(obj) {
		if (obj.value.length > maxLen){	//如果输入的字数超过了限制
			obj.value = obj.value.substring(0, maxLen);	//就去掉多余的字
			document.getElementById("remLen").innerText = '您输入的内容超出了字数限制'
		}
		else{
			document.getElementById("remLen").innerText = '还剩下' + (maxLen - obj.value.length) + '字';//计算并显示剩余字数
		}
	}
	
	function toPublish(userName,comment){	
		
		if(comment==''){
			alert("内容不能为空，请输入内容，谢谢合作！");
		}else{
			if(userName==''){
				alert("请先登入");
			}
			else{
				//alert(comment);

				document.forms[0].submit();
			}
		}
		
	}
	
	function toPublish(comment){	
		if(comment==''){
			alert("内容不能为空，请输入内容，谢谢合作！");
		}else{
			var random=Math.random();
			$.ajax({
			  url: "forum!checkLogin.action?random="+random,			  
			  success: function(data){
				data=data.replace(/^\s+|\s+$/g,"");						 
				if(data=="false"){		
					document.getElementById("open_e").click();					
				}else{
					document.forms[0].submit();
				}		
			  }
			});			
		}
		
	}

	function urlencode(text)  
	{  
	    text =encodeURIComponent(encodeURIComponent(text));  
		av=text.split('%25');
		for(i=0;i<av.length;i++){
			text = text.replace('%25', '%');  
		}
	    return text;  
	}

	function login(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var captcha = $("#captcha").val();
		if(userName==''){
			alert("用户名不能为空");
			return;
		}else if(password==''){
			alert("密码不能为空");
			return;
		}else if(captcha==''){
			alert("验证码不能为空");
			return;
		}		
		var random=Math.random();
		$.ajax({
		  url: "forum!login.action?random="+random,
		  data: {username:urlencode(userName),password:password,captcha:captcha} ,
		  success: function(data){
			data=data.replace(/^\s+|\s+$/g,"");						 
			$("#popTitle").text(data);
			if(data=="登陆成功"){		
				document.getElementById("close_e").click();
				alert(data);
			}		
		  }
		});
	}
</script>

