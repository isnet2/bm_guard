<%@ page language="java"  pageEncoding="UTF-8"%>
<article>
<figure>시스템프로세스</figure>
<section class="admit setpoli">
   <div id="content-3-1">
		<div id="basic-modal-content-3-1-system">
			<div class="selectbox">
				<select name="" id="load_type_select2" title="불러오는 방식">
					<option value="load_prevpolicy">이전 정책에서 불러오기</option>
					<option value="load_excelfile">엑셀에서 불러오기</option><!--엑셀에서 불러오기의 경우 불러오기 버튼을 누르면 파일 업로드와 같은 방식으로 윈도우 탐색기를 띄우도록 되어있습니다.-->
					<option value="load_device" selected='selected' >자동화기기에서 불러오기</option>
				</select>
				<form method="post" id="uploadform_system" action="../openfile.html" enctype="multipart/form-data"  style="display: inline;">
				<span id="upload_system_box">
					<input type="file" name="excelfile" readonly="readonly"/>
					<a href="#" class="btn set25" id="system_openfile_bt"><span>불러오기</span></a>
				</span>
				</form>
				
				<span id="prevpolicy_system_box">
					<label for="select_system_policy">정책명</label>
					<select name="" id="select_system_policy" title="정책명">
					<c:forEach var="policy" items="${policyMastList }">
						<option value="${policy.policy_idx }"><c:out value="${policy.policy_name }"/></option>
					</c:forEach>
					</select>
				<a href="#" class="btn set25" id="system_openprev_bt"><span>불러오기</span></a>
				</span>
			</div>
			
			<div class="tree auto_on float_l">
				<div class="search_tree">
					<span style="display:block">
						<select id="">
							<option>기기명</option>
							<option>IP주소</option>
						</select>
					</span>
					<input type="text" /><a href="#"><img src="../common/images/btn/btn_check_03.gif" alt="조회" /></a>
				</div>
				<div class="scroll" style="overflow-x: hidden; height: 220px;">
					<div class="treelist">
						<div class="treemap float_l" id="system_tree">
							<!-- <img src="../common/images/img/@tree_01.gif" alt="" /> -->
						</div>
						<div class="comlist float_l" id="system_device_tree">
							<!-- <img src="../common/images/img/@tree_02.gif" alt="" /> -->
						</div>
					</div>
				</div>
			</div>
			
			<div class="con_body auto_on float_l">
				<div class="os">
					<table>
						<colgroup>
							<col style="width:10%"/>
							<col style="width:90%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>OS</th>
								<td>
									<ul class="os">
										<li><input type="checkbox" id="" name=""> <label for="#">Win98</label></li>
										<li><input type="checkbox" id="" name=""> <label for="#">WinNT</label></li>
										<li><input type="checkbox" id="" name=""> <label for="#">WinME</label></li>
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
						<col style="width:50px"/>
						<col style="width:*"/>
					</colgroup>
					<tbody>
						<tr>
							<td><input type="checkbox" id="system_all_checkbox_popup" name=""/></td>
							<td class="pl20 tl">프로세스</td>
						</tr>
					</tbody>
				</table>
				<div class="list scroll" style="height: 190px;" id="popup_system_list">
					<table>
						<colgroup>
							<col style="width:50px"/>
							<col style="width:*"/>
						</colgroup>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="clearboth tc pt10">
				<a href="#" class="btn set25" id="get_system_bt"><span>가져오기</span></a>
			</div>
		</div><!-- //end basic-modal-content-3-1 -->
	</div><!-- //end content-3-1 -->

	</section>


</article>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#uploadform_system").hide();
		$("#prevpolicy_system_box").hide();
		
		// 파일 업로드 처리
		$("#system_openfile_bt").click(function(event){
			event.preventDefault();
			var filename = $("#upload_system_box input").val();
			if(filename != ""){
				$("#uploadform_system").trigger("submit");
			}else{
				alert("선택된 파일이 없습니다.");
			}
		});
		$("#uploadform_system").ajaxForm(function(data, state){
			if(state == "success" && data.status == 1){
				var processList = data.excel_data;
				var html = "";
				$.each(processList, function(index, process){
					
					html += '<tr>';
					html += '<td class="tc"><input type="checkbox" id="" name=""/></td>';
					html += '<td><input type="text" value="'+process.process_name+'" title="프로세스"/></td>';
					html += '</tr>'; 
				});
				$("#popup_system_list tbody").html(html);
			}else{
				alert("엑셀파일 처리 중 오류가 발생하였습니다.\n파일을 확인해 주십시요.");
			}
			
		});
		$("#uploadform_system").submit(function(){return;});
		
		// 이전정책 불러오기 클릭시
		$("#system_openprev_bt").click(function(event){
			event.preventDefault();
			
			var idx = $("#select_system_policy").val();
			$.getJSON("policyInfo.html", {policy_idx:idx}, function(data){
				var policy = data.policyMast;
				
				var systemPolicyList = policy.systemPolicyList;
				var html = "";
				$.each(systemPolicyList, function(index, system){
					html += '<tr>';
					html += '<td class="tc"><input type="checkbox" id="" name=""/></td>';
					html += '<td><input type="text" value="'+system.process_name+'" title="프로세스"/></td>';
					html += '</tr>';
					
				});
				$("#popup_system_list tbody").html(html);
			});
			
		});
		
		// 불러오기 selectbox 선택시
		$("#load_type_select2").change(function(){
			var selectedValue = $(this).val();
			if(selectedValue == "load_prevpolicy"){
				$("#prevpolicy_system_box").show();
				$("#uploadform_system").hide();
						
			}else if(selectedValue == "load_excelfile"){
				$("#uploadform_system").show();
				$("#prevpolicy_system_box").hide();
				
			}else if(selectedValue == "load_device"){
				$("#uploadform_system").hide();
				$("#prevpolicy_system_box").hide();
			}
		});
		
		// 전체선택 checkbox 클릭시
		$("#system_all_checkbox_popup").click(function(){
			var checked = this.checked;
			$("#popup_system_list :checkbox").each(function(index, checkbox){
				checkbox.checked = checked;
			});
		});
		
		// 가져오기 버튼 클릭시
		$("#get_system_bt").click(function(event){
			$("#popup_system_list tbody :checkbox").each(function(index, checkbox){
				if(checkbox.checked){
					var count = $("#system_section .add_list_box tbody").children().size();
					
					var $tr =  $(checkbox).parent().parent();
					var process_name = $tr.find("td:eq(1) :input").val();
					
					var html = "";
					html += "<tr class='tc'>";
					html += "<td><input type='checkbox' id='' name='system_checkbox'/></td>";
					html += '<td class="tl pl20"><input type="text" class="pl10"  style="width: 890px;" value="'+process_name+'" name="systemPolicyList['+count+'].process_name"/></td>';
					html += "</tr>";
					$("#system_section .policy_add tbody").append(html);
				}
			});
			$.modal.close();
		});
	});
</script>
