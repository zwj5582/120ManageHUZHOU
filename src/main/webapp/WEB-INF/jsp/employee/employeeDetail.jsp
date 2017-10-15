<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../utils/tags.jsp"%>
<%@ include file="../fragment/head.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%> 
<head>
	<script>
		$.ajaxSetup ({ 
			cache: false//关闭AJAX相应的缓存
		});
	</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="1" cellpadding="0" id="viewbox1"  align="center" style="font-size:10px;">
 		<tr height="25">
			<td align="right" width="100" nowrap><label style="width:100%">姓名：</label></td>
			<td align="left" width="150">
				<label >${employee.name}</label>
			</td>
			
			<td align="right" width="140"><label style="width:100%">工号：</label></td>
			<td align="left"  width="150">
				<label >${employee.jobnumber}</label>
			</td>
			
			<td align="right" width="140"><label style="width:100%">帐号：</label></td>
			<td align="left" width="150">
				<label >${employee.account.username}</label>
			</td>
			
		    <td align="right" width="140"><label style="width:100%">考勤卡号：</label></td>
		    <td align="left" width="150">
		    	<label >${employee.jobnumber}</label>
		    </td>
 		</tr>
		<tr height="25">
			<td align="right" width="140"><label style="width:100%">性别：</label></td>
			<td align="left" width="150">
				<label >${employee.sex}</label>
			</td>
	
			<td align="right" width="140"><label style="width:100%">职务：</label></td>
			<td align="left" width="150">
				<label >${employee.jobPosition }</label>
			</td>
			
			<td align="right" width="140"><label style="width:100%">出生日期：</label></td>
			<td align="left" width="150">
				<label >
					<fmt:formatDate value="${employee.borndate}" pattern="yyyy-MM-dd"/>
				</label>
			</td>
			
		    <td align="right" width="140"><label style="width:100%">编制状态：</label></td>
		    <td align="left" width="150">
		    	<label >
					<c:choose>
						<c:when test="${employee.isRegular==1}">
							在编
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${employee.isRegular==0}">
									非编
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
		    	</label>
		    </td>
		</tr>
  		<tr height="25">
			<td align="right" width="140"><label style="width:100%">身份证号码：</label></td>
			<td align="left" width="150">
				<label >${employee.idcard}</label>
			</td>
			
			<td align="right" width="140"><label style="width:100%">籍贯：</label></td>
			<td align="left" width="150">
				<label >${employee.nativePlace}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">民族：</label></td>
			<td align="left" width="150">
				<label >${employee.nationality}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">政治面貌：</label></td>
    	 		<td align="left" width="150">
    	 			<label >${employee.politicalAffiliation}</label>
    	 		</td>
	    </tr>
  		<tr height="25">
			<td align="right" width="140"><label style="width:100%">参加工作时间：</label></td>
			<td align="left" width="150">
				<label >
					<fmt:formatDate value="${employee.jobBegin}" pattern="yyyy-MM-dd"/>
				</label>
			</td>
			<td align="right" width="140"><label style="width:100%">入党(团)时间：</label></td>
			<td align="left" width="150">
				<label >
					<fmt:formatDate value="${employee.joinParty}" pattern="yyyy-MM-dd"/>
				</label>
			</td>
			<td align="right" width="140"><label style="width:100%">学历：</label></td>
			<td align="left" width="150">
				<label >${employee.education}</label>
			</td>
		    <td align="right" width="140"><label style="width:100%">学位：</label></td>
   	 		<td align="left" width="150">
   	 			<label >${employee.degree}</label>
   	 		</td>
		</tr>
	  	<tr height="25">
			<td align="right" width="140"><label style="width:100%">专业：</label></td>
			<td align="left">
				<label >${employee.major}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">毕业时间：</label></td>
			<td align="left" width="150">
				<label >
					<fmt:formatDate value="${employee.graduation}" pattern="yyyy-MM-dd"/>
				</label>
			</td>
			<td align="right" width="140"><label style="width:100%">毕业院校：</label></td>
			<td align="left" width="150">
				<label >${employee.school}</label>
			</td>
			   <td align="right" width="160"><label style="width:100%">进入本单位时间：</label></td>
			      <td align="left" width="150">
				<label >
					<fmt:formatDate value="${employee.joinDate}" pattern="yyyy-MM-dd"/>
				</label>
			</td>
	    </tr>
	  	<tr height="25">
			<td align="right" width="140"><label style="width:100%">进入本单位方式：</label></td>
			<td align="left" width="150">
				<label >
					${employee.joinWay}
				</label>
			</td>
			<td align="right" width="160"><label style="width:100%">是否参照公务员：</label></td>
			<td align="left" width="150">
				<label >
					<c:choose>
						<c:when test="${employee.isRefer==1}">
							是
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${employee.isRefer==0}">
									否
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
               	</label>
		    </td>
			<td align="right" width="140"><label style="width:100%">岗位：</label></td>
			<td align="left" width="150">
				<label >${employee.CPositionType.displayName}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">职务：</label></td>
			<td align="left" width="150">
				<label >${employee.jobPosition}</label>
			</td>
	    </tr>
	 	<tr height="25">
			<td align="right" width="140"><label style="width:100%">职称：</label></td>
			<td align="left" width="150">
				<label >${employee.jobTitle}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">任职时间：</label></td>
			<td align="left" width="150">
				<label >
					<fmt:formatDate value="${employee.presentJob}" pattern="yyyy-MM-dd"/>
				</label>
			</td>
			<td align="right" width="140"><label style="width:100%">入编文号：</label></td>
			<td align="left">
				<label >${employee.includeNumber}</label>
			</td>
		   	<td align="right" width="140"><label style="width:100%">入编时间：</label></td>
		  	<td align="left">
			<label >
				<fmt:formatDate value="${employee.includeDate}" pattern="yyyy-MM-dd"/>
			</label>
			</td>
	    </tr>
		<tr height="25">
			<td align="right" width="140"><label style="width:100%">职位：</label></td>
			<td align="left">
				<label >${employee.CJobType.displayName}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">编制经费：</label></td>
			<td align="left" width="150">
				<label >${employee.includeFund}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">驾驶证号：</label></td>
			<td align="left" width="150">
				<label >${employee.drivingLicense}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">准驾车型：</label></td>
			<td align="left" width="150">
				<label >${employee.licenseModel}</label>
			</td>
		</tr>
		<tr height="25">
			<td align="right" width="140"><label style="width:100%">工作电话：</label></td>
			<td align="left" width="150">
				<label >${employee.workPhone}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">初次领证时间：</label></td>
			<td align="left" width="150">
				<label >
					<fmt:formatDate value="${employee.licenseDate}" pattern="yyyy-MM-dd"/>
				</label>
			</td>
			<td align="right" width="140"><label style="width:100%">家庭电话：</label></td>
			<td align="left">
				<label >${employee.homePhone}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">手机号码：</label></td>
			<td align="left">
				<label >${employee.mobile}</label>
			</td>
		</tr>
		<tr height="25">
			<td align="right" width="140"><label style="width:100%">电子邮箱：</label></td>
			<td align="left" width="150">
				<label >${employee.email}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">邮编：</label></td>
			<td align="left" width="150">
				<label >${employee.postcode}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">所属部门：</label></td>
			<td align="left">
				<label >${employee.departmentByDepartmentId.name}</label>
			</td>
			<s:if test="%{employee.CEmployeeState.id=='dimission' }">
				<td align="right">
					<label >
						离职日期：
					</label>
				</td>
				<td align="left">
					<label >
						<fmt:formatDate value="${employee.leaveDate}" pattern="yyyy-MM-dd"/>
					</label>
				</td>
			</s:if>
			<s:if test="%{employee.CEmployeeState.id=='retire' }">
				<td align="right">
					<label >
						退休日期：
					</label>
				</td>
				<td align="left">
					<label >
						<fmt:formatDate value="${employee.leaveDate}" pattern="yyyy-MM-dd"/>
					</label>
				</td>
			</s:if>
		</tr>
		<tr height="25">
			<td align="right" width="140"><label style="width:100%">工作地点：</label></td>
			<td colspan="3" align="left" >
				<label >${employee.departmentByBranchId.name}</label>
			</td>
			<td align="right" width="140"><label style="width:100%">家庭地址：</label></td>
			<td colspan="3" align="left">
				<label >${employee.address}</label>
			</td>
    	</tr>
		<tr height="25">
			<td align="right" width="140"><label style="width:100%">备注：</label></td>
			<td colspan="7" align="left">
				<label >${employee.comments}</label>
			</td>
		</tr>
	</table>      
</body>
</html>

