<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb5" value="active" />
<c:set var="gnb5_1" value="on" />
<c:set var="gnb" value="통계정보" />
<c:set var="gnb_sub" value="정책관리현황" />
<c:set var="tab_1d" value="자동화기기 운영현황(기기현황)" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$body="lnb_tree";
$gnb5="active"; //GNB_1depth
$gnb5_1="on"; //GNB_2depth
$gnb="통계정보";
$gnb_sub="자동화기기 현황";
$tab_1d="자동화기기 운영현황(기기현황)";
include "../common/inc/header.html";
?>
--%>
<nav class="tab_1depth">
	<ul>
		<li><a href="./"><span></span><p>자동화기기 운영현황(통계)</p></a></li>
		<li class="on"><a href="set.html"><span></span><p>자동화기기 운영현황(기기현황)</p></a></li>
	</ul>
</nav>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<!--
	<figure>자동화기기 운영현황(기기현황)</figure>
	<section class="user_list">
	<div>
	<figure>lnb_tree</figure>
	<section class="lnb_tree" >
		<div class="check">
			<select name="" id="">
				<option value="기기명">기기명</option>
				<option value="IP주소">IP주소</option>
			</select>
			<input type="text" id="" name="">
			<input type="image" src="../common/images/btn/btn_check_03.gif" id="" name="">
		</div>
		<div class="scroll" style="overflow-x: hidden; height: 345px;">
		<div class="manage">
			<h3>관리그룹</h3>
			<div>
				<img src="../common/images/img/@tree_01.gif" alt="">
			</div>
		</div>

		<div  class="machine">
			<h3>자동화기기</h3>
			<div>
				<img src="../common/images/img/@tree_02.gif" alt="">
			</div>
		</div>
		</div>
	</section>
	<div>
	-->

	<figure>자동화기기 운영현황(기기현황)</figure>
	<section class="stats remote">
	<h2>자동화기기 운영현황(기기현황)</h2>
		
		<div class="search_box">
			<div class="ssbox float_l date">
				<h3><img src="../common/images/txt/txt_log_02.gif" alt="기간"></h3>
				<ul class="due">
					<li>
						<select name="" id="year_selectbox">
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
			<div class="ssbox float_l os mt10">
				<h3 class="log_h3"><img src="../common/images/txt/h3_manage.gif" alt="관리그룹"><span><!-- 권한 : 제어 및 모니터링 --></span></h3>
				<ul id="manage_group_list">
					<li class="type1"><input type="checkbox" id="group_all_checkbox"> <label for="#">전체</label></li>
					<c:forEach var="group" items="${groupList }">
						<li class="type1"><input type="checkbox" name="group_checkbox" value="${group.clientgrp_idx }"> <label for="group_${group.clientgrp_idx }">${group.clientgrp_name }</label></li>
					</c:forEach>
				</ul>
			</div>
			<div class="ssbox float_l group">
				<h3 class="log_h3"><img src="../common/images/txt/h3_search_target.gif" alt="조회대상"><span><!-- 권한 : 제어 및 모니터링 --></span></h3>
				<select class="mt5 ml10">
					<option value="전체">전체</option>
					<option value="입력1">입력1</option>
					<option value="입력2">입력2</option>
				</select>
			</div>
		</div>

		<p class="clearboth mt10 tc">
			<a href="srch.html" class="btn type2 setp30" id="search_bt"><span>조회</span></a>
		</p>

		<h4 class="mt20 mb10">조회결과</h4>
		<div class="stats_result mb20">
			<h5 class="tc">자동화기기 운영현황(기기현황)</h5>
			<p class="tc">기준일자 : <span id="search_date"></span></p>
			<p class="tr">작성일자 : <span id="write_date"></span></p>
			<p>신규기기(총 0 0 대수)</p>
			<table class="mt10 title_table">
				<colgroup>
						<col style="width:15%"/>
						<col style="width:10%"/>
						<col style="width:15%"/>
						<col style="width:25%"/>
						<col style="width:20%"/>
						<col style="width:25%"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="tit">관리그룹</td>
						<td class="tit">기기명</td>
						<td class="tit">IP주소</td>
						<td class="tit">MAC 주소</td>
						<td class="tit">OS 종류</td>
						<td class="tit">등록일</td>
					</tr>
				</tbody>
			</table>
			<div class="table_body mt0 mb10">
				<table id="new_device_table">
					<colgroup>
						<col style="width:15%"/>
						<col style="width:10%"/>
						<col style="width:15%"/>
						<col style="width:25%"/>
						<col style="width:20%"/>
						<col style="width:25%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tc">3층기계실</td>
							<td>2BUA01</td>
							<td>123.234.0.1</td>
							<td>44-44-44-66-66-66</td>
							<td>OS</td>
							<td>2012-10-16 10:12:12</td>
						</tr>
					</tbody>
				</table>
			</div>

			<p>제외기기(총 0 0 대수)</p>
			<table class="mt10 title_table">
				<colgroup>
						<col style="width:15%"/>
						<col style="width:10%"/>
						<col style="width:15%"/>
						<col style="width:25%"/>
						<col style="width:20%"/>
						<col style="width:25%"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="tit">관리그룹</td>
						<td class="tit">기기명</td>
						<td class="tit">IP주소</td>
						<td class="tit">MAC 주소</td>
						<td class="tit">OS 종류</td>
						<td class="tit">등록일</td>
					</tr>
				</tbody>
			</table>
			<div class="table_body mt0 mb10">
				<table id="delete_device_table">
					<colgroup>
						<col style="width:15%"/>
						<col style="width:10%"/>
						<col style="width:15%"/>
						<col style="width:25%"/>
						<col style="width:20%"/>
						<col style="width:25%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tc">3층기계실</td>
							<td>2BUA01</td>
							<td>123.234.0.1</td>
							<td>44-44-44-66-66-66</td>
							<td>OS</td>
							<td>2012-10-16 10:12:12</td>
						</tr>
					</tbody>
				</table>
			</div>

			<p>운영기기(총 0 0 대수)</p>
			<table class="mt10 title_table">
				<colgroup>
						<col style="width:15%"/>
						<col style="width:10%"/>
						<col style="width:15%"/>
						<col style="width:25%"/>
						<col style="width:20%"/>
						<col style="width:25%"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="tit">관리그룹</td>
						<td class="tit">기기명</td>
						<td class="tit">IP주소</td>
						<td class="tit">MAC 주소</td>
						<td class="tit">OS 종류</td>
						<td class="tit">등록일</td>
					</tr>
				</tbody>
			</table>
			<div class="table_body mt0 mb10">
				<table id="running_device_table">
					<colgroup>
						<col style="width:15%"/>
						<col style="width:10%"/>
						<col style="width:15%"/>
						<col style="width:25%"/>
						<col style="width:20%"/>
						<col style="width:25%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tc">3층기계실</td>
							<td>2BUA01</td>
							<td>123.234.0.1</td>
							<td>44-44-44-66-66-66</td>
							<td>OS</td>
							<td>2012-10-16 10:12:12</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="tc">
				<a href="#" class="btn set25"><span>인쇄</span></a>
			</div>
		</div><!--stats_result-->

	</section>
