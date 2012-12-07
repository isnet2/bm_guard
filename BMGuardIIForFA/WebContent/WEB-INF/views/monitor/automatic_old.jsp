<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="gnb6" value="active" />
<c:set var="gnb6_1" value="on" />
<c:set var="gnb" value="실시간 모니터링" />
<c:set var="gnb_sub" value="자동화기기 모니터링" />
<c:set var="tab_1d" value="자동화기기 모니터링" />
<%@ include file="../common/inc/header.jsp" %>

<script type="text/javascript" src="../jstree/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="../jstree/lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="../jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="../resource/libs/common/tree.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/common/common.util.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resource/libs/prototype/prototype.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
</script>
</header>
	<%@ include file="../common/inc/direction.jsp" %>
	<figure>자동화기기 모니터링</figure>
	<section class="process mt20">
		
		<section class="monitoring_at_box2">
			<h4>위험 자동화기기</h4>
			<div class="float_l mt10">
				<table class="mt0">
					<colgroup>
							<col width="45%" />
							<col width="55%" />
					</colgroup>
					<tbody>
						<tr>
							<th colspan="2">CPU</th>
						</tr>
						<tr>
							<th>기기명</th>
							<th>%</th>
						</tr>
					</tbody>
				</table>
					<div class="table_body mt0">
					<table>
						<colgroup>
							<col width="45%" />
							<col width="55%" />
						</colgroup>
						<tbody id="cpuTbody">
							<c:choose>
								<c:when test="${cpuListSize  eq 0}">
									<tr><td colspan="2">데이터가 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${cpuList }" var="cpuList" varStatus="i">
										<tr><td>${cpuList.client_name}</td><td>${cpuList.used_cpu}%</td></tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="float_l mt10">
				<table class="mt0">
					<colgroup>
							<col width="45%" /> <col width="55%" />
					</colgroup>
					<tbody>
						<tr>
							<th colspan="2">Memory</th>
						</tr>
						<tr>
							<th>기기명</th> 	<th>%</th>
						</tr>
					</tbody>
				</table>
				<div class="table_body mt0">
					<table>
						<colgroup>
							<col width="45%" />
							<col width="55%" />
						</colgroup>
						<tbody id="memoryTbody">
							<c:choose>
								<c:when test="${memoryListSize  eq 0}">
									<tr><td colspan="2">데이터가 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${memoryList }" var="memoryList" varStatus="i">
										<tr><td>${memoryList.client_name}</td><td>${memoryList.used_memory}%</td></tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_list">
				<a href="#" class="btn type1 set25 basic-limit"><span>임계치 설정</span></a>
				<a href="#" class="btn type1 set25 btn_limit_not_apply" ><span>미반영기기내역</span></a>
				<a href="#" class="btn type1 set25 btn_limit_detail_view"><span>상세조회</span></a>
			</div>
		</section>

		<section class="monitoring_at_box3">
			<h4>주요 자동화기기 자원사용량</h4>
			<table class="mt10">
				<colgroup>
					<col style="width:35%" /> <col style="width:30%" /> <col style="width:35%" />
				</colgroup>
				<tbody>
					<tr>
						<th>기기명</th> 	<th>CPU 사용량</th> 	<th>Memory 사용량 / 여유 Memory</th>
					</tr>
				</tbody>
			</table>
			<div class="table_body mt0">
				<table>
					<colgroup>
						<col style="width:35%" /> <col style="width:30%" /> <col style="width:35%" />
					</colgroup>
					<tbody id="mainTbody">
						<c:choose>
							<c:when test="${mainListSize  eq 0}">
								<tr><td></td><td>데이터가 없습니다.</td><td></td></tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${mainList }" var="mainList" varStatus="i">
									<tr>
										<td>${mainList.client_name}</td>
										<td>${mainList.used_cpu}% </td>
										<td>${mainList.used_memory}% / ${mainList.free_memory}GB</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
			</div>
			<div class="btn_list">
				<a href="#" class="btn type1 set25 basic-manag"><span>주요자동화기기 등록/변경</span></a>
				<a href="#" class="btn type1 set25 btn_maincom_not_apply"><span>미반영기기내역</span></a>
				<a href="#" class="btn type1 set25 btn_maincom_detail_view"><span>상세조회</span></a>
			</div>
		</section>

		<br class="clearboth" />
		<br/>

		<section class="float_l" style="width:30%;">
			<h4 class="mt20">차단된 프로세스 Top5</h4>
			<table class="mt10">
				<colgroup>
						<col width="45%" /> <col width="55%" />
				</colgroup>
				<tbody>
					<tr>
						<th>프로세스명</th> <th>금일발생건수</th>
					</tr>
				</tbody>
			</table>
			<div class="table_body mt0">
				<table>
					<colgroup>
						<col width="45%" />
						<col width="55%" />
					</colgroup>
					<tbody>
						<tr>
							<td>Toikn.exe</td>
							<td>22</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<section class="float_l monitoring_at_box4" style="margin:0 0 0 1%; width:69%">
			<h4 class="mt20">차단로그</h4>
			<a href="#" class="btn type1 set25 basic-log"><span>차단로그 조회</span></a>
			<table class="mt10">
				<colgroup>
						<col width="20%" />	<col width="25%" />	<col width="55%" />
				</colgroup>
				<tbody>
					<tr>
						<th>시간</th> <th>기기명</th> <th>차단로그</th>
					</tr>
				</tbody>
			</table>
			<div class="table_body mt0">
				<table>
					<colgroup>
						<col width="20%" />
						<col width="25%" />
						<col width="55%" />
					</colgroup>
					<tbody>
						<tr>
							<td>10:12:14</td>
							<td>2BUA01(123.234.110.111)</td>
							<td>프로세스[nsvmrpc가 c:\autoexec.bat 실행] 차단</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

	</section>

