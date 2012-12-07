<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb2" value="active" />
<c:set var="gnb2_2" value="on" />
<c:set var="gnb" value="자동화기기 관리" />
<c:set var="tab_1d" value="유지보수용 아이디/비밀번호관리" />
<%@ include file="../common/inc/header.jsp" %>
<!-- 
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="getManagementUserList.html">유지보수용 ID/PW관리</a></li>
	</ul>
</nav>
 -->
</header>

<article>

	<%@ include file="../common/inc/direction.jsp" %>

	<figure>사용자 로그검색</figure>
	<section class="user_log">
	<h2>유지보수용 아이디/비밀번호 관리</h2>
	
	<div class="box_log">
		<ul style="width:100%">
			<li class="auto">
				<span class="auto_kind mr10"><img src="../common/images/txt/txt_state.gif" alt="상태"></span>
				<select id="status" class="ml10">
					<option value="-1" selected="selected">전체사용자</option>
					<option value="0">정상사용자</option>
					<option value="1">삭제사용자</option>
				</select>
			</li>
			<li style="width: 100%; ">
				<div class="checkbox option_group ">
					<strong class="float_l pt6 mr10">관리그룹</strong>
					<ul class="pt3" id="search_manage_group">
						<li class="float_l mr10" style="vertical-align: middle;"><input type="checkbox"  id="allChk" value="" > <label for="#">전체</label></li>
						<c:forEach var="group" items="${groupList }">
							<li class="float_l mr10"><input type="checkbox"  name="manageGrpChk" value="${group.clientgrp_idx }" > <label for="group_${group.clientgrp_idx }">${group.clientgrp_name }</label></li>
						</c:forEach>
					</ul>
				</div>
			</li>
		</ul>
	</div>
	<p class="ac mt20"><a href="#" id="selectBtn" class="basic btn setp15"><span>조회</span></a></p>
	<p class="table_log">총 검색건수는 <strong id="total_count">${totalCount }</strong>건입니다. <!-- <span><a href="#"><img src="../common/images/btn/btn_excel.gif" alt="엑셀저장"></a></span> --></p>
	<table class="list">
		<colgroup>
			<col style="width:50px">
			<col style="width:130px">
			<col style="width:130px">
			<col style="width:*">
			<col style="width:160px">
			<col style="width:160px">
			<col style="width:160px">
			<col style="width:160px">
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" style="border:0;" id="listCheck" name="listCheck"></th>
				<th>아이디</th>
				<th>상태</th>
				<th>사용그룹</th>
				<th>등록일시</th>
				<th>삭제일시</th>
				<th>등록자</th>
				<th>삭제자</th>
			</tr>
		</thead>
	</table>
	<div class="scroll" style="height: 300px;">
		<table id="user_table">
			<colgroup>
			<col style="width:50px">
			<col style="width:130px">
			<col style="width:130px">
			<col style="width:*">
			<col style="width:160px">
			<col style="width:160px">
			<col style="width:160px">
			<col style="width:160px">
			</colgroup>
			<tbody>
				<c:forEach var="user" items="${userList }">
					<tr>
						<td>
							<c:choose>
								<c:when test="${user.invalid_flag eq 0 }">
									<input type="checkbox" id="idx_${user.user_idx }" name="idx" style="border:0;" value="${user.user_idx }">
								</c:when>
								<c:otherwise>
									<input type="checkbox" id="idx_${user.user_idx }" name="idx" style="border:0;" value="${user.user_idx }">													
								</c:otherwise>
							</c:choose>
						</td>
						<td><c:out value="${user.userlogin_id }"/></td>
						<td>
							<c:choose>
								<c:when test="${user.invalid_flag eq 0 }">사용중</c:when>
								<c:otherwise>삭제</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:forEach var="managementGroup" items="${user.managementGroupList }" varStatus="status">
								<c:if test="${not status.last }">${managementGroup.clientgrp_name },</c:if>
								<c:if test="${status.last }">${managementGroup.clientgrp_name }</c:if>
							</c:forEach>
						</td>
						<td><c:out value="${user.create_date }"/></td>
						<td><c:out value="${user.delete_date }"/></td>
						<td><c:out value="${user.createUser.user_name }" /></td>
						<td class="pl20 tl"><c:out value="${user.deleteUser.user_name }"/><input type="hidden" id="invalid_flag_${user.user_idx }" name="invalid_flag[]" value ="${user.invalid_flag}"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

	<div style="display:block; text-align: center;" class="mt20">
		<!-- modal popup contents (신규등록) -->
		<div id="basic-modal-2-1" class="btn_style_01">
			<p><a href="#" class="basic-2-1 btn setp15"><span>신규등록</span></a></p>
		</div>

		<!-- modal popup contents (변경) -->
		<div id="basic-modal-2-2" class="btn_style_01">
			<p><a href="#" class="basic-2-2 btn setp15"><span>변경</span></a></p>
		</div>

		<!-- modal popup contents (삭제) -->
	   <div id="basic-modal-2-3" class="btn_style_01">
			<p><a href="#" class="basic-2-3 btn setp15"><span>삭제</span></a></p>
		</div>

		<!-- modal popup contents (이력조회) -->
		<div id="basic-modal-2-4" class="btn_style_01">
			<p><a href="#" class="basic-2-4 btn setp15"><span>이력조회</span></a></p>
		</div>
	</div>

	<!-- modal popup contents (신규등록) 팝업창 -->
	<div id="content">
		<!-- modal content-2-1 -->
		<div id="basic-modal-content-2-1">
			<h2><img src="../common/images/txt/h2_ip_01.gif" alt="유지보수용 아이디 등록"></h2>
			<div>
				<table>
					<colgroup>
						<col style="width:30%"/>
						<col style="width:70%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text"  id="add_user_id" maxlength="12"> </td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="add_user_pwd" maxlength="12"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" id="add_user_pwd2" maxlength="12"></td>
						</tr>
						<tr>
							<th>사용그룹</th>
							<td>
								<ul class="manage" id="add_manage_group">
									<li class="type1"><input type="checkbox"  value="" > <label for="#">전체</label></li>
									<c:forEach var="group" items="${groupList }">
										<li class="type1"><input type="checkbox"  value="${group.clientgrp_idx }" > <label for="group_${group.clientgrp_idx }">${group.clientgrp_name }</label></li>
									</c:forEach>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
				<p class="ok"><a href="#" class=" btn setp15"><span>확인</span></a></p>
			</div><!-- //end basic-modal-content-2-1 -->		
		</div><!-- //end content -->	
	
	<!-- modal popup contents (변경) 팝업창 -->
	<div id="content">
		<!-- modal content-2-2 -->
		<div id="basic-modal-content-2-2">
			<h2><img src="../common/images/txt/h2_ip_02.gif" alt="유지보수용 아이디 등록"></h2>
			<div>
				<table>
					<colgroup>
						<col style="width:30%"/>
						<col style="width:70%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" id="update_user_id" readonly="readonly"> </td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="update_user_pwd" maxlength="12"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" id="update_user_pwd2" maxlength="12"></td>
						</tr>
						<tr>
							<th>사용그룹</th>
							<td>
								<ul class="manage" id="update_manage_group">
									<li class="type1"><input type="checkbox"  value="" > <label for="#">전체</label></li>
									<c:forEach var="group" items="${groupList }">
										<li class="type1"><input type="checkbox"  value="${group.clientgrp_idx }" > <label for="group_${group.clientgrp_idx }">${group.clientgrp_name }</label></li>
									</c:forEach>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
				<p class="ok"><a href="#" class=" btn setp15"><span>변경</span></a></p>
			</div><!-- //end basic-modal-content-2-2 -->		
		</div><!-- //end content -->

		<!-- modal popup contents (삭제) 팝업창 -->
		<div id="content">
		<!-- modal content-2-3 -->
		<div id="basic-modal-content-2-3">
			<h2><img src="../common/images/txt/h2_ip_03.gif" alt="삭제"></h2>
			<div>
				<table>
					<colgroup>
						<col style="width:100%"/>
					</colgroup>
					<tbody>
						<tr style="">
							<td class="ac pt5 pb5">아이디 <span id="deleteIDs"></span> 를 삭제하시겠습니까?</td>
						</tr>
					</tbody>
				</table>
				<p class="ok"><a href="#" class="btn setp15"><span>확인</span></a></p>
			</div><!-- //end basic-modal-content-2-3 -->		
		</div><!-- //end content -->

		<!-- modal popup contents (이력조회) 팝업창 -->
		<div id="content">
		<!-- modal content-2-4 -->
		<div id="basic-modal-content-2-4">
			<h2><img src="../common/images/txt/h2_ip_04.gif" alt="이력조회"></h2>
			<div class="scroll" style="height: 300px; margin: 0px; padding: 20px 30px 20px 30px;">
				<table id="history_table">
					<colgroup>
						<col style="width:30%"/>
						<col style="width:20%"/>
						<col style="width:50%"/>
					</colgroup>
					<thead>
						<tr>
							<th>처리일시</th>
							<th>처리구분</th>
							<th class="last">사용그룹</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td>2012:07.07 12:13:14</td>
							<td>삭제</td>
							<td class="last">3층기계실, 성형, 정련, 자동창고</td>
						</tr> -->
					</tbody>
				</table>
