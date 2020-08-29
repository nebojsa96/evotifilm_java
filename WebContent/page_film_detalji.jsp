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
<%@ include file="func_init_admin.jsp" %>  
<%@ include file="func_messages.jsp" %>  

<%!
	int fid;
	Film film;
	Optional<Film> fRes;
	List<Zanr> zList;
	boolean novi;
	boolean izmeni;
	
%>
<%
	novi = false;
	izmeni = false;
	film = null;

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
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/all.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body class="page-film-detalji">
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
	<% if(admin && !novi && !izmeni){ %>
		<button class="btn btn-outline-primary btn-lg btn-block m-auto" onclick="izmeniFilmClick(<%= film.getId()%>)" style="width:80%;">
			IZMENI FILM
		</button>	
	<% } %>
		
	<form name="save-film" action="rest_save_film.jsp" enctype="multipart/form-data" method="post">
	
		<% if(izmeni || novi) { %>
			<button class="btn btn-outline-primary btn-lg btn-block m-auto" type="submit" style="width:80%;">
				SAČUVAJ FILM
			</button>	
		<% } %>
		
		<% if(izmeni) { %>
			<input type="hidden" name="id" value="<%= film.getId() %>" />
		<% } %>
		<table class="table" style="margin-top: 10px;">
		<tbody>
			<tr>
				<td rowspan="5" class="img-wrapper">
					<img id="poster" class="img-fluid" src="image/<%= novi ? "0" : film.getId() %>.jpg" />
					<% if(novi || izmeni) { %>
						<div class="input-group mb-3 file-input">
					    	<div class="custom-file">
					        	<input type="file" class="custom-file-input" id="poster-input" name="poster-input" size="50">
					        	<label class="custom-file-label" id="poster-input-label" for="poster-input">Izaberi poster</label>
					        </div>
					        <div class="input-group-append">
					        	<span class="input-group-text" id="">Poster</span>
					        </div>
					    </div>
						
					<% } %>
				</td>
				<td colspan=2><label class="text-muted">Naziv: </label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getNaziv() : "" %>" class="form-control" name="naziv" required/>
					<% } else { %>
						<h3 class="display-4"><%= film.getNaziv() %></h3>
					<% } %>
				</td>
				<td rowspan="4" style="width: 200px;">
					<label class="ml-2 text-muted">Žanrovi: </label><br/>
					<div class="zanr-multiselect d-flex flex-wrap mt-3">
						<% if(admin && (izmeni || novi)) { %>
							<select name="zanroviIds" multiple class="form-control" required">
								<% for(Zanr z : zList) { %>
									 <option value="<%=z.getId()%>" <%= izmeni && film.getZanrovi().contains(z) ? "selected" : "" %>>
									 	<%= z.getNaziv() %>
									 </option> 
								<% } %>
							</select>
						<% } else {
								boolean in;
								for(Zanr z : zList) { 
									in = false;
									for(Zanr fz : film.getZanrovi()) {
										if(z.getId() == fz.getId()) {
											in = true;
											break;
										} 
									} %>
									<span class="badge badge-pill badge-<%= in ? "primary" : "light" %> m-1"><%=z.getNaziv()%></span>
								<% }
						 	} 
						 %>
					</div>
				</td>
			</tr>
			<tr>
				<td><label class="text-muted">Godina:</label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getGodina() : "" %>" class="form-control" name="godina" required/>
					<% } else { %>
						<%= "("+film.getGodina()+")" %>
					<% } %>
				</td>
				<td><label class="text-muted">Trajanje:</label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getTrajanje() : "" %>" class="form-control" name="trajanje" required/>
					<% } else { %>
						<%= film.getTrajanje() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td><label class="text-muted">Ocena: </label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getOcena() : "" %>" class="form-control" name="ocena" required/>
					<% } else { %>
						<%= film.getOcena() %>
					<% } %>
				</td>
				<td><label class="text-muted">Ocena na IMDB-u:</label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getOcenaImdb() : "" %>" class="form-control" name="ocenaImdb" required/>
					<% } else { %>
						<%= film.getOcenaImdb() %>
					<% } %>
				</td>
			</tr>
			
			<tr>
				<td colspan=2><label class="text-muted">Veza ka IMDB stranici: </label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<input type="text" value="<%= izmeni ? film.getImdb() : "" %>" class="form-control" name="imdb" required/>
					<% } else { %>
						<a href="<%= film.getImdb() %>"><%= film.getImdb() %></a>
					<% } %>
					
				</td>
			</tr>
			<tr>
				<td colspan=3><label class="text-muted">Kratak opis:</label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<textarea class="form-control" name="kratakOpis" rows=5 required><%= izmeni ? film.getKratakOpis() : "" %></textarea>
					<% } else { %>
						<%= film.getKratakOpis() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan=4><label class="text-muted">Opis:</label><br/>
					<% if(admin && (izmeni || novi)) { %>
						<textarea class="form-control" name="opis" rows=5 required><%= izmeni ? film.getOpis() : "" %></textarea>
					<% } else { %>
						<%= film.getOpis() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan=4><label class="text-muted">Zaključak:</label><br />
					<% if(admin && (izmeni || novi)) { %>
						<textarea class="form-control" name="zakljucak" rows=5 required><%= izmeni ? film.getZakljucak() : "" %></textarea>
					<% } else { %>
						<%= film.getZakljucak() %>
					<% } %>
				</td>
			</tr>
		</tbody>
		</table>
	</form>

	
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#poster-input").change(function(){
			var reader = new FileReader();
			
		    reader.onload = function (e) {
		        // get loaded data and render thumbnail
		        $("#poster").attr("src", e.target.result);
		        
		    };
		
		    // read the image file as a data URL.
		    $("#poster-input-label").text(this.files[0].name);
		    reader.readAsDataURL(this.files[0]);
		});
	});
	
	function izmeniFilmClick(id){
		location.assign("page_film_detalji.jsp?id="+id+"&izmeni=1");
	}
</script>
</html>