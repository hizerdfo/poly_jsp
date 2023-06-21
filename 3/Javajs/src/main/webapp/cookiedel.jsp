<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	for(int i=0;i<cookies.length;i++){
	    String str = cookies[i].getName();
	    if(str.equals("memberId")){
	        //유효시간을 0초 설정 - 삭제하는 효과
	        cookies[i].setMaxAge(0);
	        response.addCookie(cookies[i]);
	        
	        out.println("삭제된 쿠키의 속성 이름(name[" + i + "])" + cookies[i].getName() + "<br />");
            out.println("삭제된 쿠키의 속성 값(value[" + i + "])" + cookies[i].getValue() + "<br />");
            out.println("===========================");
	    }
	}
%>
</body>
</html>