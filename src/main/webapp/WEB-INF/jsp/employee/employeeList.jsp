<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../utils/tags.jsp"%>
<%@ include file="../fragment/head.jsp"%>
<html>
<head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>
	<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT"/>
	<script src="js/website.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$.ajaxSetup ({ 
		   cache: false//关闭AJAX相应的缓存
		});
		
		$.dataList_bottom_offset=45;
		
		function doDel(id){
			window.location.href='employee!deleteEmployee.action?employee.id='+id;
		}
		
		function doRetire(id){
			window.location.href = 'employee!retireEmployee.action?employee.id='+id;
		}
		
		function isRoles(){
			var issuccess="${isFlag}";
			if(issuccess=='success'){
				if(confirm("是否为员工分配权限？")){
					window.location.href="employee!showRoles.action?account.id=${emp.account.id}&employee.id=${emp.id}";
				}	
			}
		}
		
		function showEmployeeDetail(id) {
			if($("#Div").hasClass("bs-example-modal-sm") && $("#modelDiv").hasClass("modal-sm")){
				$("#Div").removeClass("bs-example-modal-sm");
				$("#modelDiv").removeClass("modal-sm");
				$("#Div").addClass("bs-example-modal-lg");
				$("#modelDiv").addClass("modal-lg");
			}
			$("#title").html("员工详细信息");
			var _url = 'employee/view/'+id;
			$('#contentDiv').load(_url); // AJAX载入新页面
		}
	
		function employeeChange(title, id){
			/*if($("#Div").hasClass("bs-example-modal-lg") && $("#modelDiv").hasClass("modal-lg")){
				$("#Div").removeClass("bs-example-modal-lg");
				$("#modelDiv").removeClass("modal-lg");
				$("#Div").addClass("bs-example-modal-sm");
				$("#modelDiv").addClass("modal-sm");
			}*/
			var _url='employee!prepareEmployeeChange.action?employee.id='+id;
			$("#title").html(title);
			$('#contentDiv').load(_url,{'type':title}); // AJAX载入新页面
		}
		
		function employeeHolidays(id){
			window.location.href = "employee!findEmployeeHolidays.action?employee.id="+id;
		}
		
		function roleAllocate(id, accountId){
			$("#form").attr("action", "employee!showRoles.action?employee.id=" + id + "&account.id=" + accountId);
			$("#form").submit();
		}
		
		function doEdit(id){
            $("#form").attr("method","GET");
			$("#form").attr("action", "employee/update/" + id);
			$("#form").submit();
		}
		
		function salaryManage(id){
			$("#form").attr("action", "employee!findSalaryRecord.action?employee.id=" + id);
			$("#form").submit();
		}
		
		$.formAction="employee.action";
		function doQuery(){
			$("#form").attr("action", "employee.action");
			$("#form").submit();
		}
		
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
<body onload="isRoles();">
	<div id="current_position" style="background: ">
		<img src="images/home.png" />&nbsp;&nbsp;当前位置：&nbsp;综合管理&nbsp;>&nbsp;急救资源管理&nbsp;>&nbsp;系统管理&nbsp;>&nbsp;<span>用户管理</span>
	</div>
	
	<form class="form-inline" id="form" action="employee.action" method="post">
		<div id="search_box" align="center">
			<table width="100%" border="0" cellspacing="0" cellpadding="1">
				<tr>
					<td width="100" align="right">姓名：</td>
			 	 	<td width="140" align="left">
			 	 		<input id="realname" name="name" value="${employee.name}" type="text" class="form-control " style="width:140"/>
			 	 	</td>

			  		<td width="100" align="right" >所属部门：</td>
			  		<td width="140" align="left">
						<select id="department" name="departmentByDepartmentId.id" class="form-control searcht" style="width:140px;">
							<option value="">--请选择--</option>
							<c:forEach items="${sectionlist}" var="item">
								<option value="${item.id}" <c:if test="${employee.departmentByDepartmentId.id == item.id }">selected</c:if> >${item.name}</option>
							</c:forEach>
						</select>
			  		</td>
			  		
             		<td width="100" align="right">工作分站：</td>
			  		<td width="140" align="left" >
						<select id="workdepartment" name="departmentByBranchId.id" class="form-control searcht" style="width:140px;">
							<option value="">--请选择--</option>
							<c:forEach items="${branchlist}" var="item">
								<option value="${item.id}" <c:if test="${employee.departmentByBranchId.id == item.id }">selected</c:if> >${item.name}</option>
							</c:forEach>
						</select>
			  		</td>
			  		
			 		<td width="50" align="right">职务：</td>
			  		<td width="140" align="left">
						<select id="jobPosition" name="jobPosition" class="form-control searcht" style="width:140px;">
							<option value="">--请选择--</option>
							<c:forTokens items="主任:党支部书记:副书记:副主任:工会主席:班子助理:科长:科员:分站长:办公室主任:负责人:无" delims=":" var="item">
								<option value="${item}" <c:if test="${employee.jobPosition == item }">selected</c:if> >${item}</option>
							</c:forTokens>
						</select>
			  		</td>
		  		 	<td></td>
		      	</tr>
		      	<tr>
					<td align="right" width="100">编制状态：</td>
					<td align="left" width="140">
						<select id="regular" name="isRegular" class="form-control searcht" style="width:140px;">
							<option value="">--请选择--</option>
							<c:forTokens items="0:非编,1:在编" delims="," var="item">
								<c:forTokens items="${item}" delims=":" var="it" varStatus="s">
									<c:if test="${s.index==0}">
										<c:set var="key" value="${it}"/>
									</c:if>
									<c:if test="${s.index==1}">
										<c:set var="value" value="${it}"/>
									</c:if>
								</c:forTokens>
								<option value="${key}" <c:if test="${employee.isRegular == key }">selected</c:if> >${value}</option>
							</c:forTokens>
						</select>
					</td>
					
					<td align="right" width="100">学历：</td>
					<td align="left" width="140">
						<select id="education" name="education" class="form-control searcht" style="width:140px;">
							<option value="">--请选择--</option>
							<c:forTokens items="初中及以下:初中及以下,中专（职校）:中专（职校）,高中:高中,中专:中专,大专:大专,本科:本科,硕士:硕士,博士:博士" delims="," var="item">
								<c:forTokens items="${item}" delims=":" var="it" varStatus="s">
									<c:if test="${s.index==0}">
										<c:set var="key" value="${it}"/>
									</c:if>
									<c:if test="${s.index==1}">
										<c:set var="value" value="${it}"/>
									</c:if>
								</c:forTokens>
								<option value="${key}" <c:if test="${employee.education == key }">selected</c:if> >${value}</option>
							</c:forTokens>
						</select>
					</td>
					
					<td align="right" width="100">年龄段：</td>
					<td align="left" width="140">
						<select id="age" name="age" class="form-control searcht" style="width:140px;">
							<option value="">--请选择--</option>
							<c:forTokens items="1-25:25岁以下,26-30:26-30,31-40:31-40,41-50:41-50,50-100:50岁以上" delims="," var="item">
								<c:forTokens items="${item}" delims=":" var="it" varStatus="s">
									<c:if test="${s.index==0}">
										<c:set var="key" value="${it}"/>
									</c:if>
									<c:if test="${s.index==1}">
										<c:set var="value" value="${it}"/>
									</c:if>
								</c:forTokens>
								<option value="${key}" <c:if test="${age == key }">selected</c:if> >${value}</option>
							</c:forTokens>
						</select>
					</td>
					
					<td align="right" width="100">在职状态：</td>
					<td align="left" width="140">
						<select name="CEmployeeState.id" class="form-control searcht" style="width:140px;">
							<option value="">--请选择--</option>
							<c:forTokens items="enabled:在职,dimission:离职,retire:退休" delims="," var="item">
								<c:forTokens items="${item}" delims=":" var="it" varStatus="s">
									<c:if test="${s.index==0}">
										<c:set var="key" value="${it}"/>
									</c:if>
									<c:if test="${s.index==1}">
										<c:set var="value" value="${it}"/>
									</c:if>
								</c:forTokens>
								<option value="${key}" <c:if test="${employee.CEmployeeState.id == key }">selected</c:if> >${value}</option>
							</c:forTokens>
						</select>
				 	</td>
					<td></td>
				</tr>
				<tr>
					<td width="100" align="right">休假日期：</td>
					<td colspan="3">
						<input id="beginTime" name="beginTime" value="<fmt:formatDate value='${beginTime}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker();" class="form-control searchtime" readonly
							  type="text" style="width:180"/>
						<span width="110" align="center">至</span>
						<input id="endTime" name="endTime" value="<fmt:formatDate value='${endTime}' pattern='yyyy-MM-dd'/>" onclick="WdatePicker();" class="form-control searchtime" readonly
							   type="text" style="width:180"/>
					</td>
					<td align="right" width="100">休假类型：</td>
					<td align="left" width="140">
						<select id="vocationType" name="vocationType" class="form-control searcht" style="width:140px;">
							<option value="">--全部--</option>
							<c:forEach items="${holidaysTypes}" var="item">
								<option value="${item.key}" <c:if test="${item.id == item.key }">selected</c:if> >${item.name}</option>
							</c:forEach>
						</select>
					</td>
					<td colspan="3" style="padding-left:10px" onclick="javascript:doQuery();">
						<button type="submit" class="btn btn-success btn-sm">
							查询
						</button>
					</td>
				</tr>
			</table>
		</div>
	
		<div id="content_form">
			<div class="title">
				<table width="98%" border="0" cellspacing="0" cellpadding="1">
					<tr>
						<td width="10"></td>
						<td width="18"><img src="images/Title_list.png" /></td>
						<td align="left">人员列表</td>
						
						<td width="100" align="right" style="padding-right:6px;">
							<img src="images/add.gif"/>
				 			<a href="employee/add" class="white">添加 </a>
						</td>
					</tr>
				</table>
			</div>
			<div id="listContent">
				<table id="theObjTable" width="100%" border="0" cellspacing="0" cellpadding="1" class="table table-bordered table-hover tab substrtab">
					<tr class="warning">
						<td nowrap>序号</td>
						<td nowrap>姓名</td>
						<td nowrap>帐号</td>
						<td nowrap>工号</td>
						<td nowrap>考勤号</td>
						<td nowrap>性别</td>
						<td nowrap>所属部门</td>
						<td nowrap>工作分站</td>
						<td nowrap>职务</td>
						<td nowrap>岗位</td>
						<td nowrap>编制状态</td>
						<td nowrap>学历</td>
						<td nowrap>进本单位时间</td>
						<td nowrap>入编时间</td>

						<c:choose>
							<c:when test="${employee.CEmployeeState.id == 'dimission'}">
								<td nowrap>离职日期</td>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${employee.CEmployeeState.id == 'retire'}">
										<td nowrap>退休日期</td>
									</c:when>
									<c:otherwise>
										<td nowrap>分配角色</td>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<td nowrap>基本操作</td>
					</tr>
					<c:forEach items="${pagebean.list}" varStatus="vs" var="item">

						<tr>
							<td align="center" nowrap>
								<c:choose>
									<c:when test="${pagebean.currentPage==1}">
										${vs.count}
									</c:when>
									<c:otherwise>
										${vs.count+(pagebean.pageSize*(pagebean.currentPage-1))}
									</c:otherwise>
								</c:choose>
							</td>
							<td height="22" align="center" nowrap>${item.name}</td>
							<td align="center" nowrap>${item.account.username}</td>
							<td align="center" nowrap>${item.jobnumber}</td>
							<td align="center" nowrap>${item.timecard}</td>
							<td align="center" nowrap>${item.sex}</td>
							<td align="center" nowrap>${item.departmentByDepartmentId.name}</td>
							<td align="center" nowrap>
								<c:choose>
									<c:when test="${departmentByBranchId.name!=null}">
										${departmentByBranchId.name}
									</c:when>
									<c:otherwise>
										待分配
									</c:otherwise>
								</c:choose>
							</td>
							<td align="center" nowrap>${item.jobPosition}</td>
							<td align="center" nowrap>${item.CPositionType.displayName}</td>
							<td align="center" nowrap>
								<c:choose>
									<c:when test="${isRegular==0}">
										非编
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${isRegular==1}">
												在编
											</c:when>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>
							<td align="center" nowrap>${education}</td>
							<td align="center" nowrap>
								<fmt:formatDate value="${joinDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td align="center" nowrap>
								<fmt:formatDate value="${includeDate}" pattern="yyyy-MM-dd"/>
							</td>
							<c:choose>
								<c:when test="${CEmployeeState.id=='dimission' or employee.CEmployeeState.id == 'retire'}">
									<td align="center" nowrap>
										<fmt:formatDate value="${leaveDate}" pattern="yyyy年MM月dd日"/>
									</td>
								</c:when>
								<c:otherwise>
									<td align="center" nowrap>
										<button type="button" class="btn btn-link btn-xs" onclick="javascript:roleAllocate(<s:property value='id'/>, <s:property value='account.id'/>)">
											分配角色
										</button>
									</td>
								</c:otherwise>
							</c:choose>
							<td align="center" nowrap>
								
								
								<c:choose>
									<c:when test="${CEmployeeState.id=='dimission' or employee.CEmployeeState.id == 'retire'}">
										<button type="button" class="btn btn-link btn-xs" data-toggle="modal" data-target="#Div" onclick="javascript:showEmployeeDetail(${item.id});">
											详情
										</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-link btn-xs" data-toggle="modal" data-target="#Div" onclick="javascript:showEmployeeDetail(${item.id});">
											详情
										</button>
										|<button type="button" class="btn btn-link btn-xs" onclick="javascript:doEdit(${item.id});">
										编辑
										</button>
										|<button type="button" class="btn btn-link btn-xs" onclick="javascript:salaryManage(${item.id});">
										工资管理
										</button>
										|<button type="button" class="btn btn-link btn-xs" data-toggle="modal" data-target="#Div" onclick="javascript:employeeChange('离职',${item.id});">
										离职
										</button>
										|<button type="button" class="btn btn-link btn-xs" data-toggle="modal" data-target="#Div" onclick="javascript:employeeChange('退休',${item.id});">
										退休
										</button>
										|<button type="button" class="btn btn-link btn-xs" onclick="javascript:employeeHolidays(${item.id});">
										休假
										</button>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>

					</c:forEach>

				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/jsp/fragment/pagebean_bar.jsp"/>
	</form>
  
	<div id="Div" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div id="modelDiv" class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					 <h5 id="title" class="modal-title"></h5>
				</div>
				<div class="modal-body" id="contentDiv">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
