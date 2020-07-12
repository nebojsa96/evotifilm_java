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
<%@ include file="func_messages.jsp" %>  

<%!
	IKorisnikRMI server;
	List<Korisnik> kList;
	boolean admin;
%>   
<%		
	admin = false;
	if(session.getAttribute("tip").equals("admin")) {
		admin = true;
	}
	if(!admin) {
		response.sendRedirect("page_home.jsp");
		return;
	}
	
	server = (IKorisnikRMI)Naming.lookup("rmi://localhost:1098/KorisnikRMI");
	kList = server.findAll();
	
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