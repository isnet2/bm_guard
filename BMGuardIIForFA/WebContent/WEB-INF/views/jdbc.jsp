<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<title>타이틀 </title>
<!-- 
<script type="text/javascript" charset="UTF-8" src="Jquery paht 적어주세요."></script>
 -->
<script type="text/javascript"> 
//<![CDATA[

//]]>
</script>
</head>

<body>
DB 연결 결과 <br></br>
${msg }<BR></BR>
${domain.userId } <BR></BR>
${domain.password }  <BR></BR>

DB testUser <br></br>
<c:choose>
	<c:when test="${testUserListCnt eq 0 }">
	생성된 데이타 없음.
	</c:when>
	<c:otherwise>
		<c:forEach items="${testUserList}" var="testUserList" varStatus="i">
		 <br>${testUserList.id}</br>
		</c:forEach>
	</c:otherwise>
</c:choose>
</body>
</html>