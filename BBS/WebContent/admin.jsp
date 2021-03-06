<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
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
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		
		int pageNumber=1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
	%>
	
	<nav class ="navbar navbar-default">
		<div class="navbar-header">
		
		 
			 <button type = "button" class = "navbar-toggle collapsed"
			  data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1" aria-expanded = "false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			
			<a class="navbar-brand" href="main.jsp">관리자 페이지</a> 
			
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="admin.jsp">파워Fc 사용자</a></li>
				<li><a href="adminPlanSelect.jsp">플랜 검색</a></li>
				<li><a href="adminPlanUpload.jsp">플랜 업로드</a></li>
				<li><a href="adminPlanDeleteCompany.jsp">플랜 삭제(회사)</a></li>
				<li><a href="adminPlanDeleteGubun.jsp">플랜 삭제(상품)</a></li>
				<li><a href="adminPlanDeleteAge.jsp">플랜 삭제(연령대)</a></li>
			</ul>
			<%
				if(userID == null){
					
			%>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					 role="button" aria-haspopup=true" aria-expanded="false">접속하기<span class="caret"></span></a>
					 
					 <ul class ="dropdown-menu">
					 	<li><a href="login.jsp">로그인</a></li>
					 	<li><a href="join.jsp">회원가입</a></li>
					 </ul>				
				</li>
			</ul>
			
			<%
				}else{
			%>	
		
			<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						 role="button" aria-haspopup=true" aria-expanded="false">회원관리<span class="caret"></span></a>
						 
						 <ul class ="dropdown-menu">
						 	<li><a href="logoutAction.jsp">로그아웃</a></li>
						 </ul>				
					</li>
			</ul>
			
			<%	
				}
			%>

		</div>
	</nav>
	
	<div class="container">
		<div class="row">
		 <form method="post" action="adminDeleteAction.jsp">
			<table class="table table-striped" style="text-align:center; border:1px solod #ddddddd">
				<thead>
				<tr>
					<!--<th style="background-color: #eeeeee; text-align:center;"><input type="checkbox" name="_selected_all_"></th> -->
					<th style="background-color: #eeeeee; text-align:center;">아이디</th>
					<th style="background-color: #eeeeee; text-align:center;">비번</th>
					<th style="background-color: #eeeeee; text-align:center;">이름</th>
					<th style="background-color: #eeeeee; text-align:center;">성별</th>
					<th style="background-color: #eeeeee; text-align:center;">이메일</th>
				</tr>	
				</thead>
				
				
				<tbdoy>
					<%
						
						UserDAO userDAO = new UserDAO();
						ArrayList<User> list = userDAO.getList(pageNumber);
						for(int i=0; i<list.size(); i++){
					%>
						<tr>
							<!--  <td><input name="chkbox" type="checkbox" value="<%= list.get(i).getUserID() %>"></td>-->
							<td><a href="adminUpdate.jsp?userID=<%= list.get(i).getUserID() %>"> <%= list.get(i).getUserID() %> </td>
							<td><a href="adminUpdate.jsp?userID=<%= list.get(i).getUserID() %>"> <%= list.get(i).getUserPassword() %> </td>
							<td><a href="adminUpdate.jsp?userID=<%= list.get(i).getUserID() %>"> <%= list.get(i).getUserName() %> </td>
							<td><a href="adminUpdate.jsp?userID=<%= list.get(i).getUserID() %>"> <%= list.get(i).getUserGender() %> </td>
							<td><a href="adminUpdate.jsp?userID=<%= list.get(i).getUserID() %>"> <%= list.size() %> </td>
							
						</tr>
					<%
						}
					%>
				
				</tbdoy>
			</table>
			
			<%
				if(pageNumber != 1){
			%>
			
				<a href="admin.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
				
			<%
				} if(userDAO.nextPage(pageNumber)){
			%>
			
				<a href="admin.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
				
			<%
				}
			%>
			<!-- <input type="submit" class="btn btn-primary" value="삭제"> -->
			</form>
		</div>
	</div>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>