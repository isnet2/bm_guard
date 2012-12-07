<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb3" value="active" />
<c:set var="gnb3_2" value="on" />
<c:set var="gnb" value="정책관리" />
<c:set var="gnb_sub" value="" />
<c:set var="tab_1d" value="정책적용" />
<%@ include file="../common/inc/header.jsp" %>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>
	<figure>정책적용</figure>
	<section class="user_list">
	<h2>정책적용</h2>
	<div class="apply">
		<section>
			<label for="vu_policy">정책</label>
			<select name="" id="vu_policy">
				<option value="">정책을 선택하세요.</option>
				<c:forEach var="policy" items="${policyMastList }">
					<option value="${policy.policy_idx }">${policy.policy_name }</option>
				</c:forEach>
			</select>
			<a href="#" class="btn set25 policy_detail_view" id="view_policy_bt"><span>정책내용 보기</span></a>
		</section>
	</div>
	<div class="policy_wrap">
	<figure>lnb_tree</figure>
		<section class="lnb_tree" >
		<div class="apply">
			<section>
				<label for="vu_policynow">현재 적용정책에서 불러오기</label>
				<select name="" id="vu_policynow">
					<option value="">정책을 선택하세요.</option>
					<c:forEach var="policyNow" items="${policyNowMastList }">
						<option value="${policyNow.policy_idx }">${policyNow.policy_name }</option>
					</c:forEach>
				</select>
				<a href="#" class="btn set25" id="policynow_device_btn"><span>불러오기</span></a>
			</section>
		</div>
		<div class="check">
			<select name="device_option" id="device_option"  style="display: block; margin-left: 28px; margin-bottom: 5px;">
				<option value="0">전체기기</option>
				<option value="1">일반정책기기</option>
				<option value="2">시뮬레이션정책기기</option>
			</select>
				<select name="tree_search_option" id="tree_search_option">
					<option value="client_name" selected="selected">기기명</option>
					<option value="ip_addr">IP주소</option>
				</select>
				<input type="text" id="tree_search_str" name="tree_search_str" class="w50">
				<a href="#" class="btn type2 set25" id="tree_search_bt" name="tree_search_bt" ><span>조회</span></a>
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
		<div class="board">
<!-- 			<div class="btn_set">	
				<a href="#" class="btn"><span>정책 적용</span></a>
				<a href="#" class="btn"><span>정책 시뮬레이션 적용</span></a>
			</div> -->
			<div class="tit" >
				<table> 
					<colgroup>		
						<col style="width:50px"/>
						<col style="width:100px"/>
						<col style="width:120px"/>
						<col style="width:80px"/>
						<col style="width:100px"/>
						<col style="width:100px"/>
						<col style="width:*"/>
						<col style="width:100px"/>
						<col style="width:150px"/>	
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="list_all_checkbox" name=""/></th>
						<th>관리그룹</th>
						<th>기기명</th>
						<th>IP주소</th>
						<th>OS</th>
						<th>현재적용<br/>정책명</th>
						<th>시뮬레이션정책</th>
						<th>정책생성자</th>
						<th>정책적용</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="list">
			<table id="device_list_table">
				<colgroup>
					<col style="width:50px"/>
					<col style="width:100px"/>
					<col style="width:120px"/>
					<col style="width:80px"/>
					<col style="width:100px"/>
					<col style="width:100px"/>
					<col style="width:*"/>
					<col style="width:100px"/>
					<col style="width:150px"/>
				</colgroup>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="float_l mt10">
			<a href="#" class="btn" id="append_group_bt"><span>그룹추가</span></a>
			<a href="#" class="btn" id="append_device_bt"><span>기기추가</span></a>
			<a href="#" class="btn" id="delete_device_bt"><span>기기 삭제</span></a>
			<a href="#" class="btn policy_select_view" id="view_info_bt"><span>선택기기 상세정보</span></a>
		</div>

		<div class="float_r  mt10">
			<a href="#" class="btn" id="apply_policy_bt"><span>정책 적용</span></a>
			<a href="#" class="btn" id="apply_sim_policy_bt"><span>시뮬레이션 정책 적용</span></a>
		</div>
	</div>
	
   	<%@ include file="policy_popup.jsp" %>
   	<%@ include file="device_popup.jsp" %>
  
	</section>

