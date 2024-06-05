<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${qno }  ${qtitle }</title>
<%@ include file="../include/head.jsp" %>
<style>
.container { width:1400px; }
.page { clear:both; height:100vh; }
#page1 { background-color:#ececec; }
#page2 { background-color:#42bcf5; }
.page_qtitle { font-size:36px; padding-top:2em; text-align:center; }
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
			    <li class="breadcrumb-item active" aria-current="page">질문 등록</li>
			  </ol>
			</nav>
			<hr>
		</div>
		<%
			int qparno = Integer.parseInt(request.getParameter("qparno"));
			pageContext.setAttribute("qparno", qparno);
		%>
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_qtitle">답변 등록</h3>
			<form action="${path0 }/qna/insertAnswPro.do" method="post">
				<table class="table">
					<tbody>
						
						<tr>
						
							<th><label for="content">내용</label></th>
							<td>
								<input type="hidden" name="qparno" id="qparno" value="${qparno }" />
								<textarea name="content" id="content" rows="8" cols="80" class="form-control"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<div class="btn-group">
				  <button type="submit" class="btn btn-secondary">답변 등록</button>
				  <a href="${path0 }/qna/getQnaList.do" class="btn btn-secondary">질문 및 답변 목록</a>
				</div>
			</form>
		</div>
	</section>
</div>
<div id="footer">
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>