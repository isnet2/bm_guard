function ie_versionCheckWrite() {
	var activeXVersion = "2012,11,27,1304";
	var is64 = window.navigator.userAgent.toLowerCase().indexOf('win64') >-1;
	var objHtml = '';
	if(is64) {
		objHtml = '<object ID="BMSupoAx" style="display:none" CLASSID="clsid:106F603B-6F7C-418F-A943-3E355902463E" ';
		objHtml    += 'codebase="../resource/cab/BMSupoAx64.cab#version='+activeXVersion+'"></object>';
	} else {
		objHtml = '<object ID="BMSupoAx" style="display:none" CLASSID="clsid:106F603B-6F7C-418F-A943-3E355902463E" ';
		objHtml    += 'codebase="../resource/cab/BMSupoAx.cab#version='+activeXVersion+'"></object>';
	}
	$("#activeXWrite").html(objHtml);
}

