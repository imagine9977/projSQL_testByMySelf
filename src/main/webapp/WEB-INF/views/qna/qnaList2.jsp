<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<%@ include file="../include/head.jsp"%>

<style>
.container {
	width: 1500px;
	margin: auto;
}

.contents {
	background-color: #1B1B1B;
}

.page {
	clear: both;
	width: 1500px;
	margin: auto;
	background-color: #1B1B1B;
}

#page1 {
	background-color: #1B1B1B;
}

.page_title {
	font-size: 30px;
	padding-top: 2em;
	text-align: center;
}

th.item1 {
	width: 8%;
}

th.item2 {
	width: 8%;
}

th.item3 {
	width: 50%;
}

th.item4 {
	width: 15%;
}

th.item5 {
	width: 10%;
}

.display_title {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

body {
	width: 100%;
	height: 100%;
	align-items: center;
	margin: auto;
	background-color: #1B1B1B;
}

.parent {
	display: inline-grid;
	grid-template-columns: repeat(7, 1fr);
	grid-template-rows: repeat(12, 180px);
	grid-column-gap: 10px;
	grid-row-gap: 5px;
}

.box {
	text-align: center;
	padding: 20px;
}

.box1 {
	font-size: 40px;
	color: white;
	grid-column: 1/8;
	grid-column-start: 1;
	padding: auto;
}

.box2 {
	background-color: #00cf12;
	grid-row: 2/8;
	grid-column-start: 1;
}

.box3_1 {
	background-color: #ff9019;
	grid-column: 2/7;
	grid-row-start: 2;
	padding-top: 10px;
}

.box3_2 {
	background-color: #ff9019;
	grid-column: 7;
	grid-row-start: 2;
}

.box4_1 {
	grid-column-start: 2;
	grid-row-start: 3;
	width: 100%;
	height: 100%;
}

.box4_2 {
	grid-column-start: 3;
	grid-row-start: 3;
}

.box4_3 {
	grid-column-start: 4;
	grid-row-start: 3;
}

.box4_4 {
	grid-column-start: 5;
	grid-row-start: 3;
}

.box4_5 {
	grid-column-start: 6;
	grid-row-start: 3;
}

.box5 {
	background-color: #55b61d;
	grid-column: 2/7;
	grid-row: 4/8;
}

.box6 {
	background-color: #ffd000;
	grid-column: 2/8;
	grid-row: 8/10;
	display: inline-grid;
	height: fit-content;
}

.box6 ul {
	text-align: left;
}

.box7 {
	background-color: #ffd000;
	grid-column: 2/7;
	grid-row: 10/12;
	display: inline-grid;
	height: fit-content;
	padding: 10px;
}

.tablePart {
	display: flex;
	float: left;
	justify-content: space-evenly;
	padding: 10px;
}

.container {
	border: 1px solid grey;
	margin: 1rem;
}


.box4 {
	border-bottom: 1px solid grey;
	background-color: #272727; font-size : 25px;
	color: white;
	display: flex; /* new */
	justify-content: center;
	align-items: center;
	text-align: center;
	cursor: pointer;
	font-size: 25px;
	
	
}

.box4:hover {
	filter: brightness(150%);
}

.button1 {
	background-color: #04AA6D; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="header">
		<%@ include file="../include/header.jsp"%>
	</div>
	<div id="contents">
		<section class="page" id="page1">
			<div class="parent">
				<div class="box box1">SqlGaming 고객센터</div>
				<div class="box box2">box 2</div>
				<div class="box box3_1">문의유형을 선택하면 해당 유형에 맞는 [자주 묻는 질문]을 확인할 수 있습니다. 필요한 도움말이 없으면 문의를 이용해보세요.</div>
				<div class="box box3_2">자세한</div>
				<div class="box4 box4_1">
					<span data-tab-value="#tab_1">전체보기</span>
				</div>
				<div class="box4 box4_2"
					onclick="window.location.href=
'${path1 }/qna/catelist.do?cat=acc#page1'">
					<span data-tab-value="#tab_2">계정</span>
				</div>
				<div class="box4 box4_3"
					onclick="window.location.href=
'${path1}/qna/catelist.do?cat=pay#page1'">
					<span data-tab-value="#tab_3">결제</span>
				</div>
				<div class="box4 box4_4"
					onclick="window.location.href=
'${path1 }/qna/catelist.do?cat=ref#page1'">
					<span data-tab-value="#tab_4">환불</span>
				</div>
				<div class="box4 box4_5"
					onclick="window.location.href=
'${path1 }/qna/catelist.do?cat=etc#page1'">
					<span data-tab-value="#tab_5">기타</span>
				</div>
				<div class="box box5">
					<div class="tab-content">
						<div class="tabs__tab active" id="tab_1" data-tab-info>
							<h4>전체보기 결과</h4>
							<table class="table" id="tb1">
								<thead>
									<tr>
										<th class="item1">번호</th>
										<th class="item2">분류</th>
										<th class="item3">제목</th>
										<th class="item4">작성일</th>
										<th class="item5">조회수</th>
										<th class="item6">작성자</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty qnaList }">
										<c:forEach var="dto" items="${qnaList }" varStatus="status">
											<tr>
												<td>${fn:length(qnaList) - status.index }</td>
												<td><c:if test="${dto.cate=='acc'}"> 계정
												
													 </c:if> <c:if test="${dto.cate=='pay'}">결제</c:if> <c:if
														test="${dto.cate=='ref'}"> 환불
												
													 </c:if> <c:if test="${dto.cate=='etc'}"> 기타
												
													 </c:if></td>
												<td><c:if test="${(empty sid) or (dto.secret eq true)}">
														<c:if test="${dto.qlevel==1 }">
															<strong class="page_title">${dto.qtitle }</strong>
														</c:if>
														<c:if test="${dto.qlevel==2 }">
															<strong style="padding-left: 40px" class="page_title">[답변]
																${dto.qtitle }</strong>
														</c:if>
													</c:if> <c:if test="${(not empty sid) and (dto.qlevel==1)}">
														<a href="${path1 }/qna/detail.do?qno=${dto.qno }">${dto.qtitle }</a>
													</c:if> <c:if test="${(not empty sid) and (dto.qlevel==2)}">
														<a href="${path1 }/qna/detail.do?qno=${dto.qno }"><span
															style="padding-left: 40px">[답변]</span> ${dto.qtitle }</a>
													</c:if></td>
												<td><fmt:parseDate value="${dto.qresdate }" var="res"
														pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
														value="${res }" var="resdate" pattern="yyyy년 MM월 dd일" />
													${resdate }</td>
												<td>${dto.qhits }</td>
												<td>${dto.getMember().id }</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty qnaList }">
										<tr>
											<td colspan="5"><strong>질문 및 답변이 존재하지 않습니다.</strong></td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<script>
								$(document).ready(function() {
									$("#tb1").DataTable({
										order : [ [ 0, "desc" ] ]
									});
								});
							</script>
						</div>
						<hr>
						<c:if test="${not empty sid }">
							<div class="btn-group">
								<a href="${path1 }/qna/insertQues.do" class="btns">질문 작성</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div id="footer">
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>