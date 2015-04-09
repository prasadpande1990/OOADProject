<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<h1><center>Comet Career Portal Registration</center></h1>
<form name="selectCategoryForm" method="post" action="selectCategoryServlet">
<table>
	<tr>
		<td>Select Category</td>
		<td>
    		<select name="Category">
    			<option value="Student">Student</option>
    			<option value="Professor">Professor</option>
    			<option value="Company">Company</option>
    			<option value="Department">Department</option>
			</select>		
		</td>
	</tr>
	<tr>
		<td><input type="submit" value="Submit"></td>
	</tr>
</table>
</form>
</body>
</html>