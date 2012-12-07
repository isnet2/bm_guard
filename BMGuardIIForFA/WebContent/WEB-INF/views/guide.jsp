<%@ page pageEncoding="utf-8" %>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>KUMHO TIRES | 사용자관리</title>
<link rel="stylesheet" type="text/css" media="all" href="./common/css/basic.css" />
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"type="text/javascript"></script><![endif]-->
<!--[if IE 7]><link rel="stylesheet" href="./common/css/ie7.css" type="text/css"/><![endif]-->
<script type="text/javascript" charset="utf-8" src="./common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="./common/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" charset="utf-8" src="./common/js/twolevel-1.0.js"></script>
<script type="text/javascript" charset="utf-8" src="./common/js/slides.min.jquery.js"></script>		
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#mainmenu").twolevel(
				{resetTimer: 100}
		);
	});
</script>
<!-- DatePicker -->
<script type="text/javascript" src="./common/js/Calendar.js"></script>
</head>

<body class="<?=$body;?>">

<header>
	<div>
		<p><a href="./"><img src="./common/images/logo.gif" alt="금호타이어"></a></p>
		<ul>
			<li>admin님이 로그인 하셨습니다.</li>
			<li><img src="./common/images/btn/btn_logout.gif" alt="로그아웃"></li>
			<!-- <li><img src="./common/images/btn/btn_login.gif" alt="로그인"></li> -->
			<li><img src="./common/images/btn/btn_pass.gif" alt="비밀번호변경"></li>
		</ul>
	</div>
	<nav class="gnb">
		<ul id="mainmenu" class="twoLevelMenu">
			<li class="<?=$gnb1;?>"><a href="./user/pass.html" class="gnb1">사용자 관리</a>
				<ul>
					<li class="first <?=$gnb1_1;?>" ><a href="./user/pass.html" class="gnb1_1">관리자 비밀번호</a></li>
					<li class="<?=$gnb1_2;?>"><a href="./user/list.html" class="gnb1_2">사용자관리</a></li>
				</ul>
				<a href="./help.html#help1-1" class="btn set25" target="_blank"><span>도움말</span></a>
			</li>
			<li class="<?=$gnb2;?>"><a href="./auto" class="gnb2">자동화기기 관리</a>
				<ul>
					<li class="first <?=$gnb2_1;?>" style="margin-left:55px;"><a href="./auto/index.html" class="gnb2_1">자동화기기 관리</a></li>
					<li class="<?=$gnb2_2;?>"><a href="./auto/auto_ip.html" class="gnb2_2">유지보수용 IP/PW관리</a></li>
				</ul>
				<a href="./help.html#help2-1" class="btn set25" target="_blank"><span>도움말</span></a>
			</li>
			<li class="<?=$gnb3;?>"><a href="./policy/admit.html" class="gnb3">정책관리</a>
				<ul>
					<li class="first <?=$gnb3_1;?>" style="margin-left:175px;"><a href="./policy/admit.html" class="gnb3_1">정책수립</a></li>
					<li class="<?=$gnb3_2;?>"><a href="./policy/apply.html" class="gnb3_2">정책적용</a></li>
					<li class="<?=$gnb3_3;?>"><a href="./policy/cri_policy.html" class="gnb3_3">정책적용결과(정책기준)</a></li>
					<li class="<?=$gnb3_4;?>"><a href="./policy/cri_dvice.html" class="gnb3_4">정책적용결과(기기기준)</a></li>
				</ul>
				<a href="./help.html#help3-1" class="btn set25" target="_blank"><span>도움말</span></a>
			</li>
			<li class="<?=$gnb4;?>"><a href="./remote/file.html" class="gnb4">원격관리</a>
				<ul style="left:20px;">
					<!--li class="first <?=$gnb4_1;?>" style="margin-left:0px;"><a href="./remote/setting.html" class="gnb4_1">환경설정</a></li-->
					<li class="<?=$gnb4_2;?>"><a href="./remote/file.html" class="gnb4_2">파일/폴더관리</a></li>
					<li class="<?=$gnb4_3;?>"><a href="./remote/process.html" class="gnb4_3">프로세스관리</a></li>
					<li class="<?=$gnb4_5;?>"><a href="./remote/registry.html" class="gnb4_5">레지스트리관리</a></li>
					<!--li class="<?=$gnb4_6;?>"><a href="./remote/srch.html" class="gnb4_6">검색관리</a></li-->
					<li class="<?=$gnb4_7;?>"><a href="./remote/program.html" class="gnb4_7">프로그램 배포</a></li>
					<li class="<?=$gnb4_8;?>"><a href="./remote/pc_end.html" class="gnb4_8">자동화기기 종료관리</a></li>
					<li class="<?=$gnb4_9;?>"><a href="./remote/event.html" class="gnb4_9">이벤트로그수집</a></li>
					<li class="<?=$gnb4_10;?>"><a href="./remote/pc_dump.html" class="gnb4_10">자동화기기 덤프관리</a></li>
					<li class="<?=$gnb4_11;?>"><a href="./remote/policy.html" class="gnb4_11">정책관리</a></li>
					<li class="<?=$gnb4_12;?>"><a href="./remote/remote.html" class="gnb4_12">원격제어</a></li>
					<li class="<?=$gnb4_13;?>"><a href="./remote/capture.html" class="gnb4_13">화면캡춰</a></li>
				</ul>
				<a href="./help.html#help4-1" class="btn set25" target="_blank"><span>도움말</span></a>
			</li>
			<li class="<?=$gnb5;?>"><a href="./stats" class="gnb5">통계정보</a>
				<ul>
					<li class="first <?=$gnb5_1;?>" style="margin-left:340px;"><a href="./stats" class="gnb5_1">자동화기기 현황</a></li>
					<li class="<?=$gnb5_2;?>"><a href="./stats/policy.html" class="gnb5_2">정책관리현황</a></li>
					<li class="<?=$gnb5_3;?>"><a href="./stats/report.html" class="gnb5_3">원격관리현황</a></li>
					<li class="<?=$gnb5_4;?>"><a href="./stats/nowlog.html" class="gnb5_4">로그현황</a></li>
				</ul>
				<a href="./help.html#help5-1" class="btn set25" target="_blank"><span>도움말</span></a>
			</li>
			<li class="last <?=$gnb6;?>"><a href="./monitor/automatic.html" class="gnb6">실시간 모니터링</a>
				<ul style="left:470px">
					<li class="<?=$gnb6_1;?>"><a href="./monitor/automatic.html" class="gnb6_1">자동화기기 모니터링</a></li>
					<li class="<?=$gnb6_2;?>"><a href="./monitor/servermonitor.html" class="gnb6_2">서버 모니터링</a></li>
				</ul>
				<a href="./help.html#help6-1" class="btn set25" target="_blank"><span>도움말</span></a>
			</li>
		</ul>
	</nav>


