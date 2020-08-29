<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="evotifilm.JPA.entity.Film"%>
<%@page import="evotifilm.JPA.entity.Zanr"%>
<%@page import="evotifilm.JPA.repository.FilmRepository"%>

<%@ include file="func_auth_guard.jsp" %>
<%@ include file="func_init_admin.jsp" %>  
<%@ include file="func_messages.jsp" %>  

<%!
	List<Film> fList;
%>   
<%		
	if(request.getParameter("trazi")!=null) {
		String trazi = request.getParameter("trazi");
		fList = FilmRepository.findByNaziv(trazi.trim());
	} else {
		
		fList = FilmRepository.findAll();
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EVOTIFILM</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/all.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body class="page-home">
	<%@ include file="layout_header.jsp" %> 
	
	<p class="msg-err"><%= msgError %>
	<p class="msg-succ"><%= msgSuccess %>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light mb-2 glavni-meni">
		<div class="row">
			<div class="col-4">
				<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="page_home.jsp">Početna<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="page_chat.jsp">Čet soba</a>
				</li>
				<% if(admin) { %>
				<li class="nav-item active">
					<a class="nav-link" href="page_korisnici.jsp" style="color:red;">Korisnici</a>
				</li>
				<% } %>

		    </ul>
				
		 	</div>
			 <div class="col-4">
			 	<form class="form-inline my-2 my-lg-0 d-flex justify-content-center filter" action="page_home.jsp" method="get">
				      <input class="form-control mr-sm-2" type="text" name="trazi" placeholder="Traži film">
				      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Traži</button>
			    </form>
			 </div>
			 <div class="col-4">
			 	<ul class="navbar-nav d-flex flex-row-reverse">
			 		<li class="nav-item">
				    	<a class="nav-link" href="func_logout.jsp">Odjavi se</a>
				    </li>
			 	</ul>
			 </div>
		</div>
	</nav>
	
	
	<% if(admin){ %>
	<button type="submit" class="btn btn-outline-primary btn-lg btn-block m-auto" onclick="dodajFilmClick()" style="width:80%;">
		DODAJ FILM
	</button>		
	<% } %>
	<table class="table table-hover" style="margin-top: 10px;">
		<thead>
			<tr>
				<th>Naziv</th>
				<th>Godina</th>
				<th>Žanrovi</th>
				<th>Kratak opis</th>
				<th class="text-center">Ocena</th>
				<% if(admin){ %> <th class="text-center">Obriši</th> <% } %>
			</tr>
		</thead>
		<tbody>
			<%
				if(fList!=null) {
					for(Film f : fList)
					{
			%>
			<tr>
 				<td style="width: 200px;" onclick="filmClick(<%=f.getId()%>)"><%= f.getNaziv() %></td>
				<td class="text-center" onclick="filmClick(<%=f.getId()%>)"><%= f.getGodina() %></td>
				<td><%
					Set<Zanr> zanrovi = f.getZanrovi();
					for(Zanr z: zanrovi){
						out.print(z.getNaziv());	
						out.print("<br/>");
					}
				%></td>
				<td onclick="filmClick(<%=f.getId()%>)"><%= f.getKratakOpis() %></td>
				<td class="text-center" onclick="filmClick(<%=f.getId()%>)"><%= f.getOcena() %></td>
				<% if(admin){ %> 
				<td class="text-center">
					<i class="far fa-trash-alt text-danger align-self-center" onclick="deleteFilmClick(<%=f.getId()%>)"></i>
				</td><% } %>
			</tr>
			<% 	
					}
				} 
			%>	
		</tbody>
	
	</table>
	
</body>
<script>
	function filmClick(id){
		location.assign("page_film_detalji.jsp?id="+id);
	}
	function dodajFilmClick(id){
		location.assign("page_film_detalji.jsp?id=-1");
	}
	function deleteFilmClick(id){
		location.assign("rest_delete_film.jsp?id="+id);
	}
	
</script>
</html>