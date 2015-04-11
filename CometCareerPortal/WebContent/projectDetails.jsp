<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<%@page import="cometClasses.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Project Details</title>
<link rel="stylesheet" type="text/css" href="./ccpstyle.css">
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
<h1><%=role%> Project</h1>
<h3 class="projectDetails">Add your project here</h3>
<form class="projectDetails" method="post" action="ProjectDetailServlet">
	<table>
		<tr>
				<td><b>Project Title:</b><b style="color:red;"> *</b></td>
				<td>
					<input id="title" name="title" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		<tr>
				<td valign="top">
					<b>Project Description:</b><b style="color:red;"> *</b></td>
				<td>
					<textarea id="description" name="description" style="width:250px; border:1px solid #999999; height: 250px"></textarea>
				</td>
		</tr>
		<tr>
				<td><b>Project Domain:</b><b style="color:red;"> *</b></td>
				<td>
					<input id="domain" name="domain" type="text" maxlength="60" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		<tr>
				<td><b>Programming Languages Used:</b><b style="color:red;"> *</b></td>
				<td>
					<input id="languages" name="languages" type="text" maxlength="100" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		<tr>
				<td><b>Database Used (<i>optional</i>):</b></td>
				<td>
					<input id="database" name="database" type="text" maxlength="100" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		<tr>
				<td><b>Specific Tools/Frameworks Used (<i>optional</i>):</b></td>
				<td>
					<input id="tools" name="tools" type="text" maxlength="100" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
		<tr>
				<td><b>Team Size:</b><b style="color:red;"> *</b></td>
				<td>
					<input id="teamsize" name="teamsize" type="text" maxlength="100" style="width:250px; border:1px solid #999999" />
				</td>
		</tr>
	</table>
	<table>		
		<tr>
				<td align="center">
					<br />
					<input type="submit" name="addProject" value="Add Another" />
				</td>
				<td align="center">
					<br />
					<input type="submit" name="addProject" value="Save & Next" />
				</td>
	
		</tr>	
	</table>	
</form>
</body>
</html>