<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
header {
	list-style-type: none;
	display: inline-block;
	color: white;
}
</style>
</head>
<header>
<div id="main_header">
	<div id="first_line">
		<c:if test="${not empty sid }">
			<a href="${hpath }/Logout.do">로그아웃 </a>&nbsp;&nbsp;
		    <a href="${hpath }/EditMember.do?id=${sid}"> 회원정보</a>
			<a href="${hpath }/EditMember.do?id=${sid}"> 장바구니</a>
		</c:if>
		<c:if test="${empty sid }">
			<a href="${hpath  }/member/login.do">로그인</a>&nbsp;&nbsp;
			<a href="${hpath  }/member/term.do"> 회원가입</a>
		</c:if>
	</div> 
	<div id="second_line">
		<a href="${hpath }"><img
			src="${hpath}/myapp/resources/images/favicon.png"
			style="margin-left: 50px; width: 100px; height: 100px;"></a>
		<nav id="navHeader">
			<ul>
				
				
				<li><a href="${hpath }/board/list.do">게시판</a>
					<ul>
						<li><a href="${hpath }/board/list.do" class="navbar-item">
								Notice </a></li>
						<li><a href="${hpath }/qna/list.do" class="navbar-item">
								QnA </a></li>
						<li><a href="${hpath }/free/list.do" class="navbar-item">
								Free </a></li>
						<li><a href="${hpath }/fileboard/list.do?pageNo=1"
							class="navbar-item"> Fileboard </a></li>

						<li><a href="${hpath }/service/online.do" class="navbar-item">
								Contact </a></li>
					</ul></li>
			</ul>
		</nav>
	</div>
</div>
</header>

</html>