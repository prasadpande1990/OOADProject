<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<%@ page import="cometClasses.Department"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department Home</title>
</head>
<%
	HttpSession session = request.getSession();
	Department dept = (Department)session.getAttribute("department");
%>
<body>
<h2>Welcome Department of <%=dept.getDepartmentName()%>,</h2>
<table>
<tr><form method="post" action="postJobServlet">
	<input type="submit" name="postJobButton" value="Post Job">
</form></tr>
<tr><form method="post" action="updateProfile.jsp">		
	<input type="submit" name="updateProfileButton" value="Update Profile">
</form></tr>
<tr><form>
	<input type="submit" name="searchProfileButton" value="Search Profile">
</form></tr>
<tr><form method="post" action="approvePostServlet">
	<input type="submit" name="approvePostButton" value="Aprrove Job Post">
</form></tr>		
<tr><form method="post" action="LogoutServlet">
	<input type="submit" name="Logout" value="Logout">
</form></tr>
</table>
</body>
</html>