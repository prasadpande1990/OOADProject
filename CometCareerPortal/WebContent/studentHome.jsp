<%@page import="cometCareer.studentRegistrationServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"%>
<%@page import="cometClasses.Student"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Home</title>
<link rel="stylesheet" type="text/css" href="./ccpstyle.css">
</head>
<%
	HttpSession session = request.getSession();
	Student stud = (Student)session.getAttribute("student");
	session.setAttribute("role", "Student");
%>
<body>
<h1>Student Center</h1>
<h2 class="studentHome">&nbsp;Welcome <%=stud.getFirstName()%>  <%=stud.getLastName()%>,</h2><br>
<div align="center" class="navButtons">
<table>
	<tr>
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
			<form class="transparent" method="post" action="searchJob.jsp">
				<input type="submit" name="searchJobButton" value="Search Job">
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
</body>
</html>