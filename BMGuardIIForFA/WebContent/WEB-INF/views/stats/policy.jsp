<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb5" value="active" />
<c:set var="gnb5_2" value="on" />
<c:set var="gnb" value="통계정보" />
<c:set var="gnb_sub" value="정책관리현황" />
<c:set var="tab_1d" value="정책별 통계" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$gnb5="active"; //GNB_1depth
$gnb5_2="on"; //GNB_2depth
$gnb="통계정보";
$gnb_sub="정책관리현황";
$tab_1d="정책별 통계";
include "../common/inc/header.html";
?>
--%>
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="policy.html"><span></span><p>정책별 통계</p></a></li>
		<li><a href="policy_dvc.html"><span></span><p>기기별 통계</p></a></li>
	</ul>
</nav>
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>
	
	<figure>정책조회</figure>
	<section class="stats mt20">
		<h2>정책별 통계</h2>
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
			<a href="#" class="btn type2 setp30" id="search_bt"><span>조회</span></a>
		</p>

		<h4 class="mt20 mb10">조회결과</h4>
		<div class="stats_result float_l" style="width: 100%; padding: 0px;">
		<div style="padding: 15px 20px;">
		<h5 class="tc">신규정책 운영현황</h5>
			<p class="tc">기준일자 : <span id="search_date"></span></p>
			<p class="tr">작성일자 : <span id="write_date"></span></p>
		<p class="mb10">신규정책 리스트 (총 <span id="policy_total"></span>건)<!-- <span><a href="#"><img src="../common/images/btn/btn_excel.gif" alt="엑셀저장"></a></span> --></p>

	<table class="list title_table" style="border-bottom: 1px solid #ddd;">
		<colgroup>
			<col style="width:150px">
			<col style="width:300px">
			<col style="width:*">
			<col style="width:100px">
			<col style="width:200px">
		</colgroup>
		<thead>
			<tr>
				<th class="tit" style="padding: 10px 0px;">적용일시</th>
				<th class="tit" style="padding: 10px 0px;">정책명</th>
				<th class="tit" style="padding: 10px 0px;">설명</th>
				<th class="tit" style="padding: 10px 0px;">적용기기수</th>
				<th class="tit" style="padding: 10px 0px;">비고</th>
			</tr>
		</thead>
	</table>
	<div class="scroll" style="height: 329px;">
	<table style="text-align: center; " id="policy_list_table">
		<colgroup>
			<col style="width:150px">
			<col style="width:300px">
			<col style="width:*">
			<col style="width:100px">
			<col style="width:200px">
		</colgroup>
		<tbody>
			<!-- <tr>
				<td>2012-09-14 10:14:20</td>
				<td>강제베이스 정책_2012-09-14</td>
				<td>OS 패치 관련</td>
				<td>12</td>
				<td><a class="btn type2 set20" href="#"><span>세부내역조회</span></a></td>
			</tr> -->
		</tbody>
	</table>
	</div>
	</div>
	<div class="tc">
		<a href="#" class="btn set25 mb20" href="#"><span>인쇄</span></a>
	</div>
