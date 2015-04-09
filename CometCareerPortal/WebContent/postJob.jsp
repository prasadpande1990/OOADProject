<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Job</title>
</head>
<body>
<h1><center>Post Job</center></h1>
<form method="post" action="postJobServlet">
	<frame>
	<table border="0" cellpadding="5" cellspacing="0" width="600">
			
	<tr>
			<td><b>Title:</b></td>
			<td><input id="Title" name="Title" type="text" maxlength="60" style="width:300px; border:1px solid #999999" /></td>
	</tr>

	<tr>
			<td><b>Description:</b></td>
			<td><textarea id="Description" name="Description" rows="6" cols="50"></textarea></td>
	</tr>
	<tr>
			<td><b>Visa Category:</b></td>
			<td>
	    		<select name="VisaCategory">
	    			<option value="Select">Select</option>
	    			<option value="USCitizen">US Citizen</option>
	    			<option value="F1">F1</option>
	    			<option value="USCitizen/F1">US Citizen/F1</option>
				</select>								
			</td>
	</tr>
	<tr>
			<td><b>Job Type:</b></td>
			<td>
	    		<select name="JobType">
	    			<option value="Select">Select</option>
	    			<option value="OnCampus">On Campus</option>
	    			<option value="InternshipPartTime">Internship-PartTime</option>
	    			<option value="InternshipFullTime">Internship-FullTime</option>
	    			<option value="FullTime">Full Time</option>
	    			<option value="Contract">Contract based</option>
				</select>								
			</td>
	</tr>
	<tr>
			<td><b>Requirements:</b></td>
			<td><textarea id="Requirements" name="Requirements" rows="6" cols="50"></textarea></td>
	</tr>
	<tr>
			<td><b>Pre-Requisites:</b></td>
			<td><textarea id="PreRequisites" name="PreRequisites" rows="6" cols="50"></textarea></td>
	</tr>
	<tr>
			<td><b>Job Link:</b></td>
			<td><input id="JobLink" name="JobLink" type="text" maxlength="60" style="width:300px; border:1px solid #999999" /></td>
	</tr>
	<tr>
			<td colspan="2" align="center">
			<br />
			<table border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
			</table>
				<input type="submit" value="Post Job" />
			</td>
	</tr>
	</table>
	<br />
	</frame>
</form>
</body>
</html>