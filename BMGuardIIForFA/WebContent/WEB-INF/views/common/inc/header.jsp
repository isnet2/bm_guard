<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>KUMHO TIRES | 사용자관리</title>
<link rel="stylesheet" type="text/css" media="all" href="../common/css/basic.css" />
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"type="text/javascript"></script><![endif]-->
<!--[if IE 7]><link rel="stylesheet" href="../common/css/ie7.css" type="text/css"/><![endif]-->
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/twolevel-1.0.js"></script>
<script type="text/javascript" charset="urf-8" src="../common/js/slides.min.jquery.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery.form.js"></script>		
<script language="JavaScript"> 
		var win = null;
		var console = window.console || { log: function() {} }; 
		
		jQuery(document).ready(function() {
			jQuery("#mainmenu").twolevel(	
				{resetTimer: 100}
			);
			//로그아웃
			jQuery("#logOutBtn").click(function(){
				jQuery("#headerForm").attr("action","/logout.html");
				jQuery("#headerForm").submit();
			});
			//패스워드변경
			jQuery("#changePasswordBtn").click(function(){
				jQuery("#headerForm").attr("action","/user/pass.html");
				jQuery("#headerForm").submit();
				
			});	
		
	});
		
	function helpPopup(clientX, clientY, addr) {
		 
		//마우스 클릭 위치
		var sw = event.screenX;
		var sh = event.screenY;
		
		//중앙정렬
		//var sw=screen.availWidth;                           
		//var sh=screen.availHeight; 
		
		var leftPosition=(sw)/2;
		var topPosition=sh;

		var option = 'width='+520+',height='+ 600+',top ='+topPosition;
		    option += ',left='+leftPosition+', scrollbars=yes, resizable=yes';
		win = window.open(addr, 'Help', option);
		
		if(!win || win.closed ) {
			win.opener.self;
		}else {
			win.location = addr;
			win.focus();
		}
	}
</script>
<!-- DatePicker -->
<script src="../common/js/Calendar.M.js"></script>
</head>

<body class="${body}">


<form id="headerForm"></form>