</article>

<!-- layer : 1 임계치 설정      -->

<div id="basic-modal-content-limit" class="layer setlimit" style="display:none">
<form id="criticalForm" name="criticalForm" method="post">
		<h4>임계치 설정</h4>
		<div class="mb5">
				<table>
					<colgroup>
						<col width="60px" />
						<col width="120px" />
					</colgroup>
					<tbody>
						<tr>
							<td>CPU</td>
							<td><input type="number" min='0' max='100' id="cpuNum" name="cpuNum" value="${clientLimit.cpu_limit}" /> %</td>
						</tr>
						<tr>
							<td>Memory</td>
							<td><input type="number" min='0' max='100' id="memoryNum" name="memoryNum" value="${clientLimit.memory_limit}" /> %</td>
						</tr>
					</tbody>
				</table>
			<a href="#" id="criticalBtn" class="btn type1 set25"><span>등록</span></a>
		</div>
	</form>
</div>

<!-- //layer : 1 임계치 설정 -->

<!-- layer : 2  위험자동화기기 미반영기기내역-->
<div id="basic-modal-limit_not_apply" class="layer search_log limit_not_apply" style="display:none">


	<h4 class="mb10">위험자동화기기 미반영기기내역</h4>

	<div class="search_box">
		<div class="ssbox date" style="display:inline-block">
			<ul class="date mr20 float_l">
				<li>
					<input type="text" id ="dn_sdate" name="dn_sdate" />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.dn_sdate)" alt="" />
					~
					<input type="text" id="dn_edate" name="dn_edate" />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.dn_edate)" alt="" />
				</li>
			</ul>
			<p class="float_l search_box">
				<a href="#srch.html" id="dnSearchBtn" class="btn type2 set25 setp15"><span>검색</span></a>
			</p>
		</div>
	</div>

	<table class="set_h" style="width:100%" >
		<colgroup>
				<col style="width:40%" />
				<col style="width:30%" />
				<col style="width:30%" />
		</colgroup>
		<tbody>
			<tr>
				<td>등록시간</td>
				<td>CPU 임계치</td>
				<td>Memory 임계치</td>
			</tr>
		</tbody>
	</table>
	<div class="table_body setmaxh mt5 mb15" style="width:100%; max-height:100px; overflow-y:auto; overflow-x:hidden">
		<table style="width:100%;">
			<colgroup>
				<col style="width:40%" />
				<col style="width:30%" />
				<col style="width:30%" />
			</colgroup>
			<tbody id="limitDP">
			</tbody>
		</table>
	</div>

	<div class="hey" style="display:none">
		<table class="set_h" style="width:100%" >
			<colgroup>
				<col style="width:5%" />
				<col style="width:20%" />
				<col style="width:15%" />
				<col style="width:20%" />
				<col style="width:10%" />
				<col style="width:15%" />
				<col style="width:15%" />
			</colgroup>
			<tbody>
				<tr>
					<td><input type="checkbox" title="전체선택" /></td>
					<td>관리그룹</td>
					<td>기기명</td>
					<td>IP주소</td>
					<td>구분</td>
					<td>전송주기</td>
					<td>미반영사유</td>
				</tr>
			</tbody>
		</table>
		<div class="table_body setmaxh mt0 mb10" style="width:100%; max-height:200px; overflow-y:auto; overflow-x:hidden"> 
			<table style="width:100%;">
				<colgroup>
					<col style="width:5%" />
					<col style="width:20%" />
					<col style="width:15%" />
					<col style="width:20%" />
					<col style="width:10%" />
					<col style="width:15%" />
					<col style="width:15%" />
				</colgroup>
				<tbody id="limitDPD">
					<tr>
						<td class="tc"><input type="checkbox" /></td>
						<td class="tc">3층 기계실</td>
						<td class="tc">Computer</td>
						<td class="tc">000.000.000</td>
						<td class="tc">삭제</td>
						<td class="tc">55</td>
						<td class="tc">접속불가</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- //layer : 2  위험자동화기기 미반영기기내역 -->

