<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="gnb4" value="active" />
<c:set var="gnb4_12" value="on" />
<c:set var="gnb" value="원격관리" />
<c:set var="tab_1d" value="원격제어" />
<%@ include file="../common/inc/header.jsp" %>
<!--  
<?php 
$body="lnb_tree";
$gnb4="active"; //GNB_1depth
$gnb4_12="on"; //GNB_2depth
$gnb="원격관리";
$gnb_sub="원격제어";
$tab_1d="원격제어";
include "../common/inc/header.html";
?>
-->
<!-- <nav class="tab_1depth">
	<ul>
		<li class="on"><a href="./remote.html">원격제어</a></li>
	</ul>
</nav> -->
</header>

<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>원격제어</figure>
	<section class="user_list">
	<h2>원격제어</h2>
	<div class="auto_wrap">
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
					<th><label for="sau">원격제어 사유</label></th>
					<td>
						<input type="text" style="width:350px" id="sau" name="" /> <a href="#" class="btn type2 set25 btn_action"><span>실 행</span></a>
					</td>
				</tr>
			</table>
		<div style="padding: 10px 0px;">
			<strong>2BUA03 화면</strong>
			<img src="../common/images/@바탕화면.jpg" style="width:100%; margin-top: 10px" alt="" />
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
		helpPopup(e.clientX, e.clientY, "/help.html#help4-9");
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