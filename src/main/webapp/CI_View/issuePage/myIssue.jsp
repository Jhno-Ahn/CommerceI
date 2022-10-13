<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../header.jsp"%>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
.accept {
	width: 5%;
}

.refuse {
	width: 5%;
}
</style>
<body>

	<br>
	<br>
	<br>
<!--  내가 담당자인 업무 끝 ======================================================== -->
	<div>
		<h1 class="mt-4" style="text-align:center;" >나의 업무</h1>
	</div>
	<%-- <c:set var="issueNum" value="${dtos.issueNum}"/> --%>
	<br>
	<div class="card mb-4">
		<div class="card-header">
			<div class="card-body">
				<table>
					<thead>
						<tr>
							<th>유형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>진행상태</th>
							<th>담당자</th>
							<th>담당부서</th>
							<th>등록일자</th>
							<th>완료일자</th>
							<th>공개여부</th>
						</tr>
					</thead>
					<tbody style="text-align:center;">
						<!-- ==============  여기부터 내가 만지는부분 ============== -->		
						<c:if test="${count == 0}">
									<tr>
										<td colspan="6" style="text-align:center"></td>
									</tr>
								</c:if>
								<c:if test="${count != 0}">
									<c:set var="number" value="${number}"/>
									<input type="hidden" value="${number}"/>
									<c:forEach items="${dtos}" var="dtos">
										<tr>
											<%-- <td style="text-align:center">
												${number}
												<c:set var="number" value="${number-1}"/>
											</td> --%>
											<c:set var = "issueNum" value = "${dtos.issueNum}"/>
											<td>${dtos.issueType}</td>
											<input type="hidden" id="issueDetail" class="btn" value="${dtos.issueNum}"/>
											<td><input type="button" id="issueTitle" class="btn" value="${dtos.issueTitle}"/></td>
											<td>${dtos.issueWriter}</td>			<!-- 작성자!!!! -->
											<td>${dtos.issueStmt}</td>
											<td>${dtos.issueManager}</td>
											<td>${dtos.issueDpmt}</td>
											<td>${dtos.issueDate}</td>
											<td>${dtos.issueEndDate}</td>
											<td>${dtos.issueOpt}</td>
										</tr>
									</c:forEach>
								</c:if>
					<!-- ==============  여기부터 내가 만지는부분 ============== -->		
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
			   	$(document).ready(
				function() {
 					$("input[id = issueTitle]").each(
 							function(index, item){
 								$($("input[id=issueTitle]")[index]).on(
 										"click",
 										function(event) {
 											$.ajax(
 												{
 													type : "POST",
 													url : "issuePage/myIssueDetail.do",
 													data : {
 														issueNum : $($("input[id=issueDetail]")[index]).val(),
 													},
 													dataType : "text",
 													success : function(data) {
 															$(".content").html(data);
 													},
 													error : function(error) {
 														$(".content").html(error);
 													}
 												}
 											)	
 										}
 								);
 							}
							
						);
					}
				);
			</script>

</body>
</html>