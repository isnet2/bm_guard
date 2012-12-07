<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb3" value="active" />
<c:set var="gnb3_1" value="on" />
<c:set var="gnb" value="정책관리" />
<c:set var="gnb_sub" value="정책 수립" />
<c:set var="tab_1d" value="시스템프로세스" />
<%@ include file="../common/inc/header.jsp" %>
</header>

<article class="auto_wrap setpolicy" >
<form method="post" action="">
	<figure>정책</figure>
	<section class="lnb_tree policy_list">
		<p>정책</p>
		<ul>
		<c:forEach var="policy" items="${policyMastList }">
			<li><a href="#" id="policy_idx_${policy.policy_idx }"><c:out value="${policy.policy_name }"/></a></li>
		</c:forEach>
		</ul>
	</section>

	<figure>tab</figure>
	<section class="admit tab setpoli set2">
		<div class="policy_form">
			<table>
				<tbody>
					<tr>
						<td><label for="setfname">정책명</label><input type="text" id="policy_name" name="policy_name" /></td>
						<td>
							<strong>생성자 : ${loginUser.user_name}</strong>
							<input type="hidden" name="createUser.user_idx" id="create_user_idx" value="${loginUser.user_idx }">
						</td>
					</tr>
					<tr>
						<td><label for="setfdes">설명</label><input type="text" id="policy_desc" name="policy_desc"/></td>
						<td>
							<strong>생성일시 :</strong> <span id="create_date_text"></span>
							<input type="hidden" name="create_date" />
						</td>
					</tr>
				</tbody>
			</table>
			<!-- <div class="tr">
				<a href="#" class="btn set25"><span>신규생성</span></a>
			</div> -->
		</div>
		<ul>
			<li class="on"><a href="#"><span id="tab_pass"></span><p>허용프로세스</p></a></li>
			<li><a href="#"><span id="tab_system"></span><p>시스템프로세스</p></a></li>
			<li><a href="#"><span id="tab_folder"></span><p>허용폴더목록</p></a></li>
			<li><a href="#"><span id="tab_media"></span><p>미디어/공유폴더</p></a></li>
		</ul>
	</section>

	<figure>허용프로세스</figure>
	<section class="admit setpoli" id="pass_section">	
	
	<div class="box_log" id="pass_ostype_box">
		<p><img src="../common/images/txt/txt_admit_01.gif" alt="OS선택"></p>
		<ul>
			<li><input type="checkbox" id="" name="osTypeList" value="Win98"> <label for="#">Win98</label></li>
			<li><input type="checkbox" id="" name="osTypeList" value="WingNT"> <label for="#">WinNT</label></li>
			<li><input type="checkbox" id="" name="osTypeList" value="WinME"> <label for="#">WinME</label></li> 
			<li><input type="checkbox" id="" name="osTypeList" value="Win2K"> <label for="#">Win2K</label></li>
			<li><input type="checkbox" id="" name="osTypeList" value="WinXP"> <label for="#">WinXP</label></li>
			<li><input type="checkbox" id="" name="osTypeList" value="Win7"> <label for="#">Win7</label></li>
		</ul>
	</div>

	<!-- <div class="add_list_box"> -->
	<div class="mt25">
		<table class="policy_add">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:50%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택<input type="checkbox" id="pass_all_checkbox" name=""/></th>
					<th>프로세스</th>
					<th>회사명</th>
					<th class="pl20 tl">설명</th>
				</tr>
			</thead>
		</table>
		<div class="scroll" style="height: 200px;">
		<table class="policy_add" style="width: 100%;">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:50%"/>
			</colgroup>	
			<tbody>
			</tbody>
		</table>
	</div>
	</div>
   <div style="overflow:hidden" >
	   <div id="basic-modal-3-1-pass" class="btn_admit">
			<p><a href="#" class="btn basic-3-1" id="pass_open_bt"><span>불러오기</span></a></p>
	   </div>

	   <div class="btn_admit2">
			<a href="#" class="btn" id="pass_add_bt"><span>프로세스 추가</span></a>
			<a href="#" class="btn" id="pass_del_bt"><span>선택항목 삭제</span></a>
	   </div>
	</div>

	<div class="clearboth tr mt10">
		<a href="#" class="btn type2"><span>정책저장</span></a>
	</div>

    <!-- modal popup contents 불러오기 팝업창 -->
	</section>
	
	
	<figure>시스템프로세스</figure>
	<section class="admit setpoli set2" id="system_section">

	<div class="box_log" id="system_ostype_box">
		<p><img src="../common/images/txt/txt_admit_01.gif" alt="OS선택"></p>
		<ul>
			<li><input type="checkbox" id="" name="" value="Win98"> <label for="#">Win98</label></li>
			<li><input type="checkbox" id="" name="" value="WinNT"> <label for="#">WinNT</label></li>
			<li><input type="checkbox" id="" name="" value="WinME"> <label for="#">WinME</label></li>
			<li><input type="checkbox" id="" name="" value="Win2K"> <label for="#">Win2K</label></li>
			<li><input type="checkbox" id="" name="" value="WinXP"> <label for="#">WinXP</label></li>
			<li><input type="checkbox" id="" name="" value="Win7"> <label for="#">Win7</label></li>
		</ul>
	</div>

	<!-- <div class="add_list_box"> -->
		<div class="mt25">
		<table class="policy_add">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:90%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택<input type="checkbox" id="system_all_checkbox" name=""/></th>
					<th class="tl pl20">프로세스</th>
				</tr>
			</thead>
		</table>
		<div class="scroll" style="height: 200px; ">
		<table class="policy_add">
			<tbody>
			</tbody>
		</table>
	</div>
	</div>
   <div style="overflow:hidden">
	   <div id="basic-modal-3-1-system" class="btn_admit">
			<p><a href="#" class="btn basic-3-1" id="system_open_bt"><span>불러오기</span></a></p>
	   </div>

	   <div class="btn_admit2">
			<a href="#" class="btn" id="system_add_bt"><span>프로세스 추가</span></a>
			<a href="#" class="btn" id="system_del_bt"><span>선택항목 삭제</span></a>
	   </div>
	</div>

	<div class="clearboth tr mt10">
		<a href="#" class="btn type2"><span>정책저장</span></a>
	</div>

	</section>
	
	 
	
	<figure>허용폴더목록</figure>
	<section class="admit setpoli set2" id="folder_section">

	<div class="add_list_box">
		<table class="mt20">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:35%"/>
				<col style="width:20%"/>
				<col style="width:35%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택<input type="checkbox" id="folder_all_checkbox" name=""/></th>
					<th>폴더명</th>
					<th>회사명</th>
					<th>설명</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

   <div style="overflow:hidden">
	   <div id="basic-modal-3-1-folder" class="btn_admit">
			<p><a href="#" class="btn basic-3-1" id="folder_open_bt"><span>불러오기</span></a></p>
	   </div>

	   <div class="btn_admit2">
			<a href="#" class="btn" id="folder_add_bt"><span>폴더 추가</span></a>
			<a href="#" class="btn" id="folder_del_bt"><span>선택항목 삭제</span></a>
	   </div>
	</div>

	<div class="clearboth tr mt10">
		<a href="#" class="btn type2"><span>정책저장</span></a>
	</div>
	</section>
	  
	
	<figure>미디어</figure>
	<section class="admit setpoli set2" id="media_section">

