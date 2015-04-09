<%@page import="cometCareer.professorRegistrationServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"%>
<%@page import="cometClasses.Professor"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Professor Home</title>
</head>
<%
	HttpSession session = request.getSession();
	Professor prof = (Professor)session.getAttribute("professor");
%>
<body>
<h1><center>Professor Home</center></h1>
<h2>Welcome <%=prof.getFirstName()%>  <%=prof.getLastName()%>,</h2><br>
<table>
	<tr>
		<form method="post" action="postJob.jsp">
			<input type="submit" name="postJobButton" value="Post Job">
		</form>
	</tr>
	<tr>
		<form method="post" action="updateProfile.jsp">		
			<input type="submit" name="updateProfileButton" value="Update Profile">
		</form>
	</tr>
	<tr>
		<form>
			<input type="submit" name="searchProfileButton" value="Search Profile">
		</form>
	</tr>
	<tr>
		<form method="post" action="LogoutServlet">
			<input type="submit" name="Logout" value="Logout">
		</form>
	</tr>
</table>
</body>
</html>