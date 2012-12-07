<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>KUMHO TIRES | 자동화기기 보안 콘솔 로그인</title>
<link rel="stylesheet" type="text/css" media="all" href="common/css/basic.css" />
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"type="text/javascript"></script><![endif]-->
<!--[if IE 7]><link rel="stylesheet" href="common/css/ie7.css" type="text/css"/><![endif]-->
<script type="text/javascript" charset="urf-8" src="/common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="urf-8" src="/common/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" charset="urf-8" src="/common/js/twolevel-1.0.js"></script>
<script type="text/javascript" charset="urf-8" src="/common/js/slides.min.jquery.js"></script>	
</head>

<body class="main">

<article>
	<figure>login</figure>
	<section class="login">
		<form id="loginForm" name="loginForm" method="post" action="/index.html">
			<fieldset>
			   <legend>login</legend>
			    <p style="padding:0 0 3px; *padding:0"><label for="#"><img src="common/images/txt/txt_id.gif" alt="아이디"></label>
			   <input type="text" id="login_id" maxlength="12" name="login_id" value="${login_id}">
			      <!-- <input type="text" id="login_id" name="login_id">  -->
			   </p>
			   <p><label for="#"><img src="common/images/txt/txt_pass.gif" alt="비밀번호"></label>
			   	 <!-- <input type="password" id="login_pwd" name="login_pwd"> -->
			    	<input type="password" id="login_pwd" maxlength="12" name="login_pwd">
			   	</p>
			   <p class="login"><a href="#"><img id="loginBtn" src="common/images/btn/btn_login_02.gif" alt="로그인"></a></p>
			   <!-- modal popup contents (비밀번호초기화_기본) -->
			   <div id="basic-modal" class="first_pass">
					<p><a href="#" class="basic btn setp15"><span>비밀번호 재설정</span></a></p>
			   </div>
			   
			</fieldset>
		</form>

		<!-- modal popup contents (비밀번호초기화_기본) 팝업창 -->
	    <div id="content">
			<!-- modal content -->
			<div id="basic-modal-content">
				<h2><img src="common/images/txt/h2_pass.gif" alt="비밀번호 초기화"></h2>
				<form id="pwdQuestionForm">
					<input type="hidden" id="pwd_ques_flag" value="0">
					<div id="pwdQuesDiv">
						<table>
							<colgroup>
								<col style="width:30%"/>
								<col style="width:70%"/>
							</colgroup>
							<tbody>
								<tr>
									<th>아이디</th>
									<td><input type="text" id="pwd_login_id" name="pwd_login_id" maxlength="12"> 
									<a href="#" class="btn type2 set20" id="pwdQuestionChkBtn"><span>질문조회</span></a>
									</td>
								</tr>
								<tr>
									<th>질문</th>
									<td>등록한 질문 내용이 출력됩니다.</td>
								</tr>
								<tr>
									<th>답변</th>
									<td><input type="text" id="pwd_ans" name="pwd_ans" class="w60" maxlength="20">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="pwdChkBtnDiv">
					<p class="ok"><a href="#" id='pwdAnserChkBtn' class="btn setp15"><span>답변확인</span></a></p>
					</div>
				</form>
				<form id="changePasswordform">
					<input type="hidden" id="hid_login_id" name="hid_login_id">
					<div id="newPwdDiv" style="display:none">
						<table>
							<colgroup>
								<col style="width:40%"/>
								<col style="width:60%"/>
							</colgroup>
							<tbody>
								<tr>
									<th>새 비밀번호</th>
									<td><input type="password" id="new_pwd" name="new_pwd" maxlength="12"></td>
								</tr>
								<tr>
									<th>새 비밀번호 확인</th>
									<td><input type="password" id="new_pwd_re" name="new_pwd_re" maxlength="12"></td>
								</tr>
							</tbody>
						</table>
						<p class="ok"><a href="#" id="regiBtn" class="btn setp15"><span>확인</span></a></p>
					</div>
				</form>		
			</div><!-- //end basic-modal-content -->	
		</div><!-- //end content -->
				<!-- 	<input type="button" id="rptBtn" name="rptBtn" value="리포트">  -->
	</section>
</article>
<form id="pdfReportForm" method="POST"></form>


<!-- Load jQuery, SimpleModal and Basic JS files -->
<script type="text/javascript" charset="urf-8" src="/common/js/jquery.js"></script>
<script type="text/javascript" charset="urf-8" src="/common/js/jquery.simplemodal.js"></script>
<script type="text/javascript" charset="urf-8" src="/common/js/basic.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>

