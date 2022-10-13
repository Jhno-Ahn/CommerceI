<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/CI_View/header.jsp"%>
<html>
	<body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center" style="margin-top: 10%;">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 확인</h3></div>
                                    <div class="card-body">
                                        <form class="modify-form" name ="userPasswdCheckForm">
                                        <input type="hidden" id = "userRealPasswd" value = "${dto.userPasswd}">  
                                        <input type="hidden" id = "userId" value = "${dto.userId}">  
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id = "userPasswdCheck" name="userPasswd" type="password" placeholder="현재 비밀번호"/>
                                                <label>현재 비밀번호</label>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <input class="form-control btn btn-primary rounded submit px-3" type= "button" id = "modifyCheck" 
                                                onclick = "modiresult(userPasswdCheckForm.userPasswd.value,userPasswdCheckForm.userRealPasswd.value)" value="확인">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="main.do?userId=${userId}" style="color: var(- -blue);">뒤로가기</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <script src="/Commerce_I/js/jquery-3.6.0.js"></script>
			  	<script type="text/javascript">
			   	//<!--
			   		$(document).ready(
				function() {
					
					$("input[id = modifyCheck]").on(
							"click",
							function(event) {
								var userPasswd = $("input[id=userPasswdCheck]").val();
								var userRealPasswd = $("input[id=userRealPasswd]").val();
								$.ajax(
									{
										type : "POST",
										url : (userPasswd == userRealPasswd) ? "userPage/userModifyForm.do" : "userPage/userModify.do",
										//처리한다음에 아이디 돌려줄 파일
										data : {
											userId : $("input[id=userId]").val(),
											userPasswd : $("input[id=userPasswdCheck]").val(),
											
											
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
			//—>
			</script>
            </div>
        </div>
    </body>
</html>

