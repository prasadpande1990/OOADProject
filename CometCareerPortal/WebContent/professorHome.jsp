<%@page import="cometCareer.professorRegistrationServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"%>
<%@page import="cometClasses.*"%>
 <%@page import="java.util.ArrayList"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Home</title>
<link rel="stylesheet" type="text/css" href="./ccpstyle.css">
</head>
<%
	HttpSession session = request.getSession();
	Professor prof = (Professor)session.getAttribute("professor");
	session.setAttribute("role", "Professor");
%>
<body>
<h1>Faculty Center</h1>
<h2 class="professorHome">&nbsp;Welcome <%=prof.getFirstName()%>  <%=prof.getLastName()%>,</h2><br>
<div align="center" class="navButtons">
<table>
	<tr>
		<td>
			<form class="transparent" method="post" action="professorHome.jsp">
				<input type="submit" name="HomeButton" value="Home">
			</form>
		</td>
		<td>
			<form class="transparent" method="post" action="postJob.jsp">
				<input type="submit" name="postJobButton" value="Post Job">
			</form>
		</td>
		<td>
		<form class="transparent" method="post" action="updateProfile.jsp">		
			<input type="submit" name="updateProfileButton" value="Update Profile">
		</form>
		</td>
		<td>
		<form class="transparent">
			<input type="submit" name="searchProfileButton" value="Search Profile">
		</form>
		</td>
		<td>
		<form class="transparent" method="post" action="LogoutServlet">
			<input type="submit" name="Logout" value="Logout">
		</form>
		</td>
	</tr>
</table>
</div>
<center>
<h2>Personal Information</h2>
<table border="2">
	<tr>
		<td>Professor Id: </td>
		<td><%=prof.getID()%></td>
	</tr>
	<tr>
		<td>First Name: </td>
		<td><%=prof.getFirstName()%></td>
	</tr>
	<tr>
		<td>Last Name: </td>
		<td><%=prof.getLastName()%></td>
	</tr>
	<tr>
		<td>Qualification: </td>
		<td><%=prof.getQualification()%></td>
	</tr>
	<tr>
		<td>Research Interest: </td>
		<td><%=prof.getResearchInterest()%></td>
	</tr>
		<tr>
		<td>Contact Number: </td>
		<td><%=prof.getContactNumber()%></td>
	</tr>
	<tr>
		<td>Email: </td>
		<td><%=prof.getEmail()%></td>
	</tr>
	<tr>
		<td>Mailing Address: </td>
		<td><%=prof.getMailingAddress()%></td>
	</tr>
</table>
<h2>Technical Skills</h2>
<% 
	ArrayList<Skills> skillsList = (ArrayList<Skills>)prof.getProfile().getSkillsList();
%>
<table border="2">
	<tr>
		<td>Skill</td>
		<td>Years of Experience</td>
		<td>Proficiency</td>
	</tr>
	<%for(int i=0;i<skillsList.size(); i++) {%>
		<tr>
			<td><%=skillsList.get(i).getSkillName()%></td>
			<td><%=skillsList.get(i).getYearsOfExp()%></td>
			<td><%=skillsList.get(i).getProficiency()%></td>
		</tr>
	<%} %>
</table>
<h2>Project Details</h2>
<% 
	ArrayList<Project> projList = (ArrayList<Project>)prof.getProfile().getProjectList();
%>
<table border="2">
	<tr>
		<td>Title</td>
		<td>Description</td>
		<td>Domain</td>
	</tr>
	<%for(int i=0;i<projList.size(); i++) {%>
		<tr>
			<td><%=projList.get(i).getProjectTitle()%></td>
			<td><%=projList.get(i).getProjectDescription()%></td>
			<td><%=projList.get(i).getProjectDomain()%></td>
		</tr>
	<%} %>
</table>
<h2>Employment Details</h2>
<% 
	ArrayList<WorkExperience> workList = (ArrayList<WorkExperience>)prof.getProfile().getWorkList();
%>
<table border="2">
	<tr>
		<td>Employer</td>
		<td>Years of Service</td>
		<td>Company Designation</td>
	</tr>
	<%for(int i=0;i<workList.size(); i++) {%>
		<tr>
			<td><%=workList.get(i).getEmployer()%></td>
			<td><%=workList.get(i).getYearsOfexp()%></td>
			<td><%=workList.get(i).getDesignation()%></td>
		</tr>
	<%} %>
</table>
</center>
</body>
</html>