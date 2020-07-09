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
	List<Film> fList;
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
		
	fList = FilmRepository.findAll();

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
	<% if(session.getAttribute("tip").equals("admin")){ %>
		<a href="page_film_detalji.jsp?id=-1" style="color: red; font-size: 20px;">DODAJ FILM</a>
	<% } %>
	<table border="solid" style="margin-top: 10px;">
		<tr>
			<%-- <th>ID</th> --%>
			<th>Naziv</th>
			<th>Godina</th>
			<th>Zanrovi</th>
			<th>Kratak opis</th>
			<th>Ocena</th>
			<% if(session.getAttribute("tip").equals("admin")){ %> <th>Akcija</th> <% } %>
		</tr>
		<%
		
			for(Film f : fList)
			{
		%>
			<tr>
				<%-- <td><%= f.getId() %></td> --%>
 				<td><a href="page_film_detalji.jsp?id=<%=f.getId()%>"><%= f.getNaziv() %></a></td>
				<td style="text-align: center;"><%= f.getGodina() %></td>
				<td><%
					Set<Zanr> zanrovi = f.getZanrovi();
					for(Zanr z: zanrovi){
						out.print(z.getNaziv());	
						out.print("<br/>");
					}
				%></td>
				<td><%= f.getKratak_opis() %></td>
				<td style="text-align: center;"><%= f.getOcena() %></td>
				<% if(session.getAttribute("tip").equals("admin")){ %> 
				<td style="text-align: center;"><a href="rest_film_obrisi.jsp?id=<%=f.getId()%>" style="color: red;">X</a></td><% } %>
			</tr>
		<% } %>	
	
	
	</table>

	
</body>
</html>