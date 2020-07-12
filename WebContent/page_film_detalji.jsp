<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="evotifilm.JPA.entity.Film"%>
<%@page import="evotifilm.JPA.entity.Zanr"%>
<%@page import="evotifilm.JPA.repository.FilmRepository"%>
<%@page import="evotifilm.JPA.repository.ZanrRepository"%>


<%@ include file="func_auth_guard.jsp" %>  
<%@ include file="func_messages.jsp" %>  

<%!
	int fid;
	Film film;
	Optional<Film> fRes;
	List<Zanr> zList;
	boolean admin;
	boolean novi;
	boolean izmeni;
	
%>
<%
	admin = false;
	novi = false;
	izmeni = false;
	film = null;

	if(session.getAttribute("tip").equals("admin")) {
		admin = true;
	}
	// POSTOJECI FILM
	if(Integer.parseInt(request.getParameter("id")) > 0) {
		fid = Integer.parseInt(request.getParameter("id"));
	
		if(fid>0){
			fRes = FilmRepository.findById(fid);
			if(fRes.isEmpty()) {
				session.setAttribute("msg_error", "Film sa id-jem "+fid+" ne postoji.");
				response.sendRedirect("page_home.jsp");
			} else {
				film = fRes.get();
			}
		}
		if(request.getParameter("izmeni")!=null){
			izmeni = true;
		}
	} else {
	// NOVI FILM
		fid = -1;
		novi = true;
	}
	zList = ZanrRepository.findAll();

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EVOTIFILM</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="page-film-detalji">
	<h1>Dobrodošao <%= session.getAttribute("korisnik") %>
	<span style="color: <%= session.getAttribute("tip").equals("admin") ? "red" : "blue"%>;">( <%= session.getAttribute("tip") %> )</span></h1> 
	<h1 style="font-size: 72px;">EVOTIFILM</h1>
	
	<p class="msg-err"><%= msgError %>
	<p class="msg-succ"><%= msgSuccess %>
	
	<form action="func_logout.jsp" method="post"><button>ODJAVA</button></form>

	<hr style="margin-top: 50px" />
	
	
	<form name="save-film" action="rest_save_film.jsp" enctype="multipart/form-data" method="post">
		<a href="page_home.jsp" style="color: blue; font-size: 16px;">POČETNA</a>
		<% if(admin && !novi && !izmeni){ %>
			<a href="page_film_detalji.jsp?id=<%= film.getId()%>&izmeni=1" style="color: red; font-size: 16px;">IZMENI</a>
		<% } %>
		<% if(izmeni || novi) { %><input type="submit" value="SAČUVAJ" style="color: red;"><% } %>
		
		<% if(izmeni) { %>
			<input type="hidden" name="id" value="<%= film.getId() %>" />
		<% } %>
		<table border="solid" style="margin-top: 10px;">
			<tr>
				<td rowspan="5" class="img-wrapper">
					<img id="poster" src="image/<%= novi ? "0" : film.getId() %>.jpg" />
					<% if(novi || izmeni) { %>
						<input type="file" id="poster-input" name="poster-input" size="50" />
					<% } %>
				</td>
				<td colspan=2><b>Naziv: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getNaziv() : "" %>" name="naziv" required/>
					<% } else { %>
						<%= film.getNaziv() %>
					<% } %>
				</td>
				<td rowspan="4" style="position: relative;">
					<div class="zanr-multiselect">
						<b>Žanrovi: </b><br/>
						<% if(admin && (izmeni || novi)) { %>
							<select name="zanroviIds" multiple >
								<% for(Zanr z : zList) { %>
									 <option value="<%=z.getId()%>" <%= izmeni && film.getZanrovi().contains(z) ? "selected" : "" %>>
									 	<%= z.getNaziv() %>
									 </option> 
								<% } %>
							</select>
						<% } else { %>
						<% for(Zanr z : film.getZanrovi()) { out.print(z.getNaziv()+"</br>"); } }%>
					</div>
				</td>
			</tr>
			<tr>
				<td><b>Godina: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getGodina() : "" %>" name="godina" required/>
					<% } else { %>
						<%= "("+film.getGodina()+")" %>
					<% } %>
				</td>
				<td><b>Trajanje: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getTrajanje() : "" %>" name="trajanje" required/>
					<% } else { %>
						<%= film.getTrajanje() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td><b>Ocena: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getOcena() : "" %>" name="ocena" required/>
					<% } else { %>
						<%= film.getOcena() %>
					<% } %>
				</td>
				<td><b>Ocena na IMDB-u: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getOcenaImdb() : "" %>" name="ocenaImdb" required/>
					<% } else { %>
						<%= film.getOcenaImdb() %>
					<% } %>
				</td>
			</tr>
			
			<tr>
				<td colspan=2><b>Veza ka IMDB stranici: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getImdb() : "" %>" name="imdb" required/>
					<% } else { %>
						<a href="<%= film.getImdb() %>"><%= film.getImdb() %></a>
					<% } %>
					
				</td>
			</tr>
			<tr>
				<td colspan=3><b>Kratak opis: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<textarea name="kratakOpis" rows=5 required><%= izmeni ? film.getKratakOpis() : "" %></textarea>
					<% } else { %>
						<%= film.getKratakOpis() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan=4><b>Opis: </b><br/>
					<% if(admin && (izmeni || novi)) { %>
						<textarea name="opis" rows=5 required><%= izmeni ? film.getOpis() : "" %></textarea>
					<% } else { %>
						<%= film.getOpis() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan=4><b>Zaključak: </b><br />
					<% if(admin && (izmeni || novi)) { %>
						<textarea name="zakljucak" rows=5 required><%= izmeni ? film.getZakljucak() : "" %></textarea>
					<% } else { %>
						<%= film.getZakljucak() %>
					<% } %>
				</td>
			</tr>
		</table>
	</form>

	
</body>
<script type="text/javascript">
	document.getElementById("poster-input").onchange = function () {
	    var reader = new FileReader();
	
	    reader.onload = function (e) {
	        // get loaded data and render thumbnail.
	        document.getElementById("poster").src = e.target.result;
	    };
	
	    // read the image file as a data URL.
	    reader.readAsDataURL(this.files[0]);
	};
</script>
</html>