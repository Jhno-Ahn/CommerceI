$(document).ready(
	function() {
		//리스트 불러오기
		$("div[id = issueKind]").on(
			"click",
			function(event) {
				$.ajax(
					{
						type: "POST",
						url: "issuePage/issueKind.do",
						//처리한다음에 아이디 돌려줄 파일
						data: {

						},
						dataType: "text",
						success: function(data) {
							$(".content").html(data);
							//id가 idcheck인 애한테 data를 출력시킨다는 뜻
						},
						error: function(error) {
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
						type: "POST",
						url: "userPage/userModify.do",
						//처리한다음에 아이디 돌려줄 파일
						data: {
							userId: "${dto.userId}"
						},
						dataType: "text",
						success: function(data) {
							$(".content").html(data);
							//id가 idcheck인 애한테 data를 출력시킨다는 뜻
						},
						error: function(error) {
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
						type: "POST",
						url: "userPage/userModifyForm.do",
						//처리한다음에 아이디 돌려줄 파일
						data: {
							inputUserPasswd: $("input[id=userPasswdCheck]").val(),
						},
						dataType: "text",
						success: function(data) {
							$(".content").html(data);
							//id가 idcheck인 애한테 data를 출력시킨다는 뜻
						},
						error: function(error) {
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
						type: "POST",
						url: "userPage/userSearch.do",
						//처리한다음에 아이디 돌려줄 파일
						data: {

						},
						dataType: "text",
						success: function(data) {
							$(".content").html(data);
							//id가 idcheck인 애한테 data를 출력시킨다는 뜻
						},
						error: function(error) {
							$(".content").html(error);
						}
					}
				)
			}
		);
		$("div[id = userSearchButton]").on(
			"click",
			function(event) {
				$.ajax(
					{
						type: "POST",
						url: "userPage/userSearch.do",
						//처리한다음에 아이디 돌려줄 파일
						data: {
							searchWord: "이규민"
						},
						dataType: "text",
						success: function(data) {
							$(".content").html(data);
							//id가 idcheck인 애한테 data를 출력시킨다는 뜻
						},
						error: function(error) {
							$(".content").html(error);
						}
					}
				)
			}
		);
	}
);