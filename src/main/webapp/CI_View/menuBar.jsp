<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
        <!-- =============================================   menu bar   ========================================== -->
        <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading" id = "menuBar">MY ISSUE</div>
                            <input type = "button" class="nav-link"  id = "issueKind">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                마이 이슈
                            <div type = "button" class="nav-link"  id = "confirm">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                승인 리스트(컨펌창)
                            </div>
                            <div class="sb-sidenav-menu-heading" id = "menuBar">MAIN</div>
                               <div type = "button" class="nav-link" id = "RegisterIssue">
                                   <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                   이슈 등록
                               </div>
                                <div type = "button" class="nav-link"  id = "issueList">
                                  <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                  이슈 게시판
                              </div>
                              <div type = "button" class="nav-link"  id = "confirm">
                                  <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                  이슈 완료 게시판
                              </div>
                            <div class="sb-sidenav-menu-heading" id = "menuBar">MY PAGE</div>
                            <input type = "button" class="nav-link"  id = "myInformationChange">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                내 정보 변경
                             <div type = "button" class="nav-link"  id = "organization">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                조직도 보기
                            </div>
                             <input type = "button" class="nav-link"  id = "userSearch">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                회원 조회
                        </div>
                  </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>