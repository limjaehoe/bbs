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
<title>파워FC 웹 사이트</title>
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
			
			<a class="navbar-brand" href="main.jsp">파워FC 웹 사이트</a> 
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li  class="active"><a href="main.jsp">메인</a></li>
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
		<div class = "jumbotron">
			<div class="container">
			<h1>파워FC 소개</h1>
			<p>1. 파워 FC는 GA보험설계사를 위한 필수 프로그램입니다.<br> 
				2. 고객 생년월일 입력만으로 각 플랜을 회사별로 비교견적한 결과를 즉시 알수 있습니다.<br> 
				3. 비교견적한 결과를 고객에게 문자메세지 또는 카카오특으로 전송하여 화면을 보고 의견을 교환할수 있습니다.<br> 
				4. 파워 FC에 등록한 고객에게 전화가 오면 고객이 가입한 보험과 고객관련 메모사항을 휴대폰에서 자동으로 알려줍니다.<br> 
				5. 고객의 생일과 보험만기를 알려주고 관리 할 수 있도록 도와줍니다. <br>
				6. 매일 접촉해야 할 고객을 알려주고 기존 고객관리를 통해 보험영업에 날개를 달아드립니다.<br> 
				7. 자료실을 통해 각회사의 기초전산강의, 청약서 견본등을 제공하여 계약설계 체결에 자신감을 드립니다. </p>
			<p><a class="btn btn-primary btn-pull" href="#", role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>