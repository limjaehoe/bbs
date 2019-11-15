<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파워FC 웹 사이트</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	
	<script>
		location.href = 'main.jsp';
	</script>

</body>
</html>