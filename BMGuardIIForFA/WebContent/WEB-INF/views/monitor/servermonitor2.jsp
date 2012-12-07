<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb6" value="active" />
<c:set var="gnb6_2" value="on" />
<c:set var="gnb" value="실시간 모니터링" />
<c:set var="gnb_sub" value="서버 모니터링" />
<c:set var="tab_1d" value="서버 가용정보" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$gnb6="active"; //GNB_1depth
$gnb6_2="on"; //GNB_2depth
$gnb="실시간 모니터링";
$gnb_sub="서버 모니터링";
$tab_1d="서버 가용정보";
include "../common/inc/header.html";
?>
--%>
<nav class="tab_1depth">
	<ul>
		<li><a href="servermonitor.html"><span></span><p>트랜잭션 정보</p></a></li>
		<li class="on"><a href="servermonitor2.html"><span></span><p>서버 가용정보</p></a></li>
	</ul>
</nav>
</header>

<article>

	<%-- 
	<%@ include file="../common/inc/direction.jsp" %>
	--%>
	<%@ include file="../common/inc/direction.jsp" %>

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

<!-- layer -->
<div class="layer search_log basic-server2" style="display:none">
	<h4>트랜잭션 상세조회</h4>

	<div class="search_box">
		<div class="ssbox date" style="display:inline-block">
			<ul class="date mr20 float_l">
				<li>
					<input type="text" name="cal_Date" readonly />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" alt="" />
					~
					<input type="text" name="cal_Date2" readonly />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)" alt="" />
				</li>
			</ul>
			<p class="float_l search_box">
				<a href="#srch.html" class="btn type2 set25 setp15"><span>검색</span></a>
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
	<div class="table_body setmaxh mt0 mb10" style="width:100%">
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

<!-- Load jQuery, SimpleModal and Basic JS files -->
<script type="text/javascript" src="../common/js/jquery.simplemodal.js"></script>
<script type="text/javascript" src="../common/js/basic.js"></script>
<script>
	//help
	$("#helpBtn6").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help6-2");
		//e.preventDefault();
		return false;
	});
</script>
</body>
</html>