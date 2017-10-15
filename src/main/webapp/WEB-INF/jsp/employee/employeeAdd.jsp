<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../utils/tags.jsp"%>
<%@ include file="../fragment/head.jsp"%>
<html>
<head>
	
    <script src="js/vanadium.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/check.js" charset="gbk"></script>
    <link href="css/checke.css" rel="stylesheet" media="screen" type="text/css" />
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#department").change(function() {
				var department = $("#department").find("option:selected").text();
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
						url :"employee/valid/validataJobnumber/"+jobnumber,
						dataType :"text",
						success : callback
					});
				}
				function callback(data) {
					if (data =="1") {
						alert("此工号已存在！");
						$("#jobnumber").attr("value","");
						return false
					}
				}
			});
			$("#username").blur(function() {
				var username = $("#username").val();
				if (username !="") {
					$.ajax({
						type :"post",
						url :"employee/valid/validataUsername/"+username,
						dataType :"text",
						success : callback
					});
				}
				function callback(data) {
					if (data =="1") {
						alert("此帐号已存在！");
						$("#username").attr("value","");
						return false
					}
				}
			});
	
			$("#timecard").blur(function() {
				var timecard = $("#timecard").val();
				if (timecard !="") {
					$.ajax({
						type :"post",
						url :"employee/valid/validataisTimecard/"+timecard,
						dataType :"text",
						success : callback
					});
				}
				function callback(data) {
					if (data =="1") {
						alert("此考勤号已存在！");
						$("#timecard").attr("value","");
						return false
					}
				}
			});
		});
		function show(obj) {
			if (obj.value == '1') {
				document.getElementById('ck').style.display ="block";
				document.getElementById('cl').style.display ="none";
			} else {
				document.getElementById('ck').style.display ="none";
				document.getElementById('cl').style.display ="block";
			}
		}
	
		function clear_name() {//清空
			if ('0' == this.value) {
				this.value = '';
			}
		}
	
		function reset_name() {// 重设
			if ('' == this.value) {
				this.value = '0';
			}
		}
		
		$(function(){
			var isRegular = $("#isRegular").val();
			if (isRegular == '1') {
				document.getElementById('ck').style.display ="block";
				document.getElementById('cl').style.display ="none";
			} else {
				document.getElementById('ck').style.display ="none";
				document.getElementById('cl').style.display ="block";
			}
		});
		
		$(function() {
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
<body style="overflow: visible;">
	<div id="current_position" style="background:">
		<img src="images/home.png" />&nbsp;&nbsp;当前位置：&nbsp;综合管理&nbsp;>&nbsp;急救资源管理&nbsp;>&nbsp;系统管理&nbsp;>&nbsp;用户管理&nbsp;>&nbsp;<span>添加用户</span>
	</div>

	<form class="form-inline" id="form" action="employee/add" method="post">
		<div id="search_box" align="center">
			<table border="0" cellspacing="1" cellpadding="0" id="tablebox">
				<tr>
					<td width="150" align="right">姓名：</td>
					<td width="400">
						<div class="rim">
							<input id="realname" name="name" type="text" class="form-control :max_length;15 :required" style="width:180" />
						</div>
					</td>

					<td width="150" align="right">姓名首字母：</td>
					<td width="400">
						<div class="rim">
							<input id="firstnamechar" name="pinyinShort" type="text" class="form-control" style="width:180" />
						</div>
					</td>
					<td></td>
				</tr>

				<tr>
					<td width="150" align="right">工号：</td>
					<td width="400">
						<div class="rim">
							<input id="jobnumber" name="jobnumber" type="text" class="form-control :max_length;5 :number :required" style="width:180" />
						</div>
					</td>

					<td width="150" align="right">性别：</td>
					<td width="250" align="left">
						<input type="radio" name="sex" value="男" checked="checked" />男 
						<input type="radio" name="sex" value="女" />女
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">帐号：</td>
					<td width="400">
						<div class="rim">
							<input id="username" name="username" type="text" class="form-control :sname :max_length;15 :required" style="width:180"/>
						</div>
					</td>
					<td width="150" align="right">密码：</td>
					<td width="400">
						<div class="rim">
							<input id="password" name="password" type="password" value="111111" class="form-control :max_length;15 :required" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">考勤卡号：</td>
					<td width="400">
						<div class="rim">
							<input id="timecard" name="timecard" type="text" class="form-control :max_length;25 :number" style="width:180"/>
						</div>
					</td>
					<td width="150" align="right">确认密码：</td>
					<td width="400">
						<div class="rim">
							<input id="confirmpwd" name="" value="111111" type="password" class="form-control :same_as;password :required" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">职务：</td>
					<td width="400">
						<div class="rim">

							<select id="jobPosition" name="jobPosition" class="form-control" style="width:180">
								<option value="">--请选择--</option>
								<c:forTokens items="主任:主任,党支部书记:党支部书记,副书记:副书记,副主任:副主任,工会主席:工会主席,班子助理:班子助理,科长:科长,科员:科员,分站长:分站长,办公室主任:办公室主任,负责人:负责人,无:无"
											 delims="," var="item">
									<c:forTokens items="${item}" delims=":" var="it" varStatus="s">
										<c:if test="${s.index==0}">
											<c:set value="${it}" var="key"/>
										</c:if>
										<c:if test="${s.index==1}">
											<c:set value="${it}" var="value"/>
										</c:if>
									</c:forTokens>
									<option value="${key}" <c:if test="${jobPosition == key}">selected</c:if> >${value}</option>
								</c:forTokens>
							</select>
                 		</div>
					</td>

					<td width="150" align="right">职称：</td>
					<td width="400">
						<div class="rim">

							<select name="jobTitle" class="form-control" style="width:180">
								<option value="">--请选择--</option>
								<c:forTokens items="副主任医师:副主任医师,主治医师:主治医师,医师:医师,医士:医士,未定级:未定级,高级工:高级工,中级工:中级工,初级工:初级工,普通工:普通工,无:无"
											 delims="," var="item">
									<c:forTokens items="${item}" delims=":" var="it" varStatus="s">
										<c:if test="${s.index==0}">
											<c:set value="${it}" var="key"/>
										</c:if>
										<c:if test="${s.index==1}">
											<c:set value="${it}" var="value"/>
										</c:if>
									</c:forTokens>
									<option value="${key}" <c:if test="${jobTitle == key}">selected</c:if> >${value}</option>
								</c:forTokens>
							</select>
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
									v="${CJobType.id}"
									jsonList="${jobTypeList}"
									listKey="id"
									listVal="displayName"
									headKey=""
									headValue="--请选择--"
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
									v="${appointPost.id}"
									jsonList="${appointPostList}"
									listKey="id"
									listVal="name"
									headKey=""
									headValue="--请选择--"
							></select>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">岗位：</td>
					<td width="400">
						<div class="rim">


							<select
									name="CPositionType.id"
									class="form-control"
									style="width:180"
									v="${CPositionType.id}"
									jsonList="${positionTypeList}"
									listKey="id"
									listVal="displayName"
									headKey=""
									headValue="--请选择--"
							></select>


						</div>
					</td>

					<td width="150" align="right">出生日期：</td>
					<td width="400">
						<div class="rim">
						 	<input id="borndate" name="borndate" type="text" onclick="WdatePicker();" readonly="readonly"  class="form-control :date_au" style="font-size:13px;width:180"/>
					    </div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">是否在编：</td>
					<td width="400">
						<div class="rim">
						<%--<input type="radio" name="isRegular" value="1" checked="checked" onclick="show(this);" />在编 
						<input type="radio" name="isRegular" value="0" onclick="show(this);"/>非编
						--%>
							<select id="isRegular" name="isRegular" class="form-control" style="width:180" onchange="javascript:show(this);">
								<option value="">--请选择--</option>
								<c:forTokens items="1:在编,0:非编"
											 delims="," var="item">
									<c:forTokens items="${item}" delims=":" var="it" varStatus="s">
										<c:if test="${s.index==0}">
											<c:set value="${it}" var="key"/>
										</c:if>
										<c:if test="${s.index==1}">
											<c:set value="${it}" var="value"/>
										</c:if>
									</c:forTokens>
									<option value="${key}" <c:if test="${isRegular == key}">selected</c:if> >${value}</option>
								</c:forTokens>
							</select>

						</div>
					</td>

					<td width="150" align="right">身份证号：</td>
					<td width="400">
						<div class="rim">
							<input id="idcard" name="idcard" type="text" class="form-control :namecard" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">籍贯：</td>
					<td width="400">
						<div class="rim">
							<input id="nativePlace" name="nativePlace" type="text" class="form-control :max_length;25"style="width:180" />
						</div>
					</td>
					<td width="150" align="right">民族：</td>
					<td width="400">
						<div class="rim">
							<input id="nationality" name="nationality" type="text" class="form-control :max_length;15" style="width:180"/>
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
									class="form-control"
									style="width:180"
									onchange="javascript:show(this);"
									v="${politicalAffiliation}"
									map="中共党员:中共党员,中共预备党员:中共预备党员,共青团员:共青团员,群众:群众,其他:其他"
									headKey=""
									headValue="--请选择--"
							></select>

						</div>
					</td>

					<td width="150" align="right">参加工作时间：</td>
					<td width="400">
						<div class="rim">
							<input id="jobBegin" name="jobBegin" type="text" onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="font-size:13px;width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">入党(团)时间：</td>
					<td width="400">
						<div class="rim">
							<input id="joinParty" name="joinParty" type="text" onclick="WdatePicker();" readonly="readonly"  class="form-control :date_au" style="font-size:13px;width:180"/>
						</div>
					</td>
					<td width="150" align="right">最高学历：</td>
					<td width="400">
						<div class="rim">

							<select
									id="education"
									name="education"
									class="form-control"
									style="width:180"
									v="${education}"
									map="初中及以下:初中及以下,中专（职校）:中专（职校）,高中:高中,中专:中专,大专:大专,本科:本科,硕士:硕士,博士:博士"
									headKey=""
									headValue="--请选择--"
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
									class="form-control"
									style="width:180"
									v="${degree}"
									map="学士:学士,硕士:硕士,博士:博士,无位:无"
									headKey=""
									headValue="--请选择--"
							></select>

				         </div>
					</td>
					<td width="150" align="right">专业：</td>
					<td width="400">
						<div class="rim">
							<input id="major" name="major" type="text" class="form-control :max_length;15" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">毕业时间：</td>
					<td width="400">
						<div class="rim">
							<input id="graduation" name="graduation" type="text" onclick="WdatePicker();" readonly="readonly"  class="form-control :date_au" style="font-size:13px;width:180"/>
						</div>
					</td>
					<td width="150" align="right">毕业院校：</td>
					<td width="400">
						<div class="rim">
							<input id="school" name="school" type="text" class="form-control :max_length;35" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">进入本单位时间：</td>
					<td width="400">
						<div class="rim">
							<input id="joinDate" name="joinDate" type="text" onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="font-size:13px;width:180"/>
						</div>
					</td>

					<td width="150" align="right">进入本单位方式：</td>
					<td width="400">
						<div class="rim">

							<select
									id="joinWay"
									name="joinWay"
									class="form-control"
									style="width:180"
									v="${joinWay}"
									map="调入:调入,社会招聘:社会招聘,其他:其他"
									headKey=""
									headValue="--请选择--"
							></select>

						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">是否参照公务员：</td>
					<td width="400">
						<input type="radio" name="isRefer" value="1" checked="checked" />是 
						<input type="radio" name="isRefer" value="0" />否
					</td>

					<td width="150" align="right">岗位等级：</td>
					<td width="400">
						<div class="rim">
							<input id="postGrade" name="postGrade" type="text" class="form-control :max_length;10" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">任职时间：</td>
					<td width="400">
						<div class="rim">
							<input id="presentJob" name="presentJob" type="text" onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="font-size:13px;width:180"/>
						</div>
					</td>
					<td width="150" align="right">入编文号：</td>
					<td width="400">
						<div class="rim">
							<input id="includeNumber" name="includeNumber" type="text" class="form-control :max_length;15" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">入编时间：</td>
					<td width="400">
						<div class="rim">
							<input id="includeDate" name="includeDate" type="text" onclick="WdatePicker();" readonly="readonly"  class="form-control :date_au" style="font-size:13px;width:180"/>
						</div>
					</td>

					<td width="150" align="right">编制经费：</td>
					<td width="400">
						<div class="rim">
							<input id="includeFund" name="includeFund" type="text" class="form-control :max_length;15 :number" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">驾驶证号：</td>
					<td width="400">
						<div class="rim">
							<input id="drivingLicense" name="drivingLicense" type="text" class="form-control :max_length;15" style="width:180"/>
						</div>
					</td>
					<td width="150" align="right">准驾车型：</td>
					<td width="400">
						<div class="rim">
							<input id="licenseModel" name="licenseModel" type="text" class="form-control :max_length;15" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">工作电话：</td>
					<td width="400">
						<div class="rim">
							<input id="workPhone" name="workPhone" type="text" class="form-control :checkphone" style="width:180"/>
						</div>
					</td>
					<td width="150" align="right">初次领证时间：</td>
					<td width="400">
						<div class="rim">
							<input id="licenseDate" name="licenseDate" type="text" onclick="WdatePicker();" readonly="readonly" class="form-control :date_au" style="font-size:13px;width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">家庭电话：</td>
					<td width="400">
						<div class="rim">
							<input id="homePhone" name="homePhone" type="text" class="form-control :checkphone" style="width:180"/>
						</div>
					</td>

					<td width="150" align="right">手机号码：</td>
					<td width="400">
						<div class="rim">
							<input id="mobile" name="mobile" type="text" class="form-control :checkiphone" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">电子邮箱：</td>
					<td width="400">
						<div class="rim">
							<input id="email" name="email" type="text" class="form-control :email" style="width:180"/>
						</div>
					</td>

					<td width="150" align="right">邮编号码：</td>
					<td width="400">
						<div class="rim">
							<input id="postcode" name="postcode" class="form-control :checkpost" style="width:180"/>
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
									class="form-control :checksel :required"
									style="width:180"
									v="${departmentByDepartmentId.id}"
									jsonList="${sectionlist}"
									listKey="id"
									listVal="name"
									headKey=""
									headValue="--请选择--"
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
									v="${departmentByBranchId.id}"
									jsonList="${branchlist}"
									listKey="id"
									listVal="name"
									headKey=""
									headValue="--请选择--"
							></select>
						<script type="text/javascript">
							var
						</script>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">家庭地址：</td>
					<td colspan="4">
						<div class="rim">
							<input id="address" name="address" type="text" class="form-control :max_length;65" style="width:720"/>
						</div>
					</td>
				</tr>
				<tr>
					<td width="150" align="right">户籍地址：</td>
					<td colspan="4">
						<div class="rim">
							<input id="" name="permanentResidenceAddress" type="text" class="form-control :max_length;128" style="width:720"/>
						</div>
					</td>
				</tr>
				<tr>
					<td width="150" align="right">紧急联系人姓名：</td>
					<td width="400">
						<div class="rim">
							<input id="" name="emergencyContactPerson" type="text" class="form-control :max_length;32" style="width:180"/>
						</div>
					</td>
					<td width="150" align="right">紧急联系人关系：</td>
					<td width="400">
						<div class="rim">
							<input id="" name="emergencyContactRelation" type="text" class="form-control :max_length;32" style="width:180"/>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="150" align="right">紧急联系人电话：</td>
					<td colspan="4">
						<div class="rim">
							<input id="" name="emergencyContactPhone" type="text" class="form-control :max_length;128" style="width:180"/>
						</div>
					</td>
				</tr>
				<tr>
					<td width="150" align="right">工资标准：</td>
					<td colspan="3">
						<table id="ck" style="display:block;" align="left">
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
								<td align="center" width="60">
									<input name="salary1" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary2" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary3" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary4" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="80">
									<input name="salary5" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary6" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary7" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary8" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary9" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
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
								<td align="center" width="60">
									<input name="salary10" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary11" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary12" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary13" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="80">
									<input name="salary14" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary15" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="salary16" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">&nbsp;</td>
								<td align="center" width="60">&nbsp;</td>
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
								<td align="center" width="60">
									<input name="deduction1" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="deduction2" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="deduction3" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="deduction4" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="deduction5" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="deduction6" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">
									<input name="deduction7" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center" width="60">&nbsp;</td>
								<td align="center" width="60">&nbsp;</td>
							</tr>
						</table>

						<table id="cl" style="none; margin-top:4px; margin-bottom:4px;" align="left" class="tjyg">
							<tr>
								<td width="77" height="32" align="right">收入项：</td>
								<td width="117" height="22" align="center">基本工资</td>
								<td width="87" height="22" align="center">其他</td>
								<td colspan="2" align="center">&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right">金额：</td>
								<td height="20" align="center">
									<input name="irsalary1" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td height="20" align="center">
									<input name="irsalary2" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td colspan="2" align="center">&nbsp;</td>
							</tr>
							<tr>
								<td height="32" align="right">扣除项：</td>
								<td width="117" align="center">养老</td>
								<td width="87" align="center">医保</td>
								<td width="107" align="center">失业</td>
								<td width="99" align="center">公积金</td>
							</tr>
							<tr>
								<td height="30" align="right">金额：</td>
								<td align="center">
									<input name="irdeduction1" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center">
									<input name="irdeduction2" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center">
									<input name="irdeduction3" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
								<td align="center">
									<input name="irdeduction4" onfocus="javascript:if('0.0'==this.value)this.value='';" onblur="javascript:if(''==this.value)this.value='0.0'" class="form-control" style="width:100%" value="0.0"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="150" align="right">备注：</td>
					<td colspan="3">
						<div class="rimtext">
							<textarea id="comments" name="comments" class="form-control :min_length;0 :max_length;140" style="width:720"></textarea>
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td width="100%" align="center">
						<button type="submit" class="btn btn-default btn-sm" onclick="javascript:validation();">提交</button>
						<button type="reset" class="btn btn-default btn-sm">重填</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>