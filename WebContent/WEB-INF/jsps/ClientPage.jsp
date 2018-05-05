
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
Client em = m.LoadClientById(id);
%>

<page:leftMenu h2="Информация о клиенте"/>
	<br>
	
	
	<div class="row">
	<div class="col-md-5">
		<div class="textinfo">
			<p><span>ФИО:</span><%= em.getClientName()%></p>
			<p><span>Статус:</span><%=em.getStatusName() %></p>
			<p><span>Пспорт:</span><%=em.getClientPasport()%></p>
			<p><span>Адресс:</span><%=em.getClientAdress()%></p>
		</div>
	</div>
	
	<div class = "col-md-5">
			<div class="form-group row">
			    <label for="name" class="col-sm-2 col-form-label">ФИО:</label>
			    <div class="col-sm-10">
			     	<input type="text" class="form-control" id="name" value="<%=em.getClientName()%>">
			     </div>
			</div>
			
			<div class="form-group row">
			    <label for="pasport" class="col-sm-2 col-form-label">Паспорт:</label>
			    <div class="col-sm-10">
			     	<input type="text" class="form-control" id="pasport" value="<%=em.getClientPasport()%>" >
			     </div>
			</div>
			
			
			<div class="form-group row">
			    <label for="emploe" class="col-sm-2 col-form-label">Статус</label>
			    <div class="col-sm-10">
				    <select class="form-control" id="status">
				    <% for(ClientStatus r :m.LoadClientStatus()){
				    	if(!r.getId().equals(em.getIDClientStatus())) {
				    %>
					  <option value="<%=r.getId()%>"><%=r.getName() %></option>
					  <%
				    }
				    	else {
					  %>
						  <option selected value="<%=r.getId()%>"><%=r.getName() %></option>
					  <%
					  }
				    }
					  %>
					</select>
				</div>
			</div>
			
			
			<div class="form-group row">
			    <label for="adress" class="col-sm-2 col-form-label">Адресс:</label>
			    <div class="col-sm-10">
			     	<input type="text" class="form-control" id="adress" value="<%=em.getClientAdress()%>" >
			     </div>
			</div>	
		
			
			<div class="text-right">
				<hr>
				<input type="hidden" id="id" value="<%=id%>">
				<button id="save" class="btn btn-block">Сохранить изменения</button>
			</div>
	</div>
	
	
</div>
	
	
	
	
<page:endFile/>

<script src="js/Client.js"></script>
</body>
</html>