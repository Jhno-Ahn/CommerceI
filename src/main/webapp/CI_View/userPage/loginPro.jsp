<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/CI_View/header.jsp"%>
<h2>${page_login}</h2>

<%-- 아이디가 저장된 값이 없을경우 메시지출력 --%>
<c:if test="${result eq -1}">
     <script type="text/javascript">
        <!--
        erroralert( userIdError )
        //-->
     </script>
</c:if>

<%-- 비밀번호가 저장된 값과 일치하지 않을경우 메시지출력 --%>
<c:if test="${result eq 0}">
	<script type="text/javascript">
	<!--
	erroralert( userPasswdError )
	//-->
	</script>
</c:if>

<%-- 아이디와 비밀번호가 일치할 시 성공후 메인페이지 이동후 세션에 아이디값 저장 --%>
<c:if test="${result eq 1}">
	${sessionScope.memId = userId}
    <c:redirect url="../main.do">
		<c:param name="userId" value="${requestScope.userId}" />
	</c:redirect>
</c:if>