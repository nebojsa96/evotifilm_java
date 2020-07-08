<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	session.removeAttribute("korisnik");
	session.removeAttribute("tip");
	response.sendRedirect("page_login.jsp");
%>