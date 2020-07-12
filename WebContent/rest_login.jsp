<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="evotifilm.JPA.entity.Korisnik"%>
<%@page import="evotifilm.JPA.repository.KorisnikRepository"%>


<jsp:useBean id="kb" class="evotifilm.JPA.entity.Korisnik"></jsp:useBean>
<jsp:setProperty property="*" name="kb"/>

<%
	String validateMsg = kb.validateLogin();
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
			session.setAttribute("msg_error", "Pogrešno korisničko ime/šifra");
			response.sendRedirect("page_login.jsp");		
		}
	}
%>