<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action = "paramRequest.jsp" method = "post">
    �̸�&nbsp;<input type="text" name="name" size="10"><br />
    ���̵�&nbsp;<input type="text" name="id" size="10"><br />
    ��й�ȣ&nbsp;<input type="password" name="passwd" size="10"><br />
    ���&nbsp;<input type="checkbox" name="hobby" value="swim">swim<br />
    <input type="checkbox" name="hobby" value="cook">cook<br />
    <input type="checkbox" name="hobby" value="running">running<br />
    <input type="checkbox" name="hobby" value="sleeping">sleeping<br />
    ����&nbsp;<input type="radio" name="major" value ="kor">����<br />
    <input type="radio" name ="eng">����
    <input type="radio" name ="mat">����<br />
    ��������&nbsp;<select name="protocol">
        <option value="http">http</option>
        <option value="ftp" selected="selected">ftp</option>
        <option value="smtp">smtp</option>
        <option value="https">https</option>
    </select><br />
    <input type="submit" name ="submit" value="����">&nbsp;
    <input type="reset" name ="reset" value="�ʱ�ȭ">
</form>
</body>
</html>