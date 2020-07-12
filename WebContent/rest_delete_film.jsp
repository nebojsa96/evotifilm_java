
<%@page import="java.util.List"%>
<%@page import="evotifilm.JPA.entity.Film"%>
<%@page import="evotifilm.JPA.entity.Zanr"%>
<%@page import="evotifilm.JPA.repository.FilmRepository"%>

<%@ include file="func_auth_guard.jsp" %>  
	
<%! 
	List<Zanr> zList;
	Film film;
	int fid;
%>
	
<%
	fid = Integer.parseInt(request.getParameter("id"));
	FilmRepository.deleteById(fid);
	session.setAttribute("msg_success", "Film sa id-jem "+fid+" je uspesno obrisan.");
	response.sendRedirect("page_home.jsp");

%>