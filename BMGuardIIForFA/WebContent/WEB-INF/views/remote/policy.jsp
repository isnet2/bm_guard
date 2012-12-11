<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="gnb4" value="active" />
<c:set var="gnb4_11" value="on" />
<c:set var="gnb" value="원격관리" />
<c:set var="tab_1d" value="정책관리" />
<%@ include file="../common/inc/header.jsp" %>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>정책관리</figure>
	<section class="user_list">
<!-- 	<h2>정책관리</h2> -->
	<div class="auto_wrap">

	<figure>lnb_tree</figure>

		<!--  트리메뉴 -->
		<section class="lnb_tree" >
		<div class="check">
			<select name="tree_search_option" id="tree_search_option">
				<option value="client_name" selected="selected">기기명</option>
				<option value="ip_addr">IP주소</option>
			</select>
			<input type="text" id="tree_search_str" name="tree_search_str">
			<input type="image" src="../common/images/btn/btn_check_03.gif" id="tree_search_bt" name="tree_search_bt">
		</div>
		<div>
		<div class="manage"  >
			<h3>관리그룹</h3>
			<div id="tree" style="height: 290px;">
			</div>
		</div>
		<div  class="machine">
			<h3>자동화기기</h3>
			<div id="tree_device_list" style="height: 290px;">
			</div>
		</div>
		</div>
		</section>
	<!--  트리메뉴 -->

	<div class="board">
		<div class="table_body mt0">
			<table class="mt20 sub_table">
				<colgroup>
					<col style="width:200px;"/>
					<col style="width:*;"/>
				</colgroup>
		<tbody>
			<tr>
				<th>정책유형</th>
				<td class="rela">
					<select name="job_type" id="job_type">
						<option value="ST" selected>보안정책 ON</option>
						<option value="SF">보안정책 OFF</option>
					</select>
					<input type="hidden" id="job_idx" name="job_idx"/>
				</td>
			</tr>
			<tr>
				<th><label for="sau">종료 사유</label></th>
				<td>
					<input type="text" style="width:664px" id="reason" name="reason" /> 
					<a href="#" id="submitBtn" class="btn type2 set25 btn_action"><span>실 행</span></a>
				</td>
			</tr>
		</tbody>
	</table>

		<h4 class="mt20">처리결과</h4>
		<div class="tit" style="padding-right: 0px;">
			<table class="mt10" style="border-top: 2px solid #ED1C24;">
			<colgroup>
					<col style="width:100px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>구분</th>
					<th>관리그룹</th>
					<th>자동화<br/>기기명</th>
					<th>IP주소</th>
					<th>처리일시</th>
					<th>처리결과</th>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="table_body mt0 scroll" style="height: 220px;">
			<table style="text-align: center;">
				<colgroup>
					<col style="width:100px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:*"/>
				</colgroup>
				<tbody id="devicetBody">
				</tbody>
			</table>
		</div>

	</section>

</article>

<!-- axtiveX -->
<div id="activeXWrite"></div>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/BMSupoAxInstall.js"></script>


<script type="text/javascript" charset="UTF-8" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" charset="UTF-8" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/tree.js"></script>
<script type="text/javascript" charset="UTF-8" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>
<script type="text/javascript"> 

