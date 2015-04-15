<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>
<link rel="stylesheet" type="text/css" href="./ccpstyle.css">
</head>
<%
	HttpSession session = request.getSession();
	session.setAttribute("page", "UpdateProfile");
	String role = (String)session.getAttribute("role");
	
%>
<body>
<h1><center>Update Your Profile</center></h1>
<div align="center" class="navButtons">
<table>
	<tr>
		<td>
			<form class="transparent" method="post" action="updatePersonalInfo.jsp">
				<input type="submit" name="updatePersonalInfoButton" value="Update Personal Information">
			</form>
		</td>
		<td>
			<form class="transparent" method="post" action="projectDetails.jsp">		
				<input type="submit" name="updateProjectButton" value="Add Projects">
			</form>
		</td>
		<td>
			<form class="transparent" method="post" action="addNewSkill.jsp">
				<input type="submit" name="updateSkillsButton" value="Add Skills">
			</form>
		</td>
		<td>
			<form class="transparent" method="post" action="workExperience.jsp">
				<input type="submit" name="updateWorkExButton" value="Add Work Details">
			</form>
		</td>
	</tr>
</table>
</div>
</body>
</html>