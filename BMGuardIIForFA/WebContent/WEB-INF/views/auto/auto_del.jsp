<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb2" value="active" />
<c:set var="gnb2_1" value="on" />
<c:set var="gnb" value="자동화기기 관리" />
<c:set var="gnb_sub" value="자동화기기 관리" />
<c:set var="tab_1d" value="자동화기기 삭제내역" />
<%@ include file="../common/inc/header.jsp" %>
<nav class="tab_1depth">
	<ul>
		<li><a href="index.html">자동화기기관리</a></li>
		<li class="on"><a href="auto_del.html">자동화기기 삭제내역</a></li>
		<li><a href="auto_overlap.html">IP주소 중복조회</a></li>
	</ul>
</nav>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>사용자 로그검색</figure>
	<section class="user_log">
	<h2>자동화기기 삭제내역</h2>
	
	<div class="box_log">
		<ul>

			<li class="last">
				<span><img src="../common/images/txt/txt_log_04.gif" alt="삭제일"></span>
				<ul class="due" id="date_button">
					<li class="type1"><a href="#">당일</a></li>
					<li class="type2"><a href="#">3일</a></li>
					<li class="type3"><a href="#">1주</a></li>
					<li class="type4"><a href="#">1개월</a></li>
					<li class="type5"><a href="#">3개월</a></li>
					<li class="type6"><a href="#">6개월</a></li>
				</ul>

				<ul class="date">
					<li>
						<input TYPE="text" NAME="cal_Date" readonly="readonly" id="start_date">
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)">
					</li>
					<li class="nth2">
						<input type="text" name="cal_Date2" readonly="readonly" id="end_date">
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)">
					</li>
				</ul>
			</li>
			<li class="auto">
				<select name="user_option" id="user_option">
					<option value="create" selected="selected">등록자</option>
					<option value="delete">삭제자</option>
				</select>
				<input type="text" id="user_name" name="user_name">
			</li>
			<li class="auto">
				<select name="device_option" id="device_option">
					<option value="name" selected="selected">기기명</option>
					<option value="ip">IP주소</option>
				</select>
				<input type="text" id="search_str" name="search_str">
			</li>
			<li class="auto">
