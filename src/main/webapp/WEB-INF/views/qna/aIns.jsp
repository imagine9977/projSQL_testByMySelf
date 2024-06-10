<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="hpath" value="<%=request.getContextPath()%>" />
<c:set var="cate" value="${param.cate}" />
<c:set var="secret" value="${param.secret}" />
<%@ page import="com.proj03.dto.Qna" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${qno }${qtitle }</title>
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

.page_qtitle {
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
                        <li class="breadcrumb-item"><a href="${hpath}/GetQnaList.do">질문 및 답변</a></li>
                        <li class="breadcrumb-item active" aria-current="page">질문 등록</li>
                    </ol>
                </nav>
                <hr>
            </div>
            <%
            
            int qparno = 0;
 
            String cate = "";
            boolean secret = false;
            String qtitle= "";

            try {
            	cate = request.getParameter("cate");
            	qtitle = request.getParameter("qtitle");
                qparno = Integer.parseInt(request.getParameter("qparno"));
                secret = Boolean.parseBoolean(request.getParameter("secret"));
            } catch (NumberFormatException e) {
                // Handle error and set default values or redirect with an error message
            }

            pageContext.setAttribute("cate", cate);
            pageContext.setAttribute("secret", secret);
            pageContext.setAttribute("qparno", qparno);
            pageContext.setAttribute("qtitle", qtitle);
            %>
            <div style="width: 1400px; margin: 0 auto;">
                <h3 class="page_qtitle">답변 등록</h3>
                <form action="${hpath}/qna/insertAnswPro.do" method="post">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">비밀글</th>
                                <td>
                    
                                    <input type="hidden" name="cate" id="cate" value="${cate}" />
                                    <input type="hidden" name="qtitle" id="qtitle" value="${qtitle}" />
                                    <c:if test="${secret}">
                                        <div>
                                            <input type="checkbox" id="secret" name="secret" value="true" data-switchval disabled="disabled"/> 원문이 비밀글이므로 해제 불가능
                                        </div>
                                    </c:if>
                                    <c:if test="${!secret}">
                                        <div>
                                            <input type="checkbox" id="secret" name="secret" value="false" data-switchval />
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">고객명</th>
                                <td colspan="1"><input type="text" style="width: 100px" class="input_st" id="qname" value="${sname}" placeholder="${sname}" disabled></td>
                                <th scope="row">ID</th>
                                <td><input type="text" style="width: 239px" class="input_st" id="qid" value="${sid}" placeholder="${sid}" disabled></td>
                            </tr>
                            <tr>
                                <th><label for="content">내용</label></th>
                                <td><input type="hidden" name="qparno" id="qparno" value="${qparno}" /> <textarea name="qcontent" id="qcontent" rows="8" cols="80" class="form-control"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>
                    <div class="btn-group">
                        <button type="submit" class="btn btn-secondary">답변 등록</button>
                        <a href="${hpath}/qna/list.do" class="btn btn-secondary">질문 및 답변 목록</a>
                    </div>
                </form>
            </div>
            <script>
                document.querySelector('[data-switchval]').addEventListener('change', e => {
                    e.target.value = e.target.checked;
                    console.log('current value of checkbox:', e.target.value);
                });
            </script>
        </section>
    </div>
    <div id="footer">
        <%@ include file="../include/footer.jsp"%>
    </div>
</body>

</html>