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
<body>
	<%@ include file="layout_header.jsp" %> 
	
    <table>
        <tr>
            <td colspan="2">
                <input type="text" id="korisnickoIme" placeholder="Korisničko ime" value="<%=korisnickoIme%>"/>
                <button type="button" id="connect" onclick="connect();" >PRIKLJUČI SE</button>
                <button type="button" id="disconnect" onclick="disconnect();" disabled>ISKLJUČI SE</button>
            </td>
        </tr>
        <tr>
            <td>
                <textarea readonly="true" rows="10" cols="80" id="log"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" size="51" id="msg" placeholder="Poruka"/>
                <button type="button" onclick="send();" >POŠALJI</button>
            </td>
        </tr>
    </table>
</body>

<script src="js/websocket.js"></script>

</html>