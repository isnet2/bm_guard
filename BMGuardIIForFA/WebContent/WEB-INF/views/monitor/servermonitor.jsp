<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb6" value="active" />
<c:set var="gnb6_2" value="on" />
<c:set var="gnb" value="실시간 모니터링" />
<c:set var="tab_1d" value="서버 모니터링" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$gnb6="active"; //GNB_1depth
$gnb6_2="on"; //GNB_2depth
$gnb="실시간 모니터링";
$gnb_sub="서버 모니터링";
$tab_1d="트랜잭션 정보";
include "../common/inc/header.html";
?>
--%>
<!--
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="servermonitor.html"><span></span><p>트랜잭션 정보</p></a></li>
		<li><a href="servermonitor2.html"><span></span><p>서버 가용정보</p></a></li>
	</ul>
</nav>
-->
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

<div class="float_l" style="width: 100%">
	<figure>서버 모니터링</figure>
	<section class="process monitor mt20">
		<h2><img src="../common/images/txt/h2_servert.gif" alt="트랜잭션 정보"></h2>
		<a href="#" class="btn type1 set25 btn_basic-server1"><span>트랜잭션 정보 상세조회</span></a>
		<section class="server_t_box1 float_l">
			<div class="sec_t mt10">
				&nbsp;
			</div>
		</section>

		<section class="server_t_box2 float_l">
			<div>
				<table class="mt10">
					<colgroup>
							<col width="65%" />
							<col width="35%" />
					</colgroup>
					<tbody>
						<tr>
							<td><strong>시각</strong></td>
							<td style="padding:0 8% 0 0"><strong>동시접속수</strong></td>
						</tr>
					</tbody>
				</table>
				<div class="table_body mt0">
					<table>
						<colgroup>
							<col width="65%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<td>01:01:01</td>
								<td>22</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>33</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>11</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>232</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>22</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>2</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>11</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>33</td>
							</tr>
							<tr>
								<td>02:02:02</td>
								<td>24</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="server_t_box3">
			<div>
				<p>현재 로그처리 방법 : <strong>데이터베이스</strong></p>
				<input type="radio" name="radi1" id="radi1-1" checked />
				<label for="radi1-1">데이터베이스</label>
				<input type="radio" name="radi1" id="radi1-2" />
				<label for="radi1-2">파일</label>
				<a href="#" class="btn set25"><span>수정</span></a>
			</div>

		</section>
	</section>
</div>

<div class="clearboth float_l" style="width: 100%">
<figure>서버 모니터링</figure>
	<section class="process monitor mt20">
		<h2><img src="../common/images/txt/h2_serveruse.gif" alt="서버 가용정보"></h2>
		<a href="#" class="btn type1 set25 btn_basic-server2"><span>서버 가용정보 상세조회</span></a>
		<section class="server_use box1 float_l  mt10">
			<div class="sec_t">
				&nbsp;CPU 그래프
			</div>
		</section>
		<section class="server_use box1 float_l  mt10">
			<div class="sec_t mt10">
				&nbsp;Memory 그래프
			</div>
		</section>
		<section class="server_use box1 float_l  mt10">
			<div class="sec_t mt10">
				&nbsp;Disk 그래프
			</div>
		</section>
		<br style="clear:both;" />
		<section class="server_use box2 float_l">
			<div class="sec_t mt10">
				&nbsp;CPU
			</div>
		</section>
		<section class="server_use box2 float_l">
			<div class="sec_t mt10">
				&nbsp;Memory
			</div>
		</section>
		<section class="server_use box2 float_l">
			<div class="sec_t mt10">
				&nbsp;Disk
			</div>
		</section>

	</section>
</div>

