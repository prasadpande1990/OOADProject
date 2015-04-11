<!DOCTYPE html>
<html>

<head>
<title>Company Registration form</title>
</head>

<body>
<h1><center>Company Registration</center></h1>
<form method="post" action="companyRegistrationServlet">
<frame>
<table border="0" cellpadding="5" cellspacing="0" width="600">
<tr>
<td><b>Name:</b></td>
<td><input id="companyName" name="companyName" type="text" maxlength="60" style="width:300px; border:1px solid #999999" /></td>
</tr>
<tr>
<td><b>Description:</b></td>
<td><textarea id="companyDescription" name="companyDescription" rows="6" cols="50"></textarea>
</tr>
<tr>
<td><b>Company Location:</b></td>
<td><input id="companylocation" name="companylocation" type="text" maxlength="60" style="width:300px; border:1px solid #999999" /></td>
</tr>
<tr>
<td><b>Website:</b></td>
<td><input id="website" name="website" type="url" maxlength="60" style="width:300px; border:1px solid #999999" /></td>
</tr>
</table>
<br />
</frame>
	<frame>
		<table>
			<tr>
				<td><b>UserName*: </b></td>
				<td><input id="username" name="username" type="text" maxlength="30" style="width:100px; border:1px solid #999999" /></td>
			</tr>
			<tr>
				<td><b>Password*: </b></td>
				<td><input name="password" type="password" maxlength="30" style="width:100px; border:1px solid #999999" /></td>			
			</tr>
			<tr>
				<td><b>Confirm Password*: </b></td>
				<td><input id="password" name="confirmPassowrd" type="password" maxlength="30" style="width:100px; border:1px solid #999999" /></td>			
			</tr>			
	</frame>
	<tr>
			<td colspan="2" align="center">
			<br />
			<table border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
			</table>
				<input type="submit" value="Register" />
			</td>
	</tr>
</table>
</form>
</body>
</html>