<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="gnb5" value="active" />
<c:set var="gnb5_1" value="on" />
<c:set var="gnb" value="통계정보" />
<c:set var="gnb_sub" value="자동화기기 현황" />
<c:set var="tab_1d" value="자동화기기 운영현황(통계)" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$gnb5="active"; //GNB_1depth
$gnb5_1="on"; //GNB_2depth
$gnb="통계정보";
$gnb_sub="자동화기기 현황";
$tab_1d="자동화기기 운영현황(통계)";
include "../common/inc/header.html";
?>
--%>
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="./"><span></span><p>자동화기기 운영현황(통계)</p></a></li>
		<li><a href="set.html"><span></span><p>자동화기기 운영현황(기기현황)</p></a></li>
	</ul>
</nav>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>자동화기기 운영현황(통계)</figure>
	<section class="stats">
		<h2>자동화기기 운영현황(통계)</h2>
		<div class="search_box">
			<div class="ssbox float_l date">
				<h3><img src="../common/images/txt/txt_log_02.gif" alt="기간"></h3>
				<ul class="due">
					<li>
						<select name="" id="year_selectbox">
							<option value="2017">2017</option>
							<option value="2016">2016</option>
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2012">2013</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
							<option value="2009">2009</option>
							<option value="2008">2008</option>
							<option value="2007">2007</option>
						</select>
						<span>년</span>
					</li>
					<li>
						<select name="" id="month_selectbox">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<span>월</span>
					</li>
					<li><a href="#" class="btn set25" id="month_button"><span>월별 선택</span></a></li>
				</ul>
				<ul class="clearboth" id="date_button">
					<li><a href="#" class="btn set25"><span>당일</span></a></li>
					<li><a href="#" class="btn set25"><span>3일</span></a></li>
					<li><a href="#" class="btn set25"><span>1주</span></a></li>
					<li><a href="#" class="btn set25"><span>1개월</span></a></li>
					<li><a href="#" class="btn set25"><span>3개월</span></a></li>
					<li><a href="#" class="btn set25"><span>6개월</span></a></li>
				</ul>
				<ul class="date clearboth">
					<li>
						<input type="text" name="cal_Date" readonly="readonly" id="start_date">
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" />
						 ~
						<input type="text" name="cal_Date2" readonly="readonly" id="end_date">
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)" />
					</li>
				</ul>
			</div>
			<div class="ssbox float_l group">
				<h3 class="log_h3"><img src="../common/images/txt/h3_os.gif" alt="OS"><span><!-- 권한 : 제어 및 모니터링 --></span></h3>
				<ul id="os_type_list">
					<li class="type1"><input type="checkbox" id="os_all_checkbox"> <label for="#">전체</label></li>
					<li class="type2"><input type="checkbox" name="os_checkbox" value="Win98"> <label for="#">Win98</label></li>
					<li class="type3"><input type="checkbox" name="os_checkbox" value="WinNT"> <label for="#">WinNT</label></li>
					<li class="type4"><input type="checkbox" name="os_checkbox" value="WinME"> <label for="#">WinMe</label></li>
					<li class="type5"><input type="checkbox" name="os_checkbox" value="Win2K"> <label for="#">Win2K</label></li>
					<li class="type6"><input type="checkbox" name="os_checkbox" value="WinXP"> <label for="#">WinXP</label></li>
					<li class="type7"><input type="checkbox" name="os_checkbox" value="Win7"> <label for="#">Win7</label></li>
				</ul>
			</div>
			<div class="ssbox float_l os mt10">
				<h3 class="log_h3"><img src="../common/images/txt/h3_manage.gif" alt="관리그룹"><span><!-- 권한 : 제어 및 모니터링 --></span></h3>
				<ul id="manage_group_list">
					<li class="type1"><input type="checkbox" id="group_all_checkbox"> <label for="#">전체</label></li>
					<c:forEach var="group" items="${groupList }">
						<li class="type1"><input type="checkbox" name="group_checkbox" value="${group.clientgrp_idx }"> <label for="group_${group.clientgrp_idx }">${group.clientgrp_name }</label></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<p class="clearboth mt10 tc">
			<a href="srch.html" class="btn type2 setp30"  id="search_bt"><span>조회</span></a>
		</p>

		<h4 class="mt20 mb10">조회결과</h4>
		<div class="stats_result" id="result_view">
			<h5 class="tc">자동화기기 운영현황(통계)</h5>
			<p class="tc">기준일자 : <span id="search_date"></span></p>
			<p class="tr">작성일자 : <span id="write_date"></span></p>
			<div class="float_l" style="width:49%">
				<p>관리그룹별</p>
				<table class="mt10 title_table">
					<colgroup>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">관리그룹</td>
							<td class="tit">신규기기수</td>
							<td class="tit">제외기기수</td>
							<td class="tit">운영기기수</td>
						</tr>
					</tbody>
				</table>
				<div class="table_body mt0 mb10">
					<table style="text-align: center;" id="device_stats_table1">
						<colgroup>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
					</colgroup>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="float_r" style="width:49%">
				<p>OS별</p>
				<table class="mt10 title_table">
					<colgroup>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">OS</td>
							<td class="tit">신규기기수</td>
							<td class="tit">제외기기수</td>
							<td class="tit">운영기기수</td>
						</tr>
					</tbody>
				</table>
				<div class="table_body mt0 mb10">
					<table style="text-align: center;" id="device_stats_table2">
						<colgroup>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
							<col style="width:25%"/>
					</colgroup>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tc clearboth pt20">
				<a href="#" class="btn set25"><span>인쇄</span></a>
			</div>
		</div>
		
	</section>