<!-- 				<p class="ok"><a><img src="../common/images/btn/btn_ok.gif" alt="확인"></a></p>
 -->			
 </div><!-- //end basic-modal-content-2-4 -->		
		</div><!-- //end content -->

	</section>

</article>
<script type="text/javascript" src="../resource/libs/common/common.util.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

		//help
		$("#helpBtn2").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help2-2");
			//e.preventDefault();
			return false;
		});
		
		$("#searchForm :input[name='status']").val($("#status").val());
				
		setManageGroupIdx("#search_manage_group", "#searchForm");
		setManageGroupIdx("#add_manage_group", "#addForm");
		setManageGroupIdx("#update_manage_group", "#updateForm");
		
		$("#status").change(function(){
			$("#searchForm :input[name='status']").val($("#status").val());
		});
		
    	//리스트 항목 체크박스 전체체크 / 해제
    	checkedAllOrNothing("listCheck", "idx");
   		checkedAllCheckbox("listCheck", "idx");
   		
    	//관리그룹 체크박스 전체선택/해제
    	checkedAllOrNothing("allChk", "manageGrpChk");
   		checkedAllCheckbox("allChk", "manageGrpChk");
   		
		// 사용자 정보 조회
		$("#selectBtn").click(function(event){
			event.preventDefault();
			checkManageGroupSelected("#search_manage_group");
			searchManagementUser();
		});
		
		// 신규 사용자 등록
		$("#basic-modal-content-2-1 a").click(function(event){
			event.preventDefault();
			var user_id = $("#add_user_id").val();
			var user_pwd = $("#add_user_pwd").val();
			var user_pwd2 = $("#add_user_pwd2").val();
			
			if(user_id == ""){
				alert("사용자 아이디를 입력하세요.");
				return;
			}else{
				if (strRestMinMax( $("#add_user_id"), "eng", 7, 12)) {
					if (strRestType("ub_all", user_id)) {
						$("#addForm :input[name='userlogin_id']").val(user_id);
					}else {
						$("#add_user_id").focus();
						return;
					}
				}else {
					$("#add_user_id").focus();
					return;
				}
			}
			if(user_pwd == ""){
				alert("사용자 비밀번호를 입력하세요.");
				return;
			}else {
				if (strRestMinMax( $("#add_user_pwd"), "eng", 7, 12)) {
					if (strRestType("special_one", user_pwd)) {}
					else {
						$("#add_user_pwd").focus();
						return;
					}
				}else {
					$("#add_user_pwd").focus();
					return;
				}
			}
			if(user_pwd2 == ""){
				alert("사용자 비밀번호를 입력하세요.");
				return;
			}
			if(user_pwd != user_pwd2){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}else{
				$("#addForm :input[name='userlogin_pwd']").val(user_pwd);
			}
			checkManageGroupSelected("#add_manage_group");
			$.post("addManagementUser.html", $("#addForm").serialize(), function(result){
				clearManageGroupChecked("#search_manage_group", "#searchForm");
				searchManagementUser();
				if(result.resultCode == "fail"){
					alert("신규 사용자 등록 중 오류가 발생하였습니다.");				

				}else if(result.resultCode == "duplicate"){
					alert("동일한 사용자 아이디가 있습니다.");		
					return;
				}else if(result.resultCode == "success") {
					$.modal.close();
					alert("사용자가 등록되었습니다.");
					
				}
			}, "json");
		});
		
		// 사용자 정보 변경
		$("#basic-modal-2-2 a").click(function(event){
			event.preventDefault();
			
			$("#updateForm input[name='clientGroupIdx']").remove();
			$("#update_manage_group :checked").removeAttr("checked");
			if($("#user_table tbody :checkbox:checked").size() != 1){
				alert("정보를 변경할 사용자을 선택하지 않았거나,\n한 명이상이 선택되었습니다. ");
				event.stopImmediatePropagation();
				return;
			}
			
			var userIdx = $('#user_table tbody :checkbox:checked').val();
			if ($("#invalid_flag_"+ userIdx).val()!= 0) {
				alert("삭제하신 건은  변경하실 수 없습니다.");
				event.stopImmediatePropagation();
				return;
			}
			
			var userId = $('#user_table tbody :checkbox:checked').parent().next().text();
			var manageGroupArray = $('#user_table tbody :checkbox:checked').parent().next().next().next().text().split(",");
			
			$("#updateForm :input[name='user_idx']").val(userIdx);
			$("#update_user_id").val(userId);
			$("#updateForm :input[name='userlogin_id']").val(userId);
			
			$.each(manageGroupArray, function(index, obj){
				var manageGroupName = (obj.ltrim()).rtrim();
				console.log(manageGroupName);
				if(manageGroupName != ""){
					var clientGroupIdx = $("#update_manage_group li label:contains('"+manageGroupName+"')").prev().attr('checked', 'checked').val();
					$("#updateForm").append("<input type='hidden' name='clientGroupIdx' value='"+ clientGroupIdx +"'>");
				}
			});
			
			$("#basic-modal-content-2-2 a").click(function(){
				event.preventDefault();
				var user_id = $("#update_user_id").val();
				var user_pwd = $("#update_user_pwd").val();
				var user_pwd2 = $("#update_user_pwd2").val();
				
				$("#updateForm :input[name='userlogin_id']").val(user_id);
				if(user_pwd == ""){
					alert("사용자 비밀번호를 입력하세요.");
					return;
				}else {
					
					if (strRestMinMax( $("#update_user_pwd"), "eng", 7, 12)) {
						if (strRestType("special_one", user_pwd)) {}
						else {
							$("#update_user_pwd").focus();
							return;
						}
					}else {
						$("#update_user_pwd").focus();
						return;
					}
				}
				if(user_pwd2 == ""){
					alert("사용자 비밀번호를 입력하세요.");
					return;
				}
				if(user_pwd != user_pwd2){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}else{
					$("#updateForm :input[name='userlogin_pwd']").val(user_pwd);
				}
				checkManageGroupSelected("#update_manage_group");
				
				$.post("updateManagementUser.html", $("#updateForm").serialize(), function(result){
					$.modal.close();
					clearManageGroupChecked("#update_manage_group", "#updateForm");
					searchManagementUser();
					if(result.resultCode == "fail"){
						alert("사용자 정보 변경 중 오류가 발생하였습니다.");				
					}					
				}, "json");
			});
			
		});
		
		// 사용자 삭제		
		$("#basic-modal-2-3 a").click(function(event){
			$("#deleteForm").html("");
			event.preventDefault();
			if($("#user_table tbody :checkbox:checked").size() == 0){
				alert("삭제할 사용자를 한 명이상 선택하세요.");
				event.stopImmediatePropagation();
				return;
			}
			
			var result = 0;
			$("#user_table tbody :checkbox").each(function(index, obj){
				if(obj.checked){
					var idx = $(obj).val();
					if ($("#invalid_flag_"+ idx).val()!=0) {
						result++;
					}
					$("#deleteForm").append("<input type='hidden' name='user_idx' value='"+$(obj).val()+"'>");
				}
			});

			if (result > 0) {
				alert("삭제하신 건이 선택 되었습니다.");
				$("#deleteForm").html("");
				event.stopImmediatePropagation();
				return ;
			}
			
			var deleteIDs = "";
			$("#deleteForm [name='user_idx']").each(function(index, el){
				deleteIDs  +=  $("#idx_"+$(el).val()).parent().next().text() + " ";
			});
			$("#deleteIDs").text(deleteIDs);
		});
		$("#basic-modal-content-2-3 a").click(function(event){
			event.preventDefault();
			$.post("deleteManagementUser.html", $("#deleteForm").serialize(), function(result){
				$.modal.close();
				clearManageGroupChecked("#search_manage_group", "#searchForm");
				searchManagementUser();
				if(result.resultCode == "fail"){
					alert("사용자 삭제 중 오류가 발생하였습니다.");
				}
			}, "json");
		});
		
		// 이력조회
		$("#basic-modal-2-4 a").click(function(event){
			event.preventDefault();
			if($("#user_table tbody :checkbox:checked").size() != 1){
				alert("이력을 조회할 사용자를 선택하지 않았거나,\n한 명이상이 선택되었습니다. ");
				event.stopImmediatePropagation();
				return;
			}
			$.getJSON("getUserHistory.html", {user_idx: $('#user_table tbody :checkbox:checked').val()}, function(result){
				
				var group = "";
				var html = "";
				var userList = result.userList;
				var userSize = result.userSize;
				if(userSize != 0) {
					$.each(userList, function(index, obj){
						html += "<tr>";
						html += "<td>" + obj.update_date + "</td>";
						html += "<td>" + obj.user_status + "</td>";
						
						var len =obj.managementGroupList.length;
						$.each(obj.managementGroupList, function(idx, groupObj){
							if (len == idx+1) {
								group += groupObj.clientgrp_name ;
							}else {
								group += groupObj.clientgrp_name + ", ";
							}
						}); 
						html += "<td class='last'>" + group + "</td>";
						html += "</tr>";
					});
				}else {
					html = "<tr><td colspan='3'>데이터가 없습니다.</td></tr>";
				}
				
				$("#history_table tbody").html(html);
			});
		});
		
	});
	
	// 조회 조건을 초기화 시킵니다.
	function clearSearchForm(){
		$($("#status option")[0]).attr("selected", "selected");
		$("#searchForm :input[name='status']").val($("#status").val());
	}

	// 조회 조건에 해당하는 사용자 정보를 조회합니다.
	function searchManagementUser(){
		$.post("searchManagementUserList.html", $("#searchForm").serialize(), function(result){
			
			var html = "";
			var userList = result.userList;
			$.each(userList, function(index, obj){
				
				var loginId = obj.userlogin_id;
				var flag = obj.invalid_flag == 0 ? "사용중" : "삭제";
				var group = "";
				var len = obj.managementGroupList.length;
				$.each(obj.managementGroupList, function(index, groupObj){
					if(len == index+1) {
						group += groupObj.clientgrp_name;
					}else {
						group += groupObj.clientgrp_name + ", ";
					}
				});
				var createDate = obj.create_date || "";
				var deleteDate = obj.delete_date || "";
				var createUser = obj.createUser ? obj.createUser.user_name : "";
				var deleteUser = obj.deleteUser ? obj.deleteUser.user_name : "";
				
				html += "<tr>";
				
				if(flag == '사용중'){
					html += '<td><input type="checkbox" id="idx_'+obj.user_idx+'" name="idx" style="border:none;" value="'+obj.user_idx+'"></td>';
				}else{
					html += '<td><input type="checkbox" id="idx_'+obj.user_idx+'" name="idx" style="border:none;" value="'+obj.user_idx+'"></td>';
				}
				
				html += '<td>'+loginId+'</td>';
				html += '<td>'+flag+'</td>';
				html += '<td>'+group+'</td>';
				html += '<td>'+createDate+'</td>';
				html += '<td>'+deleteDate+'</td>';
				html += '<td>'+createUser+'</td>';
				html += '<td>'+deleteUser+'<input type="hidden" id="invalid_flag_'+obj.user_idx+'" name="invalid_flag[]" value ="'+ obj.invalid_flag+ '"></td>';
				html += "</tr>";
				
			});				
			$("#user_table tbody").html(html);
			$("#total_count").text(userList.length);
		}, "json");
		
	}
</script>
<!-- 조회 -->
<form id="searchForm" action="" method="post">
	<input type="hidden" name="status" />
</form>
<form id="deleteForm" action="" method="post"></form>
<form id="addForm" action="" method="post">
	<input type="hidden" name="userlogin_id" />
	<input type="hidden" name="userlogin_pwd" />
</form>
<form id="updateForm" action="" method="post">
	<input type="hidden" name="user_idx"/>
	<input type="hidden" name="userlogin_id" />
	<input type="hidden" name="userlogin_pwd" />
</form>

<%@ include file="../common/inc/footer.jsp" %>