<!-- layer : 3 위험 자동화기기 상세조회 -->
<div id= "basic-modal-limit_detail_view" class="layer search_log limit_detail_view" style="display:none">
	<h4>위험 자동화기기 상세조회</h4>

	<div class="search_box">
		<div class="ssbox date" style="display:inline-block">
			<ul class="date mr20 float_l">
				<li>
					<!-- <input type="text" name="d_sdate" readonly id ="d_sdate" value="" />  -->
					<input type="text" name="d_sdate" id ="d_sdate" value="" />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.d_sdate)" alt="" />
					~
					<input type="text" name="d_edate" id="d_edate" value="" />
					<!-- <input type="text" name="d_edate" readonly id="d_edate" value="" /> -->
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.d_edate)" alt="" />
				</li>
			</ul>
			<p class="float_l search_box">
				<a href="#srch.html" class="btn type2 set25 setp15"><span>검색</span></a>
			</p>
		</div>
	</div>

	<h4 class="mt20 mb10 clearboth">조회결과</h4>
	<table class="set_h" style="width:100%" >
		<colgroup>
			<col style="width:20%" />
			<col style="width:20%" />
			<col style="width:10%" />
			<col style="width:20%" />
			<col style="width:15%" />
			<col style="width:15%" />
		</colgroup>
		<tbody>
			<tr>
				<td>시간</td>
				<td>관리그룹</td>
				<td>기기명</td>
				<td>IP주소</td>
				<td>CPU사용량</td>
				<td class="pr20" style="line-height:20px">Memory<br/>사용량</td>
			</tr>
		</tbody>
	</table>
	<div class="table_body setmaxh mt0 mb10" style="width:100%; max-height:200px; overflow-y:auto; overflow-x:hidden">
		<table style="width:100%;">
			<colgroup>
				<col style="width:20%" />
				<col style="width:20%" />
				<col style="width:10%" />
				<col style="width:20%" />
				<col style="width:15%" />
				<col style="width:15%" />
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${limitDListSize  eq 0}">
						<tr><td colspan="6" class="tc">데이터가 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${limitDList }" var="limitDList" varStatus="i">
							<tr>
								<td class="tc">${limitDList.create_date }</td>
								<td class="tc">3층 기계실</td>
								<td class="tc">Computer</td>
								<td class="tc">000.000.000</td>
								<td class="tc">99%</td>
								<td class="tc">89%</td>
							</tr>						
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
<!-- //layer : 3 위험 자동화기기 상세조회 -->





