<%@page import="evotifilm.RMI.IKorisnikRMI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.rmi.Naming"%>
<%@page import="java.rmi.NotBoundException"%>
<%@page import="java.rmi.RemoteException"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="evotifilm.JPA.entity.Korisnik"%>



<%@ include file="func_auth_guard.jsp" %> 
<%@ include file="func_init_admin.jsp" %>
<%@ include file="func_admin_guard.jsp" %> 
<%@ include file="func_messages.jsp" %>  

<%!
	IKorisnikRMI server;
	List<Korisnik> kList;
%>   
<%		
	
	server = (IKorisnikRMI)Naming.lookup("rmi://localhost:1098/KorisnikRMI");
	kList = server.findAll();
	
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
			 <div class="col-4"></div>
			 <div class="col-4">
			 	<ul class="navbar-nav d-flex flex-row-reverse">
			 		<li class="nav-item">
				    	<a class="nav-link" href="func_logout.jsp">Odjavi se</a>
				    </li>
			 	</ul>
			 </div>
		</div>
	</nav>
	
	<table class="table mt-2"">
		<thead>
			<tr>
				<th>Ime i prezime</th>
				<th>Korisničko ime</th>
				<th>Email</th>
				<th class="text-center">Tip (Promeni)</th>
				<th class="text-center">Obriši</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(kList!=null) {
				for(Korisnik k : kList)
				{
		%>
				<tr>
	 				<td ><%= k.getPunoIme() %></td>
					<td ><%= k.getKorisnickoIme() %></td>
					<td><%= k.getEmail() %></td>
					<td class="text-center">
						<span class="badge badge-pill badge-<%= k.getTip().equals("admin") ? "primary" : "light" %>" style="cursor: pointer;"
							 onclick="tipClick(<%=k.getId()%>,<%= k.getTip().equals("admin") ? "'korisnik'" : "'admin'" %>)">
							<%= k.getTip()%>
						</span>
					</td>
					<td class="text-center"><i class="far fa-trash-alt text-danger" onclick="deleteClick(<%=k.getId()%>)" style="cursor: pointer;"></i></td>
				</tr>
		<%
				} 
			}
		%>	
		</tbody>
	
	</table>

	
</body>
<script>
	function tipClick(id, tip){
		location.assign("rest_type_korisnik?id="+id+"&tip="+tip);
	}
	
	function deleteClick(id){
		location.assign("rest_delete_korisnik?id="+id);
	}
</script>
</html>