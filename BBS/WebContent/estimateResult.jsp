<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="estimate.Estimate"%>
<%@ page import="estimate.EstimateDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>



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
		
		
		String userName = null;
		String userYear = null;
		String userGender = null;
		String userPlan = null;
		String userGubun = null;
		String[] split_temp = null;

		if(request.getParameter("userName") != null) {
			userName = (String) request.getParameter("userName");
		}
		
		if(request.getParameter("userYear") != null) {
			userYear = (String) request.getParameter("userYear");
		}
		
		if(request.getParameter("userGender") != null) {
			userGender = (String) request.getParameter("userGender");
		}
		
		if(request.getParameter("userPlan") != null) {
			userPlan = (String) request.getParameter("userPlan");
			split_temp = userPlan.split("/");
			userPlan = split_temp[0];
			userGubun= split_temp[1];

		}
		
	
		Calendar oCalendar = Calendar.getInstance();
		//System.out.println("현재 월: " + oCalendar.get(Calendar.YEAR));
	    //System.out.println("현재 월: " + (oCalendar.get(Calendar.MONTH) + 1));
	    //System.out.println("현재 일: " +  oCalendar.get(Calendar.DAY_OF_MONTH));
	    
	    Date today = Calendar.getInstance().getTime();
        // (2) create a date "formatter" (the date format we want)
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        String format_time = formatter.format(oCalendar.getTime());
        
        // (3) create a new String using the date format we want
        Date birthday = null;
        birthday = formatter.parse(userYear);
        int year = today.getYear() - birthday.getYear();
        int month = today.getMonth() - birthday.getMonth();
        int day = today.getDate() - birthday.getDate();
        
       
        
        String age_1;
        String age_2;
        String year_char;
        
        if(month == 6)
        {
            if (day >= 0)
            {
                year = year + 1;
            }
        }
        else if(month > 6)
        {
            year = year + 1;
        }
        else if(month == -6)
        {
            if( day <= 0 )
            {
                year = year - 1;
            }
        }
        else if(month < -6)
        {
            year = year - 1; //에러 이게 플러스로되있었음 2018년 1월 2일 수정
        }
        
        year_char = String.valueOf(year);

        if(year_char.length()==1){ //10살미만 예외처리

            if(year_char.equals("0")) //0살일때
            {
                age_1 = "0";
                age_2 = "fetus";
            }
            else {
                age_1 = "0";
                age_2 = year_char.substring(0, 1);
            }
        }
        else{
            age_1 = year_char.substring(0,1);
            age_2 = year_char.substring(1,2);

            if(age_2.equals("0")) // 10살단위 예외처리
            {
                int temp = Integer.parseInt(age_1);
                temp = temp - 1;
                age_1 = String.valueOf(temp);
            }
        }

        
        //System.out.println(year_char); //나이
        //System.out.println(age_1); // old <-해쉬맵  19891129 -> 2 -> 30대 -> 3
        //System.out.println(age_2); // old2 <- 해쉬맵 19891129 -> 0 -> 0 ->  0 살
             
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
				<tr>
					<th width="50%" style="background-color: #eeeeee; text-align:center;">성함</th>
					<td  width="50%"><%= userName %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">생년월일</th>
					<td><%= userYear %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">성별</th>
					<td><%= userGender %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">플랜</th>
					<td><%= userPlan %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">비교견적일</th>
					<td><%= format_time %></td>
				</tr>	
		
				
			</table>
			<table class="table table-striped" style="text-align:center; border:1px solod #ddddddd">
				<thead>
				<tr>
					
					<th style="background-color: #eeeeee; text-align:center;">보험사</th>
					<th style="background-color: #eeeeee; text-align:center;">보험료(원)</th>
				</tr>	
				</thead>
				<tbdoy>
					<%
						EstimateDAO estimateDAO = new EstimateDAO();
						String old = estimateDAO.getHashmap_old(age_1);	
						String old2 = estimateDAO.getHashmap_old2(age_2);	
						String old3 = estimateDAO.getHashmap_old3(age_2);	
						
						ArrayList<Estimate> list = estimateDAO.getEstimateResult(old, old2, userPlan, userGender, userGubun );
						for(int i =0; i<list.size(); i++){
							
							String company = list.get(i).getCompany();
							company = company.replaceAll("\\p{Z}", "");
							
					%>
						<tr>
							<td> <%= company %></td>
							<td><a href="estimateResultDetail.jsp?company=<%=URLEncoder.encode(company, "UTF-8")%>&old=<%=old%>&old2=<%=old2%>&old3=<%=old3%>
									&userGender=<%=URLEncoder.encode(userGender, "UTF-8")%>&userPlan=<%=URLEncoder.encode(userPlan, "UTF-8")%>&userGubun=<%=URLEncoder.encode(userGubun, "UTF-8")%>		  "> <%= list.get(i).getDs() %> </td>
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