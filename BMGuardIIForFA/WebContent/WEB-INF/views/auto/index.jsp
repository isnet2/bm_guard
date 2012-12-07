<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb2" value="active" />
<c:set var="gnb2_1" value="on" />
<c:set var="gnb" value="자동화기기 관리" />
<c:set var="gnb_sub" value="자동화기기 관리" />
<c:set var="tab_1d" value="자동화기기 관리" />
<%@ include file="../common/inc/header.jsp" %>
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="index.html">자동화기기관리</a></li>
		<li><a href="auto_del.html">자동화기기 삭제내역</a></li>
		<li><a href="auto_overlap.html">IP주소 중복조회</a></li>
	</ul>
</nav>
</header>
<article>
	<%@ include file="../common/inc/direction.jsp" %>
		
	<section class="user_list">
	<figure>자동화기기 관리</figure>	
	<!-- <h2>자동화기기 관리</h2> -->
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
		<div class="tit">
			<table>
				<colgroup>
						<col style="width:150px">
						<col style="width:150px">
						<col style="width:*">
						<col style="width:150px">
						<col style="width:150px">
						<col style="width:150px">
				</colgroup>
				<thead>
					<tr>
						<th>기기명</th>
						<th>IP주소</th>
						<th>MAC주소</th>
						<th>OS종류</th>
						<th>등록일</th>
						<th>삭제키</th>
					</tr>
				</thead>
			</table>
		</div>

		<div class="list">
			<table id="device_list">
				<colgroup>
						<col style="width:150px">
						<col style="width:150px">
						<col style="width:*">
						<col style="width:150px">
						<col style="width:150px">
						<col style="width:150px">
				</colgroup>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<div style="display:block; text-align:center;">

	   <!-- modal popup contents-3-2 (파일일괄등록) -->
	   <div id="basic-modal-3-2" class="btn_admit">
			<p><a href="#" class="basic-3-2 btn" ><span>파일일괄등록</span></a></p>
	   </div>

	   <!-- modal popup contents-3-2 (관리그룹등록) -->
	   <div id="add_group_bt" class="btn_admit">
			<p><a href="#" class="basic-3-2 btn"><span>관리그룹등록</span></a></p>
	   </div>

	   <!-- modal popup contents-3-2 (관리그룹삭제) -->
	   <div id="delete_group_bt" class="btn_admit">
			<p><a href="#" class="basic-3-2 btn"><span>관리그룹삭제</span></a></p>
	   </div>

	   <!-- modal popup contents-3-2 (관리그룹명수정) -->
	   <div id="rename_group_bt" class="btn_admit">
			<p><a href="#" class="basic-3-2 btn"><span>관리그룹명수정</span></a></p>
	   </div>

	   <!-- modal popup contents-3-2 (기기등록) -->
	   <div id="add_device_bt" class="btn_admit">
			<p><a href="#" class="basic-3-2 btn"><span>기기등록</span></a></p>
	   </div>
		<!-- modal popup contents-3-2 (기기명수정) -->
	   <div id="rename_device_bt" class="btn_admit">
			<p><a href="#" class="basic-3-2 btn"><span>기기명수정</span></a></p>
	   </div>
	   <!-- modal popup contents-3-2 (기기삭제) -->
	   <div id="delete_key_bt" class="btn_admit">
			<p><a href="#" class="btn"><span>삭제키발급</span></a></p>
	   </div>
	   <!-- modal popup contents-3-2 (기기삭제) -->
	   <div id="delete_device_bt" class="btn_admit">
			<p><a href="#" class="basic-3-2 btn"><span>기기삭제</span></a></p>
	   </div>
   </div>

	<!-- modal popup contents2 (파일일괄등록) 팝업창 -->
    <div id="content-3-2">
		<!-- modal content-3-2 -->
		<div id="basic-modal-content-3-2">
			<h2><img src="../common/images/txt/h2_file.gif" alt="신규건별등록"></h2>
			<div class="scroll" style="height: 300px; margin: 0px; padding: 20px 30px 20px 30px;">
				
				<form method="post" id="uploadform_folder" action="../openfile.html" enctype="multipart/form-data">
					<p class="ar">
					<input type="file" id="excelfile" name="excelfile">
					<img src="../common/images/btn/btn_excel_bring.gif" id="folder_openfile_bt">
					</p>
				</form>
				<table class="mt5" id ="popup_folder_list">
					<colgroup>
						<col style="width:14%"/>
						<col style="width:14%"/>
						<col style="width:14%"/>
						<col style="width:14%"/>
						<col style="width:14%"/>
						<col style="width:16%"/>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">관리그룹</th>
							<th rowspan="2">레벨</th>
							<th colspan="2">상위 관리그룹</th>
							<th rowspan="2" class="last">기기명</th>
						</tr>
						<tr>
							<th>그룹명</th>
							<th>코드</th>
							<th>그룹명</th>
							<th>코드</th>
						</tr>
					</thead>
					<form id="fileRegistForm" name="fileRegistForm">
						<tbody>
	 					</tbody>
 					</form>
				</table>
				<p class="ok"><a href="#" class="btn" id="fileRegistBtn"><span>확인</span></a></p>
			</div>		
		</div><!-- //end basic-modal-content-3-2 -->
	</div><!-- //end content-3-2 -->
	</div>
	</section>
