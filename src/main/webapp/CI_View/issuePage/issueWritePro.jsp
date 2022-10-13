<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/CI_View/header.jsp"%>
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert( "다시하셈" );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=issueWriteForm.do">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="../main.do">
		<c:param name="userId" value="${sessionScope.memId}" />
	</c:redirect>
</c:if>	