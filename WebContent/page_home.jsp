<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!
	//ArrayList<Film> fList;
	String msgError;
	String msgSuccess;
%>   
<%
	if(session.getAttribute("korisnik") == null && session.getAttribute("uloga") == null) {
		response.sendRedirect("page_login.jsp");
	}

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
		
	//fList = FilmRepository.getFilmovi();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EVOTIFILM</title>
<style>
	td { min-width: 100px; }

</style>
</head>
<body>
	<h1 style="font-size: 72px;">EVOTIFILM</h1>
	<h1 style="color: blue;">Dobrodosao <%= session.getAttribute("korisnik") %></h1> 
	<h2 style="color: red">( <%= session.getAttribute("tip") %> )</h2>
	<form action="func_logout.jsp" method="post"><button>Logout</button></form>
	
	<p style="color: red;"><%= msgError %>
	<p style="color: green;"><%= msgSuccess %>
	 

	
</body>
</html>