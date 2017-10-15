<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../utils/tags.jsp"%>
<%@ include file="../fragment/head.jsp"%>
<head>
<script type="text/javascript" src="js/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script src="js/vanadium.js" type="text/javascript"></script>
<script type="text/javascript" src="js/check.js" charset="gbk"></script>
<link href="css/checke.css" rel="stylesheet" media="screen" type="text/css" />
<script type="text/javascript">
	$(function() {
		var department = $("#department").find("option:selected").text();
		if (department !="急救科" && department !="运保科") {
			$("#branch").attr("disabled", true);
		} else {
			$("#branch").attr("disabled", false);
		}
		
		$("#department").change(function(){
			var department = $("#department").find(
					"option:selected").text();
			if (department !="急救科" && department !="运保科") {
				$("#branch").attr("disabled", true);
			} else {
				$("#branch").attr("disabled", false);
			}
		});
		
		$("#jobnumber").blur(function() {
			var jobnumber = $("#jobnumber").val();
			if (jobnumber !="") {
				$.ajax({
					type :"post",
					url :"employee!isOtherJobnumber.action",
					data :"employee.jobnumber="
							+ jobnumber
							+"&employee.account.username=${employee.account.username}",
					dataType :"text",
					success : callback
				});
			}
			function callback(data) {
				if (data =="1") {
					alert("此工号已被别人占用！");
					$("#jobnumber").attr("value","");
					return false
				}
			}
		});

		$("#timecard").blur(function() {
			var timecard = $("#timecard").val();
			if (timecard !="") {
				$.ajax({
					type :"post",
					url :"employee!isOtherTimecard.action",
					data :"employee.timecard="
							+ timecard
							+"&employee.account.username=${employee.account.username}",
					dataType :"text",
					success : callback
				});
			}
			
			function callback(data) {
				if (data =="1") {
					alert("此考勤号已被别人占用！");
					$("#timecard").attr("value","");
					return false
				}
			}
		});
	});

	var flag = 0; //标记 第一次点击切换在编，非编 时候触发赋值输出口 0.0
	function show(obj) {
		if (obj.value == '1') {
			document.getElementById('ck').style.display ="block";
			document.getElementById('cl').style.display ="none";
			if (flag == 0) {
				for (i = 1; i <= 23; i++) {
					$("#ck_salary" + i).val('0.0');
				}
			}
		} else {
			document.getElementById('ck').style.display ="none";
			document.getElementById('cl').style.display ="block";
			if (flag == 0) {
				for (i = 1; i <= 6; i++) {
					$("#cl_salary" + i).val('0.0');
				}
			}
		}
		flag++;
	}
		
	$(function(){
		$("#jobPosition option").each(function() { 
			if ($(this).val() == '${employee.jobPosition}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#positionType option").each(function() { 
			if ($(this).val() == '${employee.CPositionType.id}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#jobTitle option").each(function() { 
			if ($(this).val() == '${employee.jobTitle}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#jobType option").each(function() { 
			if ($(this).val() == '${employee.CJobType.id}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#appointPost option").each(function() { 
			if ($(this).val() == '${employee.appointPost.id}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#politicalAffiliation option").each(function() { 
			if ($(this).val() == '${employee.politicalAffiliation}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#education option").each(function() { 
			if ($(this).val() == '${employee.education}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#degree option").each(function() { 
			if ($(this).val() == '${employee.degree}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#joinWay option").each(function() { 
			if ($(this).val() == '${employee.joinWay}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#department option").each(function() { 
			if ($(this).val() == '${employee.departmentByDepartmentId.id}') { 
				$(this).attr("selected","selected"); 
			} 
		}); 
			
		$("#branch option").each(function() { 
			if ($(this).val() == '${employee.departmentByBranchId.id}') { 
				$(this).attr("selected","selected"); 
			} 
	    }); 
	});
		
	$(function(){
		$('.form_datetime').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			keyboardNavigation : 1
		});
	});
	</script>
</head>

<body  style="overflow: visible;">
	<div id="current_position" style="background:">
		<img src="images/home.png" />&nbsp;&nbsp;当前位置：&nbsp;综合管理&nbsp;>&nbsp;急救资源管理&nbsp;>&nbsp;系统管理&nbsp;>&nbsp;用户管理&nbsp;>&nbsp;<span>修改用户信息</span>
	</div>
	<form id="form" action="employee/update" method="post" class="form-inline">
		<div id="search_box">
			<input type="hidden" value="${employee.id}" name="id" />
			<table border="0" cellspacing="1" cellpadding="0" id="tablebox">
				<tr>
					<td width="150" align="right">姓名：</td>
					<td width="400">
						<div class="rim">
							<input id="realname" name="name" type="text" value="${employee.name}" class="form-control :max_length;15 :required" style="width:180" />
						</div>
					</td>

					<td width="150" align="right">姓名首字母：</td>
					<td width="400">
						<div class="rim">
							<input id="firstnamechar" name="pinyinShort" type="text" value="${employee.pinyinShort}" class="form-control " style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">帐号：</td>
					<td width="400">
						<div class="rim">
							<input id="username" name="account.username" type="text" value="${employee.account.username}" class="form-control " readonly="true" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">工号：</td>
					<td width="400">
						<div class="rim">
							<input id="jobnumber" name="jobnumber" value="${employee.jobnumber}" type="text" class="form-control :max_length;5 :number :required" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">考勤卡号：</td>
					<td width="400">
						<div class="rim">
							<input id="timecard" name="timecard" value="${employee.timecard}" type="text" class="form-control :max_length;25 :number" style="width:180" />
						</div>
					</td>

					<td width="150" align="right">性别：</td>
					<td width="250" align="left">
						<c:choose>
							<c:when test="${employee.sex=='男'}">
								<label><input type="radio" name="sex" value="男" checked="checked" />男 <input type="radio" name="sex" value="女" />女</label>
							</c:when>
							<c:when test="${employee.sex=='女'}">
								<label><input type="radio" name="sex" value="男" />男 <input type="radio" name="sex" value="女" checked="checked" />女</label>
							</c:when>
						</c:choose>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">职务：</td>
					<td width="400">
						<div class="rim">
							<select
									id="jobPosition"
									name="jobPosition"
									class="form-control"
									style="width:180"
									v="${employee.jobPosition}"
									headKey=""
									headValue="--请选择--"
									map="主任:主任,党支部书记:党支部书记,副书记:副书记,副主任:副主任,工会主席:工会主席,班子助理:班子助理,科长:科长,科员:科员,分站长:分站长,办公室主任:办公室主任,负责人:负责人,无:无"
							></select>
						</div>
					</td>
					<td width="150" align="right">岗位：</td>
					<td width="400">
						<div class="rim">

							<select
									name="CPositionType.id"
									class="form-control"
									style="width:180"
									v="${employee.CPositionType.id}"
									headKey=""
									headValue="--请选择--"
									jsonList="${positionTypeList}"
									listKey="id"
									listVal="displayName"
							></select>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">职称：</td>
					<td width="400">
						<div class="rim">

							<select
									name="jobTitle"
									class="form-control"
									style="width:180"
									v="${employee.jobTitle}"
									headKey=""
									headValue="--请选择--"
									map="副主任医师:副主任医师,主治医师:主治医师,医师:医师,医士:医士,未定级:未定级,高级工:高级工,中级工:中级工,初级工:初级工,普通工:普通工,无:无"
							></select>

						</div>
					</td>
					<td width="150" align="right">出生日期：</td>
					<td width="400">
						<div class="rim">
							<input id="borndate" name="borndate" type="text" value="<fmt:formatDate value="${employee.borndate}" pattern="yyyy-MM-dd"/>"
								   onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="width:180" />

						</div>
					</td>
					<td></td>
				</tr>

				<tr>
					<td width="150" align="right">职位：</td>
					<td width="400">
						<div class="rim">

							<select
									name="CJobType.id"
									class="form-control"
									style="width:180"
									v="${employee.CJobType.id}"
									headKey=""
									headValue="--请选择--"
									jsonList="${jobTypeList}"
									listKey="id"
									listVal="displayName"
							></select>

						</div>
					</td>
					<td width="150" align="right">聘任岗位：</td>
					<td width="400">
						<div class="rim">

							<select
									name="appointPost.id"
									class="form-control"
									style="width:180"
									v="${employee.appointPost.id}"
									headKey=""
									headValue="--请选择--"
									jsonList="${appointPostList}"
									listKey="id"
									listVal="name"
							></select>

						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">是否在编：</td>
					<td width="250" align="left">
						<c:choose>
							<c:when test="${employee.isRegular=='1'}">
								<label><input type="radio" name="isRegular" value="1" checked="checked" onclick="show(this)" />在编 <input type="radio" name="isRegular" value="0" onclick="show(this)" />非编</label>
							</c:when>
							<c:when test="${employee.isRegular=='0'}">
								<label><input type="radio" name="isRegular" value="1" onclick="show(this)" />在编 <input type="radio" name="isRegular" value="0" checked="checked" onclick="show(this)" />非编</label>
							</c:when>
						</c:choose>
					</td>
					<td width="150" align="right">身份证号：</td>
					<td width="400">
						<div class="rim">
							<input id="idcard" name="idcard" type="text" value="${employee.idcard}" class="form-control :namecard" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">籍贯：</td>
					<td width="400">
						<div class="rim">
							<input id="nativePlace" name="nativePlace" value="${employee.nativePlace}" type="text" class="form-control :max_length;25" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">民族：</td>
					<td width="400">
						<div class="rim">
							<input id="nationality" name="nationality" type="text" value="${employee.nationality}" class="form-control :max_length;15" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">政治面貌：</td>
					<td width="400">
						<div class="rim">

							<select
									id="politicalAffiliation"
									name="politicalAffiliation"
									style="width:180"
									v="${employee.politicalAffiliation}"
									headKey=""
									headValue="--请选择--"
									map="中共党员:中共党员,中共预备党员:中共预备党员,共青团员:共青团员,群众:群众,其他:其他"
							></select>

						</div>
					</td>
					<td width="150" align="right">参加工作时间：</td>
					<td width="400">
						<div class="rim">
							<input id="jobBegin" name="jobBegin" type="text" value="<fmt:formatDate value='${employee.jobBegin}' pattern='yyyy-MM-dd'/>"
								   onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">入党(团)时间：</td>
					<td width="400">
						<div class="rim">
							<input id="joinParty" name="joinParty" type="text" value="<fmt:formatDate value='${employee.joinParty}' pattern='yyyy-MM-dd'/>"
								   onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="width:180" />
						</div>
					</td>

					<td width="150" align="right">最高学历：</td>
					<td width="400">
						<div class="rim">

							<select
									id="education"
									name="education"
									style="width:180"
									v="${employee.education}"
									headKey=""
									headValue="--请选择--"
									map="初中及以下:初中及以下,中专（职校）:中专（职校）,高中:高中,中专:中专,大专:大专,本科:本科,硕士:硕士,博士:博士"
							></select>

						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">学位：</td>
					<td width="400">
						<div class="rim">

							<select
									id="degree"
									name="degree"
									style="width:180"
									v="${employee.degree}"
									headKey=""
									headValue="--请选择--"
									map="学士:学士,硕士:硕士,博士:博士,无:无"
							></select>

						</div>
					</td>
					<td width="150" align="right">专业：</td>
					<td width="400">
						<div class="rim">
							<input id="major" name="major" type="text" value="${employee.major}" class="form-control :max_length;15" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">毕业时间：</td>
					<td width="400">
						<div class="rim">
							<input id="graduation" name="graduation" type="text" value="<fmt:formatDate value='${employee.graduation}' pattern='yyyy-MM-dd'/>"
								   onclick="WdatePicker();"
								   readonly="readonly" class="form-control :date_au" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">毕业院校：</td>
					<td width="400">
						<div class="rim">
							<input id="school" name="school" type="text" value="${employee.school}" class="form-control :max_length;35" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">进入本单位时间：</td>
					<td width="400">
						<div class="rim">
							<input id="joinDate" name="joinDate" type="text" value="<fmt:formatDate value='${employee.joinDate}' pattern='yyyy-MM-dd'/>"
								   onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">进入本单位方式：</td>
					<td width="400">
						<div class="rim">

							<select
									id="joinWay"
									name="joinWay"
									style="width:180"
									v="${employee.joinWay}"
									headKey=""
									headValue="--请选择--"
									map="调入:调入,社会招聘:社会招聘,其他:其他"
							></select>

						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">是否参照公务员：</td>
					<td width="250" align="left">
						<c:choose>
							<c:when test="${employee.isRefer=='1'}">
								<label><input type="radio" name="isRefer" value="1" checked="checked" />是 <input type="radio" name="isRefer" value="0" />否</label>
							</c:when>
							<c:when test="${employee.isRefer=='0'}">
								<label><input type="radio" name="isRefer" value="1" />是 <input type="radio" name="isRefer" value="0" checked="checked" />否</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" name="isRefer" value="1" />是 <input type="radio" name="isRefer" value="0" />否</label>
							</c:otherwise>
						</c:choose>
					</td>
					<td width="150" align="right">岗位等级：</td>
					<td width="400">
						<div class="rim">
							<input id="postGrade" name="postGrade" type="text" value="${employee.postGrade}" class="form-control :max_length;10" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">任职时间：</td>
					<td width="400">
						<div class="rim">
							<input id="presentJob" name="presentJob" type="text" value="<fmt:formatDate value='${employee.presentJob}' pattern='yyyy-MM-dd'/>"
								   onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">入编文号：</td>
					<td width="400">
						<div class="rim">
							<input id="includeNumber" name="includeNumber" type="text" value="${employee.includeNumber}" class="form-control :max_length;15" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">入编时间：</td>
					<td width="400">
						<div class="rim">
							<input id="includeDate" name="includeDate" type="text" value="<fmt:formatDate value='${employee.includeDate}' pattern='yyyy-MM-dd'/>"
								   onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">编制经费：</td>
					<td width="400">
						<div class="rim">
							<input id="includeFund" name="includeFund" type="text" value="${employee.includeFund}" class="form-control :max_length;15 :number" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">驾驶证号：</td>
					<td width="400">
						<div class="rim">
							<input id="drivingLicense" name="drivingLicense" type="text" value="${employee.drivingLicense}" class="form-control :max_length;15" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">准驾车型：</td>
					<td width="400">
						<div class="rim">
							<input id="licenseModel" name="licenseModel" type="text" value="${employee.licenseModel}" class="form-control :max_length;15" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">工作电话：</td>
					<td width="400">
						<div class="rim">
							<input id="workPhone" name="workPhone" type="text" value="${employee.workPhone}" class="form-control :checkphone" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">初次领证时间：</td>
					<td width="400">
						<div class="rim">
							<input id="licenseDate" name="licenseDate" type="text" value="<fmt:formatDate value='${employee.licenseDate}' pattern='yyyy-MM-dd'/>"
								   onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">家庭电话：</td>
					<td width="400">
						<div class="rim">
							<input id="homePhone" name="homePhone" value="${employee.homePhone}" type="text" class="form-control :checkphone" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">手机号码：</td>
					<td width="400">
						<div class="rim">
							<input id="mobile" name="mobile" value="${employee.mobile}" type="text" class="form-control :checkiphone" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">电子邮箱：</td>
					<td width="400">
						<div class="rim">
							<input id="email" name="email" value="${employee.email}" type="text" class="form-control :email" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">邮编：</td>
					<td width="400">
						<div class="rim">
							<input id="postcode" name="postcode" value="${employee.postcode}" type="text" class="form-control :checkpost" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">所属部门：</td>
					<td width="400">
						<div class="rim">

							<select
									id="department"
									name="departmentByDepartmentId.id"
									class="form-control :checksel"
									style="width:180"
									v="${employee.departmentByDepartmentId.id}"
									headKey=""
									headValue="--请选择--"
									jsonList="${sectionlist}"
									listKey="id"
									listVal="name"
							></select>

						</div>
					</td>
					<td width="150" align="right">工作分站：</td>
					<td width="400">
						<div class="rim">

							<select
									id="branch"
									name="departmentByBranchId.id"
									class="form-control"
									style="width:180"
									v="${employee.departmentByBranchId.id}"
									headKey=""
									headValue="--请选择--"
									jsonList="${branchlist}"
									listKey="id"
									listVal="name"
							></select>

						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">家庭地址：</td>
					<td colspan="4" align="left">
						<div class="rim">
							<input id="address" name="address" value="${employee.address}" type="text" class="form-control :max_length;65" style="width:720" />
						</div>
					</td>
				</tr>
				<tr>
					<td width="150" align="right">户籍地址：</td>
					<td colspan="4" align="left">
						<div class="rim">
							<input id="" name="permanentResidenceAddress" value="${employee.permanentResidenceAddress}" type="text" class="form-control :max_length;128" style="width:720" />
						</div>
					</td>
				</tr>
				<tr>
					<td width="150" align="right">紧急联系人姓名：</td>
					<td width="400">
						<div class="rim">
							<input id="" name="emergencyContactPerson" value="${employee.emergencyContactPerson}" type="text" class="form-control :max_length;32" style="width:180" />
						</div>
					</td>
					<td width="150" align="right">紧急联系人关系：</td>
					<td width="400">
						<div class="rim">
							<input id="" name="emergencyContactRelation" value="${employee.emergencyContactRelation}" type="text" class="form-control :max_length;32" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">紧急联系人电话：</td>
					<td width="400">
						<div class="rim">
							<input id="" name="emergencyContactPhone" value="${employee.emergencyContactPhone}" type="text" class="form-control :max_length;128" style="width:180" />
						</div>
					</td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td width="150" align="right">工资标准：</td>
					<td colspan="3" align="left">
						<table id="ck" style="display:${employee.isRegular=='1'?'block':'none'}" align="left">
							<tr>
								<td align="right" width="60">收入项：</td>
								<td align="center" width="60">岗位工资</td>
								<td align="center" width="60">薪级工资</td>
								<td align="center" width="60">保留工资</td>
								<td align="center" width="60">八类</td>
								<td align="center" width="80">2%医疗补贴</td>
								<td align="center" width="60">节编工资</td>
								<td align="center" width="60">职岗工资</td>
								<td align="center" width="60">生活津贴</td>
								<td align="center" width="60">卫生津贴</td>
							</tr>
							<tr>
								<td align="right" width="60">金额：</td>
								<td align="right" width="60"><input name="salary1" id="ck_salary1" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary2" id="ck_salary2" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary3" id="ck_salary3" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary4" id="ck_salary4" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary5" id="ck_salary5" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="80"><input name="salary6" id="ck_salary6" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary7" id="ck_salary7" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary8" id="ck_salary8" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary9" id="ck_salary9" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
							</tr>
							<tr>
								<td align="right" width="60" nowrap>收入项：</td>
								<td align="center" width="60" nowrap>郊贴</td>
								<td align="center" width="60" nowrap>房贴</td>
								<td align="center" width="60" nowrap>独生贴</td>
								<td align="center" width="60" nowrap>副贴</td>
								<td align="center" width="80" nowrap>车贴</td>
								<td align="center" width="60" nowrap>餐贴</td>
								<td align="center" width="60" nowrap>书报贴</td>
								<td align="center" width="60" nowrap>&nbsp;</td>
								<td align="center" width="60" nowrap>&nbsp;</td>
							</tr>
							<tr>
								<td align="right" width="60">金额：</td>
								<td align="center" width="60"><input name="salary10" id="ck_salary10" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary11" id="ck_salary11" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary12" id="ck_salary12" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary13" id="ck_salary13" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="80"><input name="salary14" id="ck_salary14" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary15" id="ck_salary15" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="salary16" id="ck_salary16" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><label style="width:100%">&nbsp;</label>
								</td>
								<td align="center" width="60"><label style="width:100%">&nbsp;</label>
								</td>
							</tr>
							<tr>
								<td align="right" width="60" nowrap>扣除项：</td>
								<td align="center" width="60" nowrap>公积金</td>
								<td align="center" width="60" nowrap>工会费</td>
								<td align="center" width="60" nowrap>养老金</td>
								<td align="center" width="60" nowrap>代办</td>
								<td align="center" width="60" nowrap>医疗保险</td>
								<td align="center" width="60" nowrap>失业保险</td>
								<td align="center" width="60" nowrap>代扣税</td>
								<td align="center" width="60" nowrap>&nbsp;</td>
								<td align="center" width="60" nowrap>&nbsp;</td>
							</tr>
							<tr>
								<td align="right" width="60">金额：</td>
								<td align="center" width="60"><input name="deduction1" id="ck_salary17" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="deduction2" id="ck_salary18" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="deduction3" id="ck_salary19" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="deduction4" id="ck_salary20" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="80"><input name="deduction5" id="ck_salary21" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="deduction6" id="ck_salary22" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><input name="deduction7" id="ck_salary23" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center" width="60"><label style="width:100%">&nbsp;</label>
								</td>
								<td align="center" width="60"><label style="width:100%">&nbsp;</label>
								</td>
							</tr>
						</table>

						<table id="cl" style="display:${employee.isRegular=='1'?'none':'block'}" align="left" class="tjyg">
							<tr>
								<td align="right" nowrap>收入项：</td>
								<td align="center" nowrap>基本工资</td>
								<td align="center" nowrap>其他</td>
								<td align="center" nowrap>&nbsp;</td>
								<td align="center" nowrap>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">金额：</td>
								<td align="center"><input name="salary1" id="cl_salary1" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center"><input name="salary3" id="cl_salary2" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center">&nbsp;</td>
								<td align="center">&nbsp;</td>
							</tr>
							<tr>
								<td align="right" nowrap>扣除项：</td>
								<td align="center" nowrap>养老</td>
								<td align="center" nowrap>医保</td>
								<td align="center" nowrap>失业</td>
								<td align="center" nowrap>公积金</td>
							</tr>
							<tr>
								<td height="30" align="right">金额：</td>
								<td align="center"><input name="deduction1" id="cl_salary3" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center"><input name="deduction2" id="cl_salary4" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center"><input name="deduction3" id="cl_salary5" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
								<td align="center"><input name="deduction4" id="cl_salary6" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="150" align="right">备注：</td>
					<td colspan="4" align="left">
						<div class="rim">
							<textarea id="comments" name="comments" class="form-control :min_length;0 :max_length;140" style="width:720">${employee.comments}</textarea>
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td width="100%" align="center">
						<button type="submit" class="btn btn-default btn-sm">提交</button>
						<button type="reset" class="btn btn-default btn-sm">重填</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>