<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>KUMHO TIRES | 사용자관리</title>
<link rel="stylesheet" type="text/css" media="all" href="../common/css/basic.css" />
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"type="text/javascript"></script><![endif]-->
<!--[if IE 7]><link rel="stylesheet" href="../common/css/ie7.css" type="text/css"/><![endif]-->
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/twolevel-1.0.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/slides.min.jquery.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery.form.js"></script>		
<script language="JavaScript"> 
		var win = null;
		var console = window.console || { log: function() {} }; 
		
		jQuery(document).ready(function() {
			jQuery("#mainmenu").twolevel(	
				{resetTimer: 100}
			);
			//로그아웃
			jQuery("#logOutBtn").click(function(){
				jQuery("#headerForm").attr("action","/logout.html");
				jQuery("#headerForm").submit();
			});
			//패스워드변경
			jQuery("#changePasswordBtn").click(function(){
				jQuery("#headerForm").attr("action","/user/pass.html");
				jQuery("#headerForm").submit();
				
			});	
		
	});
</script>
</head>

<body class="${body}">


<form id="headerForm"></form>

<header>
	<div>
		<div class="top_info">
			<p><a href="../"><img src="../common/images/logo.gif" alt="금호타이어"></a></p>
		</div>
	</div>
</header>
<article>
	<%-- <figure>direction</figure>
	<section class="direction">
	<ul>
		<li>${gnb}</li>
		<li>${gnb_sub}</li>
		<li class="last"><span>${tab_1d}</span></li>
	</ul>
	</section> --%>
		
	<section class="user_list">
	<figure>자동화기기 조회</figure>	
	<h2>자동화기기 조회</h2>
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
			<table id="header_table">
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
						<th>고유번호</th>
						<th>IP주소</th>
						<th>MAC주소</th>
						<th>OS종류</th>
						<th>생성일</th>
						<!-- <th>삭제키</th> -->
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
				<thead style="display: none;">
					<tr>
						<th>기기명</th>
						<th>고유번호</th>
						<th>IP주소</th>
						<th>MAC주소</th>
						<th>OS종류</th>
						<th>생성일</th>
						<!-- <th>삭제키</th> -->
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	
   </div>
	</section>
</article>
<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="../resource/libs/common/tree.js"></script>
<!-- <script type="text/javascript" src="../resource/libs/jquery/jquery.tablesorter.js"></script> -->
<script type="text/javascript">


	/* 
	function init_table_sort(header_table_id, data_table_id){
		
		var asc = 0;
		var desc = 1;
		$("#"+header_table_id).click(function(){
			var selected_column_index = $(this).index();
			var selected_sort_direction = desc;
			
			var sort_setting = {"sortList":[[selected_column_index, selected_sort_direction]]};
			$("#"+data_table_id).tablesorter(sort_setting); 
		});
	} */
	
	$(document).ready(function(){
		
		//init_table_sort("header_table", "device_list");		
		
		init_group_tree("tree");
		binding_select_group2("tree", "tree_device_list", "device_list");
		
		$("#tree_search_bt").click(function(event){
			var search_option = $("#tree_search_option").val() || "";
			var search_str = $("#tree_search_str").val() || "";
			if(search_str == ""){
				alert("검색할 내용을 입력하세요.");
			}else{
				$("#tree").jstree("search", search_option + ":" + search_str);
			}
		});
		
	});
	
	function binding_select_group2(groupTreeId, deviceTreeId, tableId){
		$("#"+groupTreeId)
		.bind("select_node.jstree", function(e, data){
			var clientGrpIdx = data.rslt.obj.attr("id").replace("node_", "");
			$.getJSON("../getDeviceList.html", {clientgrp_idx:clientGrpIdx}, function(result){
				
				$("#"+deviceTreeId).html("");
				var listHtml = "";		
				
				var dataArray = new Array();
				$.each(result, function(index, obj){
					
					var data = {};
					var attr = {};
					data["data"] = obj.client_name;
					attr["id"] = "node_" + obj.client_idx;
					attr["rel"] = "file";
					attr["client_idx"] = obj.client_idx;
					attr["clientgrp_idx"] = obj.clientgrp_idx;
					data["attr"] = attr;
					dataArray[index] = data;
					
					listHtml += "<tr>";
					listHtml += "	<td><strong>"+ obj.client_name +"</strong></td>";
					listHtml += "	<td><strong>"+ obj.client_idx +"</strong></td>";
					listHtml += "	<td>"+ (obj.ip_addr || "-") +"</td>";
					listHtml += "	<td>"+ (obj.mac_addr || "-") +"</td>";
					listHtml += "	<td>"+ (obj.os_type || "-") + "</td>";
					listHtml += "	<td>"+ (obj.create_date || "-") +"</td>";
					listHtml += "</tr>";
				});
				
				$("#"+tableId + " tbody").html(listHtml);
				create_device_tree(groupTreeId, deviceTreeId, dataArray);
			});
		});
	}
</script>

<%@ include file="../common/inc/footer.jsp" %>
