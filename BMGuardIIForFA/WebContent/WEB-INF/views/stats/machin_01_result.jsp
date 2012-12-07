<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>KUMHO TIRES | 로그검색</title>
<link rel="stylesheet" type="text/css" media="all" href="../common/css/basic.css" />
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"type="text/javascript"></script><![endif]-->
<!--[if IE 7]><link rel="stylesheet" href="../common/css/ie7.css" type="text/css"/><![endif]-->
<script type="text/javascript" charset="urf-8" src="../common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/twolevel-1.0.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/slides.min.jquery.js"></script>		
<script language="JavaScript"> 
	$(document).ready(function() {
		$("#mainmenu").twolevel(
				{resetTimer: 100}
		);
	});
</script>

<!-- DatePicker -->
<script src="../common/js/Calendar.js"></script>
</head>

<body>

<header>
	<div>
		<p><a href="../"><img src="../common/images/logo.gif" alt="금호타이어"></a></p>
		<ul>
			<li>admin님이 로그인 하셨습니다.</li>
			<li><img src="../common/images/btn/btn_logout.gif" alt="로그아웃"></li>
			<!-- <li><img src="../common/images/btn/btn_login.gif" alt="로그인"></li> -->
			<li><img src="../common/images/btn/btn_pass.gif" alt="비밀번호변경"></li>
		</ul>
	</div>
	<nav class="gnb">
		<ul id="mainmenu" class="twoLevelMenu">
			<li><a href="../user/pass.html" class="gnb1">사용자 관리</a>
				<ul>
					<li class="first" ><a href="../user/pass.html" class="gnb1_1">관리자 비밀번호</a></li>
					<li  class="on"><a href="../user/list.html" class="gnb1_2">사용자관리</a></li>
				</ul>
			</li>
			<li><a href="../auto" class="gnb2">자동화기기 관리</a></li>
			<li><a href="../policy/admit.html" class="gnb3">정책관리</a>
				<ul>
					<li class="first" style="margin-left:175px;"><a href="../policyadmit.html" class="gnb3_1">통합정책관리</a></li>
					<li><a href="../policy/dvice.html" class="gnb3_2">기기별 정책관리</a></li>
				</ul>
			</li>
			<li><a href="../remote" class="gnb4">원격관리</a>
				<ul>
					<li class="first" style="margin-left:0px;"><a href="../remote/setting.html" class="gnb4_1">환경설정</a></li>
					<li><a href="../remote/file.html" class="gnb4_2">파일/폴더관리</a></li>
					<li><a href="../remote/process.html" class="gnb4_3">프로세스관리</a></li>
					<li><a href="../remote/service.html" class="gnb4_4">서비스관리</a></li>
					<li><a href="../remote/registry.html" class="gnb4_5">레지스트리관리</a></li>
					<li><a href="../remote/srch.html" class="gnb4_6">검색관리</a></li>
					<li><a href="../remote/program.html" class="gnb4_7">프로그램 배포</a></li>
					<li><a href="../remote/pc_end.html" class="gnb4_8">PC 종료관리</a></li>
					<li><a href="../remote/event.html" class="gnb4_9">이벤트로그수집</a></li>
					<li><a href="../remote/pc_dump.html" class="gnb4_10">PC덤프관리</a></li>
					<li><a href="../remote/policy.html" class="gnb4_11">정책관리</a></li>
					<li><a href="../remote/remote.html" class="gnb4_12">원격제어</a></li>
					<li><a href="../remote/capture.html" class="gnb4_13">화면캡춰</a></li>
				</ul>
			</li>
			<li class="active"><a href="../stats/machin_01.html" class="gnb5">통계정보</a>
				<ul>
					<li class="first on" style="margin-left:340px;"><a href="../stats/machin_01.html" class="gnb5_1">자동화기기 현황</a></li>
					<li><a href="../stats/policy_01.html" class="gnb5_2">정책관리현황</a></li>
					<li><a href="../stats/remote.html" class="gnb5_3">원격관리 현황</a></li>
					<li><a href="../stats/log.html" class="gnb5_4">로그 현황</a></li>
				</ul>
			</li>
			<li class="last"><a href="../monitor" class="gnb6">실시간 모니터링</a></li>
		</ul>
	</nav>
</header>

<article>
	<figure>direction</figure>
	<section class="direction">
	<ul>
		<li>사용자 관리</li>
		<li>사용자 관리</li>
		<li class="last"><span>사용자 관리</span></li>
	</ul>
	</section>

	<figure>tab</figure>
	<section class="tab">
	<ul>
		<li class="on"><a href="machin_01.html" class="pass"><span></span><p>자동화기기 운영현황(통계)</p></a></li>
		<li><a href="machin_02.html" class="pass"><span></span><p>자동화기기 운영현황(기기현황)</p></a></li>
	</ul>
	</section>

	<figure>사용자 로그검색</figure>
	<section class="stats">
	<h2><img src="../common/images/txt/h2_log_result.gif" alt="로그검색결과"></h2>

	<p class="table_log mt5 ml5 bgnone">기준일자 : 2021년 9월 1일~2012년 9월 15일</p>
	<p class="table_log mt5 ml5 bgnone">작성일자 : 2012년 9월 15일</p>
	
	<h3 class="log_h3"><img src="../common/images/txt/h3_manage.gif" alt="관리그룹"></h3>
	<table class="mt10">
		<colgroup>
			<col style="width:25%">
			<col style="width:25%">
			<col style="width:25%">
			<col style="width:25%">
		</colgroup>
		<thead>
			<tr>
				<th>관리그룹</th>
				<th>신규기기수</th>
				<th>제외기기수</th>
				<th>운영기기수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>3층기계실</td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>가류공정</td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>검사공정</td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>기타공정</td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>반제품공정</td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>성형 </td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>자동창고 </td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>정련  </td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
			<tr>
				<td>중간검사실 </td>
				<td>3</td>
				<td>20</td>
				<td>140</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th>총 계</th>
				<th>25</th>
				<th>5</th>
				<th>5</th>
			</tr>
		</tfoot>
	</table>

	

	<p class="btn_center"><a href="#" class="basic"><img src="../common/images/btn/btn_print_02.gif" alt="인쇄"></a></p>

	</section>
</article>


</body>
</html>
