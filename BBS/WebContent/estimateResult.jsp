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
		request.setCharacterEncoding("EUC-KR");
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
		//System.out.println("���� ��: " + oCalendar.get(Calendar.YEAR));
	    //System.out.println("���� ��: " + (oCalendar.get(Calendar.MONTH) + 1));
	    //System.out.println("���� ��: " +  oCalendar.get(Calendar.DAY_OF_MONTH));
	    
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
            year = year - 1; //���� �̰� �÷����ε��־��� 2018�� 1�� 2�� ����
        }
        
        year_char = String.valueOf(year);

        if(year_char.length()==1){ //10��̸� ����ó��

            if(year_char.equals("0")) //0���϶�
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

            if(age_2.equals("0")) // 10����� ����ó��
            {
                int temp = Integer.parseInt(age_1);
                temp = temp - 1;
                age_1 = String.valueOf(temp);
            }
        }

        
        //System.out.println(year_char); //����
        //System.out.println(age_1); // old <-�ؽ���  19891129 -> 2 -> 30�� -> 3
        //System.out.println(age_2); // old2 <- �ؽ��� 19891129 -> 0 -> 0 ->  0 ��
             
	%>


	<nav class ="navbar navbar-default">
		<div class="navbar-header">
		


		
		
		 
			 <button type = "button" class = "navbar-toggle collapsed"
			  data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1" aria-expanded = "false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			
			<a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a> 
			
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
	
				
		
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solod #ddddddd">
				<tr>
					<th width="50%" style="background-color: #eeeeee; text-align:center;">����</th>
					<td  width="50%"><%= userName %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">�������</th>
					<td><%= userYear %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">����</th>
					<td><%= userGender %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">�÷�</th>
					<td><%= userPlan %></td>
				</tr>	
				
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">�񱳰�����</th>
					<td><%= format_time %></td>
				</tr>	
		
				
			</table>
			<table class="table table-striped" style="text-align:center; border:1px solod #ddddddd">
				<thead>
				<tr>
					
					<th style="background-color: #eeeeee; text-align:center;">�����</th>
					<th style="background-color: #eeeeee; text-align:center;">�����(��)</th>
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