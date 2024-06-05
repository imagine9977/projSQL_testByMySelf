<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<%@ include file="../include/head.jsp" %>
<style>
.container { width:1400px; }
.page { clear:both; height:100vh; }
#page1 { background-color:#ececec; }
#page2 { background-color:#42bcf5; }
.page_title { font-size:36px; padding-top:2em; text-align:center; }
th.item1 { width:8%; }
th.item2 { width:60%; }
th.item3 { width:20%; }
td {
word-break: break-word;

}
</style>
</head>
<body>
<div id="header">
	<%@ include file="../include/header.jsp" %>
</div>
<div id="contents">
	<section class="page" id="page1">
		<div style="width:1400px; margin:0 auto;">
			<nav aria-label="breadcrumb" style="text-align:right">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">Home</a></li>
			    <li class="breadcrumb-item"><a href="${path0 }/GetQnaList.do">질문 및 답변</a></li>
			    <li class="breadcrumb-item active" aria-current="page">질문 및 답변 상세보기</li>
			  </ol>
			</nav>
			<hr>
		</div>
		<div style="width:1400px; margin:0 auto; ">
			<h3 class="page_title">질문 및 답변 상세보기</h3>
			<div>
				<table class="table" >
					<tbody>
						<tr>
							<th>글 번호</th>
							<td>${qna.qno }</td>
						</tr>
						<tr>
							<th>글 제목</th>
							<td>${qna.qtitle }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${qna.member.id }</td>
						</tr>
						<tr>
							<th>글 내용</th>
							
							<td><div style="width:100%; ">
							
							${qna.qcontent }
							</div></td>
						</tr>
						<tr>
							<th>작성일시</th>		
							<td>${qna.qresdate }</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td>${qna.qhits }</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<div class="btn-group">
				  <c:if test="${(not empty sid) and qna.qlevel==1 }">
				  <a href="${path0 }/qna/insertAnsw.do?qparno=${qna.qno }" class="btn btn-secondary">답변 등록</a>
				  </c:if>
				  <c:if test="${sid.equals(qna.member.qaid) }">
					  <c:if test="${qna.qlevel==1 }"> 
					  <a href="${path0 }/qna/update.do?qno=${qna.qno }" class="btn btn-secondary">질문 수정</a>
					  <a href="${path0 }/qna/delqna.do?qparno=${qna.qno }" class="btn btn-secondary">질문 삭제</a>
					  </c:if>
					  <c:if test="${qna.qlevel==2 }">
					  <a href="${path0 }/qna/update.do?qno=${qna.qno }" class="btn btn-secondary">답변 수정</a>
					  <a href="${path0 }/qna/delansw.do?qno=${qna.qno }" class="btn btn-secondary">답변 삭제</a>
					  </c:if>
  				  </c:if>
				  <a href="${path0 }/qna/list.do" class="btn btn-secondary">질문 및 답변 목록</a>
				</div>
			</div>
			<div class="see reply">
				<c:if test="${sid.equals(qna.member.qaid)}" ></c:if>
			</div>
		</div>
	</section>
	<section class="page" id="page2">
		<div style="width:1400px; margin:0 auto;">	
			<h3 class="page_title"></h3>

		</div>	
	</section>	
</div>
<div id="footer">
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>