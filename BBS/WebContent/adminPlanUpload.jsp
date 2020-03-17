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
				<li  class="active"><a href="adminPlanUpload.jsp">�÷� ���ε�</a></li>
				<li><a href="adminPlanDeleteCompany.jsp">�÷� ����(ȸ��)</a></li>
				<li><a href="adminPlanDeleteGubun.jsp">�÷� ����(��ǰ)</a></li>
				<li><a href="adminPlanDeleteAge.jsp">�÷� ����(���ɴ�)</a></li>
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
		<form method="post" action="adminPlanUploadAction.jsp"> <!--   enctype="multipart/form-data" -->
		
			<select name="plan1" id="plan1" value="���غ���">
				<option value="">���м���</option>
			    <option value="�����÷�">1.�����÷�</option>
			    <option value="������������ �÷�">2.������������ �÷�</option>
			    <option value="���غ���" selected="selected">3.���غ���</option>
			    <option value="������_���">4.������_���</option>
				<option value="���÷�">5.���÷�</option>
			</select>
			
			<select name="plan2" id="plan2">
				<option value="">ȸ�缱��</option>
				<option value="">***�պ�***</option>
				<option value="KB�պ�" selected="selected">KB�պ�</option>
				<option value="DB�պ�">DB�պ�</option>
				<option value="�޸���ȭ��">�޸���ȭ��</option>
				<option value="�Ｚȭ��">�Ｚȭ��</option>
				<option value="�����ػ�">�����ػ�</option>
				<option value="�Ե��պ�">�Ե��պ�</option>
				<option value="MG�պ�">MG�պ�</option>
				<option value="��ȭ�պ�">��ȭ�պ�</option>
				<option value="�ﱹȭ��">�ﱹȭ��</option>
				<option value="NH�����պ�">NH�����պ�</option>
				<option value="������ȭ��">������ȭ��</option>
				<option value="">***����***</option>
				<option value="��������">��������</option>
				<option value="��������">��������</option>
				<option value="�������">�������</option>
				<option value="���̳�����">���̳�����</option>
				<option value="��Ʈ������">��Ʈ������</option>
				<option value="�̷����»���">�̷����»���</option>
				<option value="�Ｚ����">�Ｚ����</option>
				<option value="���ѻ���">���ѻ���</option>
				<option value="ó�������">ó�������</option>
				<option value="��ȭ����">��ȭ����</option>
				<option value="�������������">�������������</option>
				<option value="�ﱹ����">�ﱹ����</option>
				<option value="ABL����">ABL����</option>
				<option value="AIA����">AIA����</option>
				<option value="DB����">DB����</option>
				<option value="DGB����">DGB����</option>
				<option value="IBK����">IBK����</option>
				<option value="������������">������������</option>
				<option value="KB����">KB����</option>
				 <option value="KDB����">KDB����</option>
				<option value="PCA����">PCA����</option>
			</select>
			
			
			<select name="plan4" id="plan4">
			    <option value="">�÷�����</option>
				<option value="">****���� �÷�****</option>
				<option value="ġ�ƺ���(������)">ġ�ƺ���(������)</option>
				<option value="ġ�ź���">ġ�ź���</option>
				<option value="">****������������ �÷�****</option>
				<option value="1�� ��������">1�� ��������</option>
				<option value="1�� ���ź���">1�� ���ź���</option>
				<option value="3�����ܺ� ��õ">3�����ܺ� ��õ</option>
				<option value="������������ �ܵ��÷�">������������ �ܵ��÷�</option>
				<option value="�պ�����Ǯ����">�պ�����Ǯ����</option>
				<option value="">****���غ���****</option>
				<option value="3�����ܺ� ��õ" selected="selected">3�����ܺ� ��õ</option>
				<option value="������������ �ܵ��÷�">������������ �ܵ��÷�</option>
				<option value="�Ϻ��� Ǯ����">�Ϻ��� Ǯ����</option>
				<option value="��ǰ�Ǻ�">��ǰ�Ǻ�</option>
				<option value="�����ڽǺ�">�����ڽǺ�</option>
				<option value="�պ����պ����÷�">�պ����պ����÷�</option>
				<option value="�պ�����Ǯ����(������)">�պ�����Ǯ����(������)</option>
				<option value="������ Ǯ����(������)">������ Ǯ����(������)</option>
				<option value="������ Ǯ����(������)">������ Ǯ����(������)</option>
				<option value="��̺��� 30������">��̺��� 30������</option>
				<option value="��̺��� 100������">��̺��� 100������</option>
				<option value="">****������****</option>
				<option value="1�� ��������">1�� ��������</option>
				<option value="1�� �������ź���">1�� �������ź���</option>
				<option value="1�� ���ź���">1�� ���ź���</option>
				<option value="����60��">����60��</option>
				<option value="����70��">����70��</option>
				<option value="����80��">����80��</option>
			</select>
			
			<select name="plan3" id="plan3" style="width:100px;" size='2'> 
			    <option value="��" selected="selected">��</option>
			    <option value="��">��</option>
			</select>
			
			
			<select name="plan5" id="plan5">
			    <option value="">���̼���</option>
			    <option value="00-10">00-10</option>
			    <option value="11-20">11-20</option>
				<option value="21-30" selected="selected">21-30</option>
			    <option value="31-40">31-40</option>
				<option value="41-50">41-50</option>
			    <option value="51-60">51-60</option>
				<option value="61-70">61-70</option>
				<option value="71-80">71-80</option>
			</select>
			
			<p><br><input type="file" name="uploadexcel"   multiple > </p>
			
		<p class="btn_set"><input type="submit" class="btn_st3" value="����"> <input type="reset" class="btn_st3" value="���"></p>

		</form>
		
		
	</div>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>