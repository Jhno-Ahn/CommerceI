<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
</head>
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
               <c:forEach items="${dtos}" var="dto">
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
<script src="/Commerce_I/js/jquery-3.6.0.js"></script>
      <script type="text/javascript">
         $(document).ready(
      function() {
      //리스트 불러오기
      var userId = '<c:out value ="${userId}"/>'
      $("input[id = leftButton]").on(
            "click",
            function(event) {
               var pageNum = '<c:out value ="${startPage - pageBlock}"/>'
               $.ajax(
                  {
                     type : "GET",
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
                     type : "GET",
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