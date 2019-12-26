<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>�Ŀ�FC �� ����Ʈ</title>
</head>
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
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
			
			<a class="navbar-brand" href="main.jsp">�Ŀ�FC �� ����Ʈ</a> 
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li  class="active"><a href="main.jsp">����</a></li>
				<li><a href="bbs.jsp">�Խ���</a></li>
				<li><a href="admin.jsp">������</a></li>
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
		<div class = "jumbotron">
			<div class="container">
			<h1>�Ŀ�FC �Ұ�</h1>
			<p>1. �Ŀ� FC�� GA���輳��縦 ���� �ʼ� ���α׷��Դϴ�.<br> 
				2. �� ������� �Է¸����� �� �÷��� ȸ�纰�� �񱳰����� ����� ��� �˼� �ֽ��ϴ�.<br> 
				3. �񱳰����� ����� ������ ���ڸ޼��� �Ǵ� īī��Ư���� �����Ͽ� ȭ���� ���� �ǰ��� ��ȯ�Ҽ� �ֽ��ϴ�.<br> 
				4. �Ŀ� FC�� ����� ������ ��ȭ�� ���� ���� ������ ����� ������ �޸������ �޴������� �ڵ����� �˷��ݴϴ�.<br> 
				5. ���� ���ϰ� ���踸�⸦ �˷��ְ� ���� �� �� �ֵ��� �����ݴϴ�. <br>
				6. ���� �����ؾ� �� ���� �˷��ְ� ���� �������� ���� ���迵���� ������ �޾Ƶ帳�ϴ�.<br> 
				7. �ڷ���� ���� ��ȸ���� �������갭��, û�༭ �ߺ����� �����Ͽ� ��༳�� ü�ῡ �ڽŰ��� �帳�ϴ�. </p>
			<p><a class="btn btn-primary btn-pull" href="#", role="button">�ڼ��� �˾ƺ���</a></p>
			</div>
		</div>
	</div>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>