<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
isELIgnored ="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var ="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
</head>
<body>
    <table align="center" border="1" width="80%">
        <tr height="10" align="center" bgcolor="black">
            <td>글번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>작성일</td>
        </tr>
        <c:choose>
            <c:when test="${empty articlesList}">
                <tr height="10">
                    <td colspan="4">
                        <p align="center">
                            <b>등록된 글이 없습니다.</b>
                        </p>
                    </td>
                </tr>
            </c:when>
            <c:when test="${!empty articlesList}">
                <c:forEach var="article" items="${articlesList}" varStatus="articleNum">
                    <tr align="center">
                        <td width="5%"><c:out value="${articleNum.count}" /></td>
                        <td width="10%"><c:out value="${article.id}" /></td>
                        <td align="left" width="35%">
                            <span style="padding-right:30px;"></span>
                            <c:choose>
                                <c:when test ='${article.level>1 }'>
                                    <c:forEach begin="1" end="${article.level}" step="1">
                                        <span style="padding-left:20px"></span>
                                    </c:forEach>
                                    <span>답변</span>
                                    <a class='cls1' href="${contextPath}/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
                                </c:when>
                                <c:otherwise>
                                    <a class='cls1' href="${contextPath}/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td width="10%"><fmt:formatDate value="${article.postDate}" /></td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
    </table>                                                             
    <form action="http://localhost:8080/noticeBoardMVC/articleForm.do" method="post">
        <button type="submit" class="cls1">글쓰기</button>
    </form>
</body>
</html>