</div>
			

			<div id="stats_detail_view">
				<table class="mb20" style="border:1px solid #eee">
					<tbody>
						<tr>
							<td class="tl pl10"><strong>정책명</strong></td>
							<td class="tl pl10">정책_2012-10-25</td>
							<td class="tl pl10"><strong>생성자</strong></td>
							<td class="tl pl10">김길동</td>
						</tr>
						<tr>
							<td class="tl pl10"><strong>설명</strong></td>
							<td class="tl pl10">Kim Gil DDONG!!!!!!!</td>
							<td class="tl pl10"><strong>생성일시</strong></td>
							<td class="tl pl10">2012-10-25 11:22:33</td>
						</tr>
					</tbody>
				</table>
				<div class="st_dt box1">
					<table>
						<tbody>
							<tr>
								<td class="tit">프로세스</td>
								<td class="tit">회사명</td>
								<td class="tit">설명</td>
							</tr>
						</tbody>
					</table>
					<div class="table_body">
						<table>
							<tbody>
								<tr>
									<td>AAA.exe</td>
									<td>UnKnow</td>
									<td>설명</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="st_dt box2">
					<table>
						<tbody>
							<tr>
								<td class="tit">프로세스</td>
							</tr>
						</tbody>
					</table>
					<div class="table_body">
						<table>
							<tbody>
								<tr>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="st_dt box3">
					<table>
						<tbody>
							<tr>
								<td class="tit">폴더목록</td>
								<td class="tit">회사명</td>
								<td class="tit">설명</td>
							</tr>
						</tbody>
					</table>
					<div class="table_body">
						<table>
							<tbody>
								<tr>
									<td>C:\download</td>
									<td>unKnow</td>
									<td>설명</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="st_dt box4">

					<table>
						<tbody>
							<tr>
								<td class="tit">Device 명</td>
								<td class="tit">적용정책</td>
							</tr>
						</tbody>
					</table>
					<div class="table_body">
						<table>
							<colgroup>
								<col style="width:40%" />
								<col style="width:60%" />
							</colgroup>
							<tbody>
								<tr>
									<td>플로피디스크</td>
									<td>
										<input type="radio" id="radio1-1" name="radio1"/><label for="radio1-1">허용</label> 
										<input type="radio" id="radio1-2" name="radio1"/><label for="radio1-2">읽기전용</label> 
										<input type="radio" id="radio1-3" name="radio1"/><label for="radio1-3">차단</label>
									</td>
								</tr>
								<tr>
									<td>CD-R/W</td>
									<td>
										<input type="radio" id="radio2-1" name="radio2"/><label for="radio2-1">허용</label> 
										<input type="radio" id="radio2-2" name="radio2"/><label for="radio2-2">읽기전용</label> 
										<input type="radio" id="radio2-3" name="radio2"/><label for="radio2-3">차단</label>
									</td>
								</tr>
								<tr>
									<td>이동형디스크</td>
									<td>
										<input type="radio" id="radio3-1" name="radio3"/><label for="radio3-1">허용</label> 
										<input type="radio" id="radio3-2" name="radio3"/><label for="radio3-2">읽기전용</label> 
										<input type="radio" id="radio3-3" name="radio3"/><label for="radio3-3">차단</label>
									</td>
								</tr>
								<tr>
									<td>공유폴더</td>
									<td>
										<input type="radio" id="radio4-1" name="radio4"/><label for="radio4-1">허용</label>
										<input type="radio" id="radio4-2" name="radio4"/><label for="radio4-2">차단</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="st_dt box5 mb10">
					<table>
						<tbody>
							<tr>
								<td class="tit">관리그룹</td>
								<td class="tit">기기명</td>
								<td class="tit">IP 주소</td>
								<td class="tit">OS 종류</td>
								<td class="tit">시뮬레이션 정책</td>
								<td class="tit">적용일시</td>
							</tr>
						</tbody>
					</table>
					<div class="table_body">
						<table>
							<tbody>
								<tr>
									<td>성형>MMI>2공장</td>
									<td>2BUAOS</td>
									<td>192.168.0.1</td>
									<td>OS</td>
									<td></td>
									<td>2012-10-25 11:22:33</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tc">
					<a href="#" class="btn set25"><span>인쇄</span></a>
				</div>
			</div><!--stats_detail_view-->
		</div>
	</section>
</article>

<script type="text/javascript" src="../resource/libs/common/common.util.js"></script>
<script type="text/javascript"> 

$(document).ready(function() {
	
	//help
	$("#helpBtn5").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help5-2");
		//e.preventDefault();
		return false;
	});
	
	// 기간 검색 초기화
	init_gigan();
	
	$("#search_bt").click(function(event){
		event.preventDefault();
		$("#searchForm").html("");
		$("#policy_list_table tbody").html("");
		
		var write_date = getLocalDateFormat(new Date());
	   	$("#write_date").html(write_date);
   		var search_date = getDateStringToLocalDateFormat($("#start_date").val()) + " ~ " + getDateStringToLocalDateFormat($("#end_date").val());
   		$("#search_date").html(search_date);
		
		$("#searchForm").append("<input type='hidden' name='start_date' value='"+$("#start_date").val()+"'/>");
   		$("#searchForm").append("<input type='hidden' name='end_date' value='"+$("#end_date").val()+"'/>");
		
		$.post("policy.html", $("#searchForm").serialize(), function(result){
			if(result && result.status == 1){
				
				var html = "";
				$.each(result.policy_list, function(index, policy){
					html += '<tr>';
					html += '<td>'+policy.policy_nowdate+'</td>';
					html += '<td>'+policy.policy_name+'</td>';
					html += '<td>'+policy.policy_desc+'</td>';
					html += '<td>'+policy.apply_device_count+'</td>';
					html += '<td><a class="btn type2 set20" href="#" id="detail_bt_'+policy.policy_idx+'"><span>세부내역조회</span></a></td>';
					html += '</tr>';
				});
				
				$("#policy_list_table tbody").html(html);
				$("#policy_total").text(result.policy_list.length);
			}
		}, "json");
			
	});
	
	$("#policy_list_table tbody a").live("click",function(event){
		event.preventDefault();
		
		var policy_idx = $(this).attr("id").replace("detail_bt_", "");
		
		$.getJSON("../policy/policyInfo.html", {policy_idx:policy_idx}, function(result){
			console.log(result);
		});
	});
	
});
</script>

<!-- Load jQuery, SimpleModal and Basic JS files -->
<!-- <script type="text/javascript" src="../common/js/jquery.js"></script> -->
<script type="text/javascript" src="../common/js/jquery.simplemodal.js"></script>
<script type="text/javascript" src="../common/js/basic.js"></script>
<form id="searchForm" method="post" action=""></form>
</body>
</html>
