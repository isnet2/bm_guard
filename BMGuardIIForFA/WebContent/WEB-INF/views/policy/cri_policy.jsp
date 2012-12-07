<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb3" value="active" />
<c:set var="gnb3_3" value="on" />
<c:set var="gnb" value="정책관리" />
<c:set var="gnb_sub" value="" />
<c:set var="tab_1d" value="정책적용결과(정책기준)" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php
$gnb3="active"; //GNB_1depth
$gnb3_3="on"; //GNB_2depth
$gnb="정책관리";
$gnb_sub="";
$tab_1d="정책적용결과(정책기준)";
include "../common/inc/header.html";
?>
--%>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>
	<figure>정책적용결과(정책기준)</figure>
	<section class="user_list">
	<!-- <h2>정책적용결과(정책기준)</h2> -->
	<div class="policy_wrap" style="border-top: 0px;">
	
	<figure>정책</figure>
	<section class="policy_list float_l">
		<p>정책</p>
		<select name="device_option" id="device_option" style="display: block; margin-bottom: 5px;">
			<option value="" selected>기기를 선택해 주세요.</option>
			<option value="0">전체기기</option>
			<option value="1">일반정책기기</option>
			<option value="2">시뮬레이션정책기기</option>
		</select>
		<ul>
		<c:forEach var="policy" items="${policyMastList }">
			<li><a href="#" id="policy_idx_${policy.policy_idx }"><c:out value="${policy.policy_name }"/></a></li>
		</c:forEach>
		</ul>
	</section>
	<section class="admit tab setpoli">
		<div class="policy_form">
			<table style="border-top: 1px solid #dcdcdc;">
				<colgroup>
					<col style="width: 700px" />
					<col style="width: *" />
				</colgroup>
				<tbody>
					<tr>
						<td><label for="setfname">정책명</label><input type="hidden" id="policy_idx" name="policy_idx" >
						<input type="text" id="policy_name" value="" readonly="readonly" style="width: 600px" /></td>
						<td><strong>생성자 : </strong><strong><span id="policy_create_user"></span></strong></td>
					</tr>
					<tr>
						<td><label for="setfdes">설 명</label><input type="text" id="policy_desc" readonly="readonly" style="width: 600px" /></td>
						<td><strong>생성일시 :</strong><strong><span id="policy_create_date"></span></strong></td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>

	<figure>허용프로세스</figure>
	<section class="admit setpoli">
	<div>
		<table class="mt0">
			<colgroup>
				<col style="width:50px"/>
				<col style="width:100px"/>
				<col style="width:100px"/>
				<col style="width:100px"/>
				<col style="width:100px"/>
				<col style="width:100px"/>
				<col style="width:*"/>
				<col style="width:100px"/>
				<col style="width:100px"/>
				<col style="width:100px"/>
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="listCheck" value="listCheck"></th>
					<th>관리그룹</th>
					<th>기기명</th>
					<th>IP주소</th>
					<th>OS</th>
					<th>적용여부</th>
					<th>미적용사유</th>
					<th>현재적용정책명</th>
					<th>시뮬레이션정책</th>
					<th>정책적용일시</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="scroll" style="height: 395px; ">
	<table style="border-top: 0px; text-align: center">
		<colgroup>
			<col style="width:50px"/>
			<col style="width:100px"/>
			<col style="width:100px"/>
			<col style="width:100px"/>
			<col style="width:100px"/>
			<col style="width:100px"/>
			<col style="width:*"/>
			<col style="width:100px"/>
			<col style="width:100px"/>
			<col style="width:100px"/>
		</colgroup>
		<tbody id="policy_list">
		</tbody>
	</table>
	</div>

   <div style="overflow:hidden">
	   <div class="btn_admit">
			<a href="#" class="btn policy_select_view" id="view_info_bt"><span>선택기기 상세정보</span></a>
		</div>

	   <div class="btn_admit2">
			<a href="#" class="btn" id="policy_apply_btn"><span>선택기기 정책재적용</span></a>
	   </div>
	</div>
	</section>
	</div>
	</section>

