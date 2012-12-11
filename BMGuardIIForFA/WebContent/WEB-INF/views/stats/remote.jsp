<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb5" value="active" />
<c:set var="gnb5_3" value="on" />
<c:set var="gnb" value="통계정보" />
<c:set var="tab_1d" value="원격관리 현황" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$body="lnb_tree";
$gnb5="active"; //GNB_1depth
$gnb5_3="on"; //GNB_2depth
$gnb="통계정보";
$gnb_sub="원격관리 현황";
$tab_1d="원격관리 현황";
include "../common/inc/header.html";
?>
--%>
<!-- <nav class="tab_1depth">
	<ul>
		<li class="on"><a href="nowlog.html"><span></span><p>원격관리 현황</p></a></li>
	</ul>
</nav>
 --></header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>원격관리현황</figure>
	<section class="user_list">
	<h2>원격관리현황</h2>
	<div class="policy_wrap">

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
			<div id="tree" style="height: 850px;">
			</div>
		</div>
		<div  class="machine">
			<h3>자동화기기</h3>
			<div id="tree_device_list" style="height: 850px;">
			</div>
		</div>
		</div>
		</section>
	<!--  트리메뉴 -->

	<div class="board">

	<figure>정책조회</figure>
	<section class="stats mt20">
		
		<div class="search_box">
			<div class="ssbox float_l" style="width:100%">
				<!-- <div class="float_l mr20">
					<h3 class="mb10"><img src="../common/images/txt/h3_month.gif" alt="월단위" /></h3>
					<select>
						<option value="">2010-07</option>
					</select>
				</div> -->
				<div class="ssbox float_l" style="width: 250px;">
				<h3><img src="../common/images/txt/h3_month.gif" alt="월단위" /></h3>
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
				<div class="float_l">
					<h3><img src="../common/images/txt/txt_log_02.gif" alt="기간"></h3>
					<ul class="due" id="date_button">
						<li><a href="#" class="btn set25"><span>당일</span></a></li>
						<li><a href="#" class="btn set25"><span>3일</span></a></li>
						<li><a href="#" class="btn set25"><span>1주</span></a></li>
						<li><a href="#" class="btn set25"><span>1개월</span></a></li>
						<li><a href="#" class="btn set25"><span>3개월</span></a></li>
						<li><a href="#" class="btn set25"><span>6개월</span></a></li>
					</ul>
					<ul class="date clearboth">
						<li>
							<input type="text" name="cal_Date" readonly="readonly" id="start_date" />
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" alt="" />
							~
							<input type="text" name="cal_Date2" readonly="readonly" id="end_date" />
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)" alt="" />
						</li>
					</ul>
				</div>
			</div>
			<div class="ssbox mt10" style="width:100%">
				<h3 class="log_h3"><img src="../common/images/txt/h3_remotetype.gif" alt="원격관리유형"></h3>
				<ul>
					<li class="type1"><input type="checkbox" checked="checked" id="kind_all_checkbox" /> <label for="type1">전체</label></li>
					<li class="type2"><input type="checkbox" name="kind_checkbox" id="type2" value="FM"/> <label for="type2">파일/폴더관리</label></li>
					<li class="type3"><input type="checkbox" name="kind_checkbox" id="type3" value="SM"/> <label for="type3">프로세서/서비스관리</label></li>
					<li class="type4"><input type="checkbox" name="kind_checkbox" id="type4" value="RM"/> <label for="type4">레지스트리 관리</label></li>
					<li class="type5"><input type="checkbox" name="kind_checkbox" id="type5" value="PD"/> <label for="type5">프로그램배포 관리</label></li>
					<li class="type6"><input type="checkbox" name="kind_checkbox" id="type6" value="DM"/> <label for="type6">자동화기기 종료관리</label></li>
					<li class="type7"><input type="checkbox" name="kind_checkbox" id="type7" value="PM"/> <label for="type7">정책 관리</label></li>
					<li class="type8"><input type="checkbox" name="kind_checkbox" id="type8" value="RC"/> <label for="type8">원격제어</label></li>
				</ul>
			</div>
		</div>


		<p class="clearboth mt10 tc">
			<a href="srch.html" class="btn type2 setp30"><span>조회</span></a>
		</p>

		<h4 class="mt20 mb10">조회결과</h4>
		<div class="stats_result">
			<h5 class="tc">원격관리 현황</h5>
			<p class="tc">기준일자 : 2021년 9월 1일~2012년 9월 15일</p>
			<p class="tr">작성일자 : 2012년 10월 25일</p>
			<div>
				<p>원격관리 건수 (총 00건)</p>
				<table class="mt10 title_table">
					<colgroup>
						<col style="width:*" />
						<col style="width:110px" />
						<col style="width:95px" />
						<col style="width:110px" />
						<col style="width:95px" />
						<col style="width:95px" />
						<col style="width:95px" />
						<col style="width:80px" />
						<col style="width:80px" />
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">관리그룹</td>
							<td class="tit">파일/폴더관리</td>
							<td class="tit">프로세스/서비스 관리</td>
							<td class="tit">레지스트리<br />관리</td>
							<td class="tit">프로그램배포</td>
							<td class="tit">자동화기기<br/>종료관리</td>
							<td class="tit">정책관리</td>
							<td class="tit">원격제어</td>
							<td class="tit">총계</td>
						</tr>
					</tbody>
				</table>
				<div class="table_body scroll mt0 mb10" style="height: 210px;">
					<table id="remote_stats_table">
						<colgroup>
							<col style="width:*" />
							<col style="width:110px" />
							<col style="width:95px" />
							<col style="width:110px" />
							<col style="width:95px" />
							<col style="width:95px" />
							<col style="width:95px" />
							<col style="width:80px" />
							<col style="width:80px" />
						</colgroup>
						<tbody>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">0</td>
								<td class="tc">0</td>
								<td class="tc">0</td>
								<td class="tc">0</td>
								<td class="tc">0</td>
								<td class="tc">2</td>
								<td class="tc">1</td>
								<td class="tc">3</td>
							</tr>
						</tbody>
					</table>
				</div>

				<p class="mt20">원격관리 내역</p>
				<table class="mt10 title_table" >
					<colgroup>
						<col style="width:70px" />
						<col style="width:70px" />
						<col style="width:115px" />
						<col style="width:70px" />
						<col style="width:115px" />
						<col style="width:115px" />
						<col style="width:115px" />
						<col style="width:70px" />
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">관리그룹</td>
							<td class="tit">기기명</td>
							<td class="tit">IP 주소</td>
							<td class="tit">OS 종류</td>
							<td class="tit">원격 관리 분류</td>
							<td class="tit">원격관리</td>
							<td class="tit">처리내용</td>
							<td class="tit">처리일시</td>
						</tr>
					</tbody>
				</table>
				<div class="table_body scroll mt0 mb10" style="height: 210px;">
					<table id="remote_device_table">
						<colgroup>
							<col style="width:70px" />
							<col style="width:70px" />
							<col style="width:115px" />
							<col style="width:70px" />
							<col style="width:115px" />
							<col style="width:115px" />
							<col style="width:115px" />
							<col style="width:70px" />
						</colgroup>
						<tbody>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tc">2012-10-16 10:12:12</td>
								<td class="tc">시뮬이션 정책</td>
								<td class="tc">정책명</td>
								<td class="tc">설명</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="tc">
				<a href="#" class="btn set25"><span>인쇄</span></a>
			</div>
		</div>
	</section>
	</div>
</article>

<script type="text/javascript" charset="UTF-8" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" charset="UTF-8" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/tree.js"></script>
<script type="text/javascript" charset="UTF-8" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>

<script type="text/javascript"> 

$(document).ready(function() {
	
	//help
	$("#helpBtn5").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help5-3");
		//e.preventDefault();
		return false;
	});
	
	// 트리메뉴
	init_group_tree("tree");
	binding_select_group_simple("tree", "tree_device_list");
	
	//노드 클릭
	 $("#tree_device_list a").live("click", function(e) {
		var client_idx = getClientIdx("tree_device_list");
		if(client_idx){
			$.getJSON("/policy/getDeviceByClientIdx.html", {client_idx:client_idx}, function(result){
				rtnResultAddTbody(result.device);
			});
		}
  	}) ; 

	$("#devicetBody a").live( "click" , function(){
		$(this).parent().parent().remove();
	});
	
	// 기간 검색 초기화
	init_gigan();
	
	checkedAllOrNothing("group_all_checkbox", "group_checkbox");
   	checkedAllCheckbox("group_all_checkbox", "group_checkbox");

});
</script>
<form id="searchForm" method="post" action=""></form>
</body>
</html>