</header>

<article class="coding_guide">
	<section class="set2">
<!--                                   버튼                                   -->
		<div class="add_guide">
			<ul style="width:140px; float:left">
				<li>
					<a href="#" class="btn"><span>기본1, 높이 31px</span></a>
				</li>
				<li>
					<a href="#" class="btn set25"><span>기본2, 높이 25px</span></a>
				</li>
				<li>
					<a href="#" class="btn set20"><span>기본3, 높이 20px</span></a>
				</li>
			</ul>
			<ul style="width:140px; float:left">
				<li>
					<a href="#" class="btn type2"><span>검정1, 높이 31px</span></a>
				</li>
				<li>
					<a href="#" class="btn type2 set25"><span>검정2, 높이 25px</span></a>
				</li>
				<li>
					<a href="#" class="btn type2 set20"><span>검정3, 높이 20px</span></a>
				</li>
				<li>
					<a href="#" class="btn type2 set66"><span>검정3, 높이 66px</span></a>
				</li>
			</ul>
			<ul style="float:left">
				<li>
					<a href="#" class="btn setp15"><span>좌우 넓이 추가 15px</span></a>
				</li>
				<li>
					<a href="#" class="btn setp30"><span>좌우 넓이 추가 30px</span></a>
				</li>
			</ul>
		</div>
		<div class="description">
			<strong>기본(높이31px)</strong> <br /> &lt;a href="" class="btn"&gt;&lt;span&gt;버튼&lt;/span&gt;&lt;/a&gt; <br /><br />
			<strong>높이25px</strong> <br /> &lt;a href="" class="btn set25"&gt;&lt;span&gt;버튼&lt;/span&gt;&lt;/a&gt; <br /><br />
			<strong>높이20px</strong> <br /> &lt;a href="" class="btn set20"&gt;&lt;span&gt;버튼&lt;/span&gt;&lt;/a&gt; <br /><br />
			<strong>검정</strong> <br /> &lt;a href="" class="btn type2"&gt;&lt;span&gt;버튼&lt;/span&gt;&lt;/a&gt; <br /><br />
			<strong>좌우여백 15px</strong> <br /> &lt;a href="" class="btn setp15"&gt;&lt;span&gt;버튼&lt;/span&gt;&lt;/a&gt; <br /><br />
			<strong>좌우여백 30px</strong> <br /> &lt;a href="" class="btn setp30"&gt;&lt;span&gt;버튼&lt;/span&gt;&lt;/a&gt; <br /><br />
			<strong>EX)</strong> 검정색 25px 버튼 > &lt;a href="" class="btn type2 set25"&gt;&lt;span&gt;버튼&lt;/span&gt;&lt;/a&gt;
			<br /><br />
			* 높이값은 기본값 30px과 25px, 20px 가 있고. 검정버튼만 66px이 있습니다.
		</div>