</article>
<script type="text/javascript" src="../resource/libs/common/common.util.js"></script>
<script type="text/javascript"> 

$(document).ready(function() {
	
	//help
	$("#helpBtn5").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help5-1-2");
		//e.preventDefault();
		return false;
	});
	
	// 시작일과 종료일을 오늘날짜로 초기화한다.
	$("#start_date").val(getDateStringByPeriod(new Date()));
	$("#end_date").val(getDateStringByPeriod(new Date()));
	
	// 월별선택 기간 셀렉터박스의 년/월을 현재 날짜의 년월로 초기화한다.
	var now_year = new Date().getFullYear();
	var now_month = new Date().getMonth() + 1;
	$("#year_selectbox option:contains('"+now_year+"')").attr("selected", "selected");
	$("#month_selectbox option:contains('"+now_month+"')").attr("selected", "selected");
	
	// 월별선택
	$("#month_button").click(function(event){
		event.preventDefault();
		
		var year = $("#year_selectbox").val();
		var month = $("#month_selectbox").val();
		
		$("#start_date").val(getBeginDateAtMonth(year, month));
		$("#end_date").val(getLastDateAtMonth(year, month));
	});
	
	
	// 날짜기간 버튼 클릭시
	$("#date_button a").click(function(event){
		event.preventDefault();
		var date_text = $(this).text();
		
		if(date_text == '당일'){
			$("#start_date").val(getDateStringByPeriod(new Date()));
		}else if(date_text == '3일'){
			$("#start_date").val(getDateStringByPeriod(new Date(), 2));
		}else if(date_text == '1주'){
			$("#start_date").val(getDateStringByPeriod(new Date(), 6));
		}else if(date_text == '1개월'){
			$("#start_date").val(getDateStringByPeriod(new Date(), 30));
		}else if(date_text == '3개월'){
			$("#start_date").val(getDateStringByPeriod(new Date(), 90));
		}else if(date_text == '6개월'){
			$("#start_date").val(getDateStringByPeriod(new Date(), 180));
		}
		
		$("#end_date").val(getDateStringByPeriod(new Date()));
	});
	
	// 관리그룹 전체선택/해제 처리
   	checkedAllOrNothing("group_all_checkbox", "group_checkbox");
   	checkedAllCheckbox("group_all_checkbox", "group_checkbox");
   	
   	$("#search_bt").click(function(event){
   		event.preventDefault();
   		$("#searchForm").html("");
   		
   		var write_date = getLocalDateFormat(new Date());
	   	$("#write_date").html(write_date);
   		var search_date = getDateStringToLocalDateFormat($("#start_date").val()) + " ~ " + getDateStringToLocalDateFormat($("#end_date").val());
   		$("#search_date").html(search_date);
   		
   		$("#searchForm").append("<input type='hidden' name='start_date' value='"+$("#start_date").val()+"'/>");
   		$("#searchForm").append("<input type='hidden' name='end_date' value='"+$("#end_date").val()+"'/>");
   		
   		$("#manage_group_list li :checkbox[name='group_checkbox']:checked").each(function(index, obj){
   			$("#searchForm").append("<input type='hidden' name='clientgrp_idx' value='"+$(obj).val()+"'/>");
   		});
   		
   		$.post("set.html", $("#searchForm").serialize(), function(result){
   			
   			if(result && result.status == 1){
   				alert(result);
   			}
   		});
   	});
});
</script>
<form id="searchForm" action="" method="post"></form>
</body>
</html>
