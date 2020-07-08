<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!
	String msgError;
	String msgSuccess;
%>   
  
<%
	msgSuccess = "";
	msgError = "";
	if(session.getAttribute("msg_success")!= null){
		msgSuccess = (String) session.getAttribute("msg_success");
		session.removeAttribute("msg_success");
	}
	if(session.getAttribute("msg_error")!= null){
		msgError = (String) session.getAttribute("msg_error");
		session.removeAttribute("msg_error");
		
	}
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
</head>
<body>
	<h1>LOGIN </h1>
	<p style="color: red;"><%= msgError %>
	<p style="color: green;"><%= msgSuccess %>
	<form action="rest_login.jsp" method="post">
		<table>
			<tr>
				<td>Ime: </td><td><input type="text" name="korisnickoIme" required /></td>
			</tr>
			<tr>
				<td>Sifra: </td><td><input type="password" name="sifra" required /></td>
			</tr>
			<tr>
				<td></td><td><input type="submit" value="Login" /></td>
			</tr>
		</table>
	
	</form>
</body>
</html>