<!-- layer -->
<div id="basic-modal-content-manag" class="layer mainmanag" style="display:none">
	<h4>주요 자동화기기 등록/변경</h4>
	
		<div class="mb5" style="overflow:hidden">
		<div class="layer_left float_l">
			<div class="search_tree">
				 <!-- ************ tree  -->
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
				<!-- ************ tree  -->
			</div>
		</div>
		
		<!--layer_left-->

		<div class="right_table float_l">
			<table class="set_h">
				<colgroup>
					<col width="40px" />
					<col />
					<col width="50xp" />
				</colgroup>
				<tbody>
					<tr>
						<td>순서</td>
						<td>주요 자동화기기 명</td>
						<td>비고</td>
					</tr>
				</tbody>
			</table>
			<div class="scroll" style="height: 300px;">
			<table class="set_aotucom">
				<colgroup>
					<col width="40px" />
					<col />
					<col width="50xp" />
				</colgroup>
				<tbody>
					<tr>
						<td class="setb">1</td>
						<td>T-800</td>
						<td>
							<a href="#" class="btn type2 set25"><span>삭제</span></a>
						</td>
					</tr>
					<tr>
						<td class="setb">2</td>
						<td>T-1000</td>
						<td>
							<a href="#" class="btn type2 set25"><span>삭제</span></a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div><!--right_table-->
	</div>
	<div class="clearboth" style="text-align:center">
		<a href="#" class="btn type1 set25"><span>기기 추가</span></a>
		<a href="#" class="btn type1 set25"><span>시스템 반영</span></a>
	</div>
</div>

<!-- //layer -->

<!-- layer -->
<div id="basic-modal-maincom_detail_view" class="layer search_log maincom_detail_view" style="display:none">
	<h4>주요자동화기기 상세조회</h4>

	<div class="search_box">
		<div class="ssbox date" style="display:inline-block">
			<ul class="date mr20 float_l">
				<li>
					<input type="text" id ="m_sdate" name="m_sdate"  readonly />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.m_sdate)" alt="" />
					~
					<input type="text" id="m_edate" name="m_edate"  readonly />
					<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.m_edate)" alt="" />
				</li>
			</ul>
			<p class="float_l search_box">
				<a href="#srch.html" class="btn type2 set25 setp15"><span>검색</span></a>
			</p>
		</div>
	</div>

	<h4 class="mt20 mb10 clearboth">조회결과</h4>
	<table class="set_h" style="width:100%" >
		<colgroup>
			<col style="width:20%" />
			<col style="width:20%" />
			<col style="width:10%" />
			<col style="width:20%" />
			<col style="width:15%" />
			<col style="width:15%" />
		</colgroup>
		<tbody>
			<tr>
				<td>시간</td>
				<td>관리그룹</td>
				<td>기기명</td>
				<td>IP주소</td>
				<td>CPU사용량</td>
				<td class="pr20" style="line-height:20px">Memory<br/>사용량</td>
			</tr>
		</tbody>
	</table>
	<div class="table_body setmaxh mt0 mb10" style="width:100%; max-height:200px; overflow-y:auto; overflow-x:hidden">
		<table style="width:100%;">
			<colgroup>
				<col style="width:20%" />
				<col style="width:20%" />
				<col style="width:10%" />
				<col style="width:20%" />
				<col style="width:15%" />
				<col style="width:15%" />
			</colgroup>
			<tbody>
				<tr>
					<td class="tc">2012.10.31 10:20:30</td>
					<td class="tc">3층 기계실</td>
					<td class="tc">Computer</td>
					<td class="tc">000.000.000</td>
					<td class="tc">99%</td>
					<td class="tc">89%</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- //layer -->


<!-- layer -->
<div id ="basic-modal-maincom_not_apply" class="layer search_log maincom_not_apply" style="display:none">
	<h4 class="mb10">주요자동화기기 미반영기기내역</h4>
	<table class="set_h" style="width:100%" >
		<colgroup>
			<col style="width:5%" />
			<col style="width:20%" />
			<col style="width:15%" />
			<col style="width:20%" />
			<col style="width:10%" />
			<col style="width:15%" />
			<col style="width:15%" />
		</colgroup>
		<tbody>
			<tr>
				<td><input type="checkbox" title="전체선택" /></td>
				<td>관리그룹</td>
				<td>기기명</td>
				<td>IP주소</td>
				<td>구분</td>
				<td>전송주기</td>
				<td>미반영사유</td>
			</tr>
		</tbody>
	</table>
	<div class="table_body setmaxh mt0 mb10" style="width:100%; max-height:200px; overflow-y:auto; overflow-x:hidden">
		<table style="width:100%;">
			<colgroup>
				<col style="width:5%" />
				<col style="width:20%" />
				<col style="width:15%" />
				<col style="width:20%" />
				<col style="width:10%" />
				<col style="width:15%" />
				<col style="width:15%" />
			</colgroup>
			<tbody>
				<tr>
					<td class="tc"><input type="checkbox" /></td>
					<td class="tc">3층 기계실</td>
					<td class="tc">Computer</td>
					<td class="tc">000.000.000</td>
					<td class="tc">삭제</td>
					<td class="tc">55</td>
					<td class="tc">접속불가</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- //layer -->

