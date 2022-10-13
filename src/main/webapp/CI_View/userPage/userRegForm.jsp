<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/CI_View/header.jsp"%>
    <body class="bg-primary">
    <script src="/Commerce_I/js/script.js"></script>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center" style="margin-bottom: 30px;">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
                                        <form name="regInputForm" action="userRegPro.do" method="post" onsubmit="return regInputCheck()">
                                        <input type="hidden" name="userIdCheck" value="0">  
								 		<input type="hidden" name="userComNumCheck" value="0">  
                                            <div class="row mb-3">
                                                <div class="col-md-9">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="userId" type="text" placeholder="아이디" />
                                                        <label>아이디</label>
                                                    </div>
                                                </div>
                                                 <div class="col-md-3" style="margin-top: 10px;">
                                                    <input type="button" class="form-control" id="checkButton" onclick="confirmUserId()" value="아이디중복">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-9">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="userComNum" type="text" placeholder="사번" />
                                                        <label>사번</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" style="margin-top: 10px;">
                                                    <input type="button" id="checkButton" class="form-control" value="사번 인증" onclick="confirmUserComNum()"/>
                                                 </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userName" type="text" placeholder="이름" />
                                                <label>이름</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userPasswd" type="password" placeholder="비밀번호" />
                                                <label>비밀번호</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userRePasswd" type="password" placeholder="비밀번호 확인" />
                                                <label>비밀번호 확인</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userTel" type="tel" placeholder="전화번호" />
                                                <label>전화번호</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userEmail" type="email" placeholder="이메일 주소" />
                                                <label>이메일 주소</label>
                                            </div>
                                            <div class="mb-3">
                                                <select name = "userLevel" class="form-control">
                                                    <option>▶ 직급 선택</option>
                                                    <option value = "사원">사원</option>
                                                    <option value = "주임">주임</option>
                                                    <option value = "대리">대리</option>
                                                    <option value = "과장">과장</option>
                                                    <option value = "차장">차장</option>
                                                    <option value = "부장">부장</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <select name = "userDpmt" class="form-control">
                                                    <option>▶ 부서 선택</option>
                                                    <option value = "개발">개발</option>
                                                    <option value = "회계">회계</option>
                                                    <option value = "제조">제조</option>
                                                    <option value = "생산">생산</option>
                                                    <option value = "업무 지원">업무 지원</option>
                                                </select>
                                            </div>
											<div class="form-group">
												<input class="form-control btn btn-primary rounded submit px-3" type="submit" value="사용자 등록">
											</div>
									</form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="loginForm.do">로그인</a></div>
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
