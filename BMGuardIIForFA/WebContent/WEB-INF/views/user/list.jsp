<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="gnb1" value="active" />
<c:set var="gnb1_2" value="on" />
<c:set var="gnb" value="사용자관리" />
<c:set var="tab_1d" value="사용자관리" />
<%@ include file="../common/inc/header.jsp" %>

<!--
<nav class="tab_1depth">
	<ul>
		<li class="on"><a href="list.html">사용자관리</a></li>
	</ul>
</nav>
-->

<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery.form.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/jquery/jquery.validate.js"></script>
<script type="text/javascript">
//<![CDATA[

 // jquery-validation setting
	$.validator.setDefaults({
		onkeyup:false,
	    onclick:false,
	    onfocusout:false,
		showErrors:function(errorMap, errorList){
			//alertd으로 error 메세지 표시
			if(!$.isEmptyObject(errorList)){
		       	alert(errorList[0].message);
			}
		}
	});
 
	$(document).ready(function() {
		//help 버튼
		$("#helpBtn1").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help1-2");
			//e.preventDefault();
			return false;
		});
		
		
		//삭제사용자의 경우선택버튼 체크 불가
		var search_kind = "${search_kind}";
		if (search_kind == 1) {
			$("#listCheck").attr("disabled",true);
			$("#delBtn").css("visibility","hidden");
			$("#userUpdateBtn").css("visibility","hidden");
			
		}
		$("#user_kind option[value=${search_kind}]").attr("selected","true");
		
		/*삭제*/
		$("#delForm").ajaxForm(delFormCallBack);
	    $("#delForm").submit(function(){return;});
	    
		
		$("#delBtn").click(function(e) {  		// 선택 삭제
			e.preventDefault();
			var checkIndexs = $('input[name=delChk]:checked').map(function() {
			    return this.value;			
			}).get().join(',');
			
		
			if(checkIndexs.length == 0) {
				alert("사용자를  선택하여 주세요");
				return;
	        }
	    
	        if(checkIndexs == '') {
	        	alert("사용자를  선택하여 주세요");
	        	return;
	        }
	       // alert(checkIndexs);
	        var data = checkIndexs.split(",");
	        //var splitData = null;
	        var chkVal = "";
	        var chkName ="";
	        for(var i = 0; i < data.length;i++) {
	        	var splitData = data[i].split('^');
	        	
	        	if (i == data.length - 1 ) {
	        		chkVal += splitData[0];
	        		chkName += splitData[1];
	        	}else {
	        		chkVal += splitData[0]+",";
	        		chkName += splitData[1]+", ";
	        	}
	        }
	       // alert(chkVal);

	        $("#strMsg").html(
	        	chkName + "사용자를 삭제 하시겠습니까?"
	        );
    		$('#basic-modal-content3').modal();
	        
	        $("#checkIndexs").val(chkVal);
	        
		});	

	       $("#userDelBtn").click(function() { 
	    	   $("#delForm").submit();
	       });

	       $("th").click(function(e) {
	    		var title = $(this).text();
	    	
		    	/* $.post("/SortingData.html", $("#sortForm").serialize(), function(data, status) {
		    		alert(data);
	
		       }); */
	       });
	       
	    	//체크박스 전체체크 / 해제
	   	$("#listCheck").click( function() { 

	    		var result = $("#listCheck").attr("checked");
	    		if(result == "checked") {
	    			$("input[name=delChk]:checkbox").each(function() {
	   				$(this).attr("checked", true);
	   			});
	    		}else {
	    			$("input[name=delChk]:checkbox").each(function() {
	   				$(this).attr("checked", false);
	   			});
	    		}
	   	});
	   	
	    	//체크박스 합산 - 체크박스가 전부 체크(일부해제) 되어 있으면 '전체' 체크 체크/해제
	   	$("input[name=delChk]:checkbox").click(function() {
	   		var result = $(this).attr("checked");
	   		//alert(result);
	   		var cnt = 0;
	   		if (result != "checked") {
	   			$("#listCheck").attr("checked", false);
	   		}else {
	   			$("input[name=delChk]:checkbox").each(function() {
	   				var result2 = $(this).attr("checked");
	   				if (result2 == "checked") {
	   					cnt++;
	   				}
	   			});
	   			if (cnt == $("input[name=delChk]").length) {
	   				$("#listCheck").attr("checked", "checked");
	   			}
	   		}
	   		
	   	});
		
			// 조회버튼 클릭시
			$("#selectBtn").click(function(event){
				
				$("#search_kind").val($("#user_kind option:selected").val());
				$("#searchForm").attr("method","post");
				$("#searchForm").submit();
				
			});
	});
	
	//로그인 결과값 
	function delFormCallBack(data,state){

		data = data.removePre();
		var jsonStr = eval("("+data+")");
		if(jsonStr != null) {
			if(jsonStr.result == 1){
				alert(jsonStr.msg);
				location.href="/user/list.html";				
			}else{
				alert(jsonStr.msg);
			}
		} else {
			alert('에러가 발생하였습니다.결과값이 올바르지 않습니다.');
		}
		
		return;
	}

	function updateUserIdx(user_idx) {
		console.log("user_idx = " + user_idx);
		
    	$("#checkIndex1").val(user_idx);
    	
    	$.ajax({
			type:"GET"
			,url:"/UpdateUserList.html"
			,data:{"checkIndex1":user_idx}
			,dataType:"json"
			,success:function(rtnObj){
				//console.log("rtnObj : " + rtnObj);
				updateForm1CallBack(rtnObj);
			}
		});
    	
    	
	}
	
	function updateForm1CallBack(data) {
		
		var history = data.historyList;
		var user = data.updateUser;
		
		var htmls = "";
		// 객체의 리스트 만큼 탐색 
		for(var i=0; i<history.length; i++){
			htmls += "<tr> ";
			htmls += "<td>" +history[i].update_gubun + "</td>";
			
			var uDate =history[i].update_date;
			if(uDate!= "null" || uDate!= null || uDate !="") {
				
				htmls += "<td>" +uDate.substring(0,10);
				htmls += "<p>"  +uDate.substring(11,19) + "</p></td>";
			}else {
				htmls += "<td></td>";
			}
		
//			htmls += "<td>" + history[i].update_date + "</td>";
			htmls += "<td>" +history[i].usergrp_name + "</td>";
			htmls += "<td>" +history[i].user_name + "</td>";
			htmls += "<td>" +history[i].user_no + "</td>";
			htmls += "<td>" +history[i].userattr_title + "</td>";
			htmls += "<td>";
			
			var clientGrp = history[i].managementGroupList;
				for(var j=0; j<clientGrp.length;j++) {
					if (j == clientGrp.length -1) 
						htmls += clientGrp[j].clientgrp_name;
					else 
						htmls += clientGrp[j].clientgrp_name + ",";	
				}
			htmls +="</td>";
			htmls += "</tr> ";
		}
		//alert(htmls);
		$("#u_user_idx").val(user.user_idx);
		$("#u_user_name").val(user.user_name);
		$("#u_login_id").val(user.login_id);
		$("#u_login_id_old").val(user.login_id);
		$("#u_user_no").val(user.user_no);
		$("#u_user_no_old").val(user.user_no);
		$("#u_userattr option[value="+ user.userattr_idx+"]").attr("selected","true");
		$("#u_usergrp option[value="+ user.usergrp_idx+"]").attr("selected","true");
		
		var subGrp = user.managementGroupList;
		for(var k=0; k<subGrp.length;k++) {
			
			$("#u_management_grp_"+subGrp[k].clientgrp_idx).attr("checked","checked"); 
		}

		if (user.invalid_flag == 1) {
			$("#userUpdateBtn").css("visibility","hidden");
			$("#u_user_name").attr("readOnly","readOnly");
			$("#u_user_no").attr("readOnly","readOnly");
			$("#u_userattr").attr("disabled","disabled");
			$("#u_usergrp").attr("disabled","disabled");
			$("#u_login_pwd").attr("readOnly","readOnly");
			$("#u_login_pwd_re").attr("readOnly","readOnly");
			$("#u_management_grp_0").attr("disabled","disabled");
			$("input[name=u_management_grp]:checkbox").each(function() {
				$(this).attr("disabled","disabled");
   			});
			
		}else {
			$("#userUpdateBtn").css("visibility","visible");
		}
		
		$("#userHistoryTbody").html(htmls);			
	}
