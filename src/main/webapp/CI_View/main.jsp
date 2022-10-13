<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html lang="en">
    <%@ include file="header.jsp"%>
    <style>
       div#menuBar {
          color : white;
       }
       #nav_left {
            float:left !important;
       }
       #nav_light {
            float:right !important;
       }
       #pageButton {
          width : 100%;
          margin-left:auto;
          margin-right:auto;
          text-align:center;
       }
       .pageButtonul {
          display:inline-block;
          text-align:center;
          width : 100%;
       }
       .pageButtonul li{
             text-decoration:none;
          display:inline-block;
       }
       .mainBar {
             color : white;
             background-color : black;
             border : 0px;
       }
    </style>
    
    <body class="sb-nav-fixed sb-nav-fixed" style="width:80%; margin: 0 auto;" >
    <div id = "main">
          <!-- ========================================   Header 부분   ========================================= -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-black" id = "nav">
            <!-- Navbar Brand-->
            <div class="navbar-brand ps-3" id = "nav_left"><input type="button" class="mainBar" onclick="location.href='main.do?userId=${dto.userId}'" value="Commerce_I"></div>
            <!-- Navbar Search-->
            <div class="navbar-brand" style="margin-right:5%;" ><b>${dto.userName}</b>${dto.userLevel}님, 안녕하세요.</div>
            <c:set var = "userId" value = "${dto.userId}"/>
            <!-- ===================================   Header에 부분   =========================================== -->
        </nav>
        <div id="layoutSidenav">
        <!-- =============================================   menu bar   ========================================== -->
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading" id = "menuBar">MY ISSUE</div>
                            <div type = "button" class="nav-link"  id = "myIssue">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                나의 업무 보기
                            </div>
                            <div type = "button" class="nav-link"  id = "confirm">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                승인/거절 업무 보기
                            </div>
                            <div class="sb-sidenav-menu-heading" id = "menuBar">MAIN</div>
                               <div type = "button" class="nav-link" id = "issueWrite">
                                   <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                   업무 요청 등록
                               </div>
                              <div type = "button" class="nav-link"  id = "confirm">
                                  <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                  완료된 업무 보기
                              </div>
                            <div class="sb-sidenav-menu-heading" id = "menuBar">MY PAGE</div>
                            <div type = "button" class="nav-link"  id = "myInformationChange">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                내 정보 변경
                            </div>
                             <div type = "button" class="nav-link"  id = "organization">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                조직도 보기
                            </div>
                             <div type = "button" class="nav-link"  id = "userSearch">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                사용자 조회
                             </div>
                             <div type = "button" class="nav-link"  id = "logOut" onclick = "location.href='userPage/logOut.do';">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                로그 아웃
                             </div>
                            
                        </div>
                  </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
        <!-- =============================================   menu bar   ========================================== -->
            <div id="layoutSidenav_content">
         <div class="content">
            <div>
               <h1 class="mt-4">&nbsp;&nbsp;전체 게시판</h1>
            </div>
            <br>
            <div class="card mb-4">
               <div class="card-header">
                  <div style="margin-left: 30px;">
                     <i class="fas fa-table me-1"></i> 키워드로 검색 &nbsp; <input type="text"
                        placeholder="검색어 입력" id="userSearchInput"> <input
                        type="button" id="userSearchButton" value="검색">
                  </div>
                  <div class="card-body">
                     <table>
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th>유형</th>
                              <th>제목</th>
                              <th>작성자</th>
                              <th>등록일자</th>
                              <th>진행상태</th>
                              <th>담당자</th>
                              <th>담당부서</th>
                           </tr>
                        </thead>
                        <tbody style="text-align:center;">
                        <c:if test="${count == 0}">
                           <tr>
                              <td colspan="6" style="text-align:center">sss</td>
                           </tr>
                        </c:if>
                        <c:if test="${count != 0}">
                           <c:set var="number" value="${number}"/>
                           <c:forEach var="dto" items="${dtos}">
                              <tr>
                                 <td style="text-align:center">
                                    ${number}
                                    <c:set var="number" value="${number-1}"/>
                                 </td>
                                 <td>${dto.issueType}</td>
                                 <td>${dto.issueTitle}</td>
                                 <td>${dto.issueWriter}</td>
                                 <td>${dto.issueDate}</td>
                                 <td>${dto.issueStmt}</td>
                                 <td>${dto.issueManager}</td>
                                 <td>${dto.issueDpmt}</td>
                              </tr>
                           </c:forEach>
                        </c:if>
                        </tbody>
                     </table>
                     <br>
                     <div id = "pageButton">
                     <ul class="pageButtonul">
                     <c:set var = "userId" value = "${dto.userId}"/>
                        <c:if test="${count gt 0}">
                           <c:if test="${startPage gt pageBlock}">
                              <c:set var = "leftPageNum" value = "${startPage - pageBlock}"/>
                              <li><input type = "button" id = "leftButton" value = "◀"></li>
                           </c:if>
                           <c:forEach var="i" begin="${startPage}" end="${endPage}">
                              <c:if test="${i == currentPage}">
                                 <li><b>[${i}]</b></li>
                              </c:if>
                              <c:if test="${i != currentPage}">
                                 <li><input type = "button" id = "otherPage" value = "${i}"></li>
                              </c:if>
                           </c:forEach>
                           <c:if test="${pageCount gt endPage}">
                              <c:set var = "rightPageNum" value = "${startPage + pageBlock}"/>
                              <li><input type = "button" id = "rightButton" value = "▶"></li>
                           </c:if>
                        </c:if>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <!-- ======================================================================== -->
         </div>
         <!-- ======================================   Footer 부분   ================================== -->
            </div>
            <script src="/Commerce_I/js/jquery-3.6.0.js"></script>
             <script type="text/javascript">
                  $(document).ready(
               function() {
               var userId = '<c:out value ="${dto.userId}"/>'
               //리스트 불러오기
               $("div[id = myIssue]").on(
                     "click",
                     function(event) {
                        $.ajax(
                           {
                              type : "POST",
                              url : "issuePage/myIssue.do",
                              //처리한다음에 아이디 돌려줄 파일
                              data : {
                                 
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
				$("div[id = confirm]").on(
						"click",
						function(event) {
							$.ajax(
								{
									type : "GET",
									url : "issuePage/issueConfirm.do",
									//처리한다음에 아이디 돌려줄 파일
									data : {
										userId : userId,
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
               $("div[id = myInformationChange]").on(
                     "click",
                     function(event) {
                        $.ajax(
                           {
                              type : "POST",
                              url : "userPage/userModify.do",
                              //처리한다음에 아이디 돌려줄 파일
                              data : {
                                 userId : "${dto.userId}"
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
               $("div[id = modifyCheck]").on(
                     "click",
                     function(event) {
                        $.ajax(
                           {
                              type : "POST",
                              url : "userPage/userModifyForm.do",
                              //처리한다음에 아이디 돌려줄 파일
                              data : {
                                 inputUserPasswd : $("input[id=userPasswdCheck]").val(),
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
               $("div[id = userSearch]").on(
                     "click",
                     function(event) {
                        $.ajax(
                           {
                              type : "POST",
                              url : "userPage/userSearch.do",
                              //처리한다음에 아이디 돌려줄 파일
                              data : {
                                 
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
               $("div[id = issueWrite]").on(
                     "click",
                     function(event) {
                        $.ajax(
                           {
                              type : "POST",
                              url : "issuePage/issueWriteForm.do",
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
               //=========================================================================================
               $("input[id = leftButton]").on(
                     "click",
                     function(event) {
                        var pageNum = '<c:out value ="${startPage - pageBlock}"/>'
                        $.ajax(
                           {
                              type : "POST",
                              url : "issueList.do",
                              data : {
                                 pageNum : pageNum,
                                 userId : userId,
                              },
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
               $("input[id=otherPage]").each(
                     function(index, item) {
                        $($("input[id=otherPage]")[index]).on(
                           "click",
                           function(event) {
                              $.ajax(
                                 {
                                    type : "POST",
                                    url : "issueList.do",
                                    data : {
                                       pageNum : $($("input[id=otherPage]")[index]).val(),
                                       userId : userId,
                                    },
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
               $("input[id = rightButton]").on(
                     "click",
                     function(event) {
                        var pageNum = '<c:out value ="${startPage + pageBlock}"/>'
                        $.ajax(
                           {
                              type : "POST",
                              url : "issueList.do",
                              data : {
                                 pageNum : pageNum,
                                 userId : userId,
                              },
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
         </div>
         </div>
    </body>
</html>