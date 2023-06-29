<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession adminsession = request.getSession();
    String adminId = (String) adminsession.getAttribute("adminId"); 

    if (adminId == null) {
        response.sendRedirect("menu.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="login.css">
    <meta charset="EUC-KR">
    <title>관리자 로그인</title>
</head>
<body>
    <h1>관리자 로그인</h1>
    <h2><%= adminId %>님 환영합니다.</h2> <br />
    <!-- 하트 이미지 삽입 -->
    <div style="display: flex; justify-content: center;">
    <svg width="250" height="250" viewBox="0 0 200 200">
    <g transform="translate(100 100)">
		 <style type="text/css">
		  .st0{fill:#E52E44;}
		  .st1{fill:#FA4654;}
		  .st2{fill:#EA792E;}
		  .st3{fill:#FF8B00;}
		  .st4{fill:#E2A427;}
		  .st5{fill:#F9C744;}
		  .st6{fill:#14A36D;}
		  .st7{fill:#15BE79;}
		  .st8{fill:#0989D8;}
		  .st9{fill:#29A3FB;}
		  .st10{fill:#8D00AF;}
		  .st11{fill:#AA0DD1;}
		  .st12{fill:#FB626E;}
		  .st13{fill:#FBD9A3;}
		  .st14{fill:#FFAC52;}
		</style>
		<g transform="translate(-50 -50)">
		  <g>
		    <path class="st0" d="M92.5,44.5L55,82c-2.7,2.7-7.2,2.7-9.9,0L13.9,50.9l-6.4-6.4C2.5,39.5,0,33,0,26.4c0-6.5,2.5-13.1,7.5-18.1
		      c1.2-1.2,2.5-2.3,3.9-3.2c9.9-6.6,23.5-5.5,32.2,3.2l6.4,6.4l6.4-6.4c5-5,11.5-7.5,18.1-7.5c6.5,0,13.1,2.5,18.1,7.5
		      C102.5,18.3,102.5,34.5,92.5,44.5z"/>
		    <path class="st1" d="M92.5,44.5L62.1,74.9c-2.7,2.7-7.2,2.7-9.9,0L21,43.8l-6.4-6.4c-5-5-7.5-11.5-7.5-18.1
		      c0-4.9,1.4-9.9,4.3-14.1c9.9-6.6,23.5-5.5,32.2,3.2l6.4,6.4l6.4-6.4c5-5,11.5-7.5,18.1-7.5c6.5,0,13.1,2.5,18.1,7.5
		      C102.5,18.3,102.5,34.5,92.5,44.5z"/>
		    <path class="st2" d="M50,14.8L50,14.8l-47.2,0C0.9,18.4,0,22.4,0,26.4c0,0.7,0,1.5,0.1,2.2h99.8c0.4-4.7-0.5-9.5-2.7-13.9L50,14.8
		      L50,14.8z"/>
		    <path class="st3" d="M50,14.8L50,14.8l-42.5,0c-0.3,1.5-0.4,3-0.4,4.5c0,3.2,0.6,6.3,1.8,9.3h91c0.4-4.7-0.5-9.5-2.7-13.9L50,14.8
		      L50,14.8z"/>
		    <path class="st4" d="M5.7,42.5h88.6c3.3-4.1,5.2-8.9,5.6-13.9H0.1C0.5,33.6,2.4,38.4,5.7,42.5z"/>
		    <path class="st5" d="M99.9,28.6h-91c1.2,3.2,3.1,6.2,5.7,8.7l5.1,5.1h74.6C97.6,38.4,99.5,33.6,99.9,28.6z"/>
		    <path class="st6" d="M5.7,42.5c0.6,0.7,1.2,1.4,1.8,2l6.4,6.4l5.5,5.5h61.3l11.9-11.9c0.6-0.6,1.2-1.3,1.8-2H5.7z"/>
		    <path class="st7" d="M19.7,42.5l1.3,1.3l12.6,12.6h47l11.9-11.9c0.6-0.6,1.2-1.3,1.8-2H19.7z"/>
		    <polygon class="st8" points="33.2,70.2 66.8,70.2 80.6,56.4 19.3,56.4    "/>
		    <polygon class="st9" points="80.6,56.4 33.6,56.4 47.5,70.2 66.8,70.2    "/>
		    <path class="st10" d="M66.8,70.2H33.2L45,82c2.7,2.7,7.2,2.7,9.9,0L66.8,70.2z"/>
		    <path class="st11" d="M47.5,70.2l4.7,4.7c2.7,2.7,7.2,2.7,9.9,0l4.7-4.7H47.5z"/>
		  </g>
		  <path class="st12" d="M91.1,19.3c-2.1,2.9-7.7,2.4-12.5-1.2c-1.4-1-2.5-2.2-3.4-3.4c-2.2-3-2.9-6.2-1.3-8.2
		    c2.1-2.9,7.7-2.3,12.5,1.2c2.8,2.1,4.6,4.7,5.3,7.1C92.2,16.5,92,18.1,91.1,19.3z"/>
		  <path class="st13" d="M93.7,35.3c-2.2,0.3-4.5-2.4-5-6.1c0-0.2,0-0.4-0.1-0.5c-0.4-3.5,1-6.5,3.1-6.8c2.2-0.3,4.5,2.4,5,6.1
		    c0,0.2,0.1,0.5,0.1,0.7C97.2,32,95.8,34.9,93.7,35.3z"/>
		  <path class="st14" d="M78.7,18.1c-1.4-1-2.5-2.2-3.4-3.4h16.4c0.5,1.7,0.3,3.3-0.6,4.5C89,22.2,83.4,21.6,78.7,18.1z"/>
		  <path class="st14" d="M96.9,28.6h-8.2c-0.4-3.5,1-6.5,3.1-6.8c2.2-0.3,4.5,2.4,5,6.1C96.8,28.2,96.8,28.4,96.9,28.6z"/>
		</g>
		      <animateTransform 
		          attributeName="transform" 
		          type="scale" 
		          values="1; 1.5; 1.25; 1.5; 1.5; 1;" 
		          dur="1s" 
		          repeatCount="indefinite"
		          additive="sum">      
		      </animateTransform>
		  </g>
		</svg>
		</div>
    <div class="admin-button-container">
	  <div class="admin-button-style">
	    <a href="commitMember.jsp" style="color: white; text-decoration: none;">관리자 페이지</a>
	  </div>
	  <div class="admin-button-style">
	    <a href="logout.jsp" style="color: white; text-decoration: none;">로그아웃</a>
	  </div>
	</div>
</body>
</html>
