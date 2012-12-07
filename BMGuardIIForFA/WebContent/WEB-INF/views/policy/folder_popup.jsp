<%@ page language="java"  pageEncoding="UTF-8"%>
<article>
<section class="admit setpoli">
   <!-- modal popup contents 불러오기 팝업창 -->
   <div id="content-3-1">
		<!-- modal content-3-1 -->
		<div id="basic-modal-content-3-1-folder">
			<div class="selectbox">
				<label for="file_target">불러오기</label>
				<select name="" id="load_type_select3" title="불러오는 방식">
					<option value="load_prevpolicy" selected="selected">이전 정책에서 불러오기</option>
					<option value="load_excelfile">엑셀에서 불러오기</option><!--엑셀에서 불러오기의 경우 불러오기 버튼을 누르면 파일 업로드와 같은 방식으로 윈도우 탐색기를 띄우도록 되어있습니다.-->
				</select>
				<form method="post" id="uploadform_folder" action="../openfile.html" enctype="multipart/form-data" style="display: inline;">
				<span id="upload_folder_box">
					<input type="file" name="excelfile" readonly="readonly"/>
					<a href="#" class="btn set25" id="folder_openfile_bt"><span>불러오기</span></a>
				</span>
				</form>
				
				<span id="prevpolicy_folder_box">
					<label for="select_folder_policy">정책명</label>
					<select name="" id="select_folder_policy" title="정책명">
						<c:forEach var="policy" items="${policyMastList }">
							<option value="${policy.policy_idx }"><c:out value="${policy.policy_name }"/></option>
						</c:forEach>
				</select>
				<a href="#" class="btn set25" id="folder_openprev_bt"><span>불러오기</span></a>
				</span> 
			</div>

			<div class="con_body float_l">
				<div class="os">
					<table>
						<colgroup>
							<col style="width:10%"/>
							<col class="pl10" style="width:80%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>OS</th>
								<td>
									<ul class="os">
										<li><input type="checkbox" id="" name=""> <label for="#">Win98</label></li>
										<!-- <li><input type="checkbox" id="" name=""> <label for="#">WinNT</label></li>
										<li><input type="checkbox" id="" name=""> <label for="#">WinME</label></li> -->
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
							<col style="width:10%"/>
							<col style="width:35%"/>
							<col style="width:20%"/>
							<col style="width:35%"/>
					</colgroup>
					<tbody>
						<tr>
							<td><input type="checkbox" id="folder_all_checkbox_popup" name=""/></td>
							<td class="pl20 tl">프로세스</td>
							<td>회사명</td>
							<td class="pl20 tl">설명</td>
						</tr>
					</tbody>
				</table>
				<div class="list scroll" style="height: 190px;" id="popup_folder_list">
					<table>
						<colgroup>
							<col style="width:10%"/>
							<col style="width:35%"/>
							<col style="width:20%"/>
							<col style="width:35%"/>
						</colgroup>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="clearboth tc pt10">
				<a href="#" class="btn set25" id="get_folder_bt"><span>가져오기</span></a>
			</div>
		</div><!-- //end basic-modal-content-3-1 -->
	</div><!-- //end content-3-1 -->
</section>
</article>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#uploadform_folder").hide();
		
		// 파일 업로드 처리
		$("#folder_openfile_bt").click(function(event){
			event.preventDefault();
			var filename = $("#upload_folder_box input").val();
			if(filename != ""){
				$("#uploadform_folder").trigger("submit");
			}else{
				alert("선택된 파일이 없습니다.");
			}
		});
		$("#uploadform_folder").ajaxForm(function(data, state){
			if(state == "success" && data.status == 1){
				var folderList = data.excel_data;
				var html = "";
				$.each(folderList, function(index, folder){
					html += '<tr>';
					html += '<td class="tc"><input type="checkbox" id="" name=""/></td>';
					html += '<td><input type="text" value="'+folder.bmfolder_path+'" class="pl10" style="width:70%" title="프로세스"/></td>';
					html += '<td class="tc"><input type="text" value="'+folder.comp_name+'" class="pl10" style="width:70%" title="회사명" /></td>';
					html += '<td class="tc"><input type="text" value="'+folder.folder_info+'" class="pl10" style="width:70%" title="설명" /></td>';
					html += '</tr>';
				});
				$("#popup_folder_list tbody").html(html);
			}else{
				alert("엑셀파일 처리 중 오류가 발생하였습니다.\n파일을 확인해 주십시요.");
			}
			
		});
		$("#uploadform_folder").submit(function(){return;});
		
		// 이전정책 불러오기 클릭시
		$("#folder_openprev_bt").click(function(event){
			event.preventDefault();
			
			var idx = $("#select_folder_policy").val();
			$.getJSON("policyInfo.html", {policy_idx:idx}, function(data){
				var policy = data.policyMast;
				
				var folderPolicyList = policy.folderPolicyList;
				var html = "";
				$.each(folderPolicyList, function(index, folder){
					html += '<tr>';
					html += '<td class="tc"><input type="checkbox" id="" name=""/></td>';
					html += '<td><input type="text" value="'+folder.bmfolder_path+'" class="pl10" style="width:70%" title="프로세스"/></td>';
					html += '<td class="tc"><input type="text" value="'+folder.comp_name+'"class="pl10" style="width:70%" title="회사명" /></td>';
					html += '<td class="tc"><input type="text" value="'+folder.folder_info+'" class="pl10" style="width:70%" title="설명" /></td>';
					html += '</tr>';
					
				});
				$("#popup_folder_list tbody").html(html);
			});
			
		});
		
		// 불러오기 selectbox 선택시
		$("#load_type_select3").change(function(){
			var selectedValue = $(this).val();
			if(selectedValue == "load_prevpolicy"){
				$("#prevpolicy_folder_box").show();
				$("#uploadform_folder").hide();
						
			}else if(selectedValue == "load_excelfile"){
				$("#uploadform_folder").show();
				$("#prevpolicy_folder_box").hide();
				
			}
		});
		
		// 전체선택 checkbox 클릭시
		$("#folder_all_checkbox_popup").click(function(){
			var checked = this.checked;
			$("#popup_folder_list :checkbox").each(function(index, checkbox){
				checkbox.checked = checked;
			});
		});
		
		// 가져오기 버튼 클릭시
		$("#get_folder_bt").click(function(event){
			$("#popup_folder_list tbody :checkbox").each(function(index, checkbox){
				if(checkbox.checked){
					
					var count = $("#folder_section .add_list_box tbody").children().size();
					var $tr =  $(checkbox).parent().parent();
					var folder_path = $tr.find("td:eq(1) :input").val();
					var comp_name = $tr.find("td:eq(2) :input").val();;
					var folder_info = $tr.find("td:eq(3) :input").val();;
					
					var html = "";
					html += '<tr>';
					html += '<td class="tc"><input type="checkbox" id="" name="folder_checkbox"/></td>';
					html += '<td><input type="text" value="'+folder_path+'" class="pl10" style="width:80%" title="폴더명" name="folderPolicyList['+count+'].bmfolder_path"/></td>';
					html += '<td class="tc"><input type="text" value="'+comp_name+'" class="pl10" style="width:80%" title="회사명" name="folderPolicyList['+count+'].comp_name"/></td>';
					html += '<td class="tc"><input type="text" value="'+folder_info+'" class="pl10" style="width:80%" title="설명" name="folderPolicyList['+count+'].folder_info"/></td>'; 
					html += '</tr>';
					
					$("#folder_section tbody").append(html);
				}
			});
			$.modal.close();
		});
	});
</script>