<!-- 			
				<span class="auto_kind"><img src="../common/images/txt/txt_os_kind.gif" alt="사용자명"></span>
				<select name="os_type" id="os_type" class="ml10">
					<option value="" selected="selected">전체</option>
					<option value="Win98">Win98</option>
					<option value="WinXP">WinXP</option>
				</select>
 -->		
 			<!-- <div class="checkbox option_group ">
					<strong class="float_l pt6 mr10">OS선택</strong>
					<ul class="pt3">
				    	<li class="float_l mr10" style="vertical-align: middle;">
							<input type="checkbox" id="osAllCheck" name="osAllCheck">
							<label>전체</label>
						</li>
						<li class="float_l mr10">
							<input type="checkbox" name="osCheck" value="Win98">
							<label>Win98</label>
						</li>
						<li class="float_l mr10">
							<input type="checkbox" name="osCheck" value="WinNT">
							<label>WinNT</label>
						</li>
						<li class="float_l mr10">
							<input type="checkbox" name="osCheck" value="WinME">
							<label>WinME</label>
						</li>
						<li class="float_l mr10">
							<input type="checkbox" name="osCheck" value="Win2K">
							<label>Win2K</label>
						</li>
						<li class="float_l mr10">
							<input type="checkbox" name="osCheck" value="WinXP">
							<label>WinXP</label>
						</li>
						<li class="float_l">
							<input type="checkbox" name="osCheck" value="Win7">
							<label>Win7</label>
						</li>
						<li class="float_l">
							<input type="checkbox" name="osCheck" value="Win7">
							<label>Win7</label>
						</li>
						<li class="float_l">
							<input type="checkbox" name="osCheck" value="Win8">
							<label>Win8</label>
						</li>
					</ul>
				</div>	 -->
				<div class="checkbox option_group ">
					<strong class="float_l pt6 mr10">OS선택</strong>
	 				<table>
	 					<tr>
	 						<td>
	 							<input type="checkbox" id="os_all_checkbox" name="osAllCheck">
								<label>전체</label>
	 						</td>
	 						 <td>
	 							<input type="checkbox" name="os_checkbox" value="Win98">
								<label>Win98</label>
	 						</td>
	 						<td>
	 							<input type="checkbox" name="os_checkbox" value="WinNT">
								<label>WinNT</label>
	 						</td>
	 						<td>
	 							<input type="checkbox" name="os_checkbox" value="WinME">
								<label>WinME</label>
	 						</td>
	 						<td>
	 							<input type="checkbox" name="os_checkbox" value="Win2K">
								<label>Win2K</label>
	 						</td>
	 						<td>
	 							<input type="checkbox" name="os_checkbox" value="WinXP">
								<label>WinXP</label>
	 						</td>
	 						<td>
	 							<input type="checkbox" name="os_checkbox" value="Win7">
								<label>Win7</label>
	 						</td>
	 						 <td>
	 							<input type="checkbox" name="os_checkbox" value="Win8">
								<label>Win8</label>
	 						</td>
	 					</tr>
	 				</table>
 				</div>
 			</li>
		</ul>
	</div>

	<p class="ac mt20"><a href="#" class="basic btn setp15"><span>조회</span></a></p>

	<p id ="table_log" class="table_log">총 검색건수는0건입니다. <!-- <span><a href="#"><img src="../common/images/btn/btn_excel.gif" alt="엑셀저장"></a></span> --></p>
	<div>
	<table class="list mt15">
		<colgroup>
			<col style="width:135px">
			<col style="width:135px">
			<col style="width:135px">
			<col style="width:135px">
			<col style="width:*">
			<col style="width:135px">
			<col style="width:135px">
			<col style="width:135px">
			<col style="width:135px">
		</colgroup>
		<thead>
			<tr>
				<th>삭제일시</th>
				<th>관리그룹</th>
				<th>기기명</th>
				<th>IP 주소</th>
				<th>MAC 주소</th>
				<th>OS 종류</th>
				<th>등록일시</th>
				<th>등록자</th>
				<th>삭제자</th>
			</tr>
		</thead>
	</table>
	</div>
	<div class="scroll" style="height:300px; ">		
			<table id="device_list">
				<colgroup>
					<col style="width:135px">
					<col style="width:135px">
					<col style="width:135px">
					<col style="width:135px">
					<col style="width:*">
					<col style="width:135px">
					<col style="width:135px">
					<col style="width:135px">
					<col style="width:135px">
				</colgroup>
				<tbody>
					<tr>
						<td colspan="9">데이터가 없습니다.</td>
					</tr> 
				</tbody>
			</table>
		</div>
	<!-- <p class="ac mt20"><a href="#" class="basic"><img src="../common/images/btn/btn_close_02.gif" alt="닫기"></a></p> -->
   
	</section>

