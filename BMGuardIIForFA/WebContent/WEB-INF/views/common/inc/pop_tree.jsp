<%@ page pageEncoding="utf-8" %>
<div class="tree auto_on float_l">
	<div class="search_tree">
		<span style="display:block">
			<select id="">
				<option>기기명</option>
				<option>IP주소</option>
			</select>
		</span>
		<input type="text" id="pop_tree_search_str"/><a href="#">
		<img src="../common/images/btn/btn_check_03.gif" alt="조회" /></a>
	</div>
	<div class="treelist">
		<div class="treemap float_l" id="pop_tree">
			<!-- <img src="../common/images/img/@tree_01.gif" alt="" /> -->
		</div>
		<div class="comlist float_l" id="pop_tree_device_list">
			<!-- <img src="../common/images/img/@tree_02.gif" alt="" /> -->
		</div>
	</div>
</div>
<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" class="source below">
$(document).ready(function(){
	
	$("#tree")
	.jstree({ 
		"plugins" : [ 
			"themes","json_data","ui","crrm","cookies","search","types","hotkeys", "contextmenu"
		],
		"json_data" : { 
			"data" : [
			          	{"data" : "Root", "state" : "closed", "attr" : {"id":"node_1" , "rel":"drive"}}
			          ],
			"ajax" : {
				"url" : "../getChildren.html",
				"data" : function (n) { 
					return { 
						"clientgrp_pidx" : n.attr ? n.attr("id").replace("node_","") : 1
					}; 
				}
			}
		},
		"types" : {
			"max_depth" : -1,
			"max_children" : -1,
			"valid_children" : [ "drive" ],
			"types" : {
				"default" : {
					"valid_children" : "none",
					"icon" : {
						"image" : "../jstree/icon/file.png"
					}
				},
				"folder" : {
					"valid_children" : [ "default", "folder" ],
					"icon" : {
						"image" : "../jstree/icon/folder.png"
					}
				},
				"drive" : {
					"valid_children" : [ "default", "folder" ],
					"icon" : {
						"image" : "../jstree/icon/root.png"
					},
					"start_drag" : false,
					"move_node" : false,
					"delete_node" : false,
					"remove" : false
				}
			}
		}
	})
	.bind("select_node.jstree", function(e, data){
		var clientGrpIdx = data.rslt.obj.attr("id").replace("node_", "");
		$.getJSON("../getDeviceList.html", {clientgrp_idx:clientGrpIdx}, function(result){
			
			$("#tree_device_list").html("");
			var listHtml = "";		
			
			var dataArray = new Array();
			$.each(result, function(index, obj){
				
				var data = {};
				var attr = {};
				data["data"] = obj.client_name;
				attr["id"] = "node_" + index;
				attr["rel"] = "file";
				attr["client_idx"] = obj.client_idx;
				attr["clientgrp_idx"] = obj.clientgrp_idx;
				data["attr"] = attr;
				dataArray[index] = data;
				
				listHtml += "<tr>";
				listHtml += "	<td>"+ obj.client_name +"</td>";
				listHtml += "	<td>"+ (obj.ip_addr || "-") +"</td>";
				listHtml += "	<td>"+ (obj.mac_addr || "-") +"</td>";
				listHtml += "	<td>"+ (obj.os_type || "-") + "</td>";
				listHtml += "	<td>"+ (obj.create_date || "-") +"</td>";
				listHtml += "</tr>";
			});
			
			$("#device_list tbody").html(listHtml);
			createDeviceTree(dataArray);
		});
	});
	
	$("#tree_search_bt").click(function(event){
		event.preventDefault();
		$("#tree_device_list").jstree("search", $("#tree_search_str").val());
	});
});

function createDeviceTree(dataArray){
	$("#tree_device_list")
	.jstree({ 
		"plugins" : [ 
			"themes","json_data","ui","crrm","cookies","search","types","hotkeys"
		],
		"json_data" : { 
			"data" : dataArray
		},
		"search" : {
			"ajax" : {
				"url" : "../searchDevice.html",
				"data" : function (str) {
					return { 
						"search_str" : str 
					}; 
				}
			}
		},
		"types" : {
			"max_depth" : -1,
			"max_children" : -1,
			"valid_children" : [ "drive" ],
			"types" : {
				"default" : {
					"valid_children" : "none",
					"icon" : {
						"image" : "../jstree/icon/file.png"
					}
				}
			}
		}
	});
	
	$("#tree_device_list")
	.bind("select_node.jstree", function(e, data){

	})
	
}
</script>