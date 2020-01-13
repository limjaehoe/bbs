<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파워FC 웹 사이트</title>
</head>
<body>
	<%
			
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
	
					
		/* 
	 	int result = 0;
		UserDAO userDAO = new UserDAO();
		String[] chkbox = request.getParameterValues("chkbox");
		for( int i = 0; i < chkbox.length; i++ )
		{
			result = userDAO.delete(chkbox[i]);
		} */ 

		
		
	
		int result = 0;
		UserDAO userDAO = new UserDAO();
		result = userDAO.delete( request.getParameter("userID") );
		
	
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성공 했습니다.')");
			script.println("location.href = 'admin.jsp'");
			script.println("</script>");
		}
		
		
		
		
		
	
	%>

</body>
</html>