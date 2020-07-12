<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="func_auth_guard.jsp" %>  
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
</head>
<body>

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

<script src="websocket.js"></script>
</html>