<!--                                 //버튼                                   -->
<!--                                  옵션 박스                               -->
		<div class="option_box">
			<div class="checkbox option_group">
				<strong>OS선택</strong>
				<ul>
					<li><input type="checkbox" id="os1" /> <label for="os1">Win98</label></li>
					<li><input type="checkbox" id="os2" /> <label for="os2">WinNT</label></li>
					<li><input type="checkbox" id="os3" /> <label for="os3">WinME</label></li>
					<li><input type="checkbox" id="os4" /> <label for="os4">Win2K</label></li>
					<li><input type="checkbox" id="os5" /> <label for="os5">WinXP</label></li>
					<li><input type="checkbox" id="os6" /> <label for="os6">Win7</label></li>
				</ul>
			</div>

			<div class="checkbox option_group">
				<strong>관리그룹</strong>
				<ul>
					<li><input type="checkbox" id="adm1" /> <label for="adm1">그룹1</label></li>
					<li><input type="checkbox" id="adm2" /> <label for="adm2">그룹2</label></li>
					<li><input type="checkbox" id="adm3" /> <label for="adm3">그룹3</label></li>
					<li><input type="checkbox" id="adm4" /> <label for="adm4">그룹4</label></li>
				</ul>
			</div>

			<div class="option_group">
				<strong>라디오</strong>
				<input type="radio" id="radio1-1" /><label for="radio1-1">라디오버튼1-1</label>
				<input type="radio" id="radio1-2" /><label for="radio1-1">라디오버튼1-2</label>
			</div>

			<div class="option_group">
				<strong><label for="opt_target">조회대상</label></strong>
				<select id="opt_target">
					<option>전체</option>
					<option>신규기기</option>
					<option>제외기기</option>
					<option>운영기기</option>
				</select>
			</div>

			<div class="date_group option_group">
				<strong>기간 선택</strong>
				<div class="left_date">
					<select id="y_sel">
						<option>2012</option>
						<option>2011</option>
						<option>2010</option>
						<option>2009</option>
						<option>2008</option>
					</select>
					<label for="y_sel">년</label>
					<select>
						<option>11</option>
						<option>10</option>
						<option>09</option>
						<option>08</option>
						<option>07</option>
					</select>
					<label for="m_sel">월</label>
				</div>
				<div class="right_date">
					<input type="text" title="시작 날짜 선택" /><a href="#"><img src="./common/images/bu/ico_date.gif" alt="날짜 선택" /></a> ~ <input type="text"  title="종료 날짜 선택" /><a href="#"><img src="./common/images/bu/ico_date.gif" alt="날짜 선택" /></a>
					<ul>
						<li>
							<a href="" class="btn set20"><span>당일</span></a>
						</li>
						<li>
							<a href="" class="btn set20"><span>3일</span></a>
						</li>
						<li>
							<a href="" class="btn set20"><span>1주</span></a>
						</li>
						<li>
							<a href="" class="btn set20"><span>1개월</span></a>
						</li>
						<li>
							<a href="" class="btn set20"><span>3개월</span></a>
						</li>
						<li>
							<a href="" class="btn set20"><span>6개월</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="description">
			기본적으로 div.option_box 안에 div.option_group 으로 각 항목이 들어가고,<br />
			OS선택, 관리그룹의 경우 div.checkbox.option_group 로 들어가며, 넓이와 관계없이 다른 항목과 항상 다른 줄을 유지합니다. <br />
			기간 선택의 경우 div.date_group.option_group 로들어가가며, 넓이와 관계없이 다른 항목과 항상 다른 줄을 유지합니다. <br />
			
		</div>
