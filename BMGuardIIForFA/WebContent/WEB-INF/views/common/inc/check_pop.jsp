<%@ page pageEncoding="utf-8" %>
	
	<div id="content2">
		<!-- modal content2 -->
		<div id="basic-modal-content2">
			<h2><img src="../common/images/txt/h2_check.gif" alt="조회/수정"></h2>
			<div class="put">
				<table>
					<colgroup>
						<col style="width:15%"/>
						<col style="width:35%"/>
						<col style="width:15%"/>
						<col style="width:35%"/>
					</colgroup>
						<form id="changeUserForm" name="changeUserForm">
						<input type="hidden" name="u_user_idx" id ="u_user_idx">
						<tbody>
							
							<tr>
								<th>성명</th>
								<td><input type="text" id="u_user_name" name="u_user_name" maxlength="5"></td>
								
								
								<th>아이디</th>
								<td>
									<input type="text" id="u_login_id" name="u_login_id" maxlength="12" readonly="readonly" > 
									<input type="hidden" id="u_login_id_old" name="u_login_id_old">
								</td>
							</tr>
							<tr>
								<th>패스워드</th>
								<td><input type="password" id="u_login_pwd" name="u_login_pwd" maxlength="12"></td>
								<th>패스워드 확인</th>
								<td><input type="password" id="u_login_pwd_re" name="u_login_pwd_re" maxlength="12"></td>
							</tr>
							<tr>
								<th>권한</th>
								<td colspan="3">
									<input type="hidden" id="u_userattr_idx" name="u_userattr_idx">
									<select name="u_userattr" id="u_userattr" >
										<option value="" selected="selected"></option>
										<c:forEach items="${userAttrMast }" var="userAttrMast" varStatus="i">
											<option value="${userAttrMast.userattr_idx }">${userAttrMast.userattr_title}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>사원번호</th>
								<td>
									<input type="text" id="u_user_no" name="u_user_no" maxlength="12"> 
									<input type="hidden" id="u_user_no_old" name="u_user_no_old">
								</td>
								<th>부서명</th>
								<td>
									<input type="hidden" id="u_usergrp_idx" name="u_usergrp_idx">
									<select name="u_usergrp" id="u_usergrp">
										<option value="" selected="selected"></option>
										<c:forEach items="${userGrpList }" var="userGrpList" varStatus="i">
											<option value="${userGrpList.usergrp_code }">${userGrpList.usergrp_name}</option>
										</c:forEach>

									</select>
								</td>
							</tr>
							<tr>
								<th>관리그룹</th>
								<td colspan="3">
									<ul class="manage">
										<input type="hidden" id ="u_clientgrp_idx" name="u_clientgrp_idx">
										<li><input type="checkbox" name ="u_management_grp_0" id ="u_management_grp_0" alt="전체선택"> <label for="#">전체</label></li>
										<c:forEach items="${clientGrpList }" var="clientGrpList" varStatus="i">
											<li><input type="checkbox" name ="u_management_grp" id ="u_management_grp_${clientGrpList.clientgrp_idx }" value="${clientGrpList.clientgrp_idx }"> <label for="#">${clientGrpList.clientgrp_name}</label></li>
										</c:forEach>
										
									</ul>
								</td>
							</tr>
							
						</tbody>
					</form>
				</table>
				<p class="ok"><a href="#" id= "userUpdateBtn" class="btn setp15"><span>수정</span></a></p>
				</div>
				
				<div class="put">
				<h3>변경이력</h3>

				<div class="tit">
					<table>
						<colgroup>
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:14%">
							<col style="width:16%">
						</colgroup>
						<thead>
							<tr>
								<th>변경구분</th>
								<th>변경일자</th>
								<th>부서명</th>
								<th>사용자성명</th>
								<th>사번번호</th>
								<th>권한</th>
								<th>관리그룹</th>
							</tr>
						</thead>
					</table>
				</div>
				<form id="changeListForm">
				<div class="list">
						<table>
							<colgroup>
								<col style="width:14%">
								<col style="width:14%">
								<col style="width:14%">
								<col style="width:14%">
								<col style="width:14%">
								<col style="width:14%">
								<col style="width:16%">
							</colgroup>
							<tbody id="userHistoryTbody">
							</tbody>
						</table>
					</div>
				</form>	
			</div>
		</div><!-- //end basic-modal-content2 -->		
	</div><!-- //end content2 -->