<!-- layer -->
<div class="layer search_log basic-server1" style="display:none">
	<h4>트랜잭션 상세조회</h4>

	<div class="search_box">
		<div class="ssbox date" style="display:inline-block">
			<ul class="date mr20 float_l">
				<li class="float_l">
					<input type="text" name="cal_Date" readonly />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" alt="" />
				</li>
				<li class="float_l ml10" style="line-height: 23px;">
					<select id="#" name="#">
						<option value="">5</option>
					</select>
					시 
					<select id="#" name="#">
						<option value="">00</option>
					</select>
					분 ~ 
					<select id="#" name="#">
						<option value="">5</option>
					</select>
					시 
					<select id="#" name="#">
						<option value="">00</option>
					</select>
					분
				</li>
			</ul>
			<p class="float_l search_box">
				<a href="#srch.html" class="btn type2 set25 setp15"><span>검색</span></a>
			</p>
		</div>
	</div>

	<table class="set_h" style="width:100%" >
		<colgroup>
			<col style="width:60%" />
			<col style="width:40%" />
		</colgroup>
		<tbody>
			<tr>
				<td>시간</td>
				<td>동시 접속자 수</td>
			</tr>
		</tbody>
	</table>
	<div class="table_body scroll mt0 mb10" style="height:150px">
		<table style="width:100%;">
			<colgroup>
				<col style="width:60%" />
				<col style="width:40%" />
			</colgroup>
			<tbody>
				<tr>
					<td class="tc">11시 12분 30초 :10 </td>
					<td class="tc">10</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초 :11 </td>
					<td class="tc">10</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초 :12 </td>
					<td class="tc">10</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초 :13 </td>
					<td class="tc">10</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초 :14 </td>
					<td class="tc">10</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초 :15 </td>
					<td class="tc">0</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초 :16 </td>
					<td class="tc">1</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- //layer -->

<!-- layer -->
<div class="layer search_log basic-server2" style="display:none">
	<h4>서버 가용정보 상세조회</h4>

	<div class="search_box">
		<div class="ssbox date" style="display:inline-block">
			<ul class="date mr20 float_l">
				<li class="float_l">
					<input type="text" name="cal_Dat" readonly />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" alt="" />
				</li>
				<li class="float_l ml10" style="line-height: 23px;">
					<select id="#" name="#">
						<option value="">5</option>
					</select>
					시 
					<select id="#" name="#">
						<option value="">00</option>
					</select>
					분 ~ 
					<select id="#" name="#">
						<option value="">5</option>
					</select>
					시 
					<select id="#" name="#">
						<option value="">00</option>
					</select>
					분
				</li>
			</ul>
			<p class="float_l search_box">
				<a href="#srch.html" class="btn type2 set25 setp15"><span>조회</span></a>
			</p>
		</div>
	</div>

	<table class="set_h" style="width:100%" >
		<colgroup>
			<col style="width:20%" />
			<col style="width:15%" />
			<col style="width:15%" />
			<col style="width:15%" />
			<col style="width:15%" />
			<col style="width:20%" />
		</colgroup>
		<tbody>
			<tr>
				<td>시간</td>
				<td style="line-height:20px;">CPU<br/>사용량(%)</td>
				<td style="line-height:20px;">메모리<br/>사용량(%)</td>
				<td style="line-height:20px;">여유<br/>메모리(MB)</td>
				<td style="line-height:20px;">디스크<br/>사용량(%)</td>
				<td class="pr20" style="line-height:20px">여유<br/>디스크(GB)</td>
			</tr>
		</tbody>
	</table>
	<div class="table_body scroll mt0 mb10" style="height: 150px;">
		<table style="width:100%;">
			<colgroup>
				<col style="width:20%" />
				<col style="width:15%" />
				<col style="width:15%" />
				<col style="width:15%" />
				<col style="width:15%" />
				<col style="width:20%" />
			</colgroup>
			<tbody>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
				<tr>
					<td class="tc">11시 12분 30초</td>
					<td class="tc">50</td>
					<td class="tc">50</td>
					<td class="tc">512</td>
					<td class="tc">50</td>
					<td class="tc">30</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- //layer -->

</article>

<%@ include file="../common/inc/footer.jsp" %>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/jquery.periodicalupdater.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/chart/jquery.flot.js"></script>
<!--[if IE]><script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/chart/excanvas.min.js"></script><![endif]-->
<script type="text/javascript">

$(function () {
	//help
	$("#helpBtn6").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help6-2");
		//e.preventDefault();
		return false;
	});
	

});

//]]>
</script>
<%@ include file="../common/inc/footer.jsp" %>