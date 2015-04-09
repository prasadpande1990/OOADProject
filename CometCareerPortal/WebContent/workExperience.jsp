<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<%@page import="cometClasses.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Work Experience Details</title>
</head>
<%
	String role;
	HttpSession session = request.getSession();
	Student stud = (Student)session.getAttribute("student");
	Professor prof = (Professor)session.getAttribute("professor");
	if(stud==null) {
		role="Professor";
		session.setAttribute("professor",prof);
	} else {
		role="Student";
		session.setAttribute("student", stud);
	}	
	session.setAttribute("role", role);
%>
<body>
<h1><center><%=role%> Registration</center></h1>
<h2>Add your Work Experience Here</h2>
<form method="post" action="WorkExpDetailServlet">
	<frame>
	<table border="0" cellpadding="5" cellspacing="0" width="600">
		<tr>
				<td><b>Employer*:</b></td>
				<td>
					<input id="employer" name="employer" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		<tr>
				<td><b>Years of Experience*:</b></td>
				<td>
					<input id="yearsExp" name="yearsExp" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		<tr>
				<td><b>Company Designation*:</b></td>
				<td>
					<input id="designation" name="designation" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		</frame>
		<tr>
				<td colspan="2" align="center">
					<br />
					<table border="0" cellpadding="0" cellspacing="0">
						<tr valign="top">
					</table>
					<input type="submit" name="addWorkExp" value="Add Another" />
				</td>
				<td colspan="2" align="center">
					<br />
					<table border="0" cellpadding="0" cellspacing="0">
						<tr valign="top">
					</table>
					<input type="submit" name="addWorkExp" value="Save & Next" />
				</td>
				<td colspan="2" align="center">
					<br />
					<table border="0" cellpadding="0" cellspacing="0">
						<tr valign="top">
					</table>
					<input type="submit" name="addWorkExp" value="Skip" />
				</td>	
		</tr>		
</table>	
</form>
</body>
</html>