<%@ include file="device_popup.jsp" %>

</article>


<script>
	$(document).ready(function(){
		//help
		$("#helpBtn3").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help3-3");
			//e.preventDefault();
			return false;
		});
		
		
		// 좌측의 정책 선택시
		$(".policy_list li a").click(function(event){
			
			event.preventDefault();
			var idx = $(this).attr("id").replace("policy_idx_", "");
			
			$("input[name='policy_idx']").val(idx);
			
			$.getJSON("policyInfo.html", {policy_idx:idx}, function(result){
				var policy = result.policyMast;
				$("#policy_name").val(policy.policy_name);
				$("#policy_desc").val(policy.policy_desc);
				$("#policy_create_user").text(policy.createUser.user_name);
				$("#policy_create_date").text(policy.create_date);
			});
			
			callGetClientList();
		});
		
		//체크박스 전체체크 / 해제
	   	$("#listCheck").click( function() { 

	    		var result = $("#listCheck").attr("checked");
	    		if(result == "checked") {
	    			$("input[name='client_idx']:checkbox").each(function() {
	   				$(this).attr("checked", true);
	   			});
	    		}else {
	    			$("input[name='client_idx']:checkbox").each(function() {
	   				$(this).attr("checked", false);
	   			});
	    		}
	   	});
	   	
	    	//체크박스 합산 - 체크박스가 전부 체크(일부해제) 되어 있으면 '전체' 체크 체크/해제
	   	$("input[name='client_idx']:checkbox").click(function() {
	   		//alert("체크박스 체크");
	   		var result = $(this).attr("checked");
	   		//alert(result);
	   		var cnt = 0;
	   		if (result != "checked") {
	   			$("#listCheck").attr("checked", false);
	   		}else {
	   			$("input[name='client_idx']:checkbox").each(function() {
	   				var result2 = $(this).attr("checked");
	   				if (result2 == "checked") {
	   					cnt++;
	   				}
	   			});
	   			if (cnt == $("input[name='client_idx']").length) {
	   				$("#listCheck").attr("checked", "checked");
	   			}
	   		}
	   	});
	   		
	   	$("#device_option").change(function(){
	   		//alert($("#device_option option:selected").val());
	   		callGetClientList();
	   	});
	   	
   	
	   	$("#policy_apply_btn").click(function(event){
			event.preventDefault();
			var client_idxs = $('input[name=client_idx]:checked').map(function() {
			    return this.value;			
			}).get().join(',');	
			
			if(client_idxs ==""){
				alert("정책을 적용할 기기를 선택하여 주세요.");
				return;
			}
			
			var rtn1 = 0, rtn2 = 0;
			var returnValue = confirm("정책을 재적용하시겠습니까?");
			if(returnValue){
				$("input[name='client_idx']:checkbox").each(function() {
					
					if($(this).attr("checked")){
						rtn1++;
						
						var client_idx = $(this).val();
						var policy_idx = $("#policy_idx").val();
						
						$.post("applyPolicyOne.html", {"policy_idx" : policy_idx , "client_idx" : client_idx}, function(data, status){
							if(status == "success" && data.result == 1){
								rtn2++;
							}
						}, 'json');
					}
				});
				setTimeout(function(){
					if(rtn1 == rtn2) {
						alert("자동화기기에 정책 재적용이 완료되었습니다 ");
						$("#policy_list").html("");
					}else 
						alert("정책 재적용 중 오류가 발생하였습니다. ");
					},1000);

			}
	   	});
	   	
		$("#view_info_bt").click(function(event){
			if($("#policy_list :checked").length == 1){
				
				var client_idx = $("#policy_list :checked").attr("id").replace('client_idx_', '');

				$.getJSON("getDeviceByClientIdx.html", {client_idx:client_idx}, function(result){
				
					
					var device = result.device;
					$("#view_device_name").text(device.client_name);
					var policy_name = "-";
					var policy_creator = "-";
					var policy_create_date = "-";
					if(device.nowPolicy){
						var policy = device.nowPolicy;
						policy_name = policy.policy_name;
						policy_creator = policy.createUser.user_name;
						policy_create_date = policy.create_date;
					}
					
					var html = "";
					html += '<tr>';
					html 	+= '<td class="tit">기기등록일</td>';
					html 	+= '<td>'+device.create_date+'</td>';
					html 	+= '<td class="tit">OS 종류</td>';
					html 	+= '<td>'+(device.os_type||'-')+'</td>';
					html += '</tr>';
					html += '<tr>';
					html 	+= '<td class="tit">IP 주소</td>';
					html 	+= '<td>'+(device.ip_addr||'-')+'</td>';
					html 	+= '<td class="tit">MAC 주소</td>';
					html 	+= '<td>'+(device.mac_addr||'-')+'</td>';
					html += '</tr>';
					html += '<tr>';
					html 	+= '<td class="tit">현재 적용 정책</td>';
					html 	+= '<td>'+policy_name+'</td>';
					html 	+= '<td class="tit">정책생성자</td>';
					html 	+= '<td>'+policy_creator+'</td>';
					html += '</tr>';
					html += '<tr>';
					html 	+= '<td class="tit">정책생성일시</td>';
					html 	+= '<td>'+policy_create_date+'</td>';
					html 	+= '<td class="tit">정책적용일시</td>';
					html 	+= '<td>'+(device.policy_nowdate||'-')+'</td>';
					html += '</tr>';
					
					$("#view_device_table tbody").html(html);
				});
			}else{
				alert("선택된 자동화기기가 없거나, 두 개 이상의 기기를 선택하였습니다.");
				event.stopImmediatePropagation();
			}
		});
	   	
	});

	function callGetClientList() {

		var device_option = $("#device_option option:selected").val();
		var policy_idx = $("#policy_idx").val();
		
		if(device_option == "") {
			alert("기기를 선택하여 주세요.");
			return;
		}
		if (policy_idx == "" ) {
			$("select[name=device_option] option[value='']").attr("selected",true);
			alert("정책을 선택하여 주세요.");
			return;
		}
		$.post(
				"./getDevicePolicyList.html", 
				{ 	"policynow_idx" : policy_idx,
					"device_option" : device_option
				}, 
				function (r) {
					reflashTable(r);
				},
				"json"
			); 
	}
	
	function reflashTable(result) {
		var deviceList = result.deviceList;
		if(deviceList != null) {
			var html = "";
			$.each(deviceList, function(index, rtn){
				
				var policy_name = rtn.nowPolicy ? rtn.nowPolicy.policy_name : '-';
				
				html+="<tr>";
				html+="<td><input type='checkbox' id='client_idx_"+rtn.client_idx+"' name='client_idx' value='"+rtn.client_idx+"'></td>";
				html+="<td class='al'>"+rtn.clientgrp_name+"</td>";
				html+="<td>"+rtn.client_name+"</td>";
				html+="<td>"+(rtn.ip_addr || '-')+"</td>";
				html+="<td>"+(rtn.os_type|| '-')+"</td>";
				if (rtn.policy_apply_flag == '1'){
					html+="<td>적용</td>";
				}else {
					html+="<td>미적용</td>";
				}
				html+="<td>"+(rtn.miss_apply_info|| '-')+"</td>";
				html+="<td>"+policy_name+"</td>";
				html+="<td>"+(rtn.nowsim_flag|| '-')+"</td>";
				html+="<td>"+(rtn.policy_nowdate|| '-')+"</td>";
				html+="</tr>";
			});
			$("#policy_list").html(html);
		}
	}
	</script>

<%@ include file="../common/inc/footer.jsp" %>
