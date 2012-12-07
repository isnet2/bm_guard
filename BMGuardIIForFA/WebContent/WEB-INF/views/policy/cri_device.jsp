<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb3" value="active" />
<c:set var="gnb3_4" value="on" />
<c:set var="gnb" value="정책관리" />
<c:set var="gnb_sub" value="" />
<c:set var="tab_1d" value="정책적용결과(기기기준)" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php
$gnb3="active"; //GNB_1depth
$gnb3_4="on"; //GNB_2depth
$gnb="정책관리";
$gnb_sub="";
$tab_1d="정책적용결과(기기기준)";
include "../common/inc/header.html";
?>
--%>
</header>

<article  >
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>정책적용결과(기기기준)</figure>
	<section class="user_list">
	<!-- <h2>정책적용결과(기기기준)</h2> -->
	<div class="policy_wrap">

	<figure>lnb_tree</figure>
	<section class="lnb_tree" >
		<div class="check">
			<select name="device_option" id="device_option" style="display: block; margin-left: 28px; margin-bottom: 5px;">
				<option value="" selected>기기를 선택해 주세요.</option>
				<option value="0">전체기기</option>
				<option value="1">일반정책기기</option>
				<option value="2">시뮬레이션정책기기</option>
			</select>
		
			<select name="" id="">
				<option value="기기명">기기명</option>
				<option value="IP주소">IP주소</option>
			</select>
			<input type="text" id="" name="">
			<input type="image" src="../common/images/btn/btn_check_03.gif" id="" name="">
		</div>
		<div>
			<div class="manage" >
				<h3>관리그룹</h3>
				<div id="tree" style="height:220px">
					<%-- 
					<img src="../common/images/img/@tree_01.gif" alt="">
					--%>
				</div>
			</div>
			<div  class="machine" >
				<h3>자동화기기</h3>
				<div id="tree_device_list" style="height:220px">
					<!-- <img src="../common/images/img/@tree_02.gif" alt=""> -->
				</div>
			</div>
		</div>
	</section>

	<figure>허용프로세스</figure>
	<section class="board">
	<div class="tit">
	<table>
		<colgroup>
			<col style="width:50px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:*"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="listCheck" name="listCheck"/></th>
				<th>관리그룹</th>
				<th>기기명</th>
				<th>IP주소</th>
				<th>OS</th>
				<th>적용여부</th>
				<th>미적용사유</th>
				<th>현재 적용 정책명</th>
				<th>시뮬레이션정책</th>
				<th>정책적용일시</th>
			</tr>
		</thead>
	</table>
	</div>
	<div class="list" style="height: 320px;">
	<table id="device_list_table" style="border-top: 0px; text-align: center">
		<colgroup>
			<col style="width:50px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
			<col style="width:*"/>
			<col style="width:95px"/>
			<col style="width:95px"/>
		</colgroup>
		<tbody id="policy_list">
		</tbody>
	</table>
	</div>

   <div style="overflow:hidden">
	   <div class="btn_admit">
			<a href="#" class="btn" id="append_group_bt"><span>그룹추가</span></a>
			<a href="#" class="btn" id="append_device_bt"><span>기기추가</span></a>
			<a href="#" class="btn" id="delete_device_bt"><span>기기 삭제</span></a>
			<a href="#" class="btn policy_select_view" id="view_info_bt"><span>선택기기 상세정보</span></a>
		</div>

	   <div class="btn_admit2">
			<a href="#" class="btn" id="policy_apply_btn"><span>선택기기 정책재적용</span></a>
	   </div>
	</div>

	</section>

<%@ include file="device_popup.jsp" %>
</article>


<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="../resource/libs/common/tree.js"></script>
<script>

	$(document).ready(function(){
		//help
		$("#helpBtn3").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help3-4");
			//e.preventDefault();
			return false;
		});
		
		// 트리메뉴
		init_group_tree("tree");
		binding_select_group_simple("tree", "tree_device_list");
		
		// 그룹추가 버튼 클릭
		$("#append_group_bt").click(function(event){
			event.preventDefault();
			
			var device_option = $("#device_option option:selected").val();
			if(device_option == "") {
				alert("기기를 선택하여 주세요.");
				return;
			}
			var clientGrpIdx = getGroupIdx("tree");
			if(clientGrpIdx){
				$.post(
						"./getDevicePolicyList.html", 
						{ 	"device_option" : device_option,
							"clientgrp_idx" : clientGrpIdx
						}, 
						function (r) {
							reflashTable(r);
						},
						"json"
					);
			}else{
				alert("자동화기기를 선택하세요.");
			}
		});
		
		// 기기추가 버튼 클릭
		$("#append_device_bt").click(function(event){
			event.preventDefault();
			
			var device_option = $("#device_option option:selected").val();
			if(device_option == "") {
				alert("기기를 선택하여 주세요.");
				return;
			}
			
			var client_idx = getClientIdx("tree_device_list");
			if(client_idx){
				
				$.post(
						"./getDevicePolicyList.html", 
						{ 	"device_option" : device_option,
							"client_idx" : client_idx
						}, 
						function (r) {
							reflashTable(r);
						},
						"json"
					);
				
			}else{
				alert("자동화기기를 선택하세요.");
			}
			
		});
		//삭제버튼
		$("#delete_device_bt").click(function(event){
			event.preventDefault();
			$("#device_list_table tbody :checked").each(function(index, obj){
				$(this).parent().parent().remove();
			});
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
		
		$("#view_info_bt").click(function(event){
			if($("#device_list_table tbody :checked").length == 1){
				
				var client_idx = $("#device_list_table tbody :checked").attr("id").replace('client_idx_', '');

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
						var policy_idx = $("#policy_idx_"+client_idx).val();
						
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
	});
	
	function reflashTable(result) {
		var deviceList = result.deviceList;
		//alert(deviceList.length);
		if(deviceList != null) {
			var html = "";
			$.each(deviceList, function(index, rtn){
				
				var policyIdx = rtn.policy ? rtn.policy.policy_idx : '-';
				
				var policynow_name = rtn.nowPolicy ? rtn.nowPolicy.policy_name : '-';
				
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
				html+="<td>"+policynow_name+"</td>";
				html+="<td>"+(rtn.nowsim_flag|| '-')+"</td>";
				html+="<td>"+(rtn.policy_nowdate|| '-');
				html+="<input type='hidden' id='policy_idx_"+rtn.client_idx+"' value='" + policyIdx + "'></td>";
				html+="</tr>";

			});
			$("#policy_list").append(html);
		}
	}
</script>

<%@ include file="../common/inc/footer.jsp" %>