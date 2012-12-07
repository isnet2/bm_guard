// init tree
function init_group_tree(groupTreeId){
	
	var search_result = null;
	
	$("#"+groupTreeId)
	.jstree({ 
		"core" : { initially_open : [ "node_1" ] },
		"plugins" : [ 
			"themes","json_data","ui","crrm","cookies","search","types","hotkeys"
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
		"search": {
			"ajax" : {
				"type" : "POST",
				"url" : "../searchDeviceList.html",
				"data" : function(search_condition){
					console.log(search_condition);
					return {
						"option": search_condition.split(":")[0],
						"search_str" : search_condition.split(":")[1]
					};
				},
				"success" : function(result){
					/*
					 결과값 예시 : ["#node_1", "#node_76", "#node_78","#node_1", "#node_76", "#node_79"]
					 검색결과에 해당하는 자동화기기가 존재하는 관리그룹를 표시하기 위한 처리
					 ROO_NODE_VALUE를 기준으로 잘라서 처리.
					 */
					if(result.length == 0){
						alert("검색결과가 존재하지 않습니다.");
					}else{
						var ROOT_NODE_VALUE = "#node_1";					
						var is_first_group = true;
						
						$.each(result, function(index, node_value){
							
							if(node_value == ROOT_NODE_VALUE){
								var open_group_idx = index -1;
								if(open_group_idx > 0){
									if(is_first_group){
										// 맨 처음으로 검색된 관리그룹은 클릭이벤트를 발생시켜서 자동화기기 목록이 표시되도록 한다.
										$(result[open_group_idx] + " > a").click().focus();
										is_first_group = false;
									}else{
										// 두번째 이후부터는 표시를 위한 css만 적용시킨다.
										$(result[open_group_idx] + " > a").addClass("jstree-clicked");
									}								
								}
							}
							
						});					
						// 마지막으로 검색된 관리그룹을 표시하기 위한 처리 추가
						if(is_first_group){
							$(result[result.length -1] + " > a").click().focus();
						}else{
							$(result[result.length -1] + " > a").addClass("jstree-clicked");
						}
						
						search_result = result;
						
					}
					
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
	}).bind("load_node.jstree", function(e,data){
		if(search_result){
			var ROOT_NODE_VALUE = "#node_1";					
			var is_first_group = true;
			
			$.each(search_result, function(index, node_value){
	
				if(node_value == ROOT_NODE_VALUE){
					var open_group_idx = index -1;
					if(open_group_idx > 0){
						if(is_first_group){
							// 맨 처음으로 검색된 관리그룹은 클릭이벤트를 발생시켜서 자동화기기 목록이 표시되도록 한다.
							$(search_result[open_group_idx] + " > a").click().focus();
							is_first_group = false;
						}else{
							// 두번째 이후부터는 표시를 위한 css만 적용시킨다.
							$(search_result[open_group_idx] + " > a").addClass("jstree-clicked");
						}								
					}
				}
			
			});					
			// 마지막으로 검색된 관리그룹을 표시하기 위한 처리 추가
			if(is_first_group){
				$(search_result[search_result.length -1] + " > a").click();
			}else{
				$(search_result[search_result.length -1] + " > a").addClass("jstree-clicked");
			}
		}
		
	});
}


// init tree
function binding_select_group_auto(groupTreeId, deviceTreeId){
	$("#"+groupTreeId)
	.bind("select_node.jstree", function(e, data){
		var clientGrpIdx = data.rslt.obj.attr("id").replace("node_", "");
		$.getJSON("../getDeviceList.html", {clientgrp_idx:clientGrpIdx}, function(result){
			
			$("#"+deviceTreeId).html("");
			
			var dataArray = new Array();
			$.each(result, function(index, obj){
				
				var data = {};
				var attr = {};
				data["data"] = obj.client_name;
				attr["id"] = "node_" + obj.client_idx;
				attr["rel"] = "file";
				attr["client_idx"] = obj.client_idx;
				attr["clientgrp_idx"] = obj.clientgrp_idx;
				data["attr"] = attr;
				dataArray[index] = data;
				
			});
			create_device_tree_auto(deviceTreeId, dataArray);
		});
	});
}

//init tree
function binding_select_group_simple(groupTreeId, deviceTreeId){
	$("#"+groupTreeId)
	.bind("select_node.jstree", function(e, data){
		var clientGrpIdx = data.rslt.obj.attr("id").replace("node_", "");
		$.getJSON("../getDeviceList.html", {clientgrp_idx:clientGrpIdx}, function(result){
			
			$("#"+deviceTreeId).html("");
			
			var dataArray = new Array();
			$.each(result, function(index, obj){
				
				var data = {};
				var attr = {};
				data["data"] = obj.client_name;
				attr["id"] = "node_" + obj.client_idx;
				attr["rel"] = "file";
				attr["client_idx"] = obj.client_idx;
				attr["clientgrp_idx"] = obj.clientgrp_idx;
				data["attr"] = attr;
				dataArray[index] = data;
				
			});
			create_device_tree_simple(deviceTreeId, dataArray);
		});
	});
}


// 선택된 클라이언트 그룹번호 조회
function getGroupIdx(groupTreeId){
	var value1 = $("#" +groupTreeId+" a[class^='jstree-clicked']").parent().attr("id").replace("node_", "");
	var value2 = $("#" +groupTreeId+" a[class$='jstree-clicked']").parent().attr("id").replace("node_", ""); 
	if(value1){
		return value1;
	}
	if(value2){
		return value2;
	}
}

// 선택된 클라이언트 번호 조회
function getClientIdx(deviceTreeId){
	var value1 =  $("#"+deviceTreeId+" a[class^='jstree-clicked']").parent().attr("client_idx");
	var value2 =  $("#"+deviceTreeId+" a[class$='jstree-clicked']").parent().attr("client_idx");
	if(value1){
		return value1;
	}
	if(value2){
		return value2;
	}	
}

// 관리그룹 등록
function binding_create_group(groupTreeId){
	$("#"+ groupTreeId)
	.bind("create.jstree", function (e, data) {
		$.post(
			"../createGroup.html", 
			{ 
				"clientgrp_pidx" : data.rslt.parent.attr("id").replace("node_",""), 
				"position" : data.rslt.position,
				"clientgrp_name" : data.rslt.name,
				"type" : data.rslt.obj.attr("rel")
			}, 
			function (r) {
				if(r.status) {
					$(data.rslt.obj).attr("id", "node_" + r.id);
				}
				else {
					$.jstree.rollback(data.rlbk);
				}
			},
			"json"
		);
	});
}

// 관리그룹 삭제
function binding_remove_group(groupTreeId){
	$("#"+groupTreeId)
	.bind("remove.jstree", function (e, data) {
		data.rslt.obj.each(function () {
			$.ajax({
				async : false,
				type: 'POST',
				url: "../removeGroup.html",
				data : { 
					"clientgrp_idx" : this.id.replace("node_", "")
				}, 
				dataType:"json",
				success : function (r) {
					if(!r.status) {
						data.inst.refresh();
					}
				}
			});
		});
	});
}

// 관리그룹 이름 변경
function binding_rename_group(groupTreeId){
	$("#"+groupTreeId)
	.bind("rename.jstree", function (e, data) {
		$.post(
			"../renameGroup.html", 
			{ 
				"clientgrp_idx" : data.rslt.obj.attr("id").replace("node_",""),
				"clientgrp_name" : data.rslt.new_name
			}, 
			function (r) {
				if(!r.status) {
					$.jstree.rollback(data.rlbk);
				}
			},
			"json"
		);
	});
}

// 관리그룹 선택시 클라이언트 리스트 조회 - 자동화기기 목록조회 화면에서만 사용
function binding_select_group(groupTreeId, deviceTreeId, tableId){
	$("#"+groupTreeId)
	.bind("select_node.jstree", function(e, data){
		var clientGrpIdx = data.rslt.obj.attr("id").replace("node_", "");
		$.getJSON("../getDeviceList.html", {clientgrp_idx:clientGrpIdx}, function(result){
			
			$("#"+deviceTreeId).html("");
			var listHtml = "";		
			
			var dataArray = new Array();
			$.each(result, function(index, obj){
				
				var data = {};
				var attr = {};
				data["data"] = obj.client_name;
				attr["id"] = "node_" + obj.client_idx;
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
				listHtml += "	<td>"+ (obj.delete_key || "-") +"</td>";
				listHtml += "</tr>";
			});
			
			$("#"+tableId + " tbody").html(listHtml);
			create_device_tree(groupTreeId, deviceTreeId, dataArray);
		});
	});
}

//자동화기기 트리 생성 - binding_select_group_simple()에서 사용
function create_device_tree_simple(deviceTreeId, dataArray){
	$("#"+deviceTreeId)
	.jstree({ 
		"plugins" : [ 
			"themes","json_data","ui","crrm","cookies","search","types","hotkeys"
		],
		"json_data" : { 
			"data" : dataArray
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
	}).bind("load_node.jstree", function(){
		var search_str = $("#tree_search_str").val() || ""; 
		if(search_str != ""){
			$("#"+deviceTreeId + " li a:contains('"+search_str+"')").focus().addClass("jstree-clicked");
			$("#tree_search_str").val("");
		}
	});
}


// 자동화기기 트리 생성 - binding_select_group()에서 사용
function create_device_tree(groupTreeId, deviceTreeId, dataArray){
	$("#"+deviceTreeId)
	.jstree({ 
		"plugins" : [ 
			"themes","json_data","ui","crrm","cookies","search","types","hotkeys"
		],
		"json_data" : { 
			"data" : dataArray
			
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
	}).bind("load_node.jstree", function(){
		var search_str = $("#tree_search_str").val() || ""; 
		if(search_str != ""){
			$("#"+deviceTreeId + " li a:contains('"+search_str+"')").focus().addClass("jstree-clicked");
			$("#tree_search_str").val("");
		}
	});
	
	binding_remove_device(groupTreeId, deviceTreeId);
	binding_rename_device(groupTreeId, deviceTreeId);
	binding_create_device(groupTreeId, deviceTreeId);
}

// 자동화기기 삭제
function binding_remove_device(groupTreeId, deviceTreeId){
	$("#"+deviceTreeId)
	.bind("remove.jstree", function (e, data) {
		data.rslt.obj.each(function () {
			$.ajax({
				async : false,
				type: 'POST',
				url: "./removeDevice.html",
				data : { 
					"clientgrp_idx" : getGroupIdx(groupTreeId),
					"client_idx" : this.id.replace("node_", "")
				}, 
				dataType:"json",
				success : function (r) {
					if(r.status) {
						reflashTable(r);
					}else {
						data.inst.refresh();
					}
				}
			});
		}); 
	});
}

// 자동화기기 이름 변경
function binding_rename_device(groupTreeId,  deviceTreeId){
	$("#"+deviceTreeId)
	.bind("rename.jstree", function (e, data) {
		$.post(
			"./renameDevice.html", 
			{ 	"clientgrp_idx" : getGroupIdx(groupTreeId),
				"client_idx" : data.rslt.obj.attr("id").replace("node_",""),
				"client_name" : data.rslt.new_name
			}, 
			function (r) {
				if(r.status) {
					reflashTable(r);
				}else {
					$.jstree.rollback(data.rlbk);
				}
			},
			"json"
		); 
	});
}

//자동화기기 입력
function binding_create_device(groupTreeId, deviceTreeId){
	
	$("#"+deviceTreeId)
	.bind("create.jstree", function (e, data) {
		$.post(
			"./addDevice.html", 
			{ 
				"clientgrp_idx" : getGroupIdx(groupTreeId),
				"client_name" : data.rslt.name
			}, 
			function (r) {
				if(r.status) {  
					data.rslt.obj.attr("id", "node_" + r.idx);  
					reflashTable(r);
				}  
				else {  
					$.jstree.rollback(data.rlbk);  
				}  
			},
			"json"
		); 
	});
}

//테이블 재작성
function reflashTable(result) {
	
	var listHtml ="";
	var data = result.clientList;
	$.each(data, function(index, obj){	
		listHtml += "<tr>";
		listHtml += "	<td>"+ obj.client_name +"</td>";
		listHtml += "	<td>"+ (obj.ip_addr || "-") +"</td>";
		listHtml += "	<td>"+ (obj.mac_addr || "-") +"</td>";
		listHtml += "	<td>"+ (obj.os_type || "-") + "</td>";
		listHtml += "	<td>"+ (obj.create_date || "-") +"</td>";
		listHtml += "	<td>"+ (obj.delete_key || "-") +"</td>";
		listHtml += "</tr>";
	});
	$("#device_list tbody").html(listHtml);
}

