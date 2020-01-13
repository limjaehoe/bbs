<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8");%>
 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>파워FC 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		
	
		
		//로그인하면 보세요!!!
		if(session.getAttribute("userID")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		//관리자 아이디 777만 들어올 수 있습니다.
		if(!userID.equals("777")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자 아이디가 아닙니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		
		/////////////두개가 세트.
		String userID_temp =null;
		if(request.getParameter("userID")!=null){
			userID_temp = request.getParameter("userID");
		}
				
		User user = new UserDAO().getUser(userID_temp);
		
	%>


	<nav class ="navbar navbar-default">
		<div class="navbar-header">
			 <button type = "button" class = "navbar-toggle collapsed"
			  data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1" aria-expanded = "false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a> 
			
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li class="active"><a href="admin.jsp">관리자</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						 role="button" aria-haspopup=true" aria-expanded="false">회원관리<span class="caret"></span></a>
						 
						 <ul class ="dropdown-menu">
						 	<li><a href="logoutAction.jsp">로그아웃</a></li>
						 </ul>				
					</li>
			</ul>

		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<form method="post" action="adminUpdateAction.jsp">
				<table class="table table-striped" style="text-align:center; border:1px solod #ddddddd">
					<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align:center;">회원 정보 수정</th>
					</tr>	
					</thead>
					<tbdoy>
						<tr>
							<td> 아이디  </td>
							<td><input type="text" class="form-control" placeholder="글 제목" name="userID" maxlength="50" value="<%= user.getUserID() %>"></td>
						</tr>
						
						<tr>
							<td> 비밀번호  </td>
							<td><input type="text" class="form-control" placeholder="글 제목" name="userPassword" maxlength="50" value="<%= user.getUserPassword() %>"> </td>
						</tr>
						
						<tr>
							<td> 이름  </td>
							<td><input type="text" class="form-control" placeholder="글 제목" name="userName" maxlength="50" value="<%= user.getUserName() %>"> </td>
						</tr>
						
						<tr>
							<td> 성별  </td>
							<td><input type="text" class="form-control" placeholder="글 제목" name="userGender" maxlength="50" value="<%= user.getUserGender() %>"> </td>
						</tr>
						
						<tr>
							<td> 이메일  </td>
							<td><input type="text" class="form-control" placeholder="글 제목" name="userEmail" maxlength="50" value="<%= user.getUserEmail() %>"> </td>
						</tr>
						
					</tbdoy>
				</table>
				<a href="admin.jsp" class="btn btn-primary">목록</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="adminDeleteAction.jsp?userID=<%= user.getUserID() %>" class="btn btn-primary">삭제</a>
				<input type="submit" class="btn btn-primary" value="수정">
				
			</form>
		</div>
	</div>
	
	
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>