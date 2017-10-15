<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../utils/tags.jsp"%>

<script type="text/javascript">
	function setPage(page){
		if (!isNaN(page)){
			var currentPage = parseInt(page);
			document.forms[0]["pagebean.currentPage"].value = currentPage;
			if($.formAction){
			  document.forms[0].action=$.formAction;
			}
			document.forms[0].submit();
		}
	}
</script>
<input type="hidden" name="pagebean.currentPage" value="${pagebean.currentPage}" id="pageNumber">
<div class="page">
	<div class="pagef" >
		共有${pagebean.totalRow}条记录，
		当前第${pagebean.currentPage}/${pagebean.totalPage}页
	</div>
	<div class="pager">
		<a href="javascript:setPage(1);" class="pagebtn">首页</a>
		<a href="javascript:setPage(${pagebean.currentPage-1==0?1:pagebean.currentPage-1});" class="pagebtn">上一页</a>
		<a href="javascript:setPage(${pagebean.currentPage+1>pagebean.totalPage?pagebean.totalPage:pagebean.currentPage+1});" class="pagebtn">下一页</a>
		<a href="javascript:setPage(${pagebean.totalPage})" class="pagebtn">尾页</a>
		转到第<input class="pageinput" name="inputPageNumber" value="${pagebean.currentPage }"/>页
		<a href="javascript:setPage(document.forms[0].inputPageNumber.value)" class="pagebtn">跳转</a>
	</div>
</div>