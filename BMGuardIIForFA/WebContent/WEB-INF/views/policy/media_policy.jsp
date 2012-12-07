<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="gnb3" value="active" />
<c:set var="gnb3_2" value="on" />
<c:set var="gnb" value="정책관리" />
<c:set var="gnb_sub" value="기기별 정책관리" />
<c:set var="tab_1d" value="정책적용 결과" />
<%@ include file="../common/inc/header.jsp" %>
<nav class="tab_1depth">
	<ul>
		<li><a href="dvice.html"><span></span><p>정책수립 및 적용</p></a></li>
		<li class="on"><a href="media_policy.html"><span></span><p>정책적용 결과</p></a></li>
	</ul>
</nav>
</header>

<article class="auto_wrap" >
	<figure>lnb_tree</figure>
	<section class="lnb_tree" >
		<div class="check">
			<select name="" id="">
				<option value="기기명">기기명</option>
				<option value="IP주소">IP주소</option>
			</select>
			<input type="text" id="" name="">
			<input type="image" src="../common/images/btn/btn_check_03.gif" id="" name="">
		</div>

		<div class="manage">
			<h3>관리그룹</h3>
			<div>
				<img src="../common/images/img/@tree_01.gif" alt="">
			</div>
		</div>

		<div  class="machine">
			<h3>자동화기기</h3>
			<div>
				<img src="../common/images/img/@tree_02.gif" alt="">
			</div>
		</div>
	</section>

	<%@ include file="../common/inc/direction.jsp" %>


	<section class="admit">

		<table class="mt20">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:20%"/>
			</colgroup>
			<thead>
				<tr>
					<th>구분</th>
					<th class="setleftborder">내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>IP 주소</td>
					<td class="setleftborder">127.0.0.1</td>
				</tr>
				<tr>
					<td>OS 종류</td>
					<td class="setleftborder">WinXP</td>
				</tr>
				<tr>
					<td>적용 정책</td>
					<td class="setleftborder">정책_2012-10-10</td>
				</tr>
				<tr>
					<td>정책생성자</td>
					<td class="setleftborder">도우너</td>
				</tr>
				<tr>
					<td>정책생성일시</td>
					<td class="setleftborder">2012:10.16 12:12:14</td>
				</tr>
				<tr>
					<td>정책적용일시</td>
					<td class="setleftborder">2012:10.16 12:13:14</td>
				</tr>
				
			</tbody>
		</table>

	   <!-- (적용) -->
	   <div  class="ac mt20">
			<a class="btn type1 set25" href="#"><span>기기정책 변경적용</span></a>
	   </div>

	</section>

</article>

<%@ include file="../common/inc/footer.jsp" %>