<script type="text/javascript">
//<![CDATA[

	$(document).ready(function() {
				
		//비밀번호 변경_질문확인
		$("#pwdQuestionChkBtn").click(function(){
			
			if($("#pwd_login_id").val().trim()==""){ 
				alert("아이디를 입력하여 주세요.");
				$("#pwd_login_id").focus();
				return;
			}
			
			$.post("/FindByPwdQues.html", $("#pwdQuestionForm").serialize() , function(data){
				if(data != null) {
					param = data.param;
					if(param.result == 1) {
						resultPwdQuestionChg(param);
					}else{
						alert(param.msg);
					}
				}else {
					alert("다시한번 질문조회하여 주세요.");
				}	
			});
			
		});
		
		//비밀번호 변경_답변확인
		$("#pwdAnserChkBtn").click(function(){
			
			if($("#pwd_ques_flag").val() =='0'){
				alert("질문조회를 하여 주세요.");
				$("#login_id").focus();
				return;
			}
			if($("#pwd_ans").val().trim().length=='0') {
				alert("답변을 입력하여 주세요.");
				$("#pwd_ans").focus();
				return;			
			}
			
			$.post("/CheckPwdAnser.html", $("#pwdQuestionForm").serialize() , function(data){
				if(data != null) {
					param = data.param;
					if(param.result == 1){
						resultPwdAnserChg();
					}else{
						alert(param.msg);
					}
				}else {
					alert("확인버튼을 다시 눌러 주세요.");
				}
			});
			
		});
		
		$("#regiBtn").click(function() {
			$("#hid_login_id").val($("#pwd_login_id").val());
			//비밀번호 일치 여부 체크
			
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
			

			$.post("/ChangePassWord.html", $("#changePasswordform").serialize(), function(data){
				if(data != null) {
					param = data.param;
					if(param.result == 1){
						alert(param.msg);
						location.href="/index.html";
					}else{
						alert(jsonStr.msg);
						location.href="/index.html";
					}
				}
			});
		});
		
		//로그인 버튼 클릭
		$("#loginBtn").click(function() {
			loginCheckSubmit();
		});

		$("#login_pwd").keydown(function(e) {
			if (e.keyCode == 13) {
				loginCheckSubmit();
			}
		});
		
		
		$("#rptBtn").bind("click", function() {
			alert("rptBtn");
			$("#pdfReportForm").attr("action","/TestReport.html");
			$("#pdfReportForm").attr("method","POST");		
			$("#pdfReportForm").submit();
		});
		
	});

	//로그인 체크
	function loginCheckSubmit() {
		if ($("#login_id").val().trim().length == 0) {
			alert("아이디를 입력해 주세요.");
			$("#login_id").focus();
			return ;
		} else if ($("#login_pwd").val().trim().length == 0) {
			alert("비밀 번호를 입력해 주세요.");
			$("#login_pwd").focus();
			return ;
		} 
		
		$.post("/LoginCheck.html", $("#loginForm").serialize() , function(data){
			if(data != null) {
				var param = data.param;
				if(param.result == 1){
					location.href="/user/list.html";				
				}else{
					alert(param.msg);
					 $("#loginForm").submit();
					
				}
			}	
		});
	}
	
	function resultPwdQuestionChg(jsonStr) {
		$("#pwd_ques_flag").val(jsonStr.result);
		var resourceHtml ="";
		resourceHtml +="<table> ";
		resourceHtml +="	<colgroup> ";
		resourceHtml +="		<col style='width:30%'/> ";
		resourceHtml +="		<col style='width:70%'/> ";
		resourceHtml +="	</colgroup> ";
		resourceHtml +="	<tbody> ";
		resourceHtml +="		<tr> ";
		resourceHtml +="			<th>아이디</th> ";
		resourceHtml +="			<td><input type='text' id='pwd_login_id' minlength='7' maxlength='12' name='pwd_login_id' value='"+jsonStr.login_id+"'>  ";
		resourceHtml +="				<a href='#' id='pwdAnserChkBtn' class='btn type2 set20'><span>질문조회</span></a> ";
		resourceHtml +="			</td> ";
		resourceHtml +="		</tr> ";
		resourceHtml +="		<tr> ";
		resourceHtml +="			<th>질문</th> ";
		resourceHtml +="			<td>"+jsonStr.pwd_ques+"</td> ";
		resourceHtml +="		</tr> ";
		resourceHtml +="		<tr> ";
		resourceHtml +="			<th>답변</th> ";
		resourceHtml +="			<td><input type='text' id='pwd_ans' name='pwd_ans' class='w60'maxlength='20'> ";
		resourceHtml +="			</td> ";
		resourceHtml +="		</tr> ";
		resourceHtml +="	</tbody> ";
		resourceHtml +="</table> ";
		
		$("div[id='pwdQuesDiv']").html("");
		$("div[id='pwdQuesDiv']").append(resourceHtml);				
	}
	
	function resultPwdAnserChg() {
		$("div[id='pwdQuesDiv']").hide();
		$("div[id='pwdChkBtnDiv']").hide();
		$("div[id='newPwdDiv']").show();
	}
	
	
	
//]]>
</script>
</body>
</html>
