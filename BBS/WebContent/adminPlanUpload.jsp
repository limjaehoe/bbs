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
				<li><a href="admin.jsp">파워Fc 사용자</a></li>
				<li><a href="adminPlanSelect.jsp">플랜 검색</a></li>
				<li  class="active"><a href="adminPlanUpload.jsp">플랜 업로드</a></li>
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
		<form method="post" action="adminPlanUploadAction.jsp"> <!--   enctype="multipart/form-data" -->
		
			<select name="plan1" id="plan1" value="손해보험">
				<option value="">구분선택</option>
			    <option value="전략플랜">1.전략플랜</option>
			    <option value="저해지무해지 플랜">2.저해지무해지 플랜</option>
			    <option value="손해보험" selected="selected">3.손해보험</option>
			    <option value="생명보험_사망">4.생명보험_사망</option>
				<option value="암플랜">5.암플랜</option>
			</select>
			
			<select name="plan2" id="plan2">
				<option value="">회사선택</option>
				<option value="">***손보***</option>
				<option value="KB손보" selected="selected">KB손보</option>
				<option value="DB손보">DB손보</option>
				<option value="메리츠화재">메리츠화재</option>
				<option value="삼성화재">삼성화재</option>
				<option value="현대해상">현대해상</option>
				<option value="롯데손보">롯데손보</option>
				<option value="MG손보">MG손보</option>
				<option value="한화손보">한화손보</option>
				<option value="흥국화재">흥국화재</option>
				<option value="NH농협손보">NH농협손보</option>
				<option value="가나다화재">가나다화재</option>
				<option value="">***생보***</option>
				<option value="교보생명">교보생명</option>
				<option value="농협생명">농협생명</option>
				<option value="동양생명">동양생명</option>
				<option value="라이나생명">라이나생명</option>
				<option value="메트라이프">메트라이프</option>
				<option value="미래에셋생명">미래에셋생명</option>
				<option value="삼성생명">삼성생명</option>
				<option value="신한생명">신한생명</option>
				<option value="처브라이프">처브라이프</option>
				<option value="한화생명">한화생명</option>
				<option value="현대라이프생명">현대라이프생명</option>
				<option value="흥국생명">흥국생명</option>
				<option value="ABL생명">ABL생명</option>
				<option value="AIA생명">AIA생명</option>
				<option value="DB생명">DB생명</option>
				<option value="DGB생명">DGB생명</option>
				<option value="IBK생명">IBK생명</option>
				<option value="오렌지라이프">오렌지라이프</option>
				<option value="KB생명">KB생명</option>
				 <option value="KDB생명">KDB생명</option>
				<option value="PCA생명">PCA생명</option>
			</select>
			
			
			<select name="plan4" id="plan4">
			    <option value="">플랜선택</option>
				<option value="">****전략 플랜****</option>
				<option value="치아보험(갱신형)">치아보험(갱신형)</option>
				<option value="치매보험">치매보험</option>
				<option value="">****저해지무해지 플랜****</option>
				<option value="1억 간편종신">1억 간편종신</option>
				<option value="1억 종신보험">1억 종신보험</option>
				<option value="3대진단비 삼천">3대진단비 삼천</option>
				<option value="뇌혈관허혈성 단독플랜">뇌혈관허혈성 단독플랜</option>
				<option value="손보통합풀보장">손보통합풀보장</option>
				<option value="">****손해보험****</option>
				<option value="3대진단비 삼천" selected="selected">3대진단비 삼천</option>
				<option value="뇌혈관허혈성 단독플랜">뇌혈관허혈성 단독플랜</option>
				<option value="암보험 풀보장">암보험 풀보장</option>
				<option value="단품실비">단품실비</option>
				<option value="유병자실비">유병자실비</option>
				<option value="손보통합보험플랜">손보통합보험플랜</option>
				<option value="손보통합풀보장(갱신형)">손보통합풀보장(갱신형)</option>
				<option value="간편보험 풀보장(갱신형)">간편보험 풀보장(갱신형)</option>
				<option value="간편보험 풀보장(세만기)">간편보험 풀보장(세만기)</option>
				<option value="어린이보험 30세만기">어린이보험 30세만기</option>
				<option value="어린이보험 100세만기">어린이보험 100세만기</option>
				<option value="">****생명보험****</option>
				<option value="1억 간편종신">1억 간편종신</option>
				<option value="1억 변액종신보험">1억 변액종신보험</option>
				<option value="1억 종신보험">1억 종신보험</option>
				<option value="정기60세">정기60세</option>
				<option value="정기70세">정기70세</option>
				<option value="정기80세">정기80세</option>
			</select>
			
			<select name="plan3" id="plan3" style="width:100px;" size='2'> 
			    <option value="남" selected="selected">남</option>
			    <option value="여">여</option>
			</select>
			
			
			<select name="plan5" id="plan5">
			    <option value="">나이선택</option>
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
			
		<p class="btn_set"><input type="submit" class="btn_st3" value="전송"> <input type="reset" class="btn_st3" value="취소"></p>

		</form>
		
		
	</div>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>