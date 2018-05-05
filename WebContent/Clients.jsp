<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="database.MsServer" %>
<%@ page import="wraps.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib tagdir="/WEB-INF/tags/page" prefix="page" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<page:cssTag/>
</head>
<body>
<page:leftMenu h2=""/>

<%
	MsServer m = new MsServer();
	ArrayList<Client> client = m.LoadClients();
%>
<div class="row">
	<div class="col-md-12">
		<h3>Посетители отлея</h3>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				   	  <th>ФИО</th>
				      <th>Статус</th>
				      <th>Паспорт</th>
				      <th>Адрес</th>
				      <th></th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			  int i = 0;
			  	for( Client r :client ) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><a href="Client?id=<%=r.getId()%>"><%=r.getClientName()%></a></th>
				      <th><%=r.getStatusName() %></th>
				      <th><%=r.getClientPasport() %></th>
				      <th><%=r.getClientAdress() %></th>
			    <%} %>
			  </tbody>
		</table>
		
		
	</div>
</div>


<div class = "row">
	
	<div class = "col-md-5">
	
	<h3>Добавить поситителя</h3>
	
		<div class="form-group row">
		    <label for="name" class="col-sm-2 col-form-label">ФИО:</label>
		    <div class="col-sm-10">
		     	<input type="text" class="form-control" id="name" >
		     </div>
		</div>
		
		<div class="form-group row">
		    <label for="pasport" class="col-sm-2 col-form-label">Паспорт:</label>
		    <div class="col-sm-10">
		     	<input type="text" class="form-control" id="pasport">
		     </div>
		</div>
		
		
		<div class="form-group row">
		    <label for="emploe" class="col-sm-2 col-form-label">Статус</label>
		    <div class="col-sm-10">
			    <select class="form-control" id="status">
			    <% for(ClientStatus r :m.LoadClientStatus()){
			    %>
				  <option value="<%=r.getId()%>"><%=r.getName() %></option>
				  <%
			    }
				  %>
				</select>
			</div>
		</div>
		
		
		<div class="form-group row">
		    <label for="adress" class="col-sm-2 col-form-label">Адресс:</label>
		    <div class="col-sm-10">
		     	<input type="text" class="form-control" id="adress" >
		     </div>
		</div>	
	
		<div class="text-right">
			<hr>
			<button id="add" class="btn btn-block">Добавить</button>
		</div>
	</div>
	
	
	
</div>

<page:endFile/>

<script src="js/Client.js"></script>
</body>
</html>