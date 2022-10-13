/**
 * CI_User !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */

var userTelMsg = "전화번호를 입력하세요.";
var userComNumMsg = "사번을 6자리에 맞춰 입력해 주세요";
var userIdMsg = "아이디를 입력하세요";
var userPasswdMsg = "비밀번호를 입력하세요";
var userEmailMsg = "이메일을 입력하세요";
var userLevelMsg = "직급을 선택해주세요";
var userDpmtMsg = "부서를 선택해주세요";
var userNameMsg = "이름을 입력해주세요";

var confirmUserIdMsg = "아이디 중복확인을 해주세요";
var userComNumCheckMsg = "사번 중복확인을 해주세요";
var userRePasswdMsg = "비밀번호 입력이 다릅니다";

var regError = "회원가입에 실패했습니다.\n 잠시후 다시 시도하세요.";
var userIdError = "입력하신 아이디가 없습니다. \n 다시 확인하세요";
var userPasswdError = "입력하신 비밀번호가 다릅니다. \n 다시 확인하세요";
var modifyError = "회원정보수정에 실패했습니다. \n 잠시후 다시 시도해 주세요";


//  아이디 중복확인
function confirmUserId() {
	if(!regInputForm.userId.value){
		alert(userIdMsg);
		regInputForm.userId.focus();
		return false;
	}
	var url = "confirmUserId.do?userId=" + regInputForm.userId.value;
	window.open(url, "confirm", "menubar=no, scrollbar=no, status=no, width=800, height=600");
}

// 사번 중복확인
function confirmUserComNum() {
	if(!regInputForm.userComNum.value) {
		alert(userComNumMsg);
		regInputForm.userComNum.focus();
		return false;
	}
	else if(regInputForm.userComNum.value.length != 6) {
		alert(userComNumMsg);
		regInputForm.userComNum.focus();
		return false;
	}
	var url = "confirmUserComNum.do?userComNum=" + regInputForm.userComNum.value;
	window.open(url, "confirm", "menubar=no, scrollbar=no, status=no, width=800, height=600");
}

// =====================================================================================================


function erroralert(msg) {
	alert(msg);
	history.back();
}

function AjaxErrorAlert(msg) {
	alert(msg);
	
}

// 회원정보 수정
function modifyInputCheck() {
	if( ! modifyForm.userPasswd.value){
		alert(passwdMsg);
		modifyForm.userPasswd.focus();
		return false;
	}else if (modifyForm.userPasswd.value != modifyForm.userRePasswd.value){
		alert(rePasswdMsg);
		modifyForm.userPasswd.focus();
		return false;
	}
}


function setUserId(userId){
	opener.document.regInputForm.userIdCheck.value= "1";
	opener.document.regInputForm.userId.value = userId;
	// window.close();		// 이게되네
	//close();
	self.close();
}


function setOk(){
	//window.close();
	//close();
	self.close();
}



function setUserComNum(userComNum){
	opener.document.regInputForm.userComNumCheck.value= "1";
	opener.document.regInputForm.userComNum.value = userComNum;
	//window.close();
	//close();
	self.close();
	
}



/**
function setnickname(nickname){
	opener.document.regInputForm.nick_name_check.value= "1";
	opener.document.regInputForm.nick_name.value = nickname;
	//window.close();
	//close();
	self.close();
}
*/
// ========================================== 회원 가입 ==================================================

//   회원 가입 ( 입력값 누락및 잘못된거 체크)
function regInputCheck() {
	
	// 아이디 입력 확인
	if( regInputForm.userIdCheck.value == "0"){
		alert(confirmUserIdMsg);
		regInputForm.userId.focus();
		return false;
	// 사번 중복확인 사용 검사
	}
	else if(regInputForm.userComNumCheck.value == "0"){
		alert(userComNumCheckMsg);
		regInputForm.userComNum.focus();
		return false;
	}
	// 비밀번호 1차 2차 입력 유효성 확인 
	else if( regInputForm.userPasswd.value != regInputForm.userRePasswd.value){
		alert(userRePasswdMsg);
		regInputForm.userPasswd.focus();
		return false;
	}
	// 사원번호 입력 확인 (이러면서 미입력단도 걸러내기)
	else if(regInputForm.userComNum.value.length != 6){
		alert(userComNumMsg);
		regInputForm.userComNum.focus();
		return false;
	// 이름 미입력 확인단
	}
	else if(!regInputForm.userName.value) {
		alert(userNameMsg);
		regInputForm.userName.focus();
		return false;
	}
	// 비번 미입력 확인단
	else if(!regInputForm.userPasswd.value) {
		alert(userPasswdMsg);
		regInputForm.userPasswd.focus();
		return false;
	}
	// 전화번호 미입력 확인단
	else if(!regInputForm.userTel.value) {
		alert(userTelMsg);
		regInputForm.userTel.focus();
		return false;
	}
	// 이메일 미입력 확인단
	else if(!regInputForm.userEmail.value) {
		alert(userEmailMsg);
		regInputForm.userEmail.focus();
		return false;
	}
	// 직급 미입력 확인단
	else if(!regInputForm.userLevel.value) {
		alert(userLevelMsg);
		regInputForm.userLevel.focus();
		return false;
	}
	// 부서 미입력 확인단
	else if(!regInputForm.userDpmt.value) {
		alert(userDpmtMsg);
		regInputForm.userDpmt.focus();
		return false;
	}	
	
	
}

	



function confirmUserPasswd(userPasswd) {
	if(!userPasswdCheckForm.userPasswd.value) {
		alert(userRePasswdMsg);
		userPasswdCheckForm.userPasswd.focus();
		return false;
		
		
		
	} else if (userPasswdCheckForm.userPasswd.value != userPasswd) {
		alert(userRePasswdMsg);
		userPasswdCheckForm.userPasswd.focus();
		return false;
	}
}


//  컴핌창 중복확인 아이디
function confirmUserIdCheck() {
	if(!userIdConfirmForm.userId.value ){
		alert(userIdMsg);
		//idconfirmform.userId.focus();
		return false;
	}
}
//  컴핌창 중복확인 사번
function confirmUserComNumCheck() {
	if(!userComNumConfirmForm.userComNum.value ){
		alert(userComNumMsg);
		//cnumconfirmform.userComNum.focus();
		return false;
	}
}



/*
function confirmnicknamecheck() {
	if (!confirmform.nick_name.value) {
		alert(nick_namemsg);
		regInputForm.nick_name.focus();
		return false;
	}
}
*/

//=============================================================  inputcheck() ==========================================================================

//   메인페이지

/*
function mainCheck() {
	if( ! mainform.id.value){
		alert( idmsg );
		mainform.id.focus();
		return false;
	} else if(! mainform.passwd.value){
		alert( passwdmsg);
		mainform.passwd.focus();
		return false;
	}
}
*/

function loginCheck() {
	if( !loginForm.userId.value) {
		alert(userIdMsg);
		loginForm.userId.focus();
		return false;
	} else if ( !loginForm.userPassword.value){
		alert(userPasswdMsg);
		loginForm.userPassword.focus();
		return false;
		
	}
}


// ===================================================

/* 영식 추가해본 부분 1차 정보수정 진입후 비번이 틀렸을경우 어디든 페이지 이동시켜준다음에 띄울용 */
function modiresult(userPasswd,userRealPasswd) {
	if( userPasswd != userRealPasswd) {
		alert(userRePasswdMsg);
	}
}

