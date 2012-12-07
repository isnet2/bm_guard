<%@ page pageEncoding="utf-8" %>
<figure>lnb_tree</figure>
	<section class="lnb_tree" >
		<div class="check">
			<select name="tree_search_option" id="tree_search_option">
				<option value="client_name" selected="selected">기기명</option>
				<option value="ip_addr">IP주소</option>
			</select>
			<input type="text" id="tree_search_str" name="tree_search_str">
			<input type="image" src="../common/images/btn/btn_check_03.gif" id="tree_search_bt" name="tree_search_bt">
		</div>

		<div class="manage" >
			<h3>관리그룹</h3>
			<div id="tree">
				<%-- 
				<img src="../common/images/img/@tree_01.gif" alt="">
				--%>
			</div>
		</div>
		<div  class="machine">
			<h3>자동화기기</h3>
			<div id="tree_device_list">
				<!-- <img src="../common/images/img/@tree_02.gif" alt=""> -->
			</div>
		</div>
	</section>
<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="../resource/libs/common/tree.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		init_group_tree("tree");
	});
</script>