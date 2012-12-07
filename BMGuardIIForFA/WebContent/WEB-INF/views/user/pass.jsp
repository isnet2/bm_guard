<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb1" value="active" />
<c:set var="gnb1_1" value="on" />
<c:set var="gnb" value="사용자관리" />
<c:set var="gnb_sub" value="비밀번호 관리" />
<c:set var="tab_1d" value="비밀번호 변경" />
<%@ include file="../common/inc/header.jsp" %>
<?php 
$gnb1="active"; //GNB_1depth
$gnb1_1="on"; //GNB_2depth
$gnb="사용자관리";
$gnb_sub="관리자 비밀번호";
$tab_1d="비밀번호변경";
include "../common/inc/header.html";
?>
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="pass.html">비밀번호 변경</a></li>
		<li><a href="first_pass.html">비밀번호 재설정 질문/답변</a></li>
	</ul>


</nav>
</header>
	<form id="changePasswordform">
	<article>
		<%--
		<%@ include file="../common/inc/direction.jsp" %>
		--%>
		<%@ include file="../common/inc/direction.jsp" %>
		<figure>사용자관리</figure>
		<section class="user_pass">
		<h2>비밀번호 변경</h2>
		<table class="table_pass">
			<colgroup>
				<col style="width:180px">
				<col style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" id="login_pwd" name="login_pwd" maxlength="12" /></td>			
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="password" id="new_pwd" name="new_pwd" maxlength="12" /></td>				
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><input type="password" id="new_pwd_re" name="new_pwd_re" maxlength="12" /></td>			
				</tr>
	
			</tbody>
		</table>
		<p class="btn_center">
			<a href="#" id="regiBtn" class="btn setp15"><span>확인</span></a>
		</p>

	</section>
	
	</article>
</form>
<%-- 
<? include "../common/inc/footer.html";?>
--%>
<%@ include file="../common/inc/footer.jsp" %>

<!-- Load jQuery, SimpleModal and Basic JS files -->
<script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/jquery.form.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>
<script type="text/javascript">
//<![CDATA[

	$(document).ready(function() {
		//help
		$("#helpBtn1").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help1-1");
			//e.preventDefault();
			return false;
		});
		
		$("#login_pwd").focus();
		/*비밀번호 수정*/
		$("#changePasswordform").ajaxForm(changePasswordformCallBack);
		$("#changePasswordform").submit(function(){return;}); 
		
		$("#regiBtn").click(function() {
			vaildation();
		});
		
		$("#regiBtn").click(function() {
			$("#new_pwd").val("");
			$("#new_pwd_re").val("");
		});
	});
	
	function vaildation(){
		
		
		//비밀번호 일치 여부 체크
		if ($("#login_pwd").val().length == '0' ) {
			alert("현재 비밀번호를 입력하여 주세요.");
			$("#login_pwd").focus();
			return;
		}
		
		if ($("#new_pwd").val().length == '0' ) {
			alert("비밀번호를 입력하여 주세요.");
			$("#new_pwd").focus();
			return;
		}else {
			
			var str = $("#new_pwd").val();
			//alert(str.trim().length);
			if(str.trim().length >= 7){ 
				if(str.trim().length <= 12){}
				else {
					alert("비밀번호는 7자이상 12자 이내로 입력하여 주세요.");	
					return;
				}

			}else {
				alert("비밀번호는 7자이상 12자 이내로 입력하여 주세요.");	
				return;
			}
			
			var re1 = /[a-zA-Z]/i; // 영문
			var re2 = /[0-9]/i; // 숫자
			var re3 = /[\~'@!#\$\^%&*()+=\-\[\]\\\';,\.\/\{\}\|\":<>\?]/i; // 특수기호
			var re4 = /^[a-zA-Z0-9@!#\$\^%&*()+=\-\[\]\\\';,\.\/\{\}\|\":<>\?]+$/i; // 영문/숫자/특수기호 외 한글여부체크
			if (re1.test(str) && re2.test(str) && re3.test(str) && re4.test(str)) {
			} else {
				alert("특수기호/숫자/영문 각 1자이상 포함하여 주세요.");
				return;
			}
		}
		
		

		if ($("#new_pwd").val() != $("#new_pwd_re").val() ) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#new_pwd_re").focus();
			return;
		}
		
		$("#changePasswordform").attr("action","/ChangePassWord.html");	
		$("#changePasswordform").attr("method","POST");
		$("#changePasswordform").submit();	
	}
	
	//패스워드 변경 결과값 
	function changePasswordformCallBack(data,state){
		
		data = data.removePre();
		
		var jsonStr = eval("("+data+")");
		
		if(jsonStr != null) {
			if(jsonStr.result == 1){
				alert(jsonStr.msg);
			}else{
				$("#login_pwd").val("");
				alert(jsonStr.msg);
			}
		} else {
			alert('에러가 발생하였습니다.결과값이 올바르지 않습니다.');
		}
	}
	
//]]>
</script>