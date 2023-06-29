<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
<div class="signup-form">
<h1>회원가입 페이지</h1>
<form action="JoinOk" method="post">
        <label for="id">아이디:</label>
        <input type="text" name="id" size="10"><br />
        <label for="pw">비밀번호:</label>
        <input type="password" name="pw" size="10"><br />
        <label for="name">이름:</label>
        <input type="text" name="name" size="10"><br />
        <label for="phone">핸드폰:</label>
        <input type="text" name="phone" size="20"><br />
        <label for="email">이메일:</label>
        <input type="text" name="email" size="20"><br />
        
        <div class="permission-labels">
            <label for="admin">관리자</label>
            <input type="radio" name="permission" value="A">
            <label for="user">사용자</label>
            <input type="radio" name="permission" value="U"><br><br>
        </div>
        <div class="button-container">
            <input type="submit" name="submit" value="회원가입">
            <input type="reset" name="reset" value="초기화">
        </div>
    </form>
</div>
</body>
</html>