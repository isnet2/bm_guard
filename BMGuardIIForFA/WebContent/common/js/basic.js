/*
 * SimpleModal Basic Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/
 *
 * Copyright (c) 2010 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: basic.js,v 1.6 2012/11/08 01:41:35 kumho Exp $
 */

jQuery(function ($) {
	// Load dialog on page load
	//$('#basic-modal-content').modal();

	// Load dialog on click
	$('#basic-modal .basic').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content').modal();
		return false;
	});

	$('#basic-modal2 .basic2').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content2').modal();	
		return false;
	});

	$('#basic-modal-2-1 .basic-2-1').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-2-1').modal();	
		return false;
	});

	$('#basic-modal-2-2 .basic-2-2').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-2-2').modal();	
		return false;
	});

	$('#basic-modal-2-3 .basic-2-3').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-2-3').modal();	
		return false;
	});

	$('#basic-modal-2-4 .basic-2-4').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-2-4').modal();	
		return false;
	});

	$('#basic-modal-3-1 .basic-3-1').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-1').modal();
		return false;
	});

	// 11-03 add Lee eungsu
	$('#basic-modal-3-1-pass .basic-3-1').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-1-pass').modal();
		return false;
	});
	$('#basic-modal-3-1-system .basic-3-1').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-1-system').modal();
		return false;
	});
	$('#basic-modal-3-1-folder .basic-3-1').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-1-folder').modal();
		return false;
	});
	
	$('#basic-modal-3-2 .basic-3-2').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-2').modal();	
		return false;
	});

	$('#basic-modal-3-3 .basic-3-3').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-3').modal();
		return false;
	});

	$('#basic-modal-3-4 .basic-3-4').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-4').modal();
		return false;
	});

	$('#basic-modal-3-5 .basic-3-5').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-3-5').modal();
		return false;
	});

	$('#basic-modal-5-1 .basic-5-1').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-5-1').modal();
		return false;
	});

	$('#basic-modal-5-2 .basic-5-2').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-5-2').modal();
		return false;
	});

	$('#basic-modal-5-3 .basic-5-3').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-5-3').modal();
		return false;
	});

	$('#basic-modal-5-4 .basic-5-4').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-5-4').modal();
		return false;
	});

	$('#basic-modal-5-5 .basic-5-5').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-5-5').modal();
		return false;
	});

	$('.basic-manag').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-manag').modal();
		return false;
	});

	$('.basic-limit').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-limit').modal();
		return false;
	});

	$('.basic-log').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content-log').modal();
		return false;
	});

	$('.policy_detail_view').click(function (e) {
		e.preventDefault();
		$('#policy_detail_view').modal();
		return false;
	});

	$('.policy_select_view').click(function (e) {
		e.preventDefault();
		$('#policy_select_view').modal();
		return false;
	});

	$('.stats_detail_view').click(function (e) {
		e.preventDefault();
		$('#stats_detail_view').modal();
		return false;
	});

	$('.btn_limit_detail_view').click(function (e) {
		e.preventDefault();
		$('.limit_detail_view').modal();
		return false;
	});

	$('.btn_limit_not_apply').click(function (e) {
		e.preventDefault();
		$('.limit_not_apply').modal();
		return false;
	});

	$('.btn_maincom_detail_view').click(function (e) {
		e.preventDefault();
		$('.maincom_detail_view').modal();
		return false;
	});

	$('.btn_maincom_not_apply').click(function (e) {
		e.preventDefault();
		$('.maincom_not_apply').modal();
		return false;
	});

	$('.btn_basic-server1').click(function (e) {
		e.preventDefault();
		$('.basic-server1').modal();
		return false;
	});

	$('.btn_basic-server2').click(function (e) {
		e.preventDefault();
		$('.basic-server2').modal();
		return false;
	});
	
	
// 정책관리 > 정책적용 > 정책내용 보기
if ($('.pol_tab').length > 0) {
	$('.pol_tab li a').click(function(){
		$('.pol_tab li a').removeClass('on');
		$(this).addClass('on');
		$('.polbox').css('display','none')
		$('.polbox.'+$(this).attr('data-tab')).css('display','')
	})
}

});

// 실시간 모니터링 레이어 팝업
function onLayer (targetName) {
	if ($(targetName).is(':hidden')) {
		var wrapW = $('body > header').outerWidth()
		var wrapH = 119 + $('body > article').outerHeight()
		$(targetName).css('display','')
		$('.dimmed').css('width',wrapW).css('height',wrapH).css('display','')
	} else {
		$(targetName).css('display','none')
		$('.dimmed').css('display','none')
	}
	
}