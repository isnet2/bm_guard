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
			<div>
				<div class="float_l mr20" style="width: 250px">
					<h3 class="mb10"><img src="../common/images/txt/h3_month.gif" alt="월단위"></h3>
					<select name="#" id="#">
						<option value="">2010-07</option>
					</select>
				</div>
				<div class="ssbox float_l group" style="width: 70%">
					<h3><img src="../common/images/txt/txt_log_02.gif" alt="기간"></h3>
					<ul class="due">
						<li><a href="#" class="btn set25"><span>당일</span></a></li>
						<li><a href="#" class="btn set25"><span>3일</span></a></li>
						<li><a href="#" class="btn set25"><span>1주</span></a></li>
						<li><a href="#" class="btn set25"><span>1개월</span></a></li>
						<li><a href="#" class="btn set25"><span>3개월</span></a></li>
						<li><a href="#" class="btn set25"><span>6개월</span></a></li>
					</ul>
					<ul class="date clearboth">
						<li>
							<input type="text" name="cal_Date" readonly/>
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" />
							~
							<input type="text" name="cal_Date2" readonly/>
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)" />
						</li>
						<li class="nth3">
							<select name="#" id="#">
								<option value="">3</option>
							</select>시
							~
							<select name="#" id="#">
								<option value="">20</option>
							</select>시
						</li>
					</ul>
				</div>
			</div>
		</div>


		<p class="clearboth mt10 tc">
			<a href="srch.html" class="btn type2 setp30"><span>검색</span></a>
		</p>

		<h4 class="mt20 mb10">조회결과</h4>
		<div class="stats_result">
			<h5 class="tc">기기별 신규정책 운영현황</h5>
			<p class="tc">기준일자 : 2021년 9월 1일~2012년 9월 15일</p>
			<p class="tr">작성일자 : 2012년 10월 25일</p>
			<div>
				<p>기기별 신규 정책 리스트 (총 00건)</p>
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
					<table>
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
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tc">2012-10-16 10:12:12</td>
								<td class="tc">시뮬이션 정책</td>
								<td class="tc">정책명</td>
								<td class="tc">설명</td>
							</tr>
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
</article>


<script type="text/javascript"> 

$(document).ready(function() {
	
	//help
	$("#helpBtn5").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help5-2-2");
		//e.preventDefault();
		return false;
	});
});
</script>
</body>
</html>