</article>
<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="../resource/libs/common/tree.js"></script>
<script type="text/javascript" src="/resource/libs/jquery/jquery.form.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		init_group_tree("tree");
		binding_select_group("tree", "tree_device_list", "device_list");
		
		binding_create_group("tree");
		binding_remove_group("tree");
		binding_rename_group("tree");

		//form
		$("#uploadform_folder").ajaxForm(uploadFormCallback);
		$("#uploadform_folder").submit(function(){return;});
		
		//help
		$("#helpBtn2").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help2-1");
			//e.preventDefault();
			return false;
		});
		
		$("#add_group_bt a").click(function(event){
			event.preventDefault();
			$("#tree").jstree("create", null, "last", { "attr" : { "rel" : "folder" } });
		});
		$("#delete_group_bt a").click(function(event){
			event.preventDefault();
			$("#tree").jstree("remove");
		});
		$("#rename_group_bt a").click(function(event){
			event.preventDefault();
			$("#tree").jstree("rename");
		});
		$("#add_device_bt a").click(function(event){
			event.preventDefault();
			$("#tree_device_list").jstree("create", null, "last");
			
		});
		$("#delete_device_bt a").click(function(event){
			event.preventDefault();
			$("#tree_device_list").jstree("remove");
		});
		$("#rename_device_bt a").click(function(event){
			event.preventDefault();
			$("#tree_device_list").jstree("rename");
		});
		
		$("#tree_search_bt").click(function(event){
			var search_option = $("#tree_search_option").val() || "";
			var search_str = $("#tree_search_str").val() || "";
			if(search_str == ""){
				alert("검색할 내용을 입력하세요.");
			}else{
				$("#tree").jstree("search", search_option + ":" + search_str);
			}
		});
		
		$("#delete_key_bt a").click(function(event){
			event.preventDefault();
			if (!getClientIdx("tree_device_list")) {
				alert("삭제키를 발급할 기기를 선택하여 주세요.");
				return;
			}else {
				$.post(
						"./addDeleteKey.html", 
						{ 	"clientgrp_idx" : getGroupIdx("tree"),
							"client_idx" : getClientIdx("tree_device_list")
						}, 
						function (r) {
							if(r.status) {
								reflashTable(r);
							}else {
								$.jstree.rollback(data.rlbk);
							}
						},
						"json"
					); 
			}
		});
		
		
		// 파일 업로드 처리
		$("#folder_openfile_bt").click(function(event){
			event.preventDefault();

			var filename = $("#excelfile").val();
			if(filename != ""){
				$("#uploadform_folder").trigger("submit");
			}else{
				alert("선택된 파일이 없습니다.");
			}
		});
		
		//파일일괄등록 데이터 등록
		$("#fileRegistBtn").click(function(evnet) {
			var len = $("input[name='nowGroup\[\]']").length;
			if(len > 0 ) {
				var arr ="";
				for(var i = 0 ; i < len;i++) {
					arr+= $("#nowGroup_"+i).val() + ",";
					arr+= $("#nGroupCode_"+i).val()+",";
					arr+= $("#level_"+i).val()+",";
					arr+= $("#highGroup_"+i).val()+ ",";
					arr+= $("#highGroupCode_"+i).val()+",";
					arr+= $("#deviceName_"+i).val() + ",^";
				}

				$.post("./insertAllDevice.html", {"arr" : arr}, function(data){
					if(data!= null) {
						if(data.result == 1) {
							alert("파일 업로드가 완료 되었습니다.");
							location.href="/auto/index.html";
						} else {
							alert("파일 업로드 중 에러가 발생하였습니다.");
							return;
						}
					}
				});
			}else {
				alert("파일 업로드 후 확인을 눌러 주세요.");
				return;
			}
		});

	});

	function uploadFormCallback(data, state){
		var jsonStr = eval("("+data+")");
		if(state == "success" && jsonStr.status == "1"){

			var result = jsonStr.excel_data;
			var html = "";
			$.each(result, function(index, rtn){
				html+="<tr>";
				html+="<td><input type='text' id='nowGroup_"+ index +"' name ='nowGroup\[\]' value='"+ rtn.nowGroup +"' class='w100'></td>";
				html+="<td><input type='text' id='nGroupCode_"+ index +"' name ='nGroupCode\[\]' value='"+ rtn.nGroupCode + "' class='w100'></td>";
				html+="<td><input type='text' id='level_"+ index +"' name ='level\[\]' value='"+ rtn.level+ "' class='w100'></td>";
				html+="<td><input type='text' id='highGroup_"+ index +"' name ='highGroup\[\]' value='"+ rtn.highGroup+ "' class='w100'></td>";
				html+="<td><input type='text' id='highGroupCode_"+ index +"' name ='highGroupCode\[\]' value='"+ rtn.highGroupCode+ "' class='w100'></td>";
				html+="<td class='last'><input id='deviceName_"+ index +"' name ='deviceName\[\]' type='text' value='"+ rtn.deviceName + "' class='w100'></td>";
				html+="</tr>";
			});
			$("#popup_folder_list tbody").html(html);
			$("#excelfile").val("");
			
		}else{
			alert("엑셀파일 처리 중 오류가 발생하였습니다.\n파일을 확인해 주십시요.");
		}
	}
	
</script>

<%@ include file="../common/inc/footer.jsp" %>