<!-- layer -->
<div id="basic-modal-content-log" class="layer search_log" style="display:none">
	<h4>차단로그 조회</h4>
	<div class="layer_left float_l">
		<div class="search_tree">
			<select id="">
				<option>기기명</option>
				<option>IP주소</option>
			</select>
			<input type="text" /><a href="#"><img src="../common/images/btn/btn_check_03.gif" alt="조회" /></a>
		</div>
		<div class="treelist">
			<div class="treemap float_l">
				<img src="../common/images/img/@tree_01.gif" alt="" />
			</div>
			<div class="comlist float_l">
				<img src="../common/images/img/@tree_02.gif" alt="" />
			</div>
		</div>
	</div><!--layer_left-->

	<div class="float_l search_box ml20" style="width:50%">
		<div class="ssbox float_l date" style="width:100%">
			<h3 class="mb10"><img src="../common/images/txt/h3_month.gif" alt="월단위" /></h3>
			<select>
				<option value="">2010-07</option>
			</select>
			<div class="mt10">
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
						<input type="text" id ="log_sdate" name="log_sdate" readonly />
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.log_sdate)" alt="" />
						~
						<input type="text" id ="log_edate" name="log_edate" readonly />
						<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.log_edate)" alt="" />
					</li>
				</ul>
			</div>
		</div>
	</div>

	<p class="clearboth search_box mt10 tc">
		<a href="#srch.html" class="btn type2 setp30"><span>검색</span></a>
	</p>

	<h4 class="mt20 mb10">조회결과</h4>
	<table class="set_h" style="width:100%" >
		<colgroup>
				<col style="width:30%" />
				<col style="width:70%" />
		</colgroup>
		<tbody>
			<tr>
				<td>관리그룹</td>
				<td>설명</td>
			</tr>
		</tbody>
	</table>
	<div class="table_body setmaxh mt0 mb10" style="width:100%">
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
</div>
<!-- //layer -->
<script>
	jQuery(document).ready(function(){
		
		//help
		jQuery("#helpBtn6").click(function(e){
			helpPopup(e.clientX, e.clientY, "/help.html#help6-1");
			//e.preventDefault();
			return false;
		});

		//callCpuList();
		//callMemoryList();
		//callMainList();
		
		/*삭제*/
		jQuery("#criticalForm").ajaxForm(criticalFormCallBack);
	    jQuery("#criticalForm").submit(function(){return;});
		

		//위험자동화기기 상세조회
		jQuery("#d_sdate").val(getNowFormat());
		jQuery("#d_edate").val(getNowFormat());
		//위험 _미반영기기
		jQuery("#dn_sdate").val(getNowFormat());
		jQuery("#dn_edate").val(getNowFormat());		
		
		//주요자동화기기 상세조회
		jQuery("#m_sdate").val(getNowFormat());
		jQuery("#m_edate").val(getNowFormat());
		
		
		//차단로그 조회
		jQuery("#log_sdate").val(getNowFormat());
		jQuery("#log_edate").val(getNowFormat());
		
		
		//callCpuList();
		
		jQuery("#criticalBtn").click(function() {
			jQuery("#criticalForm").attr("action","/InsertCritical.html");
			jQuery("#criticalForm").submit();
		});
		
		
		
		// 미자동화기기 버튼 클릭
		jQuery(".btn_limit_not_apply").click(function(){
			//alert("미반영기기내역");
			var startDate =getNowFormat();
			var endDate = getNowFormat();
			jQuery.ajax({
				type:"GET"
				,url:"/LimitDatePList.html"
				,data:{"dn_sdate":startDate, "dn_edate":endDate}
				,dataType:"json"
				,success:function(rtnObj){
					callBackLimitNotApply(rtnObj);
				}
			});
		});
		
		// 미자동화기기 버튼 클릭
		jQuery("#dnSearchBtn").click(function(){
			
			var dn_sdate = jQuery("#dn_sdate").val();
			var dn_edate = jQuery("#dn_edate").val();
			
			jQuery.ajax({
				type:"GET"
				,url:"/LimitDatePList.html"
				,data:{"dn_sdate":dn_sdate, "dn_edate":dn_edate}
				,dataType:"json"
				,success:function(rtnObj){
					callBackLimitNotApply(rtnObj);
				}
			});
		});
		
	});
	
	//임계 미반영 callback 
	function callBackLimitNotApply(data) {
		
		var limitDList = data.limitDList;
		var limitDListSize = data.limitDListSize;
		var htmls ="";
		if (limitDListSize > 0 ) {
			for(var i = 0; i < limitDList.length; i++) {
				htmls += "<tr>";
				htmls += "<td class=\"tc\"><a href=\"#\" onclick=\"fnLimitNotApplyDetail('" + limitDList[i].create_date + "','"+limitDList[i].acquist_term+"')\">" + limitDList[i].create_date + "</a></td>";
				htmls += "<td class=\"tc\"><a href=\"#\" onclick=\"fnLimitNotApplyDetail('" + limitDList[i].create_date + "','"+limitDList[i].acquist_term+"')\">" + limitDList[i].cpu_limit + "%</a></td>";
				htmls += "<td class=\"tc\"><a href=\"#\" onclick=\"fnLimitNotApplyDetail('" + limitDList[i].create_date + "','"+limitDList[i].acquist_term+"')\">" + limitDList[i].memory_limit +"%</a></td>";
				htmls += "</tr>";
			}
		}else {
			htmls += "<tr><td class=\"tc\" colspan='3'> 데이터가 없습니다.</td></tr>";
		}
		//alert(htmls);
		jQuery("#limitDP").html(htmls);
	}
	
	
	function criticalFormCallBack(data,state){
		data = data.removePre();
		var jsonStr = eval("("+data+")");
		if(jsonStr != null) {
			if(jsonStr.result == 1){
				alert(jsonStr.msg);
				location.href="/monitor/automatic.html";				
			}else{
				alert(jsonStr.msg);
			}
		} else {
			alert('에러가 발생하였습니다.결과값이 올바르지 않습니다.');
		}
		
		return;
	}

	
	/*위험자동화 기기 - CPU*/
	function callCpuList() {
		//alert("call getCpuList()" );
		var url ="";
		var param ="";
		var pUpdater =  new Ajax.PeriodicalUpdater(
							'cpuList', 
							'/CpuList.html', 
							{
						  		//method: 'post', -- POST 방식이 기본 
						  		parameters : param,
						  		frequency: 10, 
						  		//decay: 2,
						  		onSuccess : displayCpu,
						  		onFailure : function(request) {
						  			alert("cpu_실패!");
						  		},
						  		onException : function(request) {
						  			alert("cpu_에러발생");
								}
							}
						);
	}
	function displayCpu(responseHttpObj) {
		
		var returnData = responseHttpObj.responseText;
		//alert("returnData : " + returnData);
		var data = eval("("+returnData+")");

		var cpuList = data.cpuList;
		var cpuListSize =  data.cpuListSize;
		//alert(cpuListSize);
		var htmls ="";
		if(cpuListSize > 0) {
			
			for(var i = 0; i<cpuList.length; i++) {
				htmls +="<tr><td>" + cpuList[i].client_name+ "</td><td>" +cpuList[i].used_cpu + "%</td></tr>";
			}
			//alert(htmls);
			jQuery("#cpuTbody").append(htmls);
		}
		
	}
	
	/*위험자동화 기기 - Memory */
	function callMemoryList() {
		//alert("call getCpuList()" );
		var url ="";
		var param ="";
		var pUpdater =  new Ajax.PeriodicalUpdater(
							'memoryList', 
							'/MemoryList.html', 
							{
						  		//method: 'post', -- POST 방식이 기본 
						  		parameters : param,
						  		frequency: 10, 
						  		//decay: 2,
						  		onSuccess : displayMemory,
						  		onFailure : function(request) {
						  			alert("memory_실패!");
						  		},
						  		onException : function(request) {
						  			alert("memory_에러발생");
								}
							}
						);
	}
	function displayMemory(responseHttpObj) {
		
		var returnData = responseHttpObj.responseText;
		//alert("returnData : " + returnData);
		var data = eval("("+returnData+")");

		var list = data.memoryList;
		var listSize =  data.memoryListSize;
		//alert(cpuListSize);
		var htmls ="";
		if(listSize > 0) {
			
			for(var i = 0; i<list.length; i++) {
				htmls +="<tr><td>" + list[i].client_name+ "</td><td>" +list[i].used_memory+ "%</td></tr>";
			}
			//alert(htmls);
			jQuery("#memoryTbody").append(htmls);
		}
		
	}
	
	/* 주요 자동화 기기 */
	function callMainList() {
		//alert("call Main()" );
		var url ="";
		var param ="";
		var pUpdater =  new Ajax.PeriodicalUpdater(
							'mainList', 
							'/MainClientList.html', 
							{
						  		//method: 'post', -- POST 방식이 기본 
						  		parameters : param,
						  		frequency: 10, 
						  		//decay: 2,
						  		onSuccess : displayMain,
						  		onFailure : function(request) {
						  			alert("memory_실패!");
						  		},
						  		onException : function(request) {
						  			alert("memory_에러발생");
								}
							}
						);
	}
	function displayMain(responseHttpObj) {
		
		var returnData = responseHttpObj.responseText;
		//alert("returnData : " + returnData);
		var data = eval("("+returnData+")");

		var list = data.mainList;
		var listSize =  data.mainListSize;
		//alert(listSize);
		var htmls ="";
		if(listSize > 0) {
			
			for(var i = 0; i<list.length; i++) {
				htmls +="<tr>";
				htmls +="<td>" + list[i].client_name +"</td>";
				htmls +="<td>" + list[i].used_cpu +"% </td>";
				htmls +="<td>" + list[i].used_memory +"% / "+ list[i].free_memory + "GB</td>";
				htmls +="</tr>";
			}
			//alert(htmls);
			jQuery("#mainTbody").append(htmls);
		}
		
	}
	
	
	function fnLimitNotApplyDetail(value, term) {
		value = value.substring(0,10);
		
		jQuery.ajax({
			type:"GET"
			,url:"/LimitDatePDetail.html"
			,data:{"value":value}
			,dataType:"json"
			,success:function(rtnObj){
				//alert(rtnObj);
				callBackLimitNotApplyDetail(rtnObj, term);
			}
		});
	}
	function callBackLimitNotApplyDetail(data, term) {
		var limitDHList = data.limitDHList;
		var limitDHListSize = data.limitDHListSize;
		var htmls ="";
		var apply_limit = 0;
		jQuery('.hey').css('display','block');
		if (limitDHListSize > 0) {
			for(var i=0;i<limitDHList.length;i++) {
				htmls += "<tr>";
				htmls += "<td class=\"tc\"><input type=\"checkbox\" id=\"" +limitDHList[i].client_idx +"\" name=\"dnChk\" /></td>";
				htmls += "<td class=\"tc\">"+limitDHList[i].clientGrp.clientgrp_name+"</td>";
				htmls += "<td class=\"tc\">"+limitDHList[i].client_name+"</td>";
				htmls += "<td class=\"tc\">"+limitDHList[i].ip_addr+"</td>";
				htmls += "<td class=\"tc\">변경</td>";
				htmls += "<td class=\"tc\">"+term+"</td>";
				apply_limit = limitDHList[i].apply_limit;
				if (apply_limit == 0)
					htmls += "<td class=\"tc\">접속불가</td>";
				else 
					htmls += "<td class=\"tc\"></td>";
				htmls += "</tr>";
			}
		}else {
			htmls +="tr><td class=\"tc\" colspan=\"7\">데이타가 없습니다.</td></tr>";
		}
		jQuery("#limitDPD").html(htmls);
	}
	
</script>
<%@ include file="../common/inc/footer.jsp" %>