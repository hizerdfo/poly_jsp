<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>새글쓰기</title>
</head>
<body>
<h1 style= "text-align:center"> 새글쓰기</h1>
<form name = "articleForm" method ="post" action = "${contextPath }/addArticle.do">
<table border =0 align = "center">
    <tr>
	    <td align = "right"> 글제목: </td>
	    <td colspan =2><textarea name ="content" rows ="10" cols="65" maxlength="4000"></textarea></td>
    </tr>
    <tr>
    <td align ="right"></td>
    <td colspan ="2">
        <input type="submit" value="글쓰기" />
        <input type=button value ="목록보기" onclick="backToList(this.form)"/>
    </td>
    </tr>
</table>
</form>
</body>
</html>