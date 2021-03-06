<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="admin.Admin"%>
<%@ page import="admin.AdminDAO"%>

<!DOCTYPE html>
<% request.setCharacterEncoding("EUC-KR"); %>
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
		
		String ds_plan = null;
		String ds_company = null;
		String ds_sex = null;
		String ds_gubun = null;
		String ds_old = null;

		if(request.getParameter("plan1") != null) {
			ds_plan = (String) request.getParameter("plan1");
		}
		
		if(request.getParameter("plan2") != null) {
			ds_company = (String) request.getParameter("plan2");
		}
		
		if(request.getParameter("plan3") != null) {
			ds_sex = (String) request.getParameter("plan3");
		}
		
		if(request.getParameter("plan4") != null) {
			ds_gubun = (String) request.getParameter("plan4");
			ds_gubun = URLDecoder.decode(ds_gubun, "UTF-8");
		}
		
		if(request.getParameter("plan5") != null) {
			ds_old = (String) request.getParameter("plan5");
		}
		
		System.out.println(ds_plan);
		System.out.println(ds_company);
		System.out.println(ds_sex);
		System.out.println(ds_gubun);
		System.out.println(ds_old);
		
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
				<li><a href="admin.jsp">파워Fc 사용자</a></li>
				<li class="active"><a href="adminPlanSelect.jsp">플랜 검색</a></li>
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
		플랜:<%=ds_plan%><br>
		회사:<%=ds_company%><br>
		성별:<%=ds_sex%><br>
		상품:<%=ds_gubun%><br>
		나이:<%=ds_old%><br>
		
		
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solod #ddddddd">
				<thead>
				<tr>
					
					<th style="background-color: #eeeeee; text-align:center;">보장명</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					<th style="background-color: #eeeeee; text-align:center;">가입금액</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료</th>
					
				</tr>	
				</thead>
				<tbdoy>
					<%
					
					
			
					
						AdminDAO admindao = new AdminDAO();
						
						ArrayList<Admin> list = admindao.getSelectResult(ds_plan, ds_company, ds_sex, ds_gubun, ds_old);
						for(int i =0; i<list.size(); i++){
							
							
							
					%>
						<tr>
							<td> <%= list.get(i).getDs_bojang() %></td>
							<td> <%= list.get(i).getDs_00() %></td>
							<td> <%= list.get(i).getDs_01() %></td>
							<td> <%= list.get(i).getDs_10() %></td>
							<td> <%= list.get(i).getDs_11() %></td>
							<td> <%= list.get(i).getDs_20() %></td>
							<td> <%= list.get(i).getDs_21() %></td>
							<td> <%= list.get(i).getDs_30() %></td>
							<td> <%= list.get(i).getDs_31() %></td>
							<td> <%= list.get(i).getDs_40() %></td>
							<td> <%= list.get(i).getDs_41() %></td>
							<td> <%= list.get(i).getDs_50() %></td>
							<td> <%= list.get(i).getDs_51() %></td>
							<td> <%= list.get(i).getDs_60() %></td>
							<td> <%= list.get(i).getDs_61() %></td>
							<td> <%= list.get(i).getDs_70() %></td>
							<td> <%= list.get(i).getDs_71() %></td>
							<td> <%= list.get(i).getDs_80() %></td>
							<td> <%= list.get(i).getDs_81() %></td>
							<td> <%= list.get(i).getDs_90() %></td>
							<td> <%= list.get(i).getDs_91() %></td>
							<td> <%= list.get(i).getDs_t0() %></td>
							<td> <%= list.get(i).getDs_t1() %></td>
							
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