<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb1" value="active" />
<c:set var="gnb1_1" value="on" />
<c:set var="gnb" value="사용자관리" />
<c:set var="gnb_sub" value="비밀번호 관리" />
<c:set var="tab_1d" value="비밀번호 재설정 질문/답변" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$gnb1="active"; //GNB_1depth
$gnb1_1="on"; //GNB_2depth
$gnb="사용자관리";
$gnb_sub="관리자 비밀번호";
$tab_1d="비밀번호 초기화 질문/답변";
include "../common/inc/header.html";
?>
--%>
<nav class="tab_1depth">
	<ul>
		<li><a href="pass.html">비밀번호 재설정</a></li>
		<li class="on"><a href="first_pass.html">비밀번호 재설정 질문/답변</a></li>
	</ul>
</nav>
</header>
<form id="changePwdQuesAnsform" >
<article>
	<%@ include file="../common/inc/direction.jsp" %>
	
	<figure>사용자관리</figure>
	<section class="user_pass">
	<h2>비밀번호 재설정 질문/답변</h2>
	<table class="table_pass">
		<colgroup>
			<col style="width:180px">
			<col style="width:*">
		</colgroup>
		<tbody>
			<tr>
				<th>질문</th>
				<td>
					<input type="text" id="pwd_ques" name="pwd_ques" value="${pwdQues}" maxlength="40" class="w50"/>
					<input type="hidden" id="pwd_ques_old" name="pwd_ques_old" value="${pwdQues}" maxlength="40" class="w50"/>
				</td>			
			</tr>
			<tr>
				<th>답변</th>
				<td>
					<input type="text" id="pwd_ans" name="pwd_ans" value="${pwdAns}" maxlength="40" class="w50"/>
					<input type="hidden" id="pwd_ans_old" name="pwd_ans_old" value="${pwdAns}" maxlength="40" class="w50"/>
				</td>				
			</tr>
		</tbody>
	</table>

	<p class="btn_center">
		<a href="#"  class="btn setp15" id="registBtn"><span>확인</span></a>
		<a href="#"  class="btn setp15" id="cancelBtn"><span>취소</span></a>
	</p>

	</section>

</article>
</form>
<%-- 
<? include "../common/inc/footer.html";?>
--%>
<%@ include file="../common/inc/footer.jsp" %>

<script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/jquery.form.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>
<script type="text/javascript">
//<![CDATA[
	var quesCnt = 0;
	var ansCnt = 0;
	var strQues = '${pwdQues}';
	var strAns = '${pwdAns}';

	$(document).ready(function() {
		
		//help
		$("#helpBtn1").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help1-1-1");
			//e.preventDefault();
			return false;
		});
		
		/*질문답변 변경*/
		$("#changePwdQuesAnsform").ajaxForm(changePwdQuesAnsformCallBack);
        $("#changePwdQuesAnsform").submit(function(){return;});

		$("#pwd_ques").focusin(function() {
			quesCnt++;
			if(quesCnt ==1) {
				$("#pwd_ques").val("");
			} 
		});
		
		$("#pwd_ans").focusin(function() {
			ansCnt++;
			if(ansCnt ==1) {
				$("#pwd_ans").val("");
			} 
		});
		$("#cancelBtn").click(function() {
			quesCnt = 0;
			ansCnt = 0;
			$("#pwd_ques").val(strQues);
			$("#pwd_ans").val(strAns);
		});
		
		$("#registBtn").click(function() {
			if(validation()) {
				$("#changePwdQuesAnsform").attr("action","/ChangePwdQuesAns.html");	
				$("#changePwdQuesAnsform").attr("method","POST");
				$("#changePwdQuesAnsform").submit();
			}
		});

	});
	
	
	function validation() {
		
		if($("#pwd_ques").val()!= $("#pwd_ques_old").val() ||$("#pwd_ans").val() != $("#pwd_ans_old").val()) {
			//비밀번호 일치 여부 체크
			if ($("#pwd_ques").val().length == '0' ) {
				alert("질문을 입력해 주세요.");
				$("#pwd_ques").focus();
				return;
			}else {
				var str = $("#pwd_ques").val();
				
				if($("#pwd_ques").val().byte() > 40) {
					alert("글자수가 한글20자/영문40자를 넘지않게 입력하여 주세요.");
					$("#pwd_ques").val(setStringByte(str, 40));
					$("#pwd_ques").focus();
					return;
				}
			}
	
			if ($("#pwd_ans").val().length == '0' ) {
				alert("답변을 입력해 주세요.");
				$("#pwd_ans").focus();
				return;
			}else {
				
				var str = $("#pwd_ans").val();
				if($("#pwd_ans").val().byte() > 40) {
					alert("글자수가 한글20자/영문40자를 넘지않게 입력하여 주세요.");
					$("#pwd_ans").val(setStringByte(str, 40));
					$("#pwd_ans").focus();
					return;
				}
			}
		}else {
			alert("질문 이나 답변을 변경후에 확인버튼을 눌러주세요.");
			return;
		}
		return true;
	}
	
	//질문 조회 결과값 
	function changePwdQuesAnsformCallBack(data,state){
		data = data.removePre();
		var jsonStr = eval("("+data+")");
		if(jsonStr != null) {
			if(jsonStr.result == 1){
				alert(jsonStr.msg);
			}else{
				alert(jsonStr.msg);
				window.close();
			}
		} else {
			alert('에러가 발생하였습니다.결과값이 올바르지 않습니다.');
		}
	}
</script>