<!-- 	<div class="add_list_box"> -->
		<div class="mt25">
		<table class="mt20" >
			<colgroup>
				<col style="width:40%"/>
				<col style="width:60%"/>
			</colgroup>
			<thead>
				<tr>
					<th>Device명</th>
					<th>정책범위</th>
				</tr>
			</thead>
		</table>
		<div class="scroll" style="height: 200px;">
		<table class="policy_add" style="text-align: center; width: 100%;">		
				<tr>
					<td>플로피디스트</td>
					<td>
						<input type="radio" id="" name="F" value="A" /><label for="#">허용</label> 
						<input type="radio" id="" name="F" value="R"/><label for="#">읽기전용</label> 
						<input type="radio" id="" name="F" value="B" checked="checked"/><label for="#">차단</label>
						<input type="hidden" name="mediaPolicyList[0].media_type" value="F" />
						<input type="hidden" name="mediaPolicyList[0].method" value="B" />
					</td>
				</tr>
				<tr>
					<td>CD-R 드라이브</td>
					<td>
						<input type="radio" id="" name="RO" value="A"/><label for="#">허용</label> 
						<input type="radio" id="" name="RO" value="R"/><label for="#">읽기전용</label> 
						<input type="radio" id="" name="RO" value="B" checked="checked"/><label for="#">차단</label>
						<input type="hidden" name="mediaPolicyList[1].media_type" value="RO" />
						<input type="hidden" name="mediaPolicyList[1].method" value="B" />
					</td>
				</tr>
				<tr>
					<td>CD-RW 드라이브</td>
					<td>
						<input type="radio" id="" name="RW" value="A"/><label for="#">허용</label> 
						<input type="radio" id="" name="RW" value="R"/><label for="#">읽기전용</label> 
						<input type="radio" id="" name="RW" value="B" checked="checked"/><label for="#">차단</label>
						<input type="hidden" name="mediaPolicyList[2].media_type" value="RW" />
						<input type="hidden" name="mediaPolicyList[2].method" value="B" />
					</td>
				</tr>
				<tr>
					<td>네트워크 드라이브</td>
					<td>
						<input type="radio" id="" name="N" value="A"/><label for="#">허용</label> 
						<input type="radio" id="" name="N" value="R"/><label for="#">읽기전용</label> 
						<input type="radio" id="" name="N" value="B" checked="checked"/><label for="#">차단</label>
						<input type="hidden" name="mediaPolicyList[3].media_type" value="N" />
						<input type="hidden" name="mediaPolicyList[3].method" value="B" />
					</td>
				</tr>
			</tbody>
		</table>
   </div>
	</div>

	<div class="clearboth tr mt10">
		<a href="#" class="btn type2"><span>정책저장</span></a>
	</div>

	</section>

	
