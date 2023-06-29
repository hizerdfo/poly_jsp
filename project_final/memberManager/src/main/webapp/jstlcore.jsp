<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    
    <!-- set/ out -->
    <c:set var="varName" value ="홍길동"/>
    varName : <c:out value ="${varName }"/>
    <br />
    
    <!-- remove-->
    <c:remove var ="varName"/>
    varName 제거 후 : <c:out value ="$${varName }"/>
    <hr />
    <!-- catch 사용 예-->
    <c:catch var ="error">
        <%=2/0 %>
    </c:catch>
    <c:out value ="${error }"/>
    <hr/>
    
    <!-- if사용 예-->
    <c:if test ="${1 + 2 == 3 }">
    1 + 2 = 3
    </c:if><br>
    <c:if test ="${1 + 2 != 3 }">
    1 + 3 != 3
    </c:if>
    <hr />
    
    <!-- choose -->
    <c:set var="varname" value="홍길순"/>
    <c:choose>
        <c:when test ="${varname == '홍길동' }"> when:홍길동</c:when>
        <c:otherwise>when:다른사람</c:otherwise>
    </c:choose>
    <hr />
    
    <!-- forEach 사용 예 -->
    <c:forEach var ="fEach" begin="0" end="30" step ="3">
        ${fEach }
    </c:forEach><p>
    <hr />
    
    <%  
        List<String> fruits = new ArrayList<String>();
        fruits.add("사과");
        fruits.add("배");
        fruits.add("바나나");
        fruits.add("감");
        fruits.add("귤");
        
        pageContext.setAttribute("aFruits", fruits);
        
    %>
    <ul>
    <c:forEach var = "result" items = "${aFruits}" >
        <li>${result }</li>
    </c:forEach><p>
    </ul>
    <%
    pageContext.setAttribute("aEach","홍길동, 홍순이, 홍길순");
    %>
    <ul>
    <c:forEach var ="result" items="${aEach }">
    <li>${result }</li>
    </c:forEach>
    </ul>
    <hr>
    <c:redirect url ="ex1.jsp">
        <c:param name ="name" value="홍길동" />
    </c:redirect>
</body>
</html>