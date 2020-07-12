<%
	if(session.getAttribute("tip") == null || !session.getAttribute("tip").equals("admin")) {
		response.sendRedirect("page_home.jsp");
		return;
	}
%>