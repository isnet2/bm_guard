<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb3" value="active" />
<c:set var="gnb3_1" value="on" />
<c:set var="gnb" value="정책관리" />
<c:set var="tab_1d" value="정책 수립" />
<%@ include file="../common/inc/header.jsp" %>
</header>

<article>
	<input type="hidden" id="policy_idx" name="policy_idx"/>
	
	<%@ include file="../common/inc/direction.jsp" %>
	
	<figure>정책수립</figure>
	<section class="user_list">
	<h2>정책수립</h2>
	<div class="policy_wrap">
		
		<figure>정책</figure>
		<section class="policy_list float_l">
			<p>정책</p>
			<ul>
			<c:forEach var="policy" items="${policyMastList }">
			<li><a href="#" id="policy_idx_${policy.policy_idx }"><c:out value="${policy.policy_name }"/></a></li>
			</c:forEach>			
			</ul>
		</section>

		<figure>tab</figure>
		<section class="admit tab setpoli">
			<div class="policy_form">
				<div class="btn_set">
					<a href="./createPolicy.html" class="btn set25 mb15"><span>신규생성</span></a>
					<a href="#" id="updateBtn" class="btn set25 mb15"><span>수정</span></a>
					<a href="#" class="btn set25 mb15" id="delBtn"><span>삭제</span></a>
					
				</div>
				<table style="border:0px; ">
					<colgroup>
						<col style="width: 700px;" />
						<col style="width: *" />
					</colgroup>
					<tbody>
						<tr>
							<td><label for="setfname">정책명</label><input type="text" id="policy_name" style="width: 600px;" readonly="readonly"/></td>
							<td><strong>생성자 :</strong> <span id="policy_create_user"></span></td>
						</tr>
						<tr>
							<td><label for="policy_desc">설명</label><input type="text" id="policy_desc" style="width: 600px;" readonly="readonly"/></td>
							<td><strong>생성일시 :</strong> <span id="policy_create_date"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<ul>
				<li class="on"><a href="#"><span id="tab_pass"></span><p>허용프로세스</p></a></li>
				<li><a href="#"><span id="tab_system"></span><p>시스템프로세스</p></a></li>
				<li><a href="#"><span id="tab_folder"></span><p>허용폴더목록</p></a></li>
				<li><a href="#"><span id="tab_media"></span><p>미디어/공유폴더</p></a></li>
			</ul>
			</section>
			
<!-- ********* TAB 허용 프로세스 화면 ******** -->

			<figure>허용프로세스</figure>
			<section class="admit setpoli" id="pass_section">
			<div class="box_log">
				<p class="ml30"><img src="../common/images/txt/txt_admit_01.gif" alt="OS선택"></p>
				<ul>
					<li><input type="checkbox" id="" name="os_type" value="Win98"> <label for="#">Win98</label></li>
					<li><input type="checkbox" id="" name="os_type" value="WinNT"> <label for="#">WinNT</label></li>
					<li><input type="checkbox" id="" name="os_type" value="WinME"> <label for="#">WinME</label></li> 
					<li><input type="checkbox" id="" name="os_type" value="Win2K"> <label for="#">Win2K</label></li>
					<li><input type="checkbox" id="" name="os_type" value="WinXP"> <label for="#">WinXP</label></li>
					<li><input type="checkbox" id="" name="os_type" value="Win7"> <label for="#">Win7</label></li>
				</ul>
			</div>

		<!-- <p class="btn_center">
			<a href="#"><img src="../common/images/btn/btn_srch.gif" alt="검색"></a>
		</p> -->

			<div class="mt25">
			<table class="policy_add">
				<colgroup>
					<col style="width:200px"/>
					<col style="width:200px"/>
					<col style="width:*;"/>
				</colgroup>
				<thead>
					<tr>
						<th>프로세스</th>
						<th>회사명</th>
						<th class="pl20 tl">설명</th>
					</tr>
				</thead>
			</table>
			<div class="scroll" style="height: 276px; ">
			<table class="policy_add" style="width: 100%;">
				<colgroup>
					<col style="width:200px"/>
					<col style="width:200px"/>
					<col style="width:*"/>
				</colgroup>
				<tbody>
				</tbody>
			</table>
			</div>
			</div>
		</section>

