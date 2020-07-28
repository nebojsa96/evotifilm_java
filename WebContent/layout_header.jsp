<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>Dobrodošao <%= session.getAttribute("korisnik") %>
<span style="color: <%= session.getAttribute("tip").equals("admin") ? "red" : "blue"%>;">( <%= session.getAttribute("tip") %> )</span></h1> 
<h1 style="font-size: 72px;">EVOTIFILM</h1>
<%@ include file="layout_uputstvo.jsp" %>