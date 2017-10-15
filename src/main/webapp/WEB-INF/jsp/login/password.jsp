<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/utils/tags.jsp"%>
<%@ include file="/jsp/fragment/head.jsp"%>
<html>
<head>
	<title>管理系统</title>
	<script src="js/website.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		function doChange(){
			var oldPassword = document.password.oldPassword.value;
			var newPassword=document.password.newPassword.value;
			var newPassword1=document.password.newPassword1.value;
			if(oldPassword==""){
				alert("请输入旧密码！");
				return false;
			}
			else if(newPassword==""){
				alert("请输入新密码！");
				return false;
			}
			else if(newPassword1==""){
				alert("请确认新密码！");
				return false;
			}
			if(newPassword!=newPassword1) {
				alert("两次输入密码不一致！");
				return false;
			}
			return true;
		}
		
	</script>
</head>

<body>
<div id="current_position" style="background: ">
	<img src="images/home.png" />&nbsp;&nbsp;当前位置：&nbsp;<span>个人信息</span>
</div>
<s:form onsubmit="return doChange();">
	<div id="search_box" align="center">
		<div style="height:15" aign="left">
			<s:fielderror/>
			<s:actionerror/>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="1" id="tbbox" align="center">
			<tr>
				<td width="100" align="right">旧密码：</td>
				<td width="300">
					<div class="rim">
						<s:password name="oldPassword" cssClass="form-control ipttext" cssStyle="width:200"/>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="right" width="100">新密码：</td>
				<td width="300">
					<div class="rim">
						<s:password name="newPassword" cssClass="form-control ipttext" cssStyle="width:200"/>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="right" width="100">确认新密码：</td>
				<td width="300">
					<div class="rim">
						<input name="newPassword1" type="password" class="form-control ipttext" style="width:200"/>
					</div>
				</td>
				<td></td>
			</tr>
	
			<s:if test="hasEmployee">			
			<tr>
				<td align="right" width="100">个人昵称：</td>
				<td width="300">
					<div class="rim">
						<input name="nickname" value="${nickname }" type="text" class="form-control ipttext" style="width:200"/>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="right" width="100">出生日期：</td>
				<td width="300">
                    <s:textfield id="" name="borndate" onclick="WdatePicker({isShowClear:false,readOnly:true})" readonly="true" cssClass="form-control ipttext" cssStyle="width:200">
                        <s:param name="value">
                            <s:date name="borndate"  format="yyyy-MM-dd"/>
                        </s:param>
                    </s:textfield>
                </td>
				<td></td>
			</tr>
			</s:if>
			
		</table>
		<table width="50%" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td width="50%" align="center">
					<button type="submit" class="btn btn-default btn-sm">提交</button>
					<button type="reset" class="btn btn-default btn-sm">重填</button>
				</td>
			</tr>
		</table>
	</div>
</s:form>
</body>
</html>