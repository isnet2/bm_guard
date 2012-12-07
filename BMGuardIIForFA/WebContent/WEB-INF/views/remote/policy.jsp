<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="gnb4" value="active" />
<c:set var="gnb4_11" value="on" />
<c:set var="gnb" value="원격관리" />
<c:set var="tab_1d" value="정책관리" />
<%@ include file="../common/inc/header.jsp" %>
<!--  
<?php 
$body="lnb_tree";
$gnb4="active"; //GNB_1depth
$gnb4_11="on"; //GNB_2depth
$gnb="원격관리";
$gnb_sub="정책관리";
$tab_1d="정책관리";
include "../common/inc/header.html";
?>
-->
<!-- <nav class="tab_1depth">
	<ul>
		<li class="on"><a href="/remote/policy.html">정책관리</a></li>
	</ul>
</nav> -->
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>정책관리</figure>
	<section class="user_list">
	<h2>정책관리</h2>
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
		<div class="table_body mt0">
			<table class="mt20 sub_table">
				<colgroup>
					<col style="width:200px;"/>
					<col style="width:*;"/>
				</colgroup>
		<tbody>
			<tr>
				<th>정책유형</th>
				<td class="rela">
					<select name="" id="">
						<option value="보안정책 ON">보안정책 ON</option>
						<option value="보안정책 OFF">보안정책 OFF</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><label for="sau">종료 사유</label></th>
				<td>
					<input type="text" style="width:664px" id="sau" name="" /> <a href="#" class="btn type2 set25 btn_action"><span>실 행</span></a>
				</td>
			</tr>
		</tbody>
	</table>

		<h4 class="mt20">처리결과</h4>
		<div class="tit" style="padding-right: 0px;">
			<table class="mt10" style="border-top: 2px solid #ED1C24;">
			<colgroup>
					<col style="width:100px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>구분</th>
					<th>관리그룹</th>
					<th>자동화<br/>기기명</th>
					<th>IP주소</th>
					<th>처리일시</th>
					<th>처리결과</th>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="table_body mt0 scroll" style="height: 220px;">
			<table style="text-align: center;">
				<colgroup>
					<col style="width:100px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:150px"/>
					<col style="width:*"/>
				</colgroup>
				<tbody>
	<!--
					<tr>
						<td style="text-align:center" colspan="6">결과가 없습니다.</td>
					</tr>
	-->
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
					<tr>
						<td><a href="#" class="btn type2 set25"><span>삭제</span></a></td>
						<td>3층기계실</td>
						<td>2BUA01</td>
						<td>123.234.0.1</td>
						<td>2012-10-16 10:12:12</td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>

	</section>

</article>


<script type="text/javascript" charset="UTF-8" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" charset="UTF-8" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/tree.js"></script>
<script type="text/javascript" charset="UTF-8" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>
<script type="text/javascript"> 

$(document).ready(function() {
	
	//help
	$("#helpBtn4").click(function(e){
		helpPopup(e.clientX, e.clientY, "/help.html#help4-8");
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
<%@ include file="../common/inc/footer.jsp" %>