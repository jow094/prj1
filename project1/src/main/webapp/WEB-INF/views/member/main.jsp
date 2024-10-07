<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL-core 라이브러리 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>views/member/main.jsp</h1>
	
	<%-- <c:if test="${sessionScope.userid==null} "> --%>
	<c:if test="${empty sessionScope.userid}">
		<c:redirect url = "/member/login" />
	</c:if>
	session.getAttribute("userid") : 
	<%=session.getAttribute("userid") %> <br>
	
	<h2> ${sessionScope.userid}님 안녕하세요! </h2>
	
	<input type="button" value = "로그아웃" onclick ="location.href='/member/logout';">
	
	<h2><a href="/member/info">회원정보 조회 (info)</a></h2>
	<h2><a href="/member/update">회원정보 수정 (update)</a></h2>
	<h2><a href="/member/delete">회원정보 삭제 (delete)</a></h2>
	<c:if test = "${!empty sessionScope.userid && sessionScope.userid.equals('admin')}">
		<h2><a href="/member/list">회원정보 목록 (list)</a></h2>
	</c:if>
	
</body>
</html>