<!-- ********* TAB 허용 프로세스 화면 ******** -->

<!-- ********* TAB 시스템프로세스화면 ******** -->

		<figure>시스템프로세스</figure>
		<section class="admit setpoli" id="system_section">

		<div class="box_log">
			<p class="ml30"><img src="../common/images/txt/txt_admit_01.gif" alt="OS선택"></p>
			<ul>
			<li><input type="checkbox" id="" name="os_type" value="Win98"> <label for="#">Win98</label></li>
			<li><input type="checkbox" id="" name="os_type" value="WinNT"> <label for="#">WinNT</label></li>
			<li><input type="checkbox" id="" name="os_type" value="WinME"> <label for="#">WinME</label></li>
			<li><input type="checkbox" id="" name="os_type" value="Win2K"> <label for="#">Win2K</label></li>
			<li><input type="checkbox" id="" name="os_type" value="WinXP"> <label for="#">WinXP</label></li>
			<li><input type="checkbox" id="" name="os_type" value="Win7"> <label for="#">Win7</label></li>
			</ul>
		</div>

		<div class="mt25">
		<table>
			<thead>
				<tr>
					<th class="tl pl20">프로세스</th>
				</tr>
			</thead>
		</table>
		<div class="scroll" style="height: 272px; ">
		<table class="policy_add" style="width: 100%;">
			<tbody>
			</tbody>
		</table>
		</div>
		</div>

		</section>

<!-- ********* TAB 시스템프로세스화면 ******** -->

<!-- ********* TAB 허용폴더목록 ******** -->

		<figure>허용폴더목록</figure>
		<section class="admit setpoli" id="folder_section">

		<div class="mt25">
		<table class="policy_add">
			<colgroup>
				<col style="width:300px"/>
				<col style="width:150px"/>
				<col style="width:*"/>
			</colgroup>
			<thead>
				<tr>
					<th>폴더명</th>
					<th>회사명</th>
					<th class="pl20 tl">설명</th>
				</tr>
			</thead>
		</table>
		<div class="scroll" style="height: 340px;">
		<table class="policy_add" style="width: 100%;">
			<colgroup>
				<col style="width:300px"/>
				<col style="width:150px"/>
				<col style="width:*"/>
			</colgroup>
			<tbody>
			</tbody>
		</table>
		</div>
		</div>
		</section>
<!-- ********* TAB 허용폴더목록 ******** -->



<!-- ********* TAB 미디어 ******** -->
<figure>미디어</figure>
	<section class="admit setpoli" id="media_section">

	<div class="mt25">
	<table class="mt20" style="text-align: cneter;">
		<colgroup>
			<col style="width:450px"/>
			<col style="width:*"/>
		</colgroup>
		<thead>
			<tr>
				<th>Device명</th>
				<th>정책범위</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div>
	</div>

	</section>

<!-- ********* TAB 미디어 ******** -->

	</div>
	<%@ include file="../common/inc/del_pop.jsp" %>
</article>
<script type="text/javascript">
function clearCheckbox(selector){
	$(selector).each(function(index, checkbox){
		checkbox.checked = false;
	});
}

