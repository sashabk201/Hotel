
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

<% 
MsServer m = new MsServer();
String id = request.getParameter("id");
Employe em = m.LoadEmployeById(id);
%>

<page:leftMenu h2="Информация о работнике"/>

	<br>
<div class="row">
	<div class="col-md-5">
		<div class="textinfo">
			<p><span>ФИО:</span><%= em.getEmployeeName()%></p>
			<p><span>Телефон:</span><%=em.getEmployePhone() %></p>
			<p><span>Пспорт:</span><%=em.getEmployeePasport()%></p>
			<p><span>Адресс:</span><%=em.getEmployesAdress()%></p>
		</div>
	</div>
	
	<div class = "col-md-5">
			<div class="form-group row">
			    <label for="name" class="col-sm-2 col-form-label">ФИО:</label>
			    <div class="col-sm-10">
			     	<input type="text" class="form-control" id="name" value="<%=em.getEmployeeName()%>">
			     </div>
			</div>
			
			<div class="form-group row">
			    <label for="pasport" class="col-sm-2 col-form-label">Паспорт:</label>
			    <div class="col-sm-10">
			     	<input type="text" class="form-control" id="pasport" value="<%=em.getEmployeePasport()%>" >
			     </div>
			</div>
			
			
			<div class="form-group row">
			    <label for="phone" class="col-sm-2 col-form-label">Телефон:</label>
			    <div class="col-sm-10">
			     	<input type="text" class="form-control" id="phone" value="<%=em.getEmployePhone()%>" >
			     </div>
			</div>
			
			
			<div class="form-group row">
			    <label for="adress" class="col-sm-2 col-form-label">Адресс:</label>
			    <div class="col-sm-10">
			     	<input type="text" class="form-control" id="adress" value="<%=em.getEmployesAdress()%>" >
			     </div>
			</div>	
		
			
			<div class="text-right">
				<hr>
				<input type="hidden" id="id" value="<%=id%>">
				<button id="saveEmploye" class="btn btn-block">Сохранить изменения</button>
			</div>
	</div>
	
	
</div>


<page:endFile/>

<script src="js/Employe.js"></script>
</body>
</html>