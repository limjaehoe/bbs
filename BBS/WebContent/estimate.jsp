<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="estimate.Estimate"%>
<%@ page import="estimate.EstimateDAO"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
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
				<li><a href="main.jsp">����</a></li>
				<li class="active"><a href="estimate.jsp">����񱳰���</a></li>
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
		<div class="col-lg-4"></div> 
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="estimateResult.jsp">
						<h3 style="text-align: center;">����񱳰���</h3>
						<div class="form=group" >
							<input type="text" class="form-control" placeholder="�̸�" name="userName" maxlength="20" value="����ȸ" autocomplete="on">
						</div>
						<div class="form=group" style="padding-top: 5px;">
							<input type="text" class="form-control" placeholder="�������(19891129)" name="userYear" maxlength="20" value="19891129" >
						</div>
					
						<div class="form=group" style="text-align:center;">
							<div class = "btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" name="userGender" autocomplete="off" value="��" checked>��
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="userGender" autocomplete="off" value="��" checked>��
								</label>
							</div>
						</div>
						
						<div class="form=group" style="text-align:center;">
							<select name="userPlan" id="userPlan" style="padding-top: 5px;">
							    <option value="">�÷�����</option>
								<option label="****���� �÷�****"></option>
								<option value="���� �÷�/ġ�ƺ���(������)">ġ�ƺ���(������)</option>
								<option value="���� �÷�/ġ�ź���">ġ�ź���</option>
								<option value="">****������������ �÷�****</option>
								<option value="������������ �÷�/1�� ��������">1�� ��������</option>
								<option value="������������ �÷�/1�� ���ź���">1�� ���ź���</option>
								<option value="������������ �÷�/3�����ܺ� ��õ">3�����ܺ� ��õ</option>
								<option value="������������ �÷�/������������ �ܵ��÷�">������������ �ܵ��÷�</option>
								<option value="������������ �÷�/�պ�����Ǯ����">�պ�����Ǯ����</option>
								<option value="">****���غ���****</option>
								<option value="���غ���/3�����ܺ� ��õ" selected="selected">3�����ܺ� ��õ</option>
								<option value="���غ���/������������ �ܵ��÷�">������������ �ܵ��÷�</option>
								<option value="���غ���/�Ϻ��� Ǯ����">�Ϻ��� Ǯ����</option>
								<option value="���غ���/���غ���/��ǰ�Ǻ�">��ǰ�Ǻ�</option>
								<option value="���غ���/�����ڽǺ�">�����ڽǺ�</option>
								<option value="���غ���/�պ����պ����÷�">�պ����պ����÷�</option>
								<option value="���غ���/�պ�����Ǯ����(������)">�պ�����Ǯ����(������)</option>
								<option value="���غ���/������ Ǯ����(������)">������ Ǯ����(������)</option>
								<option value="���غ���/������ Ǯ����(������)">������ Ǯ����(������)</option>
								<option value="���غ���/��̺��� 30������">��̺��� 30������</option>
								<option value="���غ���/��̺��� 100������">��̺��� 100������</option>
								<option value="">****������****</option>
								<option value="������_���/1�� ��������">1�� ��������</option>
								<option value="������_���/1�� �������ź���">1�� �������ź���</option>
								<option value="������_���/1�� ���ź���">1�� ���ź���</option>
								<option value="������_���/����60��">����60��</option>
								<option value="������_���/����70��">����70��</option>
								<option value="������_���/����80��">����80��</option>
							</select>
						</div>
						<input type="submit" class="btn btn-primary form-control" value="�񱳰��� ����" style="padding-top: 5px;">
					</form>
				</div>
			</div>
	</div>
	
	
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>