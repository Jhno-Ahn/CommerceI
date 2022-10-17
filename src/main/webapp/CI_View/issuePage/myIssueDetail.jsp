<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
.updown {
		border-bottom : 3px solid white;
    	width : 20%;
    	background-color : #F2F2F2;
    }
</style>
<%@ include file="/CI_View/header.jsp"%>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center" style="margin-bottom: 30px;">
                            <div>
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">작성 업무 상세</h3></div>
                                    <div class="card-body">
                                    <!-- ============== 여기부터 form  -->
                                    <table>
                                    <input type="hidden" id="issueNum" value="${dto.issueNum}" />
										<tr>
											<th class="updown">유형</th>
											<td>${dto.issueType}</td>
											<th class="updown" >글제목</th>
											<td>${dto.issueTitle}</td>
										</tr>
										<tr>
											<th class="updown">작성자</th>
											<td>${dto.issueWriter}</td>
											<th class="updown">진행상태</th>
											<td>${dto.issueStmt}</td>
										</tr>
										<tr>
											<th class="updown">담당자</th>
											<td>${dto.issueManager}</td>
											<th class="updown">담당부서</th>
											<td>${dto.issueDpmt}</td>
										</tr>
										<tr>
											<th class="updown">등록일자</th>
											<td>${dto.issueDate}</td>
											<th class="updown">완료일자</th>
											<td>${dto.issueEndDate}</td>
										</tr>
										<tr>
											<th class="updown">공개여부</th>
											<td>${dto.issueOpt}</td>
											<th class="updown">거절여부</th>
											<td>${dto.issueRefuse}</td>
										</tr>
										<tr>
											<th class="updown">글내용</th>
											<td colspan="4">
												<pre style="white-space:normal;">${dto.issueContent}</pre>
											</td>
										</tr>
                                 	</table>
                                </div>
                                	    <div class="card-footer text-center py-3">
                                       		<input  type="button" id="backMyIssue" class="btn btn-primary" value="삭제하기"/>
                                       	    <input  type="button" id="modifyMyIssue" class="btn btn-primary" value="수정하기"/>
                                       	    <input  type="button" id="backMyIssue" class="btn btn-primary" value="뒤로가기"/>
                                	    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center" style="margin-bottom: 30px;">
                        	<table>
                        		<tr>
	                        		<th>첨부파일</th>
	                        		<td>
	                        			${dto.issueFile}
	                        		</td>
                        		</tr>
                        	</table>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script>
        $(document).ready(
				function() {
				$("input[id = backMyIssue]").on(
						"click",
						function(event) {
							$.ajax(
								{
									type : "POST",
									url : "issuePage/myIssue.do",
									data : {
										
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
				$("input[id = modifyMyIssue]").on(
						"click",
						function(event) {
							$.ajax(
								{
									type : "GET",
									url : "issuePage/myIssueModify.do",
									data : {
										issueNum : $("input[id=issueNum]").val(),
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
    </body>
</html>
