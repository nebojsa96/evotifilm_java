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
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body class="page-home">
	<%@ include file="layout_header.jsp" %> 
	
	<p class="msg-err"><%= msgError %>
	<p class="msg-succ"><%= msgSuccess %>
	
	
	<form action="func_logout.jsp" method="post"><button>ODJAVA</button></form>
	<hr style="margin-top: 50px" />
	
	<a href="page_home.jsp" style="color: blue; font-size: 16px;">POČETNA</a>
	<table border="solid" style="margin-top: 10px;">
		<tr>
			<th>Ime i prezime</th>
			<th>Korisničko ime</th>
			<th>Email</th>
			<th>Tip (Promeni)</th>
			<th>Obriši</th>
		</tr>
		<%
			if(kList!=null) {
				for(Korisnik k : kList)
				{
		%>
				<tr>
	 				<td style="width: 200px;"><%= k.getPunoIme() %></td>
					<td style="text-align: center;"><%= k.getKorisnickoIme() %></td>
					<td><%= k.getEmail() %></td>
					<td style="text-align: center;">
						<a href="rest_type_korisnik?id=<%=k.getId()%>&tip=<%= k.getTip().equals("admin") ? "korisnik" : "admin" %>" style="color:red;"><%= k.getTip()%></a>
					</td>
					<td style="text-align: center;"><a href="rest_delete_korisnik?id=<%=k.getId()%>" style="color: red;">X</a></td>
				</tr>
		<%
				} 
			}
		%>	
	
	
	</table>

	
</body>
</html>