</article>
<form id="searchForm" method="post"></form>
<input type="hidden" id="hidden" name="os_type"> 
<script type="text/javascript" src="../resource/libs/common/common.util.js"></script>
<script>
	$(document).ready(function(){
		
		//help
		$("#helpBtn2").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help2-1-1");
			//e.preventDefault();
			return false;
		});
		
		// 시작일과 종료일을 오늘날짜로 초기화한다.
		$("#start_date").val(getDateStringByPeriod(new Date()));
		$("#end_date").val(getDateStringByPeriod(new Date()));
		
		// 날짜기간 버튼 클릭시
		$("#date_button a").click(function(event){
			event.preventDefault();
			var date_text = $(this).text();
			
			if(date_text == '당일'){
				$("#start_date").val(getDateStringByPeriod(new Date()));
			}else if(date_text == '3일'){
				$("#start_date").val(getDateStringByPeriod(new Date(), 2));
			}else if(date_text == '1주'){
				$("#start_date").val(getDateStringByPeriod(new Date(), 6));
			}else if(date_text == '1개월'){
				$("#start_date").val(getDateStringByPeriod(new Date(), 30));
			}else if(date_text == '3개월'){
				$("#start_date").val(getDateStringByPeriod(new Date(), 90));
			}else if(date_text == '6개월'){
				$("#start_date").val(getDateStringByPeriod(new Date(), 180));
			}
			$("#end_date").val(getDateStringByPeriod(new Date()));
		});
		
		// 조회버튼 클릭시
		$(".mt20 a").click(function(event){
			event.preventDefault();
			// 폼의 내용을 지운다.
			$("#searchForm :input").remove();
			// 선택된 조회조건을 폼에 설정한다.			
			var start_date = $("#start_date").val();
			var end_date = $("#end_date").val();
			var user_option = $("#user_option").val();
			var user_name = $("#user_name").val().trimAll();
			var device_option = $("#device_option").val();
			var search_str = $("#search_str").val().trimAll();
			
			var os_type = $('input[name=os_checkbox]:checked').map(function() {
			    return this.value;			
			}).get().join(',');
			
			
			if(start_date > end_date) {
				alert("검색 시작일자가 검색 종료일자보다 큽니다.");
				return;
			}
			
			if(start_date != ""){
				$("#searchForm").append(createInputbox("start_date", start_date));
			}
			if(end_date != ""){
				$("#searchForm").append(createInputbox("end_date", end_date));
			}
			if(user_name != ""){
				$("#searchForm").append(createInputbox("user_option", user_option));
				$("#searchForm").append(createInputbox("user_name", user_name));
			}
			if(search_str != ""){
				$("#searchForm").append(createInputbox("device_option", device_option));
				$("#searchForm").append(createInputbox("search_str", search_str));
			}
			if(os_type != ""){
				$("#searchForm").append(createInputbox("os_type", os_type));
			}
			
			if($("#searchForm :input").size() == 0){
				alert("조회 조건을 입력, 선택하지 않았습니다.");
				event.stopImmediatePropagation();
				return;
			}
			// 삭제이력을 조회한다.
			$.post("getDeleteHistory.html", $("#searchForm").serialize(), function(result){
				
				var clientList = result.clientList;
				var html = "";
				
				var htmls = "총 검색건수는 " + clientList.length +"건입니다.";
				$("#table_log").html(htmls);
				
				 if(clientList.length == 0) {
					 html +='<tr><td colspan="9">데이터가 없습니다.</td></tr>';
				 }else {
					$.each(clientList, function(index, obj){
						
						var create_user = obj.createUser ? obj.createUser.user_name : "-";
						var delete_user = obj.deleteUser ? obj.deleteUser.user_name : "-";
					    var clientgrp_name = obj.clientGrp ? obj.clientGrp.clientgrp_name : "-";
						html += "<tr>";
						html += "<td>"+(obj.delete_date || "-")+"</td>";
						html += "<td>"+clientgrp_name+"</td>";
						html += "<td>"+obj.client_name+"</td>";
						html += "<td>"+(obj.ip_addr || "-")+"</td>";
						html += "<td>"+(obj.mac_addr || "-")+"</td>";
						html += "<td>"+(obj.os_type || "-")+"</td>";
						html += "<td>"+(obj.create_date || "-")+"</td>";
						html += "<td>"+create_user+"</td>";
						html += "<td>"+delete_user+"</td>";
						html += "</tr> 	";
					});
				 }
				$("#device_list tbody").html(html);
			}, "json");
		});
	});
	// name:value를 inputbox를 생성한다.
	function createInputbox(name, value){
		return "<input type='hidden' name='"+name+"' value='"+value+"'/>";
	}
	
	//체크박스 전체체크 / 해제
   	checkedAllOrNothing("os_all_checkbox", "os_checkbox");
   	
    //체크박스 합산 - 체크박스가 전부 체크(일부해제) 되어 있으면 '전체' 체크 체크/해제
   	checkedAllCheckbox("os_all_checkbox", "os_checkbox");
</script>

<%@ include file="../common/inc/footer.jsp" %>
