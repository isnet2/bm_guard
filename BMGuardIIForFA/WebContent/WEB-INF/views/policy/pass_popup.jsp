<%@ page language="java"  pageEncoding="UTF-8"%>
<article>
<section class="admit setpoli">
<div id="content-3-1">
<div id="basic-modal-content-3-1-pass">
	<div class="selectbox">
		<select name="" id="load_type_select1" title="불러오는 방식">
			<option value="load_prevpolicy">이전 정책에서 불러오기</option>
			<option value="load_excelfile">엑셀에서 불러오기</option>
			<option value="load_device" selected='selected' >자동화기기에서 불러오기</option>
		</select> 
		
		<form method="post" id="uploadform_pass" action="../openfile.html" enctype="multipart/form-data" style="display: inline;">
		<span id="upload_pass_box">
			<input type="file" name="excelfile" readonly="readonly"/>
			<a href="#" class="btn set25" id="pass_openfile_bt"><span>불러오기</span></a>
		</span>
		</form>
		
		<span id="prevpolicy_pass_box">
			<label for="select_pass_policy">정책명</label>
			<select name="" id="select_pass_policy" title="정책명">
				<c:forEach var="policy" items="${policyMastList }">
					<option value="${policy.policy_idx }"><c:out value="${policy.policy_name }"/></option>
				</c:forEach>
		</select>
		<a href="#" class="btn set25" id="pass_openprev_bt"><span>불러오기</span></a>
		</span> 
		
	</div>

	<div class="tree auto_on float_l">
		<div class="search_tree">
			<span style="display:block">
				<select id="tree_search_option">
					<option value="client_name" selected="selected">기기명</option>
					<option value="ip_addr">IP주소</option>
				</select>
			</span>
			<input type="text" id="tree_search_str"/><a href="#">
			<img src="../common/images/btn/btn_check_03.gif" alt="조회" /></a>
		</div>
		<div class="scroll" style="overflow-x: hidden; height: 220px;">
			<div class="treelist">
				<div class="treemap float_l" id="pass_tree">
				</div>
				<div class="comlist float_l" id="pass_device_tree">
				</div>
			</div>
		</div>
	</div>
	
	<div class="con_body auto_on float_l">
		<!--자동화기기에서 불러오기 일때 con_body에 auto_on을 붙이면 tree 공간만큼 사이즈를 조절했습니다.-->
		<div class="os">
			<table>
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 90%" />
				</colgroup>
				<tbody>
					<tr>
						<th>OS</th>
						<td>
							<ul class="os">
								<li><input type="checkbox" id="" name=""> <label for="#">Win98</label></li>
								<!-- 
								<li><input type="checkbox" id="" name=""> <label for="#">WinNT</label></li>
								<li><input type="checkbox" id="" name=""> <label for="#">WinME</label></li> 
								-->
								<li><input type="checkbox" id="" name=""> <label for="#">Win2K</label></li>
								<li><input type="checkbox" id="" name=""> <label for="#">WinXP</label></li>
								<li><input type="checkbox" id="" name=""> <label for="#">Win7</label></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<table class="title">
			<colgroup>
				<col style="width: 20%" />
				<col style="width: 20%" />
				<col style="width: 20%" />
				<col style="width: 40%" />
			</colgroup>
			<tbody>
				<tr>
					<td><input type="checkbox" id="pass_all_checkbox_popup" name="" /></td>
					<td>프로세스</td>
					<td>회사명</td>
					<td class="pl20 tl">설명</td>
				</tr>
			</tbody>
		</table>
		<div class="list scroll"   style="height: 190px" id="popup_pass_list">
			<table class="policy_add" style="width: 100%; border-top: 0px">
				<colgroup>
					<col style="width: 20%" />
					<col style="width: 20%" />
					<col style="width: 20%" />
					<col style="width: 40%" />
				</colgroup>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="clearboth tc pt10">
		<a href="#" class="btn set25" id="get_pass_bt"><span>가져오기</span></a>
	</div>
