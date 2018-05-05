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
	ArrayList<Employe> em = m.LoadEmployes();
%>
<div class="row">
	<div class="col-md-12">
		<h3>Работники отлея</h3>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				   	  <th>ФИО</th>
				      <th>Телефон</th>
				      <th>Паспорт</th>
				      <th>Адрес</th>
				      <th></th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			  int i = 0;
			  	for( Employe r :em ) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><a href="Employe?id=<%=r.getId()%>"><%=r.getEmployeeName()%></a></th>
				      <th><%=r.getEmployePhone() %></th>
				      <th><%=r.getEmployeePasport() %></th>
				      <th><%=r.getEmployesAdress() %></th>
			    <%} %>
			  </tbody>
		</table>
		
		
	</div>
</div>

<hr>

<div class = "row">
	
	<div class = "col-md-5">
	
	<h3>Добавить работника</h3>
	
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
		    <label for="phone" class="col-sm-2 col-form-label">Телефон:</label>
		    <div class="col-sm-10">
		     	<input type="text" class="form-control" id="phone"  >
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
			<button id="addEmploye" class="btn btn-block">Добавить</button>
		</div>
	</div>


	<div class = "col-md-5">
	
	<h3>Удалить работника</h3>
	
			<div class="form-group row">
			    <label for="emploe" class="col-sm-2 col-form-label">ФИО</label>
			    <div class="col-sm-10">
				    <select class="form-control" id="emploe">
				    <% for(Employe r :em){
				    %>
					  <option value="<%=r.getId()%>"><%=r.getEmployeeName() %></option>
					  <%
				    }
					  %>
					</select>
				</div>
			</div>
	
		<div class="text-right">
			<hr>
			<button id="delEmploye" class="btn btn-block">Удалить</button>
		</div>
	</div>



</div>



<page:endFile/>

<script src="js/Employe.js"></script>
</body>
</html>