<header>
	<div>
		<div class="top_info">
			<p><a href="../"><img src="../common/images/logo.gif" alt="금호타이어"></a></p>
			<ul>
				<li>${loginUser.user_name}(${loginUser.login_id}) 님이 로그인하였습니다</li>
				<li><a href="#"><img  id="logOutBtn" src="../common/images/btn/btn_logout.gif" alt="로그아웃"></a></li>
				<li><a href="#"><img id="changePasswordBtn" src="../common/images/btn/btn_pass.gif" alt="비밀번호변경"></a></li>
			</ul>
		</div>
	</div>
	<nav class="gnb">
		<ul id="mainmenu" class="twoLevelMenu">
			<li class="${gnb1 }"><a href="../user/pass.html" class="gnb1">사용자 관리</a>
				<ul>
					<li class="first ${gnb1_1 }" ><a href="../user/pass.html" class="gnb1_1">관리자 비밀번호</a></li>
					<li class="${gnb1_2 }"><a href="../user/list.html" class="gnb1_2">사용자관리</a></li>
				</ul>
				<a href="#" id="helpBtn1" class="btn set25"><span style="width:34px;">도움말</span></a>
			</li>
			<li class="${gnb2 }"><a href="../auto/index.html" class="gnb2">자동화기기 관리</a>
				<ul>
					<li class="first ${gnb2_1 }" style="margin-left:55px;"><a href="../auto/index.html" class="gnb2_1">자동화기기 관리</a></li>
					<li class="${gnb2_2 }"><a href="../auto/getManagementUserList.html" class="gnb2_2">유지보수용 ID/PW관리</a></li>
				</ul>
				<a href="#" id="helpBtn2" class="btn set25" ><span style="width:34px;">도움말</span></a>
			</li>
			
			<li class="${gnb3 }"><a href="../policy/index.html" class="gnb3">정책관리</a>
				<ul>
					<li class="first ${gnb3_1 }" style="margin-left:175px;"><a href="../policy/index.html" class="gnb3_1">정책수립</a></li>
					<li class="${gnb3_2 }"><a href="../policy/apply.html" class="gnb3_2">정책적용</a></li>
					<li class="${gnb3_3 }"><a href="../policy/cri_policy.html" class="gnb3_3">정책적용결과(정책기준)</a></li>
					<li class="${gnb3_4 }"><a href="../policy/cri_device.html" class="gnb3_4">정책적용결과(기기기준)</a></li>
				</ul>
				<a href="#" id="helpBtn3" class="btn set25"><span style="width:34px;">도움말</span></a>
			</li>
			
			<li class="${gnb4 }"><a href="../remote/file.html" class="gnb4">원격관리</a>
				<ul style="left:20px;">
					<!--li class="first ${gnb4_1 }" style="margin-left:0px;"><a href="../remote/setting.html" class="gnb4_1">환경설정</a></li-->
					<li class="${gnb4_2 }"><a href="../remote/file.html" class="gnb4_2">파일/폴더관리</a></li>
					<li class="${gnb4_3 }"><a href="../remote/process.html" class="gnb4_3">프로세스관리</a></li>
					<li class="${gnb4_5 }"><a href="../remote/registry.html" class="gnb4_5">레지스트리관리</a></li>
					<!--li class="${gnb4_6 }"><a href="../remote/srch.html" class="gnb4_6">검색관리</a></li-->
					<li class="${gnb4_7 }"><a href="../remote/program.html" class="gnb4_7">프로그램 배포</a></li>
					<li class="${gnb4_8 }"><a href="../remote/pc_end.html" class="gnb4_8">자동화기기 종료관리</a></li>
					<li class="${gnb4_9 }"><a href="../remote/event.html" class="gnb4_9">이벤트로그수집</a></li>
					<li class="${gnb4_10 }"><a href="../remote/pc_dump.html" class="gnb4_10">자동화기기 덤프관리</a></li>
					<li class="${gnb4_11 }"><a href="../remote/policy.html" class="gnb4_11">정책관리</a></li>
					<li class="${gnb4_12 }"><a href="../remote/remote.html" class="gnb4_12">원격제어</a></li>
					<li class="${gnb4_13 }"><a href="../remote/capture.html" class="gnb4_13">화면캡춰</a></li>
				</ul>
				<a href="#" id="helpBtn4" class="btn set25" ><span style="width:34px;">도움말</span></a>
			</li>
			<li class="${gnb5 }"><a href="../stats/index.html" class="gnb5">통계정보</a>
				<ul>
					<li class="first ${gnb5_1 }" style="margin-left:340px;"><a href="../stats/index.html" class="gnb5_1">자동화기기 현황</a></li>
					<li class="${gnb5_2 }"><a href="../stats/policy.html" class="gnb5_2">정책관리현황</a></li>
					<li class="${gnb5_3 }"><a href="../stats/report.html" class="gnb5_3">원격관리현황</a></li>
					<li class="${gnb5_4 }"><a href="../stats/nowlog.html" class="gnb5_4">로그현황</a></li>
				</ul>
				<a href="#" id="helpBtn5" class="btn set25" ><span style="width:34px;">도움말</span></a>
				
			</li>
			<li class="last ${gnb6 }"><a href="../monitor/automatic.html" class="gnb6">실시간 모니터링</a>
				<ul style="left:470px">
					<li class="${gnb6_1 }"><a href="../monitor/automatic.html" class="gnb6_1">자동화기기 모니터링</a></li>
					<li class="${gnb6_2 }"><a href="../monitor/servermonitor.html" class="gnb6_2">서버 모니터링</a></li>
				</ul>
				<a href="#" id="helpBtn6" class="btn set25" ><span style="width:34px;">도움말</span></a>
			</li>
		</ul>
	</nav>