</form>
	<%@ include file="pass_popup.jsp" %>
    <%@ include file="system_popup.jsp" %>
	<%@ include file="folder_popup.jsp" %>
</article>
<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="../resource/libs/common/tree.js"></script>
<script type="text/javascript">
	function getDatetimeString(now){
		var year = now.getFullYear();
		var month = now.getMonth() + 1;
		month = month < 10 ? "0" + month : month;
		var day = now.getDate(); 
		
		var hour = now.getHours();
		hour = hour < 10 ? "0" + hour : hour;
		var minute = now.getMinutes();
		minute = minute < 10 ? "0" + minute : minute;
		var second = now.getSeconds();
		second = second < 10 ? "0" + second : second;
		
		return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
	}
	
	$(document).ready(function(){
		
		// 트리 적용.
		init_group_tree("pass_tree");
		binding_select_group_simple("pass_tree", "pass_device_tree");
		init_group_tree("system_tree");
		binding_select_group_simple("system_tree", "system_device_tree");
		
		// 정책목록 클릭시
		$(".lnb_tree.policy_list").click(function(){
			
		});
		
		// 탭 제어
		$("section[id$='section']").hide();
		$("#pass_section").show();
		
		$(".tab.setpoli ul li a").click(function(event){
			event.preventDefault();
			$("section[id$='section']").hide();
			$(".tab.setpoli ul li").removeClass("on");
			$(this).parent().addClass("on");
			
			var tab_name = $(this).children().first().attr("id").replace("tab_", "");
			$("#" + tab_name + "_section").show();
			
		});
		
		// 생성일지 표시
		$("#create_date_text").text(getDatetimeString(new Date()));
		$(":hidden[name='create_date']").val(getDatetimeString(new Date()));
		
		// 전체 선택/해제 체크박스 클릭시
		$(":checkbox[id$=all_checkbox]").click(function(){
			var id_attr = $(this).attr("id").replace("_all_checkbox", "");
			var checked = this.checked;
			$(":checkbox[name='"+id_attr+"_checkbox']").each(function(index, checkbox){
					checkbox.checked = checked;
			});
		});
		
		// OS 선택 시
		$("div[id$='ostype_box'] :checkbox").click(function(){
			var clickedCheckbox = this;
			var clickedValue = $(clickedCheckbox).val();
			$("div[id$='ostype_box'] :checkbox").each(function(index, checkbox){
				if($(checkbox).val() == clickedValue){
					checkbox.checked = clickedCheckbox.checked;
				}
			});
		});
		
		// 미디어 차단여부 클릭시
		$("#media_section tbody :radio").click(function(){
			//console.log($(this).val()); 
			//console.log($(this).attr("name"));
			$(this).parent().find(":input:eq(3)").val($(this).attr("name"));
			$(this).parent().find(":input:eq(4)").val($(this).val());
			
		});
		
		// 입력폼 추가 버튼 클릭 시
		$("a[id$=add_bt]").click(function(event){
			event.preventDefault();
			var id_attr = $(this).attr("id").replace("_add_bt", "");;
			var count = $("#"+id_attr+"_section .add_list_box tbody").children().size();
			
			// 입력필드를 추가한다.
			if(id_attr == "pass"){
				var html = "";
				html += "<tr class='tc'>";
				html += '<td><input type="checkbox" id="" name="pass_checkbox"/></td>';
				html += '<td><input type="text" value="" title="프로세스" name="passPolicyList['+count+'].process_name"/></td>';
				html += '<td><input type="text" value="" title="회사명" name="passPolicyList['+count+'].comp_name"/></td>';
				html += '<td class="pl20 tl"><input style="width:300px" type="text" value="" name="passPolicyList['+count+'].passpr_info" title="설명"/></td>';
				html += '</tr>';
				$("#pass_section .policy_add tbody").append(html);
			}else if(id_attr == "system"){
				var html = "";
				html += "<tr class='tc'>";
				html += "<td><input type='checkbox' id='' name='system_checkbox'/></td>";
				html += '<td class="tl pl20"><input type="text" class="pl10" style="width:80%" value="" name="systemPolicyList['+count+'].process_name"/></td>';
				html += "</tr>";
				$("#system_section .policy_add tbody").append(html);
			}else if(id_attr == "folder"){
				var html = "";
				html += '<tr class="tc">';
				html += '<td class="tc"><input type="checkbox" id="" name="folder_checkbox"/></td>';
				html += '<td><input type="text" value="" class="pl10" style="width:80%" title="폴더명" name="folderPolicyList['+count+'].bmfolder_path"/></td>';
				html += '<td class="tc"><input type="text" value="" class="pl10" style="width:80%" title="회사명" name="folderPolicyList['+count+'].comp_name" /></td>';
				html += '<td class="tc"><input type="text" value="" class="pl10" style="width:80%" title="설명" name="folderPolicyList['+count+'].folder_info" /></td>';
				html += '</tr>';
				$("#folder_section .mt20 tbody").append(html);
			}
		});
		
		// 입력폼 삭제 버튼 클릭시
		$("a[id$=del_bt]").click(function(event){
			event.preventDefault();
			var id_attr = $(this).attr("id").replace("_del_bt", "");
			
			// 선택된 체크박스에 해당하는 항목 삭제
			$("#"+id_attr+"_section .add_list_box :checkbox[name='"+id_attr+"_checkbox']").each(function(index, checkbox){
				if(checkbox.checked){
					$(this).parent().parent().remove();
				}
			});
			
			// inputbox의 name을 순서에 맞게 재설정한다.
			if(id_attr == "pass"){
				$("#"+id_attr+"_section .policy_add tbody").children().each(function(index, tr){
					$(this).find('td:eq(1) :input').attr("name", "passPolicyList["+index+"].process_name");
					$(this).find('td:eq(2) :input').attr("name", "passPolicyList["+index+"].comp_name");
					$(this).find('td:eq(3) :input').attr("name", "passPolicyList["+index+"].passpr_info");
				});
			}else if(id_attr == "system"){
				$("#"+id_attr+"_section .policy_add tbody").children().each(function(index, tr){
					$(this).find('td:eq(1) :input').attr("name", "systemPolicyList["+index+"].process_name");
				});
			}else if(id_attr == "folder"){
				$("#"+id_attr+"_section .policy_add tbody").children().each(function(index, tr){
					$(this).find('td:eq(1) :input').attr("name", "folderPolicyList["+index+"].bmfolder_path");
					$(this).find('td:eq(2) :input').attr("name", "folderPolicyList["+index+"].comp_name");
					$(this).find('td:eq(3) :input').attr("name", "folderPolicyList["+index+"].folder_info");
				});
			}
			
		});
		
		
		// 정책저장 버튼 클릭시
		$("a:contains('정책저장')").click(function(event){
			event.preventDefault();
			
			if($("#create_user_idx").val() == ""){
				alert("관리자 정보가 누락되었습니다. 로그인후 다시 이용해주십시요.");
				return;
			}
			
			if($("div[id$='ostype_box'] :checkbox:checked").length == 0){
				alert("OS종류를 선택하세요");
				return;
			}
			if($("#pass_section .add_list_box tbody").children().size() == 0){
				alert("허용 프로세스를 등록하세요");
				return;
			}
			if($("#system_section .add_list_box tbody").children().size() == 0){
				alert("시스템 프로세스를 등록하세요");
				return;
			}
			if($("#folder_section .add_list_box tbody").children().size() == 0){
				alert("허용폴더를 등록하세요");
				return;
			}
			
			$.post("addPolicy.html",$("form").serialize(), function(data, status){
				if(status == "success" && data.status == 1){
					alert("정책 생성이 성공적으로 수행되었습니다.");
					location.href = "index.html"; 
				}else{
					alert("정책 저장 중 오류가 발생하였습니다.");
				}
			}, "json");
		});
		
		// 왼쪽의 정책목록에서 정책 선택시 페이지 이동
		$("a[id^=policy_idx]").click(function(event){
			event.preventDefault();
			var policy_idx = $(this).attr("id").replace("policy_idx_", "");
			location.href = "index.html?policy_idx="+ policy_idx;
		});
		
	});
	
</script>
<%@ include file="../common/inc/footer.jsp" %>