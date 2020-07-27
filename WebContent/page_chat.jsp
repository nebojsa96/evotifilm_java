<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="func_auth_guard.jsp" %> 
<%@ include file="func_init_admin.jsp" %>  
<%@ include file="func_messages.jsp" %>

<%! String korisnickoIme; %>
<%
	korisnickoIme = (String) session.getAttribute("korisnik");
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
<body class="page-chat">
	<%@ include file="layout_header.jsp" %> 
	
	<p class="msg-err"><%= msgError %>
	<p class="msg-succ"><%= msgSuccess %>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light mb-2 glavni-meni">
		<div class="row">
			<div class="col-4">
				<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="page_home.jsp">Početna<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="page_chat.jsp">Čet soba</a>
				</li>
				<% if(admin) { %>
				<li class="nav-item active">
					<a class="nav-link" href="page_korisnici.jsp" style="color:red;">Korisnici</a>
				</li>
				<% } %>

		    </ul>
				
		 	</div>
			 <div class="col-4">
			 	
			 </div>
			 <div class="col-4">
			 	<ul class="navbar-nav d-flex flex-row-reverse">
			 		<li class="nav-item">
				    	<a class="nav-link" href="func_logout.jsp">Odjavi se</a>
				    </li>
			 	</ul>
			 </div>
		</div>
	</nav>
	
	<div class="row mx-auto" style="width: 80%;">
	    <div class="chat-area col-8">
			<!--  <input type="text" id="korisnickoIme" placeholder="Korisničko ime" value="<%=korisnickoIme%>"/> -->
			<textarea readonly="true" rows="10" cols="80" id="log"></textarea>
			<div class="row mt-2">
				<div class="col-9">
					<input type="text" size="51" class="input-msg form-control" id="input-msg" placeholder="Poruka" disabled/>
				</div>
				<div class="col-3">
					<button class="btn btn-primary btn-send" id="btn-send" onclick="send();" disabled>POŠALJI</button>
				</div>
			</div>
		</div>
	    <div class="users-list col-4">
	    	<button type="button" id="toggle-online" class="toggle-online btn btn-primary mb-3" onclick="toggleChat()" >PRIKLJUČI SE</button>
	    	<label>Online korisnika <span id="num-users" class="badge badge-success badge-pill">0</span></label>
	    	<ul class="list-group" id="ul-users">
			  
			</ul>
	    </div>
    </div>
</body>

<script src="js/websocket.js"></script>
<script>
	
	var isOnline = false;

	function toggleChat() {
		isOnline = !isOnline;
		if (isOnline) {
			$('#toggle-online').text("ISKLJUČI SE");
			$('#toggle-online').removeClass("btn-primary");
			$('#toggle-online').addClass("btn-outline-warning");
			$('#input-msg').attr('disabled',false);
			$('#btn-send').attr('disabled',false);
			connect('<%=korisnickoIme%>');
			
		} else {
			$('#toggle-online').text("PRIKLJUČI SE");
			$('#toggle-online').removeClass("btn-outline-warning");
			$('#toggle-online').addClass("btn-primary");
			$('#input-msg').attr('disabled',true);
			$('#btn-send').attr('disabled',true);
			disconnect();
		}
	}

</script>

</html>