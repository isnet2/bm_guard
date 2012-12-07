<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>passwordChange</title>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery.form.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/jquery.cookie.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/common/common.util.js"></script>

<script type="text/javascript">
//<![CDATA[
     
	$(document).ready(function() {
		
		$("#pwdQuestionForm").ajaxForm(pwdQuestionCallBack);
		$("#pwdQuestionForm").submit(function(){return false;}); 
		
		$("#changePasswordform").ajaxForm(changePasswordformCallBack);
		$("#changePasswordform").submit(function(){return false;}); 
		
		$("#pwdQuestionChkBtn").click(function(){
			idCheckSubmit();
		});
		
		$("#pwdAnserChkBtn").click(function(){
			pwdAnserCheckSubmit();	
		});
		
		$("#regiBtn").click(function() {
			vaildation();
		});

	});
	
	function idCheckSubmit() {
		if($("#login_id").val().length == '0' ) {
			alert("아이디를 입력하여 주세요.");
			$("#login_id").focus();
			return false;
		}
		$("#pwdQuestionForm").attr("action","/FindByPwdQues.html");
		$("#pwdQuestionForm").submit();	
		
	}
	
	function pwdAnserCheckSubmit() {
		if($("#pwd_ques_flag").val() =='0'){
			alert("질문을 먼저 확인해 주세요.");
			$("#login_id").focus();
			return false;
		}
		if($("#pwd_ans").val().length=='0') {
			alert("답변을 입력해 주세요.");
			$("#pwd_ans").focus();
			return false;			
		}
	}
	
	function vaildation(){
		
		
		//비밀번호 일치 여부 체크
		if ($("#login_pwd").val().length == '0' ) {
			alert("비밀번호를 입력주세요.");
			$("#login_pwd").focus();
			return false;
		}

		if ($("#login_pwd").val() != $("#login_pwd_re").val() ) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#login_pwd_re").focus();
			return false;
		}
		

		$("#changePasswordform").submit();	
	}
	
	
	//질문 조회 결과값 
	function pwdQuestionCallBack(data,state){
		data = data.removePre();
		var jsonStr = eval("("+data+")");
		if(jsonStr != null) {
			if(jsonStr.result == 1){
				$("#pwd_ques_flag").val(jsonStr.result);
				var innerHtml ="";
				innerHtml += "<input type='text' id='pwd_ques' value='"+jsonStr.pwd_ques+"' readOnly>";
				$("div[id='pwdQuestion']").html("");
				$("div[id='pwdQuestion']").append(innerHtml);				
			}else{
				alert(jsonStr.msg);
				window.close();
			}
		} else {
			alert('에러가 발생하였습니다.결과값이 올바르지 않습니다.');
		}
	}
	
	//패스워드 변경 결과값 
	function changePasswordformCallBack(data,state){
		
		data = data.removePre();
		
		var jsonStr = eval("("+data+")");
		
		if(jsonStr != null) {
		
			if(jsonStr.result == 1){
				alert("비밀번호 변경 성공");
					location.href="Login.html";

			}else{
				alert("비밀번호 변경 실패");
					location.href="Login.html";
			}
		} else {
			alert('에러가 발생하였습니다.결과값이 올바르지 않습니다.');
		}
	}
//]]>
</script>

</head>
<body>
	<form id="pwdQuestionForm">
		<table>
			<tr>
				<td>아이디 : <input type="text" id="login_id" name="login_id"> <input type="button" id="pwdQuestionChkBtn" value="질문확인"></td>
			<tr>
			<tr>
				<td>질    문 : <div id="pwdQuestion"></div></td>
				<input type="hidden" id="pwd_ques_flag" value="0">
			</tr>
			<tr>
				<td>답    변 : <input type="text" id="pwd_ans"><input type="button" id="pwdAnserChkBtn" value="답변확인"><br></td>
			</tr>
		</table>	
	</form>
	<div id="newPwd" style="display:none">
		<form id="changePasswordform" name="changePasswordform" action="/login/PasswordChangePage" method="post">	
			<table>
				<tr> 
					<td>New PWD : <input type="text" id="login_id" name="login_id"></td>
				</tr>
				<tr> 
					<td>Confirm PWD : <input type="text" id="login_id_re" name="login_id_re"></td>
				</tr>
				<tr>
					<td>
					<input type="button" id="regiBtn" value="확인"> 
					<input type="button" id="winClose" value="닫기" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>