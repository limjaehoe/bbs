<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="estimate.Estimate"%>
<%@ page import="estimate.EstimateDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLDecoder"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		request.setCharacterEncoding("EUC-KR");
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
		
		String company = null;
		String old =null;
		String old2 =null;
		String old3 =null;
		String userGender = null;
		String userPlan = null;
		String userGubun = null;

		if(request.getParameter("company") != null) {
			company = (String) request.getParameter("company");
		}
		if(request.getParameter("old") != null) {
			old = (String) request.getParameter("old");
		}
		if(request.getParameter("old2") != null) {
			old2 = (String) request.getParameter("old2");
		}
		if(request.getParameter("old3") != null) {
			old3 = (String) request.getParameter("old3");
		}
		if(request.getParameter("userGender") != null) {
			userGender = (String) request.getParameter("userGender");
		}
		if(request.getParameter("userPlan") != null) {
			userPlan = (String) request.getParameter("userPlan");
		}
		if(request.getParameter("userGubun") != null) {
			userGubun = (String) request.getParameter("userGubun");
			userGubun = URLDecoder.decode(userGubun, "UTF-8");
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
			
			
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a> 
			
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="estimate.jsp">보험비교견적</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="admin.jsp">관리자</a></li>
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
			<table class="table table-striped" style="text-align:center; border:1px solod #ddddddd">
				
				
				
				<thead>
				<tr>
					
					<th style="background-color: #eeeeee; text-align:center;">담보내용</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
				</tr>	
				</thead>
				<tbdoy>
					
				
				
					<%

						EstimateDAO estimateDAO = new EstimateDAO();
					
						
						
						ArrayList<Estimate> list = estimateDAO.getEstimateResultDetail(old, old2, old3 ,userPlan , userGender, userGubun, company );
						for(int i =0; i<list.size(); i++){
					%>
						<tr>
							<td> <%= list.get(i).getBojang() %></td>
							<td> <%= list.get(i).getMoney() %> </td>
							<td> <%= list.get(i).getMoney2() %> </td>
							
						</tr>
					<%
						}
					%>
				
				</tbdoy>
			</table>
		
			
		</div>
	</div>
	
	
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>