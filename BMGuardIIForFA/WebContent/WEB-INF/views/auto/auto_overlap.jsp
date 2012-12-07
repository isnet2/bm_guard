<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb2" value="active" />
<c:set var="gnb2_1" value="on" />
<c:set var="gnb" value="자동화기기 관리" />
<c:set var="gnb_sub" value="자동화기기 관리" />
<c:set var="tab_1d" value="IP 주소 중복조회" />
<%@ include file="../common/inc/header.jsp" %>
<nav class="tab_1depth">
	<ul>
		<li><a href="index.html">자동화기기관리</a></li>
		<li><a href="auto_del.html">자동화기기 삭제내역</a></li>
		<li class="on"><a href="auto_overlap.html">IP 주소 중복조회</a></li>
	</ul>
</nav>
</header>

<article>

<%@ include file="../common/inc/direction.jsp" %>

	<figure>IP주소 중복조회</figure>
	<section class="user_log">
	<h2><span style="letter-spacing: 0px;">IP</span>주소 중복조회</h2>
		<table class="list">
				<table>
					<colgroup>
						<col style="width:50px">
						<col style="width:160px">
						<col style="width:160px">
						<col style="width:160px">
						<col style="width:*">
						<col style="width:160px">
						<col style="width:160px">
						<col style="width:160px">
					</colgroup>
					<tbody>
						<tr>
							<th><input type="checkbox" id="listCheck" title="전체선택" /></th>
							<th>관리그룹</th>
							<th>기기명</th>
							<th>IP 주소</th>
							<th>MAC 주소</th>
							<th>OS 종류</th>
							<th>등록일시</th>
							<th>등록자</th>
						</tr>
					</tbody>
				</table>
			<div class="scroll" style="height:300px;">
				<table>
					<colgroup>
						<col style="width:50px">
						<col style="width:160px">
						<col style="width:160px">
						<col style="width:160px">
						<col style="width:*">
						<col style="width:160px">
						<col style="width:160px">
						<col style="width:160px">
					</colgroup>
					<tbody id="ipDuplTbody">
					<c:choose>
						<c:when test="${clientSize  eq 0}">
							<tr><td colspan="8">데이터가 없습니다.</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${clientList }" var="clientList" varStatus="i">
								<tr>
									<td><input name="delChk" type="checkbox" style="border:none;" value="${clientList.client_idx}"/></td>
									<td>${clientList.clientGrp.clientgrp_name}</td>
									<td>${clientList.client_name}</td>
									<td>${clientList.ip_addr}</td>
									<td>${clientList.mac_addr}</td>
									<td>${clientList.os_type}</td>
									<td>${clientList.create_date}</td>
									<td >${clientList.createUser.user_name}</td>
								</tr>
							</c:forEach>
						</c:otherwise>	
					</c:choose>
					</tbody>
				</table>
			</div>

		<p class="ac mt20">
			<a href="#" class="btn set25" ><span>기기삭제</span></a>
		</p>

	</section>

</article>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>
<script type="text/javascript">
//<![CDATA[

	$(document).ready(function() {
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
	    	
	   	$(".mt20 a").click(function(e) {  		// 선택 삭제
			e.preventDefault();
			var checkIndexs = $('input[name=delChk]:checked').map(function() {
			    return this.value;			
			}).get().join(',');
			
			if(checkIndexs.length == 0 || checkIndexs == '') {
				alert("삭제할 기기를 선택하여 주세요");
				return;
	        }
	    	$.ajax({
				type:"GET"
				,url:"deleteIpDuplClient.html"
				,data:{"checkIndexs":checkIndexs}
				,dataType:"json"
				,success:function(rtnObj){
					if(rtnObj!= null) {
						if(rtnObj.status == '1') {
							alert("중복된 기기를 삭제하였습니다.");
							location.href="/auto/auto_overlap.html";
						}
					}
				}
			});   
	   	});
	});
</script>	

<%@ include file="../common/inc/footer.jsp" %>