<!--                                //옵션 박스                               -->
<!--                                일반 테이블                               -->
		<div class="tables type1">
			<table>
				<colgroup>
					<col style="width:20%"/>
					<col style="width:30%"/>
					<col style="width:50%"/>
				</colgroup>
				<thead>
					<tr>
						<th>필드1</th>
						<th>필드2</th>
						<th class="pl20 tl">마지막필드</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td class="pl20 tl"></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td class="pl20 tl"></td>
					</tr>
					<tr>
						<td>Autoexec.bat</td>
						<td>MS</td>
						<td class="pl20 tl"></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="description">
			기본형 테이블입니다.
			스크롤 기능이 없습니다.
		</div>
<!--                                //일반 테이블                             -->
<!--                                스크롤 테이블                             -->
		<div class="tables type2">
			<div class="table_heads">
				<table>
					<colgroup>
						<col style="width:20%"/>
						<col style="width:30%"/>
						<col style="width:50%"/>
					</colgroup>
					<tbody>
						<tr>
							<td class="tit">필드1</td>
							<td class="tit">필드2</td>
							<td class="tit pl20 tl">마지막필드</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="table_bodys">
				<table>
					<colgroup>
						<col style="width:20%"/>
						<col style="width:30%"/>
						<col style="width:50%"/>
					</colgroup>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="pl20 tl"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="description">
			스크롤링을 넣은 테이블입니다.
			높이 조절은 set200 ~ set400 까지 50단위로 클래스를 붙이면 해당 숫자만큼의 높이 값으로 기본 높이 값이 조절됩니다. <br />
			<strong>EX)</strong> &lt;div class="table_bodys set200"&gt;
		</div>
<!--                                //스크롤 테이블                           -->
<!--                                   기타 설정                              -->
		<div class="add_guide">
			<div style="border:1px solid red; width:50px; height:50px" class="float_l mt20 ml20">class="mt20 ml20"</div>
			<div style="border:1px solid blue; width:50px; height:50px" class="float_l mt55 ml55">class="mt55 ml55"</div>
		</div>
		<div class="description">
			<strong>class="tl"</strong> 해당 클래스를 가진 엘리먼트의 텍스트 정렬을 left 값을 기준으로합니다. <br />
			.tc {text-align:center !important} <br />
 			.tr {text-align:right !important} <br /><br />
			<strong>class="mt0" </strong> 엘리먼트에 margin-top:0 ~ margin-top:55px 까지 5px 단위로 조절이 가능합니다. <br />
			<strong>class="mr0" </strong> 엘리먼트에 margin-right:0 ~ margin-right:55px 까지 5px 단위로 조절이 가능합니다. <br />
			<strong>class="ml0" </strong> 엘리먼트에 margin-left:0 ~ margin-left:55px 까지 5px 단위로 조절이 가능합니다. <br />
			<strong>class="mb0" </strong> 엘리먼트에 margin-bottom:0 ~ margin-bottom:55px 까지 5px 단위로 조절이 가능합니다. <br />
		</div>
<!--                                   //기타 설정                            -->
	</section>

</article>

<!-- Load jQuery, SimpleModal and Basic JS files -->
<script type="text/javascript" src="./common/js/jquery.simplemodal.js"></script>
<script type="text/javascript" src="./common/js/basic.js"></script>

</body>
</html>
