<%!
	String msgError;
	String msgSuccess;
%>   
<%
	msgSuccess = "";
	msgError = "";
	if(session.getAttribute("msg_success")!= null){
		msgSuccess = (String) session.getAttribute("msg_success");
		session.removeAttribute("msg_success");
	}
	if(session.getAttribute("msg_error")!= null){
		msgError = (String) session.getAttribute("msg_error");
		session.removeAttribute("msg_error");
	}
%>