</div>
<!-- //end basic-modal-content-3-1 -->
</div><!-- //end content-3-1 -->
</section>
</article>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#uploadform_pass").hide();
		$("#prevpolicy_pass_box").hide();
		
		// 파일 업로드 처리
		$("#pass_openfile_bt").click(function(event){
			event.preventDefault();
			var filename = $("#upload_pass_box input").val();
			if(filename != ""){
				$("#uploadform_pass").trigger("submit");
			}else{
				alert("선택된 파일이 없습니다.");
			}
		});
		$("#uploadform_pass").ajaxForm(function(data, state){
			console.log(state);
			
			if(state == "success" && data.status == 1){
				var processList = data.excel_data;
				var html = "";
				$.each(processList, function(index, process){
					html += '<tr>';
					html += '<td class="tc"><input type="checkbox" id="" style="width: 80%"/></td>';
					html += '<td><input type="text" value="'+process.process_name+'" name="" title="프로세스"  style="width: 80%" /></td>';
					html += '<td><input type="text" value="'+process.comp_name+'" name="" title="회사명" style="width: 80px" /></td>';
					html += '<td class="pl20 tl"><input type="text" value="'+process.passpr_info+'" name="" title="설명" style="width: 80px"/></td>';
					html += '</tr>';
				});
				$("#popup_pass_list tbody").html(html);
			}else{
				alert("엑셀파일 처리 중 오류가 발생하였습니다.\n파일을 확인해 주십시요.");
			}
			
		});
		$("#uploadform_pass").submit(function(){return;});
		
		// 이전정책 불러오기 클릭시
		$("#pass_openprev_bt").click(function(event){
			event.preventDefault();
			
			var idx = $("#select_pass_policy").val();
			$.getJSON("policyInfo.html", {policy_idx:idx}, function(data){
				var policy = data.policyMast;
				
				var passPolicyList = policy.passPolicyList;
				var html = "";
				$.each(passPolicyList, function(index, pass){
					html += '<tr>';
					html += '<td class="tc"><input type="checkbox" id="" style="width: 80%" /></td>';
					html += '<td><input type="text" value="'+pass.process_name+'" name="" title="프로세스" style="width: 80%" /></td>';
					html += '<td><input type="text" value="'+pass.comp_name+'" name="" title="회사명" style="width: 80%" /></td>';
					html += '<td class="pl20 tl"><input type="text" value="'+pass.passpr_info+'" name="" title="설명" style="width: 80%"/></td>';
					html += '</tr>';
					
				});
				$("#popup_pass_list tbody").html(html);
			});
			
		});
		
		// 불러오기 selectbox 선택시
		$("#load_type_select1").change(function(){
			var selectedValue = $(this).val();
			if(selectedValue == "load_prevpolicy"){
				$("#prevpolicy_pass_box").show();
				$("#uploadform_pass").hide();
						
			}else if(selectedValue == "load_excelfile"){
				$("#uploadform_pass").show();
				$("#prevpolicy_pass_box").hide();
				
			}else if(selectedValue == "load_device"){
				$("#uploadform_pass").hide();
				$("#prevpolicy_pass_box").hide();
			}
		});
		
		// 전체선택 checkbox 클릭시
		$("#pass_all_checkbox_popup").click(function(){
			var checked = this.checked;
			$("#popup_pass_list :checkbox").each(function(index, checkbox){
				checkbox.checked = checked;
			});
		});
		
		// 가져오기 버튼 클릭시
		$("#get_pass_bt").click(function(event){
			$("#popup_pass_list tbody :checkbox").each(function(index, checkbox){
				if(checkbox.checked){
					
					var count = $("#pass_section .add_list_box tbody").children().size();
					var $tr =  $(checkbox).parent().parent();
					var process_name = $tr.find("td:eq(1) :input").val();
					var comp_name = $tr.find("td:eq(2) :input").val();;
					var passpr_info = $tr.find("td:eq(3) :input").val();;
					
					var html = "";
					html += '<tr class="tc">';
					html += '<td  class="tc"><input type="checkbox" id="" name="pass_checkbox"/></td>';
					html += '<td><input type="text"  title="프로세스" name="passPolicyList['+count+'].process_name" value="'+process_name+'"  style="width: 180px"/></td>';
					html += '<td class="pl10"><input type="text"  title="회사명" name="passPolicyList['+count+'].comp_name" value="'+comp_name+'"  style="width: 180px"/></td>';
					html += '<td class="pl10 tl"><input type="text" name="passPolicyList['+count+'].passpr_info" title="설명" value="'+passpr_info+'" style="width: 500px"/></td>';
					html += '</tr>';
					$("#pass_section .policy_add tbody").append(html);
				}
			});
			$.modal.close();
		});
	});
</script>