var submitFlag = false;
$(document).ready(function() {
	
	//help
	$("#helpBtn4").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help4-8");
		//e.preventDefault();
		return false;
	});
	
	// 트리메뉴
	init_group_tree("tree");
	binding_select_group_simple("tree", "tree_device_list");
	
	//노드 클릭
	 $("#tree_device_list a").live("click", function(e) {
		var client_idx = getClientIdx("tree_device_list");
		if(client_idx){
			$.getJSON("/policy/getDeviceByClientIdx.html", {client_idx:client_idx}, function(result){
				rtnResultAddTbody(result.device);
			});
		}
  	}) ; 

	$("#devicetBody a").live( "click" , function(){
		//실행이 이미 되었으면
		if (!submitFlag) {
			$(this).parent().parent().remove();
		}else {
			alert("이미 실행된 건에 대해서는 삭제하실 수 없습니다.");
			return;
		}	});

	$("#submitBtn").click(function() {  
		// 실행 버튼 클릭시 
		submitFlag = true;
		
		var job_type = $("#job_type").val();
		var reason = $("#reason").val();

		if(job_type.trim().length==0) {
			alert("정책유형을 선택하여 주세요.");
			return;
		}

		if(reason.trim().length ==0) {
			alert("정책 사유를 입력하여 주세요.");
			return;
		}
		//전송할 device idx, ip
		var device_idxs = $("input[name='device_idx\[\]']");
		var device_ips = $("input[name='device_ip\[\]']");
		
		if(device_idxs.length == 0) {
			alert("정책 관리할 자동화 기기를 선택하여 주세요.");
			return;
		}
		
		$.post(
				"./insertPolicy.html", 
				{ 
					"job_type" : job_type,
					"job_desc" : reason,
				}, 
				function (r) {
					if(r.status) {  
						$("#job_idx").val(r.job_idx);
					}else {
						submitFlag = false;
					}   
				},
				"json"
			); 
		
		/* document.BMSupoAx.SendFile(보낼IP, port, 전송파일경로, 수신파일경로, 0, 클라이언트 idx)*/
		for(var i = 0 ; i < device_idxs.length;i++) {
		
			var device_idx = $(device_idxs[i]).val();
			var device_ip =  $(device_ips[i]).val();
/* 			if(device_ip == "" || device_ip == "null") {
				device_ip = "192.168.0.73";
			}
 */			//alert("("+device_ip +", 7997 ," +transfile+","+savePath+","+ 0 +"," +device_idx+" )");
			//document.BMSupoAx.SendFile( "192.168.0.73", 7997, transfile, savePath, 0, device_idx);
			alert("OnMessage 호출");
			OnMessage(device_idx,3);
		}

	});

});
 
function OnMessage(nlIndex, nlResultCode) {
	$.post("./insertResult.html" ,
			{ 
			"job_idx" : $("#job_idx").val(),
			"client_idx" : nlIndex,
			"job_kind" : "PM",
			"job_result" : nlResultCode
			}, 
			function (r) {
				if(r.status == 1) {  
					//alert("OnMessage 성공");
				}   
			},
			"json"
		); 
	rtnValue(nlIndex, nlResultCode);

}
function rtnValue(nlIndex, nlResultCode) {
	var date = new Date();
	var rtnTime = getDateTimeFormat(date);

	$("#rtnVal_" + nlIndex).html(nlResultCode);
	$("#rtnTime_" + nlIndex).html(rtnTime);
	$("#result_idx_" + nlIndex).val(nlResultCode);
	
}

function rtnResultAddTbody(device){
	
	var client_idx = device.client_idx;
	var length = $("#device_ip_"+client_idx).length;
	if(length == 0){
		
		var htmls = "";
	
		htmls += "<tr>";
		htmls += "<td><a href=\"#\" id=\"del_"+ device.client_idx +"\" class=\"btn type2 set25\"><span>삭제</span></a></td>";
		htmls += "<td>";
		htmls += "<input type=\"hidden\" name=\"device_idx[]\" id=\"device_"+device.client_idx+"\" value=\""+device.client_idx+"\">";
		
		if (device.clientGrp != null)
		htmls +=      device.clientGrp.clientgrp_name + "</td>";
		else 
		htmls += "</td>";
		
		htmls += "<td>" +device.client_name+'</td>';
		htmls += "<td><input type=\"hidden\" name=\"device_ip[]\" id=\"device_ip_"+device.client_idx+"\" value=\""+device.ip_addr+"\">";
		htmls += (device.ip_addr||'')+"</td>";
		htmls += "<td><input type=\"hidden\" name=\"job_idx[]\" id=\"job_idx_"+device.client_idx+"\">";
		htmls += "<div id=\"rtnTime_" +device.client_idx +"\"></div></td>";
		htmls += "<td ><input type=\"hidden\" name=\"result_idx[]\" id=\"result_idx_"+device.client_idx+"\" value=\""+device.ip_addr+"\">";
		htmls += "<div id=\"rtnVal_" +device.client_idx +"\"></div></td>";
		htmls += "</tr>";
		
		$("#devicetBody").append(htmls);
	}
	
}

</script>

<script language="javascript" event="ResultNoti2WEB(nlIndex, nlResultCode)" for="BMSupoAx">
	OnMessage(nlIndex, nlResultCode);
</script>

<%@ include file="../common/inc/footer.jsp" %>