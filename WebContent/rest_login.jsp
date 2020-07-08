<%@page import="evotifilm.beans.KorisnikBean"%>
<%@page import="evotifilm.JPA.entity.Korisnik"%>
<%@page import="evotifilm.JPA.repository.KorisnikRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="kb" class="evotifilm.beans.KorisnikBean"></jsp:useBean>
<jsp:setProperty property="*" name="kb"/>

<%
	String validateMsg = kb.validate();
	if(!validateMsg.equals("")){
		session.setAttribute("msg_error", validateMsg);
		response.sendRedirect("page_login.jsp");
	}
	else {
		Korisnik k = KorisnikRepository.authenticate(kb.getKorisnickoIme(),kb.getSifra());
		if(k!=null){
	session.setAttribute("korisnik", k.getKorisnickoIme());
	session.setAttribute("tip", k.getTip());
	response.sendRedirect("page_home.jsp");
		} else {		
	session.setAttribute("msg_error", "Pogresno korisnicko ime/lozinka");
	response.sendRedirect("page_login.jsp");		
		}
	}
%>