<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<li class="breadcrumb-item"><a href="${path0 }/GetQnaList.do">질문
								및 답변</a></li>
						<li class="breadcrumb-item active" aria-current="page">질문 등록</li>
					</ol>
				</nav>
				<hr>
			</div>
			<div style="width: 1400px; margin: 0 auto;">
				<h3 class="page_title">질문 등록</h3>
				<form action="${path0 }/QuestionIns.do" method="post">
					<div class="box box6">

						<h3>1. 동의사항</h3>
						<ul>
							<li>공개 문의 [제목]과 [내용]란에는 절대 개인정보를 입력하지 마세요.</li>
							<li>문의에 욕설, 인격침해, 성희롱 등 수치심을 유발하는 표현이 있다면 상담이 중단될 수 있습니다.</li>
							<li>질문에 따라 답변은 최소 1일에서 5일정도 걸릴 수 있습니다.</li>
						</ul>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="ck_item1"
								name="ck_item1"> <label for="ck_item1"
								class="form-check_lable">위 이용약관에 동의합니다.</label>
						</div>
					</div>

					<div class=" box7">
						<h3>2. 문의사항 작성하기</h3>
						<table>
							<colgroup>
								<col style="width: 13%">
								<col style="width: 37%">
								<col style="width: 13%">
								<col style="width: 37%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">종류</th>
									<td id="category"><select>
											<option value="0">계정</option>
											<option value="1">결제</option>
											<option value="2">환불</option>
											<option value="3">기타</option>

									</select></td>
									<th scope="secret">비밀글</th>
									<td>
										<form>
											<div>
												<input type="checkbox" id="secretQ" name="secretQ"
													value="secret" />
											</div>

										</form>
									</td>
								</tr>
								<tr>

									<th scope="row">고객명</th>
									<td colspan="1"><input type="text" style="width: 100px"
										class="input_st" id="qname" value="${mem.name}"></td>
									<th scope="row">ID</th>
									<td><input type="text" style="width: 239px"
										class="input_st" id="qid" value="${mem.id }"></td>
								</tr>



								<tr>
									<th scope="row">제목</th>
									<td colspan="3"><input type="text" style="width: 631px"
										class="input_st" id="qtitle"></td>
								</tr>
								<!-- 던파 비회원 접수 시 아이디 / 이름 입력 End -->
								<tr id="inquirytrText">
									<th>내용</th>
									<td colspan="3"><textarea class="input_st" id="qcontent"
											style="width: 700px; height: 150px"
											placeholder="여기에 오류 사항등을 기재하십시오"></textarea></td>
								</tr>


								<tr id="inquiry_email" class="reply-notice">
									<th scope="row">답변 알림받기</th>
									<td colspan="3">
										<div class="n_txt" style="display: inline-block;">
											<span name="renameText" id="reWriteEmailText"> ※ 답변 등록
												시 이메일로 발송해 드립니다. </span>
										</div>
										<div class="alarm_bx">
											<span class="checkbox_st1"> <input type="checkbox"
												id="inquiry_email_send"> <label
												for="inquiry_email_send"> <span name="nameText"
													id="spEmail">(선택) 이메일 수집 및 이용 동의</span>
											</label>

											</span> <br /> <input type="email" name="email" id="email"
												value="${mem.email }" class="form-control" required>

										</div>
									</td>
								</tr>

							</tbody>
						</table>
						

					</div>

					<div class="btn-group">
						<button type="submit" class="btn btn-secondary">질문 등록</button>
						<a href="${path0 }/GetQnaList.do" class="btn btn-secondary">질문
							및 답변 목록</a>
					</div>
				</form>
			</div>
		</section>
	</div>
	<div id="footer">
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>