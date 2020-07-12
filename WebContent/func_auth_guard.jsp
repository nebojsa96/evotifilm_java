<%
	if(session.getAttribute("korisnik") == null && session.getAttribute("tip") == null) {
		response.sendRedirect("page_login.jsp");
		return;
	}
%>