<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb5" value="active" />
<c:set var="gnb5_2" value="on" />
<c:set var="gnb" value="통계정보" />
<c:set var="gnb_sub" value="정책관리현황" />
<c:set var="tab_1d" value="기기별 통계" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$body="lnb_tree";
$gnb5="active"; //GNB_1depth
$gnb5_2="on"; //GNB_2depth
$gnb="통계정보";
$gnb_sub="정책관리현황";
$tab_1d="기기별 통계";
include "../common/inc/header.html";
?>
--%>
<nav class="tab_1depth">
	<ul>
		<li><a href="policy.html"><span></span><p>정책별 통계</p></a></li>
		<li class="on"><a href="policy_dvc.html"><span></span><p>기기별 통계</p></a></li>
	</ul>
</nav>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>정책조회</figure>
	<section class="stats mt20">
		<h2>기기별 통계</h2>
		<div class="search_box">
			<div class="ssbox float_l" style="width: 250px;">
				<h3><img src="../common/images/txt/txt_log_02.gif" alt="기간"></h3>
				<ul class="due">
					<li>
						<select name="" id="year_selectbox">
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
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
					<li><a href="#" class="btn set25 mr20" id="month_button"><span>월별 선택</span></a></li>
				</ul>
			</div>
			<div class="ssbox float_l group" style="margin-top: 16px;">
				<ul class="clearboth"  id="date_button">
					<li><a href="#" class="btn set25"><span>당일</span></a></li>
					<li><a href="#" class="btn set25"><span>3일</span></a></li>
					<li><a href="#" class="btn set25"><span>1주</span></a></li>
					<li><a href="#" class="btn set25"><span>1개월</span></a></li>
					<li><a href="#" class="btn set25"><span>3개월</span></a></li>
					<li><a href="#" class="btn set25"><span>6개월</span></a></li>
				</ul>
				<ul class="clearboth">
					<li>
						<input type="text" name="cal_Date" readonly="readonly" id="start_date">
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" />
						 ~
						<input type="text" name="cal_Date2" readonly="readonly" id="end_date">
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)" />
					</li>
				</ul>
			</div>
		</div>


		<p class="clearboth mt10 tc">
			<a href="#" class="btn type2 setp30" id="search_bt"><span>검색</span></a>
		</p>

		<h4 class="mt20 mb10">조회결과</h4>
		<div class="stats_result">
			<h5 class="tc">기기별 신규정책 운영현황</h5>
			<p class="tc">기준일자 : <span id="search_date"></span></p>
			<p class="tr">작성일자 : <span id="write_date"></span></p>
			<div>
				<p>기기별 신규 정책 리스트 (총 <span id="device_total"></span>건)</p>
				<table class="title_table mt10">
					<colgroup>
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">관리그룹</td>
							<td class="tit">기기명</td>
							<td class="tit">IP 주소</td>
							<td class="tit">OS 종류</td>
							<td class="tit">적용일시</td>
							<td class="tit">시뮬레이션 정책</td>
							<td class="tit">정책명</td>
							<td class="tit">설명</td>
						</tr>
					</tbody>
				</table>
				<div class="table_body scroll mt0 mb10" style="height: 210px;">
					<table id="device_list_table">
						<colgroup>
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:140px">
						<col style="width:*">
						</colgroup>
						<tbody>
							<!-- <tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tc">2012-10-16 10:12:12</td>
								<td class="tc">시뮬이션 정책</td>
								<td class="tc">정책명</td>
								<td class="tc">설명</td>
							</tr> -->
						</tbody>
					</table>
				</div>
			</div>

			<div class="tc">
				<a href="#" class="btn set25"><span>인쇄</span></a>
			</div>
		</div>
	</section>
</article>

<script type="text/javascript" src="../resource/libs/common/common.util.js"></script>
<script type="text/javascript"> 

$(document).ready(function() {
	
	//help
	$("#helpBtn5").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help5-2-2");
		//e.preventDefault();
		return false;
	});
	
	// 기간 검색 초기화
	init_gigan();
	
	$("#search_bt").click(function(event){
		event.preventDefault();
		$("#searchForm").html("");
		$("#device_list_table tbody").html("");
		
		var write_date = getLocalDateFormat(new Date());
	   	$("#write_date").html(write_date);
		var search_date = getDateStringToLocalDateFormat($("#start_date").val()) + " ~ " + getDateStringToLocalDateFormat($("#end_date").val());
		$("#search_date").html(search_date);
		
		$("#searchForm").append("<input type='hidden' name='start_date' value='"+$("#start_date").val()+"'/>");
		$("#searchForm").append("<input type='hidden' name='end_date' value='"+$("#end_date").val()+"'/>");
		
		$.post("policy_dvc.html", $("#searchForm").serialize(), function(result){
			if(result && result.status == 1){
				
				var html = "";
				$.each(result.device_list, function(index, device){

					var group_name = (device.group_name || '-');
					var client_name = (device.client_name || '-');
					var ip_addr = (device.ip_addr || '-');
					var os_type = (device.os_type || '-');
					var reg_date = (device.policy_nowdate || '-');
					var policy_mode = (device.sim_flag == '1' ? '시뮬레이션 정책' : '보안모드');
					policy_mode = (policy_mode || '-');
					var policy_name = (device.policy_name || '-');
					var policy_desc = (device.policy_desc || '-');
					
					html += '<tr>';
					html += '<td class="tc">'+group_name+'</td>';
					html += '<td class="tc">'+client_name+'</td>';
					html += '<td class="tc">'+ip_addr+'</td>';
					html += '<td class="tc">'+os_type+'</td>';
					html += '<td class="tc">'+reg_date+'</td>';
					html += '<td class="tc">'+policy_mode+'</td>';
					html += '<td class="tc">'+policy_name+'</td>';
					html += '<td class="tc">'+policy_desc+'</td>';
					html += '</tr>';
					
				});
				
				$("#device_total").text(result.device_list.length);
				$("#device_list_table tbody").html(html);
			}
		});
		
	});
	
	
	
});
</script>
<form id="searchForm" method="post" action=""></form>
</body>
</html>