</article>
<script type="text/javascript" src="../resource/libs/common/common.util.js"></script>
<script type="text/javascript"> 

$(document).ready(function() {
	
	$("#result_view").hide();
	
	//help
	$("#helpBtn5").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help5-1");
		//e.preventDefault();
		return false;
	});
	
	// 기간 검색 초기화
	init_gigan();
	
	// OS타입 전체선택/해제 처리
   	checkedAllOrNothing("os_all_checkbox", "os_checkbox");
   	checkedAllCheckbox("os_all_checkbox", "os_checkbox");
	
	// 관리그룹 전체선택/해제 처리
   	checkedAllOrNothing("group_all_checkbox", "group_checkbox");
   	checkedAllCheckbox("group_all_checkbox", "group_checkbox");
	
   	$("#search_bt").click(function(event){
   		event.preventDefault();
   		
   		$("#searchForm").html("");
   		$("#result_view").html(""); 
   		$("#result_view").show();   		
   		
	   	var write_date = getLocalDateFormat(new Date());
	   	$("#write_date").html(write_date);
   		var search_date = getDateStringToLocalDateFormat($("#start_date").val()) + " ~ " + getDateStringToLocalDateFormat($("#end_date").val());
   		$("#search_date").html(search_date);
   		
   		$("#searchForm").append("<input type='hidden' name='start_date' value='"+$("#start_date").val()+"'/>");
   		$("#searchForm").append("<input type='hidden' name='end_date' value='"+$("#end_date").val()+"'/>");
   		
   		$("#os_type_list li :checkbox[name='os_checkbox']:checked").each(function(index, obj){
   			$("#searchForm").append("<input type='hidden' name='os_type' value='"+$(obj).val()+"'/>");
   		});
   		$("#manage_group_list li :checkbox[name='group_checkbox']:checked").each(function(index, obj){
   			$("#searchForm").append("<input type='hidden' name='clientgrp_idx' value='"+$(obj).val()+"'/>");
   		});
   		
   		$.post("index.html", $("#searchForm").serialize(), function(result){
   			
   			if(result && result.status == 1){
   				var list1 = result.deviceStatsByGroup;
   				var list2 = result.deviceStatsByOstype;
   				
   				var html = "";
   				var total_new_device = 0;
   				var total_delete_device = 0;
   				var total_running_device = 0;
   				
   				$.each(list1, function(index, obj){
   					html += makeRow(obj.group_name, obj);
   					total_new_device += obj.new_device;
   	   				total_delete_device += obj.delete_device;
   	   				total_running_device += obj.running_device;
   				});
   				html += makeTotalRow(total_new_device, total_delete_device, total_running_device)
   				$("#device_stats_table1 tbody").html(html);
   				
   				html = "";
   				total_new_device = 0;
   				total_delete_device = 0;
   				total_running_device = 0;
   				$.each(list2, function(index, obj){
   					html += makeRow(obj.os_type, obj);
   					total_new_device += obj.new_device;
   	   				total_delete_device += obj.delete_device;
   	   				total_running_device += obj.running_device;
   				});
   				html += makeTotalRow(total_new_device, total_delete_device, total_running_device);
   				$("#device_stats_table2 tbody").html(html);
   			} 			
   			
   		}, "json");
   		
   	});
   	
});

function makeRow(name, obj){
	var html = "";
	html += '<tr>';
	html += '<td class="tc">'+name+'</td>';
	html += '<td>'+obj.new_device+'</td>';
	html += '<td>'+obj.delete_device+'</td>';
	html += '<td>'+obj.running_device+'</td>';
	html += '</tr>';
	return html;
}

function makeTotalRow(total_new_device, total_delete_device, total_running_device){
	var html = "";
	html += '<tr>';
	html += '<td class="tc"><strong>총계</strong></td>';
	html += '<td>'+total_new_device+'</td>';
	html += '<td>'+total_delete_device+'</td>';
	html += '<td>'+total_running_device+'</td>';
	html += '</tr>';
	return html;
}

</script>
<form id="searchForm" action="" method="post">
</form>
</body>
</html>
