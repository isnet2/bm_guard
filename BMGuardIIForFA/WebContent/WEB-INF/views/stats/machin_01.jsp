<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>KUMHO TIRES | ë¡ê·¸ê²ì</title>
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
		<p><a href="../"><img src="../common/images/logo.gif" alt="ê¸í¸íì´ì´"></a></p>
		<ul>
			<li>adminëì´ ë¡ê·¸ì¸ íì¨ìµëë¤.</li>
			<li><img src="../common/images/btn/btn_logout.gif" alt="ë¡ê·¸ìì"></li>
			<!-- <li><img src="../common/images/btn/btn_login.gif" alt="ë¡ê·¸ì¸"></li> -->
			<li><img src="../common/images/btn/btn_pass.gif" alt="ë¹ë°ë²í¸ë³ê²½"></li>
		</ul>
	</div>
	<nav class="gnb">
		<ul id="mainmenu" class="twoLevelMenu">
			<li><a href="../user/pass.html" class="gnb1">ì¬ì©ì ê´ë¦¬</a>
				<ul>
					<li class="first" ><a href="../user/pass.html" class="gnb1_1">ê´ë¦¬ì ë¹ë°ë²í¸</a></li>
					<li  class="on"><a href="../user/list.html" class="gnb1_2">ì¬ì©ìê´ë¦¬</a></li>
				</ul>
			</li>
			<li><a href="../auto" class="gnb2">ìëíê¸°ê¸° ê´ë¦¬</a></li>
			<li><a href="../policy/admit.html" class="gnb3">ì ì±ê´ë¦¬</a>
				<ul>
					<li class="first" style="margin-left:175px;"><a href="../policyadmit.html" class="gnb3_1">íµí©ì ì±ê´ë¦¬</a></li>
					<li><a href="../policy/dvice.html" class="gnb3_2">ê¸°ê¸°ë³ ì ì±ê´ë¦¬</a></li>
				</ul>
			</li>
			<li><a href="../remote" class="gnb4">ìê²©ê´ë¦¬</a>
				<ul>
					<li class="first" style="margin-left:0px;"><a href="../remote/setting.html" class="gnb4_1">íê²½ì¤ì </a></li>
					<li><a href="../remote/file.html" class="gnb4_2">íì¼/í´ëê´ë¦¬</a></li>
					<li><a href="../remote/process.html" class="gnb4_3">íë¡ì¸ì¤ê´ë¦¬</a></li>
					<li><a href="../remote/service.html" class="gnb4_4">ìë¹ì¤ê´ë¦¬</a></li>
					<li><a href="../remote/registry.html" class="gnb4_5">ë ì§ì¤í¸ë¦¬ê´ë¦¬</a></li>
					<li><a href="../remote/srch.html" class="gnb4_6">ê²ìê´ë¦¬</a></li>
					<li><a href="../remote/program.html" class="gnb4_7">íë¡ê·¸ë¨ ë°°í¬</a></li>
					<li><a href="../remote/pc_end.html" class="gnb4_8">PC ì¢ë£ê´ë¦¬</a></li>
					<li><a href="../remote/event.html" class="gnb4_9">ì´ë²¤í¸ë¡ê·¸ìì§</a></li>
					<li><a href="../remote/pc_dump.html" class="gnb4_10">PCë¤íê´ë¦¬</a></li>
					<li><a href="../remote/policy.html" class="gnb4_11">ì ì±ê´ë¦¬</a></li>
					<li><a href="../remote/remote.html" class="gnb4_12">ìê²©ì ì´</a></li>
					<li><a href="../remote/capture.html" class="gnb4_13">íë©´ìº¡ì¶°</a></li>
				</ul>
			</li>
			<li class="active"><a href="../stats/machin_01.html" class="gnb5">íµê³ì ë³´</a>
				<ul>
					<li class="first on" style="margin-left:340px;"><a href="../stats/machin_01.html" class="gnb5_1">ìëíê¸°ê¸° íí©</a></li>
					<li><a href="../stats/policy_01.html" class="gnb5_2">ì ì±ê´ë¦¬íí©</a></li>
					<li><a href="../stats/remote.html" class="gnb5_3">ìê²©ê´ë¦¬ íí©</a></li>
					<li><a href="../stats/log.html" class="gnb5_4">ë¡ê·¸ íí©</a></li>
				</ul>
			</li>
			<li class="last"><a href="../monitor" class="gnb6">ì¤ìê° ëª¨ëí°ë§</a></li>
		</ul>
	</nav>
</header>

