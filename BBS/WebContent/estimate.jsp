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
		<div class="col-lg-4"></div> 
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="estimateResult.jsp">
						<h3 style="text-align: center;">보험비교견적</h3>
						<div class="form=group" >
							<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20" value="임재회" autocomplete="on">
						</div>
						<div class="form=group" style="padding-top: 5px;">
							<input type="text" class="form-control" placeholder="생년월일(19891129)" name="userYear" maxlength="20" value="19891129" >
						</div>
					
						<div class="form=group" style="text-align:center;">
							<div class = "btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" name="userGender" autocomplete="off" value="남" checked>남
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="userGender" autocomplete="off" value="여" checked>여
								</label>
							</div>
						</div>
						
						<div class="form=group" style="text-align:center;">
							<select name="userPlan" id="userPlan" style="padding-top: 5px;">
							    <option value="">플랜선택</option>
								<option label="****전략 플랜****"></option>
								<option value="전략 플랜/치아보험(갱신형)">치아보험(갱신형)</option>
								<option value="전략 플랜/치매보험">치매보험</option>
								<option value="">****저해지무해지 플랜****</option>
								<option value="저해지무해지 플랜/1억 간편종신">1억 간편종신</option>
								<option value="저해지무해지 플랜/1억 종신보험">1억 종신보험</option>
								<option value="저해지무해지 플랜/3대진단비 삼천">3대진단비 삼천</option>
								<option value="저해지무해지 플랜/뇌혈관허혈성 단독플랜">뇌혈관허혈성 단독플랜</option>
								<option value="저해지무해지 플랜/손보통합풀보장">손보통합풀보장</option>
								<option value="">****손해보험****</option>
								<option value="손해보험/3대진단비 삼천" selected="selected">3대진단비 삼천</option>
								<option value="손해보험/뇌혈관허혈성 단독플랜">뇌혈관허혈성 단독플랜</option>
								<option value="손해보험/암보험 풀보장">암보험 풀보장</option>
								<option value="손해보험/손해보험/단품실비">단품실비</option>
								<option value="손해보험/유병자실비">유병자실비</option>
								<option value="손해보험/손보통합보험플랜">손보통합보험플랜</option>
								<option value="손해보험/손보통합풀보장(갱신형)">손보통합풀보장(갱신형)</option>
								<option value="손해보험/간편보험 풀보장(갱신형)">간편보험 풀보장(갱신형)</option>
								<option value="손해보험/간편보험 풀보장(세만기)">간편보험 풀보장(세만기)</option>
								<option value="손해보험/어린이보험 30세만기">어린이보험 30세만기</option>
								<option value="손해보험/어린이보험 100세만기">어린이보험 100세만기</option>
								<option value="">****생명보험****</option>
								<option value="생명보험_사망/1억 간편종신">1억 간편종신</option>
								<option value="생명보험_사망/1억 변액종신보험">1억 변액종신보험</option>
								<option value="생명보험_사망/1억 종신보험">1억 종신보험</option>
								<option value="생명보험_사망/정기60세">정기60세</option>
								<option value="생명보험_사망/정기70세">정기70세</option>
								<option value="생명보험_사망/정기80세">정기80세</option>
							</select>
						</div>
						<input type="submit" class="btn btn-primary form-control" value="비교견적 실행" style="padding-top: 5px;">
					</form>
				</div>
			</div>
	</div>
	
	
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>