<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path0" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<%@ include file="../include/head.jsp"%>

<style>
.container {
	width: 1400px;
}

.page {
	clear: both;
	height: 100vh;
}

#page1 {
	background-color: #ececec;
}

#page2 {
	background-color: #42bcf5;
}

.page_title {
	font-size: 36px;
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
            width: 1200px;
            height: 100%;
            align-items: center;
            margin: auto;
        }

        .parent {
            display: inline-grid;

            grid-template-columns: repeat(6, 1fr);
            grid-template-rows: repeat(12, 100px);
            grid-column-gap: 10px;
            grid-row-gap: 5px;
        }

        .box {
            text-align: center;
            padding: 20px;
        }

        .box1 {
            background-color: #3689ff;
            grid-column: 1/7;
            grid-column-start: 1;
            padding-top: 30px;
            font-size: 20px;
        }

        .box2 {
            background-color: #00cf12;
            grid-row: 2/8;
            grid-column-start: 1;
        }

        .box3_1 {
            background-color: #ff9019;
            grid-column: 2/6;
            grid-row-start: 2;
            padding-top: 10px;
        }

        .box3_2 {
            background-color: #ff9019;
            grid-column: 6;
            grid-row-start: 2;
        }

        .box4_1 {
            background-color: #ffd000;
            grid-column-start: 2;
            grid-row-start: 3;
        }

        .box4_2 {
            background-color: #ffd000;
            grid-column-start: 3;
            grid-row-start: 3;
        }

        .box4_3 {
            background-color: #ffd000;
            grid-column-start: 4;
            grid-row-start: 3;
        }

        .box4_4 {
            background-color: #ffd000;
            grid-column-start: 5;
            grid-row-start: 3;
        }

        .box4_5 {
            background-color: #ffd000;
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
            grid-column: 2/7;
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

        [data-tab-info] {
            display: none;
        }

        .active[data-tab-info] {
            display: block;
        }

        .tab-content {
            margin-top: 1rem;
            padding-left: 1rem;
            font-size: 20px;
            font-family: sans-serif;
            font-weight: bold;
            color: rgb(0, 0, 0);
        }

        .box4 {
            border-bottom: 1px solid grey;
            background-color: rgb(16, 153, 9);
            font-size: 25px;
            color: rgb(0, 0, 0);
            display: inherit;
            white-space: nowrap;
            margin: 0;
        }

        .box4 span {
            background: rgb(28, 245, 17);
            padding: 10px;
            border: 1px solid rgb(255, 255, 255);
        }

        .box4 span:hover {
            background: rgb(55, 219, 46);
            cursor: pointer;
            color: black;
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
			<div style="width: 1400px; margin: 0 auto;">
				<nav aria-label="breadcrumb" style="text-align: right">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item"><a href="${path0 }/list.do">질문
								및 답변</a></li>
						<li class="breadcrumb-item active" aria-current="page">질문 및
							답변 목록</li>
					</ol>
				</nav>
				<hr>
			</div>
			<h1>Notice Table</h1>
			<label for="category">분류:</label> <select id="category"
				name="category">
				<option value="All">All</option>
				<option value="ACC">계정</option>
				<option value="PAY">결제</option>
				<option value="REF">환불</option>
				<option value="ETC">기타</option>
			</select>

			<div style="width: 1400px; margin: 0 auto;">
				<h3 class="page_title">질문 및 답변</h3>
				<div>
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
										<td>${dto.cate}</td>
										<td><c:if test="${(empty sid) or (dto.secret=1)}">
												<c:if test="${dto.qlevel==1 }">
													<strong class="page_title">${dto.qtitle }</strong>
												</c:if>
												<c:if test="${dto.qlevel==2 }">
													<strong style="padding-left: 40px" class="page_title">[답변]
														${dto.qtitle }</strong>
												</c:if>
											</c:if> <c:if test="${(not empty sid) and (dto.qlevel==1)}">
												<a href="${path0 }/detail.do?no=${dto.qno }">${dto.qtitle }</a>
											</c:if> <c:if test="${(not empty sid) and (dto.qlevel==2)}">
												<a href="${path0 }/detail.do?no=${dto.qno }"><span
													style="padding-left: 40px">[답변]</span> ${dto.qtitle }</a>
											</c:if></td>
										<td><fmt:parseDate value="${dto.qresdate }" var="res"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${res }" var="resdate" pattern="yyyy년 MM월 dd일" />
											${resdate }</td>
										<td>${dto.qhits }</td>
										<td>${dto.member.getId }</td>
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
					<hr>
					<c:if test="${not empty sid }">
						<div class="btn-group">
							<a href="${path0 }/qna/qIns.jsp" class="btn btn-secondary">질문
								등록</a>
						</div>
					</c:if>
				</div>
			</div>
		</section>
	</div>
	<div id="footer">
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>