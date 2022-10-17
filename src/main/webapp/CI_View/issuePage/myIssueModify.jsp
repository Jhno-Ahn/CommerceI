<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/CI_View/header.jsp"%>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center" style="margin-bottom: 30px;">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">업무 요청</h3></div>
                                    <div class="card-body">
                                        <form action="issuePage/myIssueModifyPro.do"  method="post" accept-charset="utf-8" enctype="multipart/form-data">
                                        <input type="hidden" name="issueNum" value="${issueNum}">
                                        <input type="hidden" name="userId" value="${userId}">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="issueTitle" type="text" placeholder="title" value="${dto.issueTitle}"/>
                                                <label>제목</label>
                                            </div>
                                             <div class="form-floating mb-3">
                                                <input class="form-control" name="issueWriter" type="text" value="${userId}" readonly />
                                                <label>작성자</label>
                                            </div>
                                            <div class="mb-3">
                                                <select name="issueType" class="form-control">
                                                    <option>▶업무 유형 선택</option>
                                                    <option value = "건의">건의</option>
                                                    <option value = "개선요청">개선요청</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <select name="issueDpmt" class="form-control">
                                                    <option>▶부서 선택</option>
                                                    <option value = "개발">개발</option>
                                                    <option value = "회계">회계</option>
                                                    <option value = "제조">제조</option>
                                                    <option value = "생산">생산</option>
                                                    <option value = "업무지원">업무지원</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <select name="issueOpt" class="form-control">
                                                	<option>▶공개 여부 선택</option>
                                                    <option value="공개" >공개</option>
                                                    <option value="비공개" >비공개</option>
                                                </select>
                                            </div>
                                            <div class="form-floating mb-3">
                                                    <textarea style="width:100%; height:300px;"  name="issueContent" placeholder="  업무 내용">${dto.issueContent}</textarea>
                                            </div>
                                            <div>
                                                <input name="issueFile" type="file" class="form-control"/>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input id="modifyIssue" type="submit" class="btn btn-primary btn-block" value="수정하기"></div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
	<script type="text/javascript">
               $(document).ready(
               function() {
            	   var all = $("form[name=modify]").serialize();
            	   $("input[id = modifyIssue]").on(
                     "click",
                     function(event) {
                        $.ajax(
                           {
                              type : "POST",
                              enctype: "multipart/form-data",
                              url : "issuePage/myIssueModifyPro.do",
                              data : {
                            	  all,
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
	</script>
</html>
