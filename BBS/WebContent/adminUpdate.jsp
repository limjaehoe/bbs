<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<title>�Ŀ�FC �� ����Ʈ</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
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
		
		
		/////////////�ΰ��� ��Ʈ.
		String userID_temp =null;
		if(request.getParameter("userID")!=null){
			userID_temp = request.getParameter("userID");
		}
				
		User user = new UserDAO().getUser(userID_temp);
		System.out.println(userID_temp);
		System.out.println(user.getUserID());

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
				<li class="active"><a href="admin.jsp">�Ŀ�Fc �����</a></li>
				<li><a href="adminPlanSelect.jsp">�÷� �˻�</a></li>
				
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						 role="button" aria-haspopup=true" aria-expanded="false">ȸ������<span class="caret"></span></a>
						 
						 <ul class ="dropdown-menu">
						 	<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
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
						<th colspan="2" style="background-color: #eeeeee; text-align:center;">ȸ�� ���� ����</th>
					</tr>	
					</thead>
					<tbdoy>
						<tr>
							<td> ���̵�  </td>
							<td><input type="text" class="form-control" placeholder="�� ����" name="userID" maxlength="50" value="<%= user.getUserID() %>"></td>
						</tr>
						
						<tr>
							<td> ��й�ȣ  </td>
							<td><input type="text" class="form-control" placeholder="�� ����" name="userPassword" maxlength="50" value="<%= user.getUserPassword() %>"> </td>
						</tr>
						
						<tr>
							<td> �̸�  </td>
							<td><input type="text" class="form-control" placeholder="�� ����" name="userName" maxlength="50" value="<%= user.getUserName() %>"> </td>
						</tr>
						
						<tr>
							<td> ����  </td>
							<td><input type="text" class="form-control" placeholder="�� ����" name="userGender" maxlength="50" value="<%= user.getUserGender() %>"> </td>
						</tr>
						
						<tr>
							<td> �̸���  </td>
							<td><input type="text" class="form-control" placeholder="�� ����" name="userEmail" maxlength="50" value="<%= user.getUserEmail() %>"> </td>
						</tr>
						
					</tbdoy>
				</table>
				<a href="admin.jsp" class="btn btn-primary">���</a>
				<a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')" href="adminDeleteAction.jsp?userID=<%= user.getUserID() %>" class="btn btn-primary">����</a>
				<input type="submit" class="btn btn-primary" value="����">
				
			</form>
		</div>
	</div>
	
	
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>