<form id="userCheckForm" name="userCheckForm" method="get"></form>
 <script type="text/javascript"> 

 // jquery-validation check
$().ready(function() {
    
	var validator2 = $("#changeUserForm").validate({
		rules: {
			u_user_name   : {required: true, kor_eng: true, minlength:2, maxlength: 7},
			u_login_pwd   : {required: false, special_one:true, minlength:7, maxlength: 12},
			u_login_pwd_re: {required: false  , equalTo: "#u_login_pwd"},
			u_userattr    : {required: true},
			u_user_no     : {required: true, minlength:1, maxlength: 13},
			u_usergrp     : {required: true},
			u_management_grp : {required: true}
		},
		messages: {
			u_user_name: {
				required: "사용자 성명을 입력해 주세요.",
				minlength: "사용자 성명은 {0}자 이상  입력해 주세요.",
				maxlength: "사용자 성명은 {0}자 이내로 입력해 주세요."
			},
			u_login_pwd: {
				required: "패스워드를 입력해 주세요.",
				minlength: "패스워드는 {0}자이상 입력해 주세요.",
				maxlength: "패스워드는 {0}자이내로 입력해 주세요."
			},
			u_login_pwd_re: {
				required: "패스워드 확인을 입력해 주세요.",
				equalTo: "패스워드가  동일하지 않습니다."
			},
			u_userattr_idx: {
				required: "권한을  입력해 주세요.",
			},
			u_user_no: {
				required: "사원번호를  입력해 주세요.",
				minlength: "사원번호는 {0}자 이상 입력해 주세요.",
				maxlength: "사원번호는 {0}자이내로 입력해 주세요."
			},
			u_usergrp_idx: {
				required: "부서명을  입력해 주세요.",
			},
			u_management_grp: {
				required: "관리그룹을 체크하여 주세요."
			}
		
		}
	});
	
	
 	//체크박스 전체체크 / 해제
	$("#u_management_grp_0").click( function() { 

 		var result = $("#u_management_grp_0").attr("checked");
 		if(result == "checked") {
 			$("input[name=u_management_grp]:checkbox").each(function() {
				$(this).attr("checked", true);
			});
 		}else {
 			$("input[name=u_management_grp]:checkbox").each(function() {
				$(this).attr("checked", false);
			});
 		}
	});
	
 	//체크박스 합산 - 체크박스가 전부 체크(일부해제) 되어 있으면 '전체' 체크 체크/해제
	$("input[name=u_management_grp]").click(function() {
		var result = $(this).attr("checked");
		var cnt = 0;
		if (result != "checked") {
			$("#u_management_grp_0").attr("checked", false);
		}else {
			$("input[name=u_management_grp]:checkbox").each(function() {
				var result2 = $(this).attr("checked");
				if (result2 == "checked") {
					cnt++;
				}
			});
			if (cnt == $("input[name=u_management_grp]").length) {
				$("#u_management_grp_0").attr("checked", "checked");
			}
		}
		
		
	});
	
 //jquey validation button-event
	$("#userUpdateBtn").click(function(e){
		e.preventDefault();
		if($("#changeUserForm").valid()) {
				
				var clientGrpIdxs = $('input[name=u_management_grp]:checked').map(function() {
				    return this.value;			
				}).get().join(',');
				$("#u_clientgrp_idx").val(clientGrpIdxs);

				
				$("#u_userattr_idx").val($("#u_userattr option:selected").val());
				$("#u_usergrp_idx").val($("#u_usergrp option:selected").val());


				$.post("/ChangeUser.html", $("#changeUserForm").serialize(), function(result){
					if(result!= null) {
						changeUserFormCallBack(result, "sucess");
					}
				});
		}else {
			validator2.focusInvalid(); 
			return false;
		}
	});
 

	
	$("#u_login_id").keydown(function(e) {
		if (e.keyCode == 13) {

			var loginId = $("#u_login_id").val();
			var loginIdOld = $("#u_login_id_old").val();
			if( loginId != loginIdOld) {
				loginidCheckSubmit();
			}
		}
	});
	
	$("#u_user_no").keydown(function(e) {
		if (e.keyCode == 13) {
			var userNo =  $("#u_user_no").val();
			var userNoOld =  $("#u_user_no_old").val();
			if(userNo != userNoOld) {
				userNOCheckSubmit();
			}
		}
	});
	
});
 
 function loginidCheckSubmit() {
	 
	 var u_user_idx = $("#u_user_idx").val();
	 var u_login_id = $("#u_login_id").val();
	 var result =0;
 	$.ajax({
		type:"GET"
		,url:"/CheckLoginIdCnt.html"
		,data:{"u_user_idx":u_user_idx, "u_login_id":u_login_id}
		,dataType:"json"
		,success:function(rtnObj){
			loginidChkcallBack(rtnObj);
		}
	});
 }
 function loginidChkcallBack(rtnObj) {
	 
	if(rtnObj.result == 0) {
		alert(rtnObj.msg);
		return false;
	}
 }
 function userNOCheckSubmit() {
	 
	 var u_user_idx = $("#u_user_idx").val();
	 var u_user_no = $("#u_user_no").val();
	 var result;
	 
 	$.ajax({
		type:"GET"
		,url:"/CheckUserNoCnt.html"
		,data:{"u_user_idx":u_user_idx, "u_user_no":u_user_no }
		,dataType:"json"
		,success:function(rtnObj){
			if(rtnObj.result == 0) {
				alert(rtnObj.msg);
				result =0;
			}
		}
	});
 	return result;
 }
 
 function changeUserFormCallBack(data, state) {
	
	var jsonStr = data;
	
		var history = jsonStr.uHistory;
		var user = jsonStr.uUser;

		
		if (jsonStr.result == 1) {
			alert(jsonStr.msg);
			var htmls = "";
			// 객체의 리스트 만큼 탐색 
			for(var i=0; i<history.length; i++){
				htmls += "<tr> ";
				htmls += "<td>" +history[i].update_gubun + "</td>";
				htmls += "<td>" +history[i].update_date.substring(0,10);
				htmls += "<p>" +history[i].update_date.substring(11,19) + "</p></td>";
				htmls += "<td>" +history[i].usergrp_name + "</td>";
				htmls += "<td>" +history[i].user_name + "</td>";
				htmls += "<td>" +history[i].user_no + "</td>";
				htmls += "<td>" +history[i].userattr_title + "</td>";
				htmls += "<td>";
				
				var clientGrp = history[i].managementGroupList;
					for(var j=0; j<clientGrp.length;j++) {
						if (j == clientGrp.length -1) 
							htmls += clientGrp[j].clientgrp_name;
						else 
							htmls += clientGrp[j].clientgrp_name + ",";	
					}
				htmls +="</td>";
				htmls += "</tr> ";
			}
			
			$("#u_user_name").val(user.user_name);
			$("#u_login_id").val(user.login_id);
			$("#u_login_id_old").val(user.login_id);
			$("#u_user_no").val(user.user_no);
			$("#u_user_no_old").val(user.user_no);
			$("#u_userattr option[value="+ user.userattr_idx+"]").attr("selected","true");
			$("#u_usergrp option[value="+ user.usergrp_idx+"]").attr("selected","true");
			
			var subGrp = user.managementGroupList;
			for(var k=0; k<subGrp.length;k++) {
				$("#u_management_grp_"+subGrp[k].clientgrp_idx).attr("checked","checked"); 
			}
			
			$("#userHistoryTbody").html(htmls);	
		}else {
			alert(jsonStr.msg);
			return false;
		}	
	 
 }
</script>