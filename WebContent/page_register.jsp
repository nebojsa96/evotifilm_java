<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="func_messages.jsp" %>  


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EVOTIFILM</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<h1>REGISTRACIJA </h1>
	<p class="msg-err"><%= msgError %>
	<p class="msg-succ"><%= msgSuccess %>
	<form action="rest_register" method="post">
		<table>
			<tr>
				<td>Puno ime i prezime: </td><td><input type="text" name="punoIme" required /></td>
			</tr>
			<tr>
				<td>Korisničko ime: </td><td><input type="text" name="korisnickoIme" required /></td>
			</tr>
			<tr>
				<td>Šifra: </td><td><input type="password" name="sifra" required /></td>
			</tr>
			<tr>
				<td>Ponovljena šifra: </td><td><input type="password" name="sifra2" required /></td>
			</tr>
			<tr>
				<td>Email: </td><td><input type="text" name="email" required /></td>
			</tr>
			<tr>
				<td></td><td><input type="submit" value="REGISTRACIJA" /></td>
			</tr>
		</table>
	
	</form>
</body>
</html>