<article>
	<figure>direction</figure>
	<section class="direction">
	<ul>
		<li>ì¬ì©ì ê´ë¦¬</li>
		<li>ì¬ì©ì ê´ë¦¬</li>
		<li class="last"><span>ì¬ì©ì ê´ë¦¬</span></li>
	</ul>
	</section>

	<figure>tab</figure>
	<section class="tab">
	<ul>
		<li class="on"><a href="machin_01.html" class="pass"><span></span><p>ìëíê¸°ê¸° ì´ìíí©(íµê³)</p></a></li>
		<li><a href="machin_02.html" class="pass"><span></span><p>ìëíê¸°ê¸° ì´ìíí©(ê¸°ê¸°íí©)</p></a></li>
	</ul>
	</section>

	<figure>ì¬ì©ì ë¡ê·¸ê²ì</figure>
	<section class="stats">
	<h2><img src="../common/images/txt/h2_log_srch.gif" alt="ë¡ê·¸ê²ìì¡°ê±´"></h2>
	
	<div class="box_log">
		<ul>
			<li>
				<p>
					<span><img src="../common/images/txt/h3_month.gif" alt="ìë¨ì"></span>
					<select name="#" id="#">
						<option value="2012-07">2012-07</option>
					</select>
				</p>
			</li>
			<li class="last">
					<span><img src="../common/images/txt/txt_log_02.gif" alt="ê¸°ê°"></span>
					<ul class="due">
						<li class="type1"><a href="#">ë¹ì¼</a></li>
						<li class="type2"><a href="#">3ì¼</a></li>
						<li class="type3"><a href="#">1ì£¼</a></li>
						<li class="type4"><a href="#">1ê°ì</a></li>
						<li class="type5"><a href="#">3ê°ì</a></li>
						<li class="type6"><a href="#">6ê°ì</a></li>
					</ul>

					<ul class="date">
						<li>
							<input type="text" name="cal_Date" readonly>
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date)">
						</li>
						<li class="nth2">
							<input type="text" name="cal_Date2" readonly>
							<img src="../common/images/bu/ico_date.gif" onclick="Calendar_D(document.all.cal_Date2)">
						</li>
					</ul>
			</li>
		</ul>
	</div>

	<h3 class="log_h3"><img src="../common/images/txt/h3_manage.gif" alt="ê´ë¦¬ê·¸ë£¹"><span><!-- ê¶í : ì ì´ ë° ëª¨ëí°ë§ --></span></h3>
	<div class="log_select">
		<ul>
			<li class="type1"><input type="checkbox"> <label for="#">ì ì²´</label></li>
			<li class="type2"><input type="checkbox"> <label for="#">3ì¸µê¸°ê³ì¤</label></li>
			<li class="type3"><input type="checkbox"> <label for="#">ê°ë¥ê³µì </label></li>
			<li class="type4"><input type="checkbox"> <label for="#">ê²ì¬ê³µì </label></li>
			<li class="type5"><input type="checkbox"> <label for="#">ê¸°íê³µì </label></li>
			<li class="type6"><input type="checkbox"> <label for="#">ë°ì íê³µì </label></li>
			<li class="type7"><input type="checkbox"> <label for="#">ì±í</label></li>
			<li class="type8"><input type="checkbox"> <label for="#">ìëì°½ê³ </label></li>
			<li class="type9"><input type="checkbox"> <label for="#">ì ë ¨</label></li>
			<li class="last type10"><input type="checkbox"> <label for="#">ì¤ê°ê²ì¬ì¤</label></li>
		</ul>
	</div>

	<h3 class="log_h3"><img src="../common/images/txt/h3_os.gif" alt="OS"><span><!-- ê¶í : ì ì´ ë° ëª¨ëí°ë§ --></span></h3>
	<div class="log_select">
		<ul>
			<li class="type1"><input type="checkbox"> <label for="#">ì ì²´</label></li>
			<li class="type2"><input type="checkbox"> <label for="#">Win98</label></li>
			<li class="type3"><input type="checkbox"> <label for="#">WinNT</label></li>
			<li class="type4"><input type="checkbox"> <label for="#">WinME</label></li>
			<li class="type5"><input type="checkbox"> <label for="#">Win2K</label></li>
			<li class="type6"><input type="checkbox"> <label for="#">WinXP</label></li>
			<li class="last type7"><input type="checkbox"> <label for="#">Win7</label></li>
		</ul>
	</div>

	<p class="btn_center">
		<a href="machin_01_result.html"><img src="../common/images/btn/btn_check_02.gif" alt="ì¡°í"></a>
	</p>
	</section>
</article>


</body>
</html>
