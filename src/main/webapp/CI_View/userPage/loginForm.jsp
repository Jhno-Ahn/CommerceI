<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/CI_View/header.jsp"%>
<body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center" style="margin-top: 15%;">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                        <!-- 여기부터가 아이디 입력받는------------------------------------------------------------------------ -->
                                        <form id="log_1" name="loginForm" method="post" action="loginPro.do" onsubmit="return loginCheck()">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userId" type="text" placeholder="아이디" />
                                                <label>아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userPassword" type="password" placeholder="비밀번호" />
                                                <label>비밀번호</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0" style="margin-left: 43%;" >
                                            	<button type="submit" class="btn btn-primary">로그인</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="userRegForm.do">회원가입</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
