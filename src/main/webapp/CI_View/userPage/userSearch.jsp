<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file="/CI_View/header.jsp"%>
    <link href="${pageContext.request.contextPath}/css/list.css" rel="stylesheet" />
    <style>
    	table#userSearchTable {
    	 	width: 85%;
    		margin-left:auto;
    		margin-right:auto;
    		text-align:center;
    	}
    	
    	table#userSearchTable tr, th, td{
    		border: 1px solid #444444;
    		padding-top:10px;
    		padding-bottom:10px;
    	}
    		
    </style>
    <body>
        <main>
               <h1 class="mt-4">&nbsp;&nbsp;사용자 조회</h1>
               <br>
                <div class="card mb-4">
                    <div class="card-header">
                    	<div>
	                        <i class="fas fa-table me-1"></i>
	                        사용자 조회 &nbsp;
	                      	<input type = "text" placeholder = "검색어 입력" id = "userSearchInput">
	                      	<input type = "button" id = "userSearchButton" value = "검색">
                      	</div>
                    <div class="card-body">
                        <table>
						    <thead>
						    <tr>
						        <th>이름</th>
						        <th>부서</th>
						        <th>직급</th>
						        <th>이메일</th>
						        <th>전화번호</th>
						    </tr>
						    </thead>
						    <tbody>
						     <c:forEach items="${dtos}" var="dtos">
							    <tr>
							    	<td>${dtos.userName}</td>
                                    <td>${dtos.userDpmt}</td>
                                    <td>${dtos.userLevel}</td>
                                    <td>${dtos.userEmail}</td>
                                    <td>${dtos.userTel}</td>
							    </tr>
							 </c:forEach>
						    </tbody>
						</table>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script src="/Commerce_I/js/jquery-3.6.0.js"></script>
		 	   <script type="text/javascript">
			   		$(document).ready(
				function() {
					$("input[id = userSearchButton]").on(
							"click",
							function(event) {
								$.ajax(
									{
										type : "POST",
										url : "userPage/userSearch.do",
										//처리한다음에 아이디 돌려줄 파일
										data : {
											searchWord : $("input[id=userSearchInput]").val(),
										},
										dataType : "text",
										success : function(data) {
											$(".content").html(data);
											//id가 idcheck인 애한테 data를 출력시킨다는 뜻
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
			</script> 
</html>