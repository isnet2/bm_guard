<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">
<title>excelTest</title>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/jquery/jquery.form.js"></script>
<script type="text/javascript" charset="UTF-8" 	src="/resource/libs/common/common.util.js"></script>
</head>

<body class="admin">

<script type="text/javascript">
//<![CDATA[
$(document).ready(function() {
	
	$("#frmFile").ajaxForm(FileuploadCallback);
	$("#frmFile").attr("action","/excelUpload");
	$("#frmFile").submit(function(){return false;});
});

function downloadFileServer(fileName){
	$('#downloadForm input[name=filaName]').val(fileName);
	$("#downloadForm").attr("target", "fileDownload");
	$("#downloadForm").attr("action", "/common/download").submit();
}	

//파일업로드 이벤트
function FileUpload(){
	var IMG_FORMAT = "\.(xlsx|xls)$"; 
	if(!$("#file").val()){
		alert("파일을 선택하세요.");
		$("#file").focus();
		return;
	}
	
    if(!(new RegExp(IMG_FORMAT, "i")).test($("#file").val())) {
	    alert("엑셀 파일만 첨부하실 수 있습니다.   ");
	    return;
    }
	
	//파일전송
	var frm;
	frm = $('#frmFile'); 
	frm.attr("action","/excelUpload");
	frm.submit(); 
						
}

//파일 업로드 콜백 
function FileuploadCallback(data,state){
	
	data = data.removePre();
	$("#file").val("");

	var jsonStr = eval("("+data+")");

	if(jsonStr != null) {
		if(jsonStr.result == 1 ) {
			alert('파일 업로드가 완료되었습니다.');
		} else {
			alert(jsonStr.msg);
		}
	} else {
		alert('에러가 발생하였습니다.');
		
	}
}

//]]>
</script>

<form id="frmFile" name="frmFile" method="post" enctype="multipart/form-data">
<input type="hidden" name="dataType" id="dataType" value="test" />
<input type="file" size="30" name="file" id="file" />
<input type="button"  value="확인" onclick="FileUpload()"><br>
</form>

<iframe name="fileDownload" width="0" height="0" frameborder="0"  style="display:hidden"></iframe>

<form id="downloadForm" name="downloadForm" method="post" action="">
<input type="hidden" id="filaName" name="filaName" value="" />
</form>

