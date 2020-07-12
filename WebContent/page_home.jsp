<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="evotifilm.JPA.entity.Film"%>
<%@page import="evotifilm.JPA.entity.Zanr"%>
<%@page import="evotifilm.JPA.repository.FilmRepository"%>

<%@ include file="func_auth_guard.jsp" %>  
<%@ include file="func_messages.jsp" %>  

<%!
	List<Film> fList;
	boolean admin;
%>   
<%		
	fList = FilmRepository.findAll();
	admin = false;
	if(session.getAttribute("tip").equals("admin")) {
		admin = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EVOTIFILM</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="page-home">
	<h1>Dobrodošao <%= session.getAttribute("korisnik") %>
	<span style="color: <%= admin ? "red" : "blue"%>;">( <%= session.getAttribute("tip") %> )</span></h1> 
	<h1 style="font-size: 72px;">EVOTIFILM</h1>
	
	<p class="msg-err"><%= msgError %>
	<p class="msg-succ"><%= msgSuccess %>
	
	
	<form action="func_logout.jsp" method="post"><button>ODJAVA</button></form>
	<hr style="margin-top: 50px" />
	<% if(admin){ %>
		<a href="page_film_detalji.jsp?id=-1" style="color: red; font-size: 20px;">DODAJ FILM</a>
		<a href="page_korisnici.jsp" style="color: red; font-size: 20px;">KORISNICI</a>
	<% } %>
	<a href="page_chat.jsp" style="color: blue; font-size: 20px">ČET SOBA</a>
	<table border="solid" style="margin-top: 10px;">
		<tr>
			<th>Naziv</th>
			<th>Godina</th>
			<th>Žanrovi</th>
			<th>Kratak opis</th>
			<th>Ocena</th>
			<% if(admin){ %> <th>Obriši</th> <% } %>
		</tr>
		<%
			if(fList!=null) {
				for(Film f : fList)
				{
		%>
			<tr>
 				<td style="width: 200px;"><a href="page_film_detalji.jsp?id=<%=f.getId()%>"><%= f.getNaziv() %></a></td>
				<td style="text-align: center;"><%= f.getGodina() %></td>
				<td><%
					Set<Zanr> zanrovi = f.getZanrovi();
					for(Zanr z: zanrovi){
						out.print(z.getNaziv());	
						out.print("<br/>");
					}
				%></td>
				<td><%= f.getKratakOpis() %></td>
				<td style="text-align: center;"><%= f.getOcena() %></td>
				<% if(admin){ %> 
				<td style="text-align: center;"><a href="rest_delete_film.jsp?id=<%=f.getId()%>" style="color: red;">X</a></td><% } %>
			</tr>
		<% 	
				}
			} 
		%>	
	
	
	</table>

	
</body>
</html>