</script>

</header>
<form id ="searchForm" name="searchForm" action="/user/list.html">
	<input type="hidden" id="search_kind" name="search_kind" />
</form>
<article>
	<%@ include file="../common/inc/direction.jsp" %>

	<figure>사용자관리</figure>
	<section class="user_list">
	<h2>사용자관리</h2>
	<div class="mt20 ml10 mb20">
		<ul>
			<li class="auto">
				<span class="auto_kind"><img src="../common/images/txt/txt_state.gif" alt="상태"></span>
				<select id="user_kind" class="ml10">
					<option value="-1" selected="selected">전체사용자</option>
					<option value="0">정상사용자</option>
					<option value="1">삭제사용자</option>
				</select>
				<a href="#" class="btn set20" id="selectBtn"><span>조회</span></a>	
			</li>
		</ul>
	</div>
	
	<div class="tit">
		<table id="userTable">
			<colgroup>
<%-- 				<col style="width:5%">
				<col style="width:5%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				
 --%>		
 				<col style="width:50px">
				<col style="width:150px">
				<col style="width:130px">
				<col style="width:130px">
				<col style="width:130px">
				<col style="width:150px">
				<col style="width:150px">
				<col style="width:210px">
				<col style="width:150px">
				<col style="width:150px">
				<col style="width:150px">	
 			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="listCheck" name="listCheck"> </th>
					<th>부서명</th>
					<th>사용자성명</th>
					<th>로그인 ID</th>
					<th>사원번호</th>
					<th>권한</th>
					<th>상태</th>
					<th>관리그룹</th>
					<th>변경일자</th>
					<th>최근접속일자</th>
					<th>관리</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="list">
		<table>
			<colgroup>
				<col style="width:50px">
				<col style="width:150px">
				<col style="width:130px">
				<col style="width:130px">
				<col style="width:130px">
				<col style="width:150px">
				<col style="width:150px">
				<col style="width:210px">
				<col style="width:150px">
				<col style="width:150px">
				<col style="width:150px">
			</colgroup>
			<tbody id="userTbody">
				<c:choose>
				<c:when test="${userSize  eq 0}">
					<tr><td colspan="11">데이터가 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
				<c:forEach items="${userList }" var="userList" varStatus="i">
				<tr>
					<td>
						<c:choose>
							<c:when test="${userList.invalid_flag eq 0 }">
							<input type="checkbox" id="delChk_${userList.user_idx }" name="delChk" style="border:none;" value="${userList.user_idx }^${userList.user_name }">
							</c:when>
							<c:otherwise>
								<input type="checkbox" style="border:none;" disabled="disabled">													
							</c:otherwise>
						</c:choose>
					</td>
					<td>${userList.usergrp_name }</td>
					<td>${userList.user_name }</td>
					<td>${userList.login_id }</td>
					<td>${userList.user_no }</td>
					<td>${userList.userattr_title }</td>
					<td><c:choose>
							<c:when test="${userList.invalid_flag eq 0 }">
								정상
							</c:when>
							<c:otherwise>
								삭제
							</c:otherwise>
						</c:choose>
					</td>
					<td>
					
						<c:forEach var="managementGroup" items="${userList.managementGroupList }" varStatus="status">
							<c:if test="${not status.last }">${managementGroup.clientgrp_name },</c:if>
							<c:if test="${status.last }">${managementGroup.clientgrp_name }</c:if>
							
						</c:forEach>
					</td>
					<td>${fn:substring(userList.update_date,0,10)} <p>${fn:substring(userList.update_date,11,19)}</p></td>
					<td>${fn:substring(userList.login_ldate,0,10)} <p>${fn:substring(userList.login_ldate,11,19)}</p></td>
					<td>
						<div id="basic-modal2">
						<p><a href="#" onclick="updateUserIdx('${userList.user_idx }')" class="basic2 btn type2 set20">
						<c:choose>
							<c:when test="${userList.invalid_flag eq 0 }">
								<span>조회/수정</span>
							</c:when>
							<c:otherwise>
								<span>조회</span>												
							</c:otherwise>
						</c:choose>
						</a></p></div>
					</td>
				</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</tbody>
		</table>

	</div>
	<div class="btn_wrap">
		<!-- 신규등록팝업 -->
		<div id="basic-modal" class="btn_style_01">
			<p><a href="#" class="basic btn setp15"><span>신규등록</span></a></p>
		</div>
		
		<!-- 삭제팝업 -->
		<div id="basic-modal3" class="btn_style_01">
			<p><a href="#" class="basic3 btn setp15" id="delBtn"><span>삭제</span></a></p>
		</div>
	</div>
   	<%@ include file="../common/inc/new_pop.jsp" %>
   	<%@ include file="../common/inc/check_pop.jsp" %>
   	<%@ include file="../common/inc/del_pop.jsp" %>
   	
	</section>

</article>
	<form id="delForm" name="delForm" action="/DeleteUser.html" method="POST">
		<input type="hidden" id="checkIndexs" name="checkIndexs"/>
	</form>
	
	<form id="updateForm1" name="updateForm1" action="" method="POST">
		<input type="hidden" id="checkIndex1" name="checkIndex1" value="" />
	</form>
	<form id="sortForm" name="sortForm" action="" method="POST">
		<input type="hidden" id="userSize" name="userSize" value="${userSize }">
		<input type="hidden" id="userList" name="userList" value="${userList }">
		<input type="hidden" id="sortTitle" name="sortTitle">
	</form>

<%@ include file="../common/inc/footer.jsp" %>