$(document).ready(function(){
	//alert("${policy_idx}");
	var policy_idx ="${policy_idx}";
	
	if(policy_idx != "") {
		
		$.getJSON("policyInfo.html", {policy_idx:policy_idx}, function(result){
			reflashPage(result);
		});		
		$("#policy_idx").val(policy_idx);
	}
	
	//help
	$("#helpBtn3").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help3-1");
		//e.preventDefault();
		return false;
	});
	
	$("#updateBtn").click(function(e){
		e.preventDefault();
		
		var form = document.createElement("form");     
		form.setAttribute("method", "post");     
		form.setAttribute("action", "./updatePolicy.html");  

		var hiddenField = document.createElement("input");        
		hiddenField.setAttribute("type", "hidden");        
		hiddenField.setAttribute("name", "policy_idx");         
		hiddenField.setAttribute("value", policy_idx);         
		form.appendChild(hiddenField);    
		document.body.appendChild(form);
		
		form.submit(); 
		
/* 		$("#searchForm").attr("action" , "./updatePolicy.html");
		$("#searchForm").attr("method","post");
		$("#searchForm").submit();
 */	});
	
	//정책삭제
	$("#delBtn").click(function(e){
	
		var policy = $("#policy_name").val();
		if(policy == "") {
			alert("삭제할 정책을 선택해 주세요.");
			return;
		}else {
			if(confirm("정책 \'" + policy+ "\' 을(를) 삭제하시겠습니까?")) {
				$.post(
						"./deletePolicy.html", 
						{ 	"policy_idx" : $("#policy_idx").val()
						}, 
						function (r) {
							if(r.result == 1) {
								alert("정책을 삭제 하였습니다.");
								location.href="./index.html";
							}
						},
						"json"
					); 
			}
		}
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

	// 좌측의 정책 선택시
	$(".policy_list li a").click(function(event){
		
		event.preventDefault();
		var idx = $(this).attr("id").replace("policy_idx_", "");
		$("#policy_idx").val(idx);
		policy_idx = idx;
		$.getJSON("policyInfo.html", {policy_idx:idx}, function(result){
			reflashPage(result);
		});
	});
	
});

function reflashPage(result) {
	var policy = result.policyMast;
	$("#policy_name").val(policy.policy_name);
	$("#policy_desc").val(policy.policy_desc);
	$("#policy_create_user").text(policy.createUser.user_name);
	$("#policy_create_date").text(policy.create_date);

	// 체크박스 처리
	clearCheckbox(".box_log :checkbox");
	$(".box_log :checkbox").each(function(index, checkbox){
		
		$.each(policy.osTypeList, function(index, ostype){
			if($(checkbox).val() == ostype){
				checkbox.checked = true;
			}
		});
	});
	
	// 허용 프로세스
	var passPolicyList = policy.passPolicyList;
	var pass_html = "";
	$.each(passPolicyList, function(index, passPolicy){
		pass_html += "<tr>";
		pass_html += "<td>"+passPolicy.process_name+"</td>";
		pass_html += "<td>"+passPolicy.comp_name+"</td>";
		pass_html += "<td class='p120 tl'>"+passPolicy.passpr_info+"</td>";
		pass_html += "</tr>";
	});
	$("#pass_section table tbody").html(pass_html);
	
	// 시스템 프로세스
	var systemPolicyList = policy.systemPolicyList;
	var system_html = "";
	$.each(systemPolicyList, function(index, systemPolicy){
		system_html += "<tr >";
		system_html += "<td class='tl pl20'>"+systemPolicy.process_name+"</td>";
		system_html += "</tr>";				
	});
	$("#system_section table tbody").html(system_html);
	
	// 허용 폴더목록
	var folderPolicyList = policy.folderPolicyList;
	var folder_html = "";
	$.each(folderPolicyList, function(index, folderPolicy){
		folder_html += "<tr>";
		folder_html += "<td>"+folderPolicy.bmfolder_path+"</td>";
		folder_html += "<td>"+folderPolicy.comp_name+"</td>";
		folder_html += "<td  class='al'>"+folderPolicy.folder_info+"</td>";
		folder_html += "</tr>";
	});
	$("#folder_section table tbody").html(folder_html);

	// 미디어
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
		media_html += "<tr style='text-align: center'>";
		media_html += "<td style='border-bottom: 1px solid #ddd;'>"+media_type+"</td>";
		media_html += "<td>";
		media_html += '<input type="radio" disabled="disabled" name="radio'+index+'"'+ (mediaPolicy.method == 'A' ? 'checked=checked' : '') +'/><label for="radio1-1">허용</label>'; 
		media_html += '<input type="radio" disabled="disabled" name="radio'+index+'"'+ (mediaPolicy.method == 'R' ? 'checked=checked' : '') +'/><label for="radio1-2">읽기전용</label>'; 
		media_html += '<input type="radio" disabled="disabled" name="radio'+index+'"'+ (mediaPolicy.method == 'B' ? 'checked=checked' : '') +'/><label for="radio1-3">차단</label>';
		
		media_html += '</td>';
		media_html += "</tr>";
	});
	$("#media_section table tbody").html(media_html);
}

</script>
<%@ include file="../common/inc/footer.jsp" %>
