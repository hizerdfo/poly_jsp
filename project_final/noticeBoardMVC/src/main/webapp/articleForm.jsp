<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src ="http://code.jquery.com/jquery-latest.min.js"></script>
<script type ="text/javascript">
	function backToList(obj){
		obj.action="${contextPath}/listArticles.do";
		obj.submit();
	}
</script>
<title>새글쓰기</title>
</head>
<body>
<h1 style="text-align:center">새글쓰기</h1>
<form name="articleForm" method="post" action="${contextPath}/addArticle.do" enctype ="multipart/form-data">
    <table border="0" align="center">
        <tr>
            <td align="right">글제목:</td>
            <td colspan="2"><input type="text" size="70" maxlength="500" name="title"/></td>
        </tr>
        <tr>
            <td align="right">글내용:</td>
            <td colspan="2"><textarea name ="content" rows ="10" cols ="65" maxlength="4000"></textarea></td>
        </tr>
        <tr>
            <td align="right"></td>
            <td colspan="2">
                <input type="submit" value="글쓰기" />
                <button onclick="location.href='${contextPath}/listArticles.do'" type="button">목록보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
