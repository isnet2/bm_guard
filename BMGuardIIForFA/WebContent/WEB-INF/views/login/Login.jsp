<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery.form.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/jquery.cookie.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/common/common.util.js"></script>

<script type="text/javascript">
//<![CDATA[
	$(document).ready(function() {
		
		$("#loginForm").ajaxForm(LoginFormCallBack);
		$("#loginForm").submit(function(){return false;});
		
		//로그인 버튼 클릭
		$("#loginBtn").bind("click", function() {
			loginCheckSubmit();
		});

		$("#login_pwd").keydown(function(e) {
			if (e.keyCode == 13) {
				loginCheckSubmit();
			}
		});
		
		//비밀번호 재설정 버튼 클릭  
		$("#changePasswordBtn").bind("click", function() {
			
			//location.href = "PasswordChangePage";	
			window.open("/ChangePassWord.html");
			return false;
		});

	});

	function loginCheckSubmit() {
		if ($("#login_id").val() == "") {
			alert("아이디를 입력하여 주세요.");
			return false;
		} else if ($("#login_pwd").val() == "") {
			alert("비밀 번호를 입력하여 주세요.");
			return false;
		} 
		//로그온
		$("#loginForm").attr("action","/LoginCheck.html");
		$("#loginForm").submit();
		
	}
	
	//로그인 결과값 
	function LoginFormCallBack(data,state){

		data = data.removePre();
		var jsonStr = eval("("+data+")");
		if(jsonStr != null) {
			if(jsonStr.result == 1){
				location.href="/index.html";				
			}else{
				alert(jsonStr.msg);
			}
		} 
		return false;
	}
//]]>
</script>

</head>
<body>
	<form id="loginForm" name="loginForm" action="/login/Login.html" method="post">
		I D : <input type="text" id="login_id" name="login_id"> <br>
		PWD : <input type="password" id="login_pwd" name="login_pwd"> <br>
		<input type="button" id="loginBtn" value="확인">
        <input type="button" id="changePasswordBtn" value="비밀번호 재설정"><br>

	</form>
</body>
</html>