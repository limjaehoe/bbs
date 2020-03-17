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
<title>�Ŀ�FC �� ����Ʈ</title>
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
		
		
		//�α����ϸ� ������!!!
		if(session.getAttribute("userID")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� ���ּ���.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		//������ ���̵� 777�� ���� �� �ֽ��ϴ�.
		if(!userID.equals("777")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ ���̵� �ƴմϴ�.')");
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
			
			
			<a class="navbar-brand" href="main.jsp">������ ������</a> 
			
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="admin.jsp">�Ŀ�Fc �����</a></li>
				<li><a href="adminPlanSelect.jsp">�÷� �˻�</a></li>
				<li><a href="adminPlanUpload.jsp">�÷� ���ε�</a></li>
				<li><a href="adminPlanDeleteCompany.jsp">�÷� ����(ȸ��)</a></li>
				<li><a href="adminPlanDeleteGubun.jsp">�÷� ����(��ǰ)</a></li>
				<li  class="active"><a href="adminPlanDeleteAge.jsp">�÷� ����(���ɴ�)</a></li>
			</ul>
			<%
				if(userID == null){
					
			%>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					 role="button" aria-haspopup=true" aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					 
					 <ul class ="dropdown-menu">
					 	<li><a href="login.jsp">�α���</a></li>
					 	<li><a href="join.jsp">ȸ������</a></li>
					 </ul>				
				</li>
			</ul>
			
			<%
				}else{
			%>	
		
			<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						 role="button" aria-haspopup=true" aria-expanded="false">ȸ������<span class="caret"></span></a>
						 
						 <ul class ="dropdown-menu">
						 	<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
						 </ul>				
					</li>
			</ul>
			
			<%	
				}
			%>

		</div>
	</nav>
	
	<div class="container">
	
					<%
					
						AdminDAO admindao = new AdminDAO();
						
						int a = admindao.deleteAge(ds_plan, ds_company, ds_gubun, ds_sex, ds_old);
	
					%>
					
					<td> <%= a %></td>
							�� �����Ǿ����ϴ�.
		
	</div>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>