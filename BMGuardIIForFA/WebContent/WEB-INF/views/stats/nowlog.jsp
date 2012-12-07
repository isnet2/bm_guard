<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb5" value="active" />
<c:set var="gnb5_4" value="on" />
<c:set var="gnb" value="통계정보" />
<c:set var="tab_1d" value="로그현황" />
<%@ include file="../common/inc/header.jsp" %>
<%--
<?php 
$body="lnb_tree";
$gnb5="active"; //GNB_1depth
$gnb5_4="on"; //GNB_2depth
$gnb="통계정보";
$tab_1d="로그 현황";
include "../common/inc/header.html";
?>
--%>
<!--
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="nowlog.html"><span></span><p>로그 현황</p></a></li>
	</ul>
</nav>
-->
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>로그현황</figure>
	<section class="user_list">
	<h2>로그현황</h2>
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
		<div class="manage">
			<h3>관리그룹</h3>
			<div id="tree" style="height: 750px;">
			</div>
		</div>
		<div  class="machine">
			<h3>자동화기기</h3>
			<div id="tree_device_list" style="height: 750px;">
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
				<div class="float_l mr20">
					<h3 class="mb10"><img src="../common/images/txt/h3_month.gif" alt="월단위" /></h3>
					<select>
						<option value="">2010-07</option>
					</select>
				</div>
				<div class="float_l">
					<h3><img src="../common/images/txt/txt_log_02.gif" alt="기간" /></h3>
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
							<input type="text" name="cal_Date" readonly />
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)" alt="" />
							~
							<input type="text" name="cal_Date2" readonly />
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)" alt="" />
						</li>
					</ul>
				</div>
			</div>
		</div>


		<p class="clearboth mt10 tc">
			<a href="srch.html" class="btn type2 setp30"><span>조회</span></a>
		</p>

		<h4 class="mt20 mb10">조회결과</h4>
		<div class="stats_result">
			<h5 class="tc">로그 현황</h5>
			<p class="tc">기준일자 : 2021년 9월 1일~2012년 9월 15일</p>
			<p class="tr">작성일자 : 2012년 10월 25일</p>
			<div>
				<p>기기별 신규 정책 리스트 (총 00건)</p>
				<table class="mt10 title_table">
					<colgroup>
							<col style="width:30%"/>
							<col style="width:70%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">관리그룹</td>
							<td class="tit">설명</td>
						</tr>
					</tbody>
				</table>
				<div class="table_body scroll mt0 mb10">
					<table>
						<colgroup>
							<col style="width:30%"/>
							<col style="width:70%"/>
						</colgroup>
						<tbody>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tl pl10">설명</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tl pl10">설명</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tl pl10">설명</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tl pl10">설명</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tl pl10">설명</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tl pl10">설명</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tl pl10">설명</td>
							</tr>
						</tbody>
					</table>
				</div>

				<p class="mt20">2BUA50[성형>MMI>2공장] 기기 로그</p>
				<table class="mt10 title_table">
					<colgroup>
						<col style="width:16%"/>
						<col style="width:11%"/>
						<col style="width:11%"/>
						<col style="width:11%"/>
						<col style="width:40%"/>
						<col style="width:11%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">관리그룹</td>
							<td class="tit">기기명</td>
							<td class="tit">IP 주소</td>
							<td class="tit">OS 종류</td>
							<td class="tit">로그내용</td>
							<td class="tit">건수</td>
						</tr>
					</tbody>
				</table>
				<div class="table_body setmaxh mt0 mb10">
					<table>
						<colgroup>
							<col style="width:16%"/>
							<col style="width:11%"/>
							<col style="width:11%"/>
							<col style="width:11%"/>
							<col style="width:40%"/>
							<col style="width:11%"/>
						</colgroup>
						<tbody>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tl pl10">USB 읽기전용</td>
								<td class="tc">11</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tl pl10">USB 읽기전용</td>
								<td class="tc">11</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tl pl10">USB 읽기전용</td>
								<td class="tc">11</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tl pl10">USB 읽기전용</td>
								<td class="tc">11</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tl pl10">USB 읽기전용</td>
								<td class="tc">11</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tl pl10">USB 읽기전용</td>
								<td class="tc">11</td>
							</tr>
							<tr>
								<td class="tc">3층기계실</td>
								<td class="tc">2BUA01</td>
								<td class="tc">123.234.0.1</td>
								<td class="tc">OS 종류</td>
								<td class="tl pl10">USB 읽기전용</td>
								<td class="tc">11</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="tc">
				<a href="#" class="btn set25"><span>인쇄</span></a>
			</div>
		</div><!--stats_result-->

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
		helpPopup(e.clientX, e.clientY, "/help.html#help5-4");
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

});
</script>

</body>
</html>
