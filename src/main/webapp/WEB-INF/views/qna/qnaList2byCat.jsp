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
<link rel="stylesheet" href="${hpath }/resources/css/qna.css?after3"/>

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
				<div class="box4 box4_1"
					onclick="window.location.href=
'${path0 }/qna/list.do#page1'">
					<span>전체보기</span></div>
				<div class="box4 box4_2"
					onclick="window.location.href=
'${path0 }/qna/catelist.do?cat=acc#page1'">
					<span>계정</span>
				</div>
				<div class="box4 box4_3"
					onclick="window.location.href=
'${path0 }/qna/catelist.do?cat=pay#page1'">
					<span>결제</span>
				</div>
				<div class="box4 box4_4"
					onclick="window.location.href=
'${path0 }/qna/catelist.do?cat=ref#page1'">
					<span>환불</span>
				</div>
				<div class="box4 box4_5"
					onclick="window.location.href=
'${path0 }/qna/catelist.do?cat=etc#page1'">
					<span>기타</span>
				</div>
				<div class="box box5">
					<div class="tab-content">
						<div class="tabs__tab active" id="tab_1" >
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
												
													 </c:if><c:if test="${dto.cate=='pay'}">결제</c:if><c:if test="${dto.cate=='ref'}"> 환불
												
													 </c:if><c:if test="${dto.cate=='etc'}"> 기타
												
													 </c:if></td>
												<td><c:if test="${(empty sid) or (dto.secret  and !sid.equals(dto.member.qaid) and (sid ne 'admin'))}"> 
														<c:if test="${dto.qlevel==1 }">
															<strong class="page_title">${dto.qtitle } ${dto.secret }</strong>
														</c:if>
														<c:if test="${dto.qlevel==2 }">
															<strong style="padding-left: 40px" class="page_title">[답변]
																${dto.qtitle }</strong>
														</c:if>
													</c:if> <c:if test="${(not empty sid) and (dto.qlevel==1) and !dto.secret}">
														<a href="${path0 }/qna/detail.do?qno=${dto.qno }">${dto.qtitle } ${dto.secret }</a>
													</c:if> <c:if test="${(not empty sid) and (dto.qlevel==2)and !dto.secret}">
														<a href="${path0 }/qna/detail.do?qno=${dto.qno }"><span
															style="padding-left: 40px">[답변]</span> ${dto.qtitle }</a>
													</c:if></td>
												<td><fmt:parseDate value="${dto.qresdate }" var="res"
														pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
														value="${res }" var="resdate" pattern="yyyy년 MM월 dd일" />
													${resdate }</td>
												<td>${dto.qhits }</td>
													<td>${dto.member.qaid }</td>  
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
								<a href="${path0 }/qna/insertQues.do" class="btns">질문 작성</a>
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