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
<title>�Ŀ�FC �� ����Ʈ</title>
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
			script.println("alert('�α����� �ϼ���.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
	
					
		if(request.getParameter("userID")==null || request.getParameter("userPassword")==null 
				|| request.getParameter("userName").equals("") || request.getParameter("userGender").equals("")
				|| request.getParameter("userEmail").equals("") )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(request.getParameter("userID"), request.getParameter("userPassword"),  request.getParameter("userName"), request.getParameter("userGender"),request.getParameter("userEmail") );
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�� ������ �����߽��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('���� �߽��ϴ�.')");
				script.println("location.href = 'admin.jsp'");
				script.println("</script>");
			}
		}
		
		
		
		
	
	%>

</body>
</html>