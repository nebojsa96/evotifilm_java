<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="func_messages.jsp" %>  


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EVOTIFILM</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<h1>PRIJAVA </h1>
	<p class="msg-err"><%= msgError %>
	<p class="msg-succ"><%= msgSuccess %>
	<form action="rest_login" method="post">
		<table>
			<tr>
				<td>Korisničko ime: </td><td><input type="text" name="korisnickoIme" required /></td>
			</tr>
			<tr>
				<td>Šifra: </td><td><input type="password" name="sifra" required /></td>
			</tr>
			<tr>
				<td></td><td>
							<a href="page_register.jsp" style="color: blue;">REGISTRACIJA</a><br/>
							<input type="submit" value="PRIJAVA" />
						</td>
			</tr>
		</table>
	
	</form>
</body>
</html>