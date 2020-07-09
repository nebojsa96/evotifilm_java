<%@page import="java.util.Optional"%>
<%@page import="java.util.Set"%>
<%@page import="evotifilm.JPA.entity.Zanr"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="evotifilm.JPA.repository.FilmRepository"%>
<%@page import="evotifilm.JPA.entity.Film"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=windows-1250"
    pageEncoding="windows-1250"%>
<%!
	int fid;
	Film film;
	Optional<Film> fRes;
	String msgError;
	String msgSuccess;
%>   
<%
	if(session.getAttribute("korisnik") == null && session.getAttribute("uloga") == null) {
		response.sendRedirect("page_login.jsp");
	}
	if(session.getAttribute("korisnik") == null && session.getAttribute("uloga") == null) {
		response.sendRedirect("page_login.jsp");
	}

	fid = Integer.parseInt(request.getParameter("id"));
	
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
	
	if(fid>0){
		fRes = FilmRepository.findById(fid);
		if(fRes.isEmpty()) {
			session.setAttribute("msg_error", "Film sa id-jem "+fid+" ne postoji.");
			response.sendRedirect("page_home.jsp");
		} else {
			film = fRes.get();
		}
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1250">
<title>EVOTIFILM</title>
<style>
	td { min-width: 100px; }

</style>
</head>
<body>
	<h1>Dobrodosao <%= session.getAttribute("korisnik") %>
	<span style="color: <%= session.getAttribute("tip").equals("admin") ? "red" : "blue"%>;">( <%= session.getAttribute("tip") %> )</span></h1> 
	<h1 style="font-size: 72px;">EVOTIFILM</h1>
	
	<p style="color: red;"><%= msgError %>
	<p style="color: green;"><%= msgSuccess %>
	
	
	<form action="func_logout.jsp" method="post"><button>Logout</button></form>

	<hr style="margin-top: 50px" />
	<a href="page_home.jsp" style="color: blue; font-size: 16px;">POCETNA</a>
	<h1><%= film.getNaziv() %></h1>
	<table border="solid" style="margin-top: 10px;">
	
	
	
	</table>

	
</body>
</html>