</article>
<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="../resource/libs/common/tree.js"></script>
<script type="text/javascript">

	function appendDevice(device){
		
		var client_idx = device.client_idx;
		var length = $("#device_list_table tbody :input[id='client_idx_"+client_idx+"']").length;
		if(length == 0){
			
			var html = "";
			var policy_name = device.nowPolicy ? device.nowPolicy.policy_name : '-';
			var sim_mode = device.nowsim_flag ? (device.nowsim_flag == 0 ? '보안모드' : '시뮬레이션 모드' ): '-';
			var user_name ="-";
			if (device.createUser!= null) {
				var user_name = device.createUser.user_name ? device.createUser.user_name : '-';
			}
			html += "<tr>";
			html += '<td><input type="checkbox" id="client_idx_'+device.client_idx+'" name="client_idx"/></td>';
			html += '<td>'+device.clientGrp.clientgrp_name+'</td>';
			html += '<td>'+device.client_name+'</td>';
			html += '<td>'+(device.ip_addr||'-')+'</td>';
			html += '<td>'+(device.os_type||'-')+'</td>';
			html += '<td>'+policy_name+'</td>';
			html += '<td>'+sim_mode+'</td>';
			html += '<td>'+user_name+'</td>';
			html += '<td>'+(device.create_date||'-')+'</td>';
			html += '</tr>';
			
			$("#device_list_table tbody").append(html);
		}
		
	}
	
	$(document).ready(function(){
		
		//help
		$("#helpBtn3").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help3-2");
			//e.preventDefault();
			return false;
		});
		
		init_group_tree("tree");
		binding_select_group_simple("tree", "tree_device_list");
		
		// 전체 선택 체크박스 선택시
		$("#list_all_checkbox").click(function(){
			var checkbox = this;
			$("#device_list_table tbody :checkbox").each(function(index, obj){
				obj.checked = checkbox.checked;
			});
			
		});
		
		//현재정책에서 불러오기 버튼클릭
		$("#policynow_device_btn").click(function(event){
			//event.preventDefault();
			var policy_idx = $("#vu_policynow").val();
			if(policy_idx != "") {
				$.post("./getDeviceListByPolicyIdx.html", {"policy_idx" :policy_idx}, function(result, status){
					alert(result);
					if(result !=null) {
						var deviceNowList = appendDevice(result.deviceNowList);
						$.each(deviceNowList, function(index, deviceNow){
							appendDevice(deviceNow);
						});
					}
				}, 'json');
			}else {
				alert("현재정책을 선택하여 주세요.");
				return;
			}
		});
				
		// 그룹추가 버튼 클릭
		$("#append_group_bt").click(function(event){
			event.preventDefault();
			//var clientGrpIdx = $("#tree a[class='jstree-clicked']").parent().attr("id").replace("node_", "");
			var clientGrpIdx = getGroupIdx("tree");
			if(clientGrpIdx){
				
				$.getJSON("getDeviceListByClientGrpIdx.html", {clientgrp_idx:clientGrpIdx}, function(result){
					var deviceList = result.deviceList;
					$.each(deviceList, function(index, device){
						appendDevice(device);
					});
					
				});
			}else{
				alert("자동화기기를 선택하세요.");
			}
		});
		
		// 기기추가 버튼 클릭
		$("#append_device_bt").click(function(event){
			event.preventDefault();
			//var client_idx = $("#tree_device_list a[class='jstree-clicked']").parent().attr("client_idx");
			var client_idx = getClientIdx("tree_device_list");
			if(client_idx){
				
				$.getJSON("getDeviceByClientIdx.html", {client_idx:client_idx}, function(result){
					appendDevice(result.device);
				});
				
			}else{
				alert("자동화기기를 선택하세요.");
			}
			
		});
		
		$("#delete_device_bt").click(function(event){
			event.preventDefault();
			$("#device_list_table tbody :checked").each(function(index, obj){
				$(this).parent().parent().remove();
			});
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
		
		$("#view_policy_bt").click(function(event){
			event.preventDefault();
			var policy_idx = $("#vu_policy").val();
			if(policy_idx != ""){
				$.getJSON("policyInfo.html", {policy_idx:policy_idx}, function(result){
					var policy = result.policyMast;
					var passPolicyList = policy.passPolicyList;
					var pass_html = "";
					$.each(passPolicyList, function(index, passPolicy){
						pass_html += "<tr>";
						pass_html += "<td>"+passPolicy.process_name+"</td>";
						pass_html += "<td>"+passPolicy.comp_name+"</td>";
						pass_html += "<td class='p120 tl'>"+passPolicy.passpr_info+"</td>";
						pass_html += "</tr>";
					});
					$("#pass_policy_table tbody").html(pass_html);
					
					var systemPolicyList = policy.systemPolicyList;
					var system_html = "";
					$.each(systemPolicyList, function(index, systemPolicy){
						system_html += "<tr>";
						system_html += "<td class='pl20 tl'>"+systemPolicy.process_name+"</td>";
						system_html += "</tr>";				
					});
					$("#system_policy_table tbody").html(system_html);
					
					var folderPolicyList = policy.folderPolicyList;
					var folder_html = "";
					$.each(folderPolicyList, function(index, folderPolicy){
						folder_html += "<tr>";
						folder_html += "<td>"+folderPolicy.bmfolder_path+"</td>";
						folder_html += "<td>"+folderPolicy.comp_name+"</td>";
						folder_html += "<td>"+folderPolicy.folder_info+"</td>";
						folder_html += "</tr>";
					});
					$("#folder_policy_table tbody").html(folder_html);
					
					var mediaPolicyList = policy.mediaPolicyList;
					var media_html = "";
					$.each(mediaPolicyList, function(index, mediaPolicy){
						var media_type = "";
						switch(mediaPolicy.media_type){
							case "U":
								media_type = "Unknown Type";
								break;
							case "F":
								media_type = "플로피 디스크";
								break;
							case "L":
								media_type = "Local Disk";
								break;
							case "RO":
								media_type = "CD-R 드라이브";
								break;
							case "RW":
								media_type = "CD_RW 드라이브";
								break;
							case "N":
								media_type = "Network 드라이브";
								break;
							case "Z":
								media_type = "Removable 드라이브";
								break;
							case "RD":
								media_type = "RAM 드라이브";
								break;
						}
						media_html += "<tr>";
						media_html += "<td>"+media_type+"</td>";
						media_html += "<td>";
						media_html += '<input type="radio" disabled="disabled" name="radio'+index+'"'+ (mediaPolicy.method == 'A' ? 'checked=checked' : '') +'/><label for="radio1-1">허용</label>'; 
						media_html += '<input type="radio" disabled="disabled" name="radio'+index+'"'+ (mediaPolicy.method == 'R' ? 'checked=checked' : '') +'/><label for="radio1-2">읽기전용</label>'; 
						media_html += '<input type="radio" disabled="disabled" name="radio'+index+'"'+ (mediaPolicy.method == 'B' ? 'checked=checked' : '') +'/><label for="radio1-3">차단</label>';
						
						media_html += '</td>';
						media_html += "</tr>";
					});
					$("#media_policy_table tbody").html(media_html);
				});
			}else{
				alert("조회할 정책을 선택하세요.");
				event.stopImmediatePropagation();
			}
		});
		
		$("#apply_policy_bt").click(function(event){
			event.preventDefault();
			applyPolicy("1");
		});
		
		$("#apply_sim_policy_bt").click(function(event){
			event.preventDefault();
			applyPolicy("0");			
		});
		
	});
	
	// 정책 적용
	function applyPolicy(sim_flag){
		$("#apply_form").html("");

		var policy_idx = $("#vu_policy").val();
		if(policy_idx == ""){
			alert("적용할 정책을 선택하세요.");
			return;
		}
		
		if($("#device_list_table tbody :checkbox:checked").length == 0){
			alert("정책을 적용할 자동화기기가 등록되지 않았거나,\n 선택된 자동화기기가 없습니다.");
			return;
		}
		
		var returnValue = confirm("정책을 적용하시겠습니까?");
		if(returnValue){
		
			$("#apply_form").append("<input type='hidden' name='policy_idx' value='"+policy_idx+"'/>");
			
			$("#device_list_table tbody :checkbox:checked").each(function(input, checkbox){
				var client_idx = $(checkbox).attr("id").replace("client_idx_", "");
				var input = "<input type='hidden' name='client_idx' value='"+client_idx+"'/>";
				$("#apply_form").append(input);
			});
			$("#apply_form").append("<input type='hidden' name='sim_flag' value='"+sim_flag+"'/>");
			
			
			$.post("applyPolicyForDevice.html", $("#apply_form").serialize(), function(data, status){
				if(status == "success" && data.status == 1){
					// 중계서버 호출
					/* jQuery.ajax({
						url			: "http://isnet.ipdisk.co.kr:8180/hnd",
						data		: {SC_CODE:"510", TG_TYPE:"JSON", UUID:new Date().getTime()},
						dataType	: "jsonp",
						type		: "POST",
						jsonp		: "callback",
						success		: function(data) {
							alert(JSON.stringify(data));
						},
						error		: function(data, status){
							alert("ERROR : " + status);
						}
					});		 */
					
					alert("자동화기기에 정책 적용이 완료되었습니다.");
					$("#device_list_table tbody").html("");
				}else{
					alert("정책적용 중 오류가 발생하였습니다.");
				}
			}, 'json');
		}
		
	}
</script>
<form id="apply_form" method="post">
</form>
<%@ include file="../common/inc/footer.jsp" %>
