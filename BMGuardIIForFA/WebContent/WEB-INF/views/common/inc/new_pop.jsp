<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
	<div id="content">
		<!-- modal content -->
		<div id="basic-modal-content">
			<h2><img src="../common/images/txt/h2_new.gif" alt="신규등록"></h2>
			<div>
				<table>
					<colgroup>
						<col style="width:30%"/>
						<col style="width:70%"/>
					</colgroup>
					<form id ="signForm" name="signForm" method="post" action ="/InsertUser.html">
					<input type="hidden" id="clientgrp_idx" name="clientgrp_idx" />
					<div id="basic-modal-content">
					<tbody>
						<tr>
							<th>사용자 성명</th>
							<td><input type="text" id="user_name" name="user_name" maxlength="7"> </td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" id="login_id" name="login_id" maxlength="12"> </td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" id="login_pwd" name="login_pwd" maxlength="12"> </td>
						</tr>
						<tr>
							<th>패스워드 확인</th>
							<td><input type="password" id="login_pwd_re" name="login_pwd_re" maxlength="12"></td>
						</tr>
						<tr>
							<th>권한</th>
							<td>
								<input type="hidden" name="userattr_idx" id="userattr_idx">
								<select name="userattr" id="userattr">
									<option value="" selected="selected"></option>
									<c:forEach items="${userAttrMast }" var="userAttrMast" varStatus="i">
										<option value="${userAttrMast.userattr_idx}">${userAttrMast.userattr_title}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>사원번호</th>
							<td><input type="text" id="user_no" name="user_no" maxlength="13"></td>
						</tr>
						<tr>
							<th>부서명</th>
							<td>
								<input type="hidden" name="usergrp_idx" id="usergrp_idx">
								<select name="usergrp" id="usergrp">
									<option value="" selected="selected"></option>
									<c:forEach items="${userGrpList }" var="userGrpList" varStatus="i">
										<option value="${userGrpList.usergrp_code }">${userGrpList.usergrp_name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>관리그룹</th>
							<td>
								<ul class="manage">
									<input type="hidden" id="chkText2" name="chkText2" value="전체선택">
									<li><input type="checkbox" name ="management_grp_0" id ="management_grp_0" alt="전체선택"> <label for="#">전체</label></li>
									<c:forEach items="${clientGrpList }" var="clientGrpList" varStatus="i">
											<li><span><input type="checkbox" name ="management_grp" id ="management_grp_${clientGrpList.clientgrp_idx }" value="${clientGrpList.clientgrp_idx }"></span> <label for="#">${clientGrpList.clientgrp_name}</label></li>
									</c:forEach>
								</ul>
							</td>
						</tr>
					</tbody>
					</div>
				</form>
				</table>
				<p class="ok"><a href="#" id="btnValidate" class="btn setp15"><span>신규등록</span></a></p>
			</div>
		</div><!-- //end basic-modal-content -->		
	</div><!-- //end content -->

 <script type="text/javascript"> 

 // jquery-validation check
$().ready(function() {
	
	var validator = $("#signForm").validate({
		rules: {
			user_name   : {required: true, kor_eng: true, minlength:2, maxlength: 7},
			login_id    : {required: true, ub_all: true, minlength:7, maxlength: 12},
			login_pwd   : {required: true, special_one:true, minlength:7, maxlength: 12},
			login_pwd_re: {required: true, equalTo: "#login_pwd"},
			userattr    : {required: true},
			user_no     : {required: true, minlength:1, maxlength: 13},
			usergrp     : {required: true},
			management_grp:{required: true}
		},
		messages: {
			user_name: {
				required: "사용자 성명을 입력해 주세요.",
				minlength: "사용자 성명은 {0}자 이상  입력해 주세요.",
				maxlength: "사용자 성명은 {0}자 이내로 입력해 주세요."
			},
			login_id: {
				required: "아이디를 입력하여 주세요.",
				minlength: "아이디는 {0}자 이상 입력해 주세요.",
				maxlength: "아이디는 {0}자 이내로 입력해 주세요."
			},
			login_pwd: {
				required: "패스워드를 입력해 주세요.",
				minlength: "패스워드는 {0}자이상 입력해 주세요.",
				maxlength: "패스워드는 {0}자이내로 입력해 주세요."
			},
			login_pwd_re: {
				required: "Password 확인을 입력해 주세요.",
				equalTo: "Password가 동일하지 않습니다."
			},
			userattr: {
				required: "권한을  입력해 주세요."
			},
			user_no: {
				required: "사원번호를  입력해 주세요.",
				minlength: "사원번호는 {0}자 이내로 입력해 주세요.",
				maxlength: "사원번호는 {0}자이내로 입력해 주세요."
			},
			usergrp: {
				required: "부서명을  입력해 주세요."
			},
			management_grp: {
				required: "관리그룹을 체크하여 주세요."
			}
		}
	});
 //jquey validation button-event
	$("#btnValidate").click(function(e){
		e.preventDefault();
		if($("#signForm").valid()) {
			
			var clientGrpIdxs = $('input[name=management_grp]:checked').map(function() {
			    return this.value;			
			}).get().join(',');
			$("#clientgrp_idx").val(clientGrpIdxs);
			
			$("#userattr_idx").val($("#userattr option:selected").val());
			$("#usergrp_idx").val($("#usergrp option:selected").val());

			$("#signForm").ajaxForm(signFormCallBack);
			$("#signForm").submit();
		}else {
			validator.focusInvalid(); 
			return;
		}
	});
 
 	//체크박스 전체체크 / 해제
	$("#management_grp_0").click( function() { 

 		var result = $("#management_grp_0").attr("checked");
 		if(result == "checked") {
 			$("input[name=management_grp]:checkbox").each(function() {
				$(this).attr("checked", true);
			});
 		}else {
 			$("input[name=management_grp]:checkbox").each(function() {
				$(this).attr("checked", false);
			});
 		}
	});
	
 	//체크박스 합산 - 체크박스가 전부 체크(일부해제) 되어 있으면 '전체' 체크 체크/해제
	$("input[name=management_grp]").click(function() {
		var result = $(this).attr("checked");
		var cnt = 0;
		if (result != "checked") {
			$("#management_grp_0").attr("checked", false);
		}else {
			$("input[name=management_grp]:checkbox").each(function() {
				var result2 = $(this).attr("checked");
				if (result2 == "checked") {
					cnt++;
				}
			});
			if (cnt == $("input[name=management_grp]").length) {
				$("#management_grp_0").attr("checked", "checked");
			}
		}
		
		
	});
	
});

//로그인 결과값 
function signFormCallBack(data,state){

	data = data.removePre();
	var jsonStr = eval("("+data+")");
	if(jsonStr != null) {
		if(jsonStr.result == 1){
			alert(jsonStr.msg);
			location.href="/user/list.html";				
		}else{
			alert(jsonStr.msg);
		}
	} else {
		alert('에러가 발생하였습니다.결과값이 올바르지 않습니다.');
	}
	
	return;
}
</script>


 