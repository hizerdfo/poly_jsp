<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var ="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<style>
#tr_btn_modify{
display:none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type = "text/javascript">

function backToList(obj){
	obj.action = "${contextPath}/listArticles.do";
	obj.submit();
}
function fn_enable(obj){
	document.getElementById("i_title").disabled=false;
	document.getElementById("i_content").disabled=false;
	document.getElementById("tr_btn_modify").style.display="block";
	document.getElementById("tr_btn").style.display="none";
}
function fn_modify_article(obj){
	obj.action="${contextPath}/modArticle.do";
	obj.submit();
}
function fn_remove_article(url,articleNO){
	var form = document.createElement("form");
	form.setAttribute("method","post");
	form.setAttribute("action", url);
	var articleNOInput = document.createElement("input");
	articleNOInput.setAttribute("type", "hidden");
	articleNOInput.setAttribute("name", "articleNO");
	articleNOInput.setAttribute("value", articleNO);
	
	from.appendChild(articleNOInput);
	document.body.appendChild(form);
	form.submit();
}
function fn_reply_form(url, parentNO){
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action",url);
	var parentNOInput = ducument.createElement("input");
	parentNOInput.setAttribute("type","hidden");
	parentNOInput.setAttribute("name","parentNO");
	parentNOInput.setAttribute("value",parentNO);
	
	form.appendChild(parentNOInput);
	document.body.appendChild(form);
	from.submit();
}
</script>
</head>
<body>
	<form name="frmArticle" method="post" action="<%= request.getContextPath() %>" enctype="multipart/form-data">

	<table border ="0" align ="center">
	<tr>
	<td width ="150" align ="center" bgcolor="#FF9933">
	글번호
	</td>
	<td>
		<input type ="text" value ="${article.articleNO }" disabled/>
		<input type="hidden" name="articleNO" value="${article.articleNO}" />
	</td>
	</tr>
	<tr>
		<td width="150" align ="center" bgcolor ="#FF9933">
		작성자 아이디
	</td>
	<td>
	<input type="text" value="${article.id }" name="writer" disabled />
	</td>
	</tr>
	<tr>
		<td width ="150" align ="center" bgcolor ="#FF9933">
		제목
	</td>
	<td>
	<input type="text" value="${article.title }" name ="title" id="i_title" disabled/>
	</td>
	</tr>
	<tr><tr>
		<td width ="150" align ="center" bgcolor ="#FF9933">
		내용
	</td>
	<td>
	<textarea rows ="20" cols="60" name="content" id="i_content" disabled >${article.content }</textarea>
	</td>
	</tr>
	<tr>
		<td width="20%" align ="center" bgcolor="#FF9933">
		등록일자
		</td>
		<td>
		<input type =text value ="<fmt:formatDate value ="${article.postDate }"/>"disabled/>
		</td>
	</tr>
	<tr id = "tr_btn_modify">
		<td colspan ="2" align ="center">
			<input type= button value ="수정 반영하기" onClick="fn_modify_article(frmArticle)">
			<input type= button value ="취소" onClick="backToList(frmArticle)">
		</td>
	</tr>
	<tr id="tr_btn">
		<td colspan =2 align ="center">
		<input type=button value ="수정하기" onClick ="fn_enable(this.form)">
		<input type=button value="삭제하기" onClick ="fn_remove_article('${contextPath}/removeArticle.do', ${article.articleNO })">
		<button onclick="location.href='${contextPath}/listArticles.do'" type="button">목록보기</button>
		<input type=button value="답글쓰기" onClick ="fn_reply_form('${contextPath}/replyForm.do', ${article.articleNO })">
 	</td>
 	</tr>
 	</table>
	</form>
</body>
</html>