<%!
	boolean admin;
%>   
<%
	admin = false;
	if(session.getAttribute("tip").equals("admin")) {
		admin = true;
	}
%>