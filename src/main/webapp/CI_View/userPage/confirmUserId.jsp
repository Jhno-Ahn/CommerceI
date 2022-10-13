<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/CI_View/header.jsp"%>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-md-7 col-lg-5">
				<div class="wrap">
					<div class="login-wrap p-4 p-md-5 ">
						<div class="d-flex">
							<div class="w-100">
								<c:if test="${result eq 0}">
									<h5>아이디 중복 확인</h5>
									<!-- 아이디가 있는지 없는지 디비에게 물어봐야함. -->
									<table border="1">
										<tr>
											<th style="width: 300px"><span>${userId}</span> 는 사용할 수 있습니다.
											</th>
										</tr>
										<tr>
											<th><input class="inputbutton" type="button"
												value="확인" onclick="setUserId('${userId}')"></th>
										</tr>
									</table>
								</c:if>
								<c:if test="${result ne 0}">
									<form method="post" name="userIdConfirmForm" action="confirmUserId.do"
										onsubmit="return confirmUserIdCheck()">
										<table border="1">
											<tr>
												<th colspan="2"><span>${userId}</span> 는 사용할 수 없습니다.</th>
											</tr>
											<tr>
												<th>아이디
												<td><input class="input" type="text" name="userId" autofocus></td>
											</tr>
											<tr>
												<th colspan="2">
												<input class="inputbutton" type="submit" value="확인"> 
												<input class="inputbutton" type="button" value="취소"
													onclick="window.close()"></th>
											</tr>
										</table>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>