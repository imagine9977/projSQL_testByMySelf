<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hpath" value="<%=request.getContextPath()%>" />
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
						<li class="breadcrumb-item"><a href="${hpath }/GetQnaList.do">질문
								및 답변</a></li>
						<li class="breadcrumb-item active" aria-current="page">글 수정</li>
					</ol>
				</nav>
				<hr>
			</div>

			<div style="width: 1400px; margin: 0 auto;">
				<c:if test="${qna.qlevel==1 }">
					<h3 class="page_title">질문 수정</h3>
				</c:if>
				<c:if test="${qna.qlevel==2 }">
					<h3 class="page_title">답변 수정</h3>
				</c:if>
				<form action="${hpath}/qna/updatePro.do" method="post"
					onsubmit="addHiddenInputForCheckboxes()">

					<table class="table">
						<colgroup>
							<col style="width: 13%">
							<col style="width: 37%">
							<col style="width: 13%">
							<col style="width: 37%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">비밀글</th>
								<td><c:if test="${qna.qlevel==1 }">
										<c:if test="${qna.secret }">
											<input type="checkbox" id="secret" name="secret"
												value="${qna.secret }" checked data-switchval />
										</c:if>
										<c:if test="${!qna.secret }">
											<input type="checkbox" id="secret" name="secret"
												value="${qna.secret }" data-switchval />
										</c:if>
									</c:if> <c:if test="${qna.qlevel==2 }">
										<c:if test="${qna.secret }">
											<input type="checkbox" id="secret" name="secret"
												value="${qna.secret }" checked disabled />
										</c:if>
										<c:if test="${!qna.secret }">
											<input type="checkbox" id="secret" name="secret"
												value="${qna.secret }" disabled />
										</c:if>
									</c:if>
									<div></div></td>

								<th>답변 상태</th>
								<td> <c:if test="${sid == 'admin'}">
										<c:if test="${qna.replied }">
											<input type="checkbox" id="replied" name="replied"
												value="${qna.replied }" checked data-switchval />
										</c:if>
										<c:if test="${!qna.replied }">
											<input type="checkbox" id="replied" name="replied"
												value="${qna.replied }" data-switchval />
										</c:if>
										</c:if> <c:if test="${sid != 'admin' }">유저 제한</c:if></td>
							</tr>
							<tr>
								<th><label for="qtitle">제목</label></th>
								<td><input type="hidden" name="qno" id="qno"
									value="${qna.qno }"> <c:if test="${ qna.qlevel == 1}">
										<input type="text" name="qtitle" id="qtitle"
											class="form-control" maxlength="100" value="${qna.qtitle }"
											required>
									</c:if> <c:if test="${ qna.qlevel == 2}">
										<input type="text" name="qtitle" id="qtitle"
											class="form-control" maxlength="100" value="${qna.qtitle }"
											disabled>
										<input type="hidden" name="qtitle" value="${qna.qtitle}">
									</c:if></td>


							</tr>
							<tr>
								<th><label for="qcontent">내용</label></th>
								<td><textarea name="qcontent" id="qcontent" rows="8"
										cols="80" class="form-control">${qna.qcontent }</textarea></td>
							</tr>
							<tr>
								<th><label for="qresdate">작성일시</label></th>
								<td><input type="text" name="qresdate" id="qresdate"
									class="form-control" value="${qna.qresdate }" disabled>
								</td>
							</tr>
							<tr>
								<th><label for="qvisited">읽은횟수</label></th>
								<td><input type="text" name="qhits" id="qhits"
									class="form-control" value="${qna.qhits }" disabled></td>
							</tr>
						</tbody>

					</table>
					<hr>
					<div class="btn-group">
						<button type="submit" class="btn btn-secondary">질문 및 답변
							수정</button>
						<a href="${hpath }/qna/list.do" class="btn btn-secondary">질문 및
							답변 목록</a> <a href="${hpath }/qna/detail.do?qno=${qna.qno} "
							class="btn btn-secondary">뒤로가기</a>
					</div>
				</form>

				<script>
					
					</script>
				<script>
				document.querySelectorAll('[data-switchval]').forEach(checkbox => {
			        checkbox.addEventListener('change', e => {
			            e.target.value = e.target.checked;
			            console.log('current value of checkbox:', e.target.value);
			        });
			    });

			    // 체크되지 않은 체크박스에 대해 hidden input 추가
			    function addHiddenInputForCheckboxes() {
			        document.querySelectorAll('input[type="checkbox"]').forEach(function(checkbox) {
			            if (!checkbox.checked) {
			                var hiddenInput = document.createElement('input');
			                hiddenInput.type = 'hidden';
			                hiddenInput.name = checkbox.name;
			                hiddenInput.value = 'false';
			                checkbox.form.appendChild(hiddenInput);
			            }
			        });
    			}
				</script>
			</div>
		</section>
	</div>
	<div id="footer">
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>