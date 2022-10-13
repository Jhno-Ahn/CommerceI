<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/CI_View/header.jsp"%>
	  <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center" style="margin-top: 10%;">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">마이페이지 - 정보수정</h3></div>
                                    <div class="card-body">
                                        <form name="modifyForm" action="userModifyPro.do" method="post" class="modify-form" onsubmit ="return modifyInputCheck()">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userPasswd" type="password" placeholder="비밀번호" value="${dto.userPasswd}" />
                                                <label>수정 비밀번호</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userRePasswd" type="password" placeholder="비밀번호확인" value="${dto.userPasswd}" />
                                                <label>수정 비밀번호 확인</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userTel" type="tel" placeholder="전화번호"  value="${dto.userTel}"/>
                                                <label>변경할 전화번호</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userEmail" type="email" placeholder="이메일 주소" value="${dto.userEmail}" />
                                                <label>변경할 이메일 주소</label>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <input class="form-control btn btn-primary rounded submit px-3" type="submit" value="정보 수정">
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
            </div>
        </div>
    </body>
</html>	
