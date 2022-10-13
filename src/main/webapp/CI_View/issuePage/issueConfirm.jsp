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
	<div>
		<h1 class="mt-4" style="text-align: center;">승인 대기중 업무</h1>
		<c:set var = "userId" value = "${userId}"/>
	</div>
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
							<th>수락</th>
							<th>거절</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<tr style="text-align: center;">
							<!-- ==============  여기부터 내가 만지는부분 ============== -->
							<c:if test="${count == 0}">
								<tr>
									<td colspan="6" style="text-align: center"></td>
								</tr>
							</c:if>
							<c:if test="${count != 0}">
								<c:set var="number" value="${number}" />
								<input type="hidden" name="number" value="${number}" />
								<c:forEach items="${wdtos}" var="wdto">
										<input type="hidden" id="issueNum" value="${wdto.issueNum}" />
										<tr>
											<%-- <td style="text-align:center">
											${number}
											<c:set var="number" value="${number-1}"/>
											</td> --%>
											<td>${wdto.issueType}</td>
											<td>${wdto.issueTitle}</td>
											<td>${wdto.issueWriter}</td>
											<td>${wdto.issueStmt}</td>
											<td>${wdto.issueManager}</td>
											<td>${wdto.issueDpmt}</td>
											<td>${wdto.issueDate}</td>
											<td>${wdto.issueEndDate}</td>
											<td>${wdto.issueOpt}</td>
											<td><input id="yes" type="button" value="수락"/></td>
											<td class="refuse"><input type="button" value="거절" /></td>
										</tr>
								</c:forEach>
							</c:if>
							<%-- </c:forEach> --%>
					</tbody>
				</table>
				<br>
				<div id="pageButton">
					<%-- <c:if test="${count gt 0}">
						<c:if test="${startPage gt pageBlock}">
							<a href="list.do?pageNum=${startPage - pageBlock}">[◀]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<b>[${i}]</b>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="list.do?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount gt endPage}">
							<a href="list.do?pageNum=${startPage + pageBlock}">[▶]</a>
						</c:if>
					</c:if> --%>
				</div>
			</div>
		</div>
	</div>


	<br>
	<br>
	<br>
	<!--  내가 담당자인 업무 끝 ======================================================== -->
	<div>
		<h1 class="mt-4" style="text-align: center;">거절된 업무</h1>
	</div>
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
							<th>거절확인</th>
							<th>확인</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<!-- ==============  여기부터 내가 만지는부분 ============== -->
						<c:if test="${count == 0}">
							<tr>
								<td colspan="6" style="text-align: center"></td>
							</tr>
						</c:if>
						<c:if test="${count != 0}">
							<c:set var="number" value="${number}" />
							<input type="hidden" value="${number}" />
							<c:forEach items="${refusedtos}" var="refusedtos">
								<tr>
									<%-- <td style="text-align:center">
												${number}
												<c:set var="number" value="${number-1}"/>
											</td> --%>
									<td>${refusedtos.issueType}</td>
									<td>${refusedtos.issueTitle}</td>
									<td>${refusedtos.issueWriter}</td>
									<td>${refusedtos.issueStmt}</td>
									<td>${refusedtos.issueManager}</td>
									<td>${refusedtos.issueDpmt}</td>
									<td>${refusedtos.issueDate}</td>
									<td>${refusedtos.issueEndDate}</td>
									<td>${refusedtos.issueOpt}</td>
									<td>${refusedtos.issueRefuse}</td>
									<td class="refuse"><input type="button" value="확인" /></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(
			function() {
				var userId = '<c:out value = "${userId}"/>'
					$("input[id=yes]").each(
							function(index, item){
								$($("input[id=yes]")[index]).on(
										"click",
										function(event) {
											$.ajax(
												{
													type : "GET",
													url : "issuePage/issueConfirm.do",
													data : {
														issueNum : $($("input[id=issueNum]")[index]).val(),
														userId : userId,
													},
													dataType : "text",
													success : function(data) {
															$(".content").html(data);
													},
													error : function(error) {
														alert("ㅄ ㅋ");
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