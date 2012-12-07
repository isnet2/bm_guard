<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>KUMHO TIRES | 정책조회</title>
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
			<li class="active"><a href="../stats" class="gnb5">통계정보</a>
				<ul>
					<li class="first" style="margin-left:340px;"><a href="../stats" class="gnb5_1">로그검색</a></li>
					<li class="on"><a href="../stats/policy.html" class="gnb5_2">정책조회</a></li>
					<li><a href="../stats/report.html" class="gnb5_3">레포팅</a></li>
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
		<li class="last"><span>정책조회 검색결과</span></li>
	</ul>
	</section>

	<figure>정책조회 검색결과</figure>
	<section class="stats mt20">
	<h2><img src="../common/images/txt/h2_policy_result.gif" alt="정책조회검색결과"></h2>
	
	<p class="btn_print mt0"><a href="#"><img src="../common/images/btn/btn_print.gif" alt="인쇄"></a></p>
	<table class="mt5">
		<colgroup>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:15%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:15%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>
					<select name="" id="">
						<option value="기기그룹명" selected>기기그룹명</option>
						<option value="3층기계실">3층기계실</option>
						<option value="가류공정">가류공정</option>
						<option value="반제품공정">반제품공정</option>
					</select>
				</th>
				<th>
					<select name="" id="">
						<option value="기기명" selected>기기명</option>
						<option value="2BA01">2BA01</option>
						<option value="2BA02">2BA02</option>
						<option value="2BA03">2BA03</option>
					</select>
				</th>
				<th>
					<select name="" id="">
						<option value="정책구분" selected>정책구분</option>
						<option value="정책구분">폴더정책</option>
						<option value="허용프로세스">허용프로세스</option>
						<option value="차단프로세스">차단프로세스</option>
					</select>
				</th>
				<th>
					<select name="" id="">
						<option value="배포정책구분" selected>배포정책구분</option>
						<option value="정책적용">정책적용</option>
						<option value="정책해제">정책해제</option>
					</select>
				</th>
				<th>
					<select name="" id="">
						<option value="적용일시">적용일시</option>
					</select>
				</th>
				<th>
					<select name="" id="">
						<option value="프로세스/폴더명">프로세스/폴더명</option>
					</select>
				</th>
				<th>
					<select name="" id="">
						<option value="로그생성" selected>로그생성</option>
						<option value="사용">사용</option>
						<option value="사용안함">사용안함</option>
					</select>
				</th>
				<th>
					<select name="" id="">
						<option value="회사명" selected>회사명</option>
						<option value="MS">MS</option>
					</select>
				</th>
				<th>설명</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>3층 기계실</td>
				<td>2BA01</td>
				<td>폴더정책</td>
				<td>정책적용</td>
				<td>2012.04.05 <p>17:00:00</p></td>
				<td class="al pl10">C:\download</td> 
				<td>사용</td>
				<td>MS</td>
				<td>OS부팅시</td>
			</tr>
		</tbody>
	</table>

	<p class="btn_center"><a href="#" class="basic"><img src="../common/images/btn/btn_excel_save.gif" alt="엑셀저장"></a></p>
    
	</section>

</article>

</body>
</html>
