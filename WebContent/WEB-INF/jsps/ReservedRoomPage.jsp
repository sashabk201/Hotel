
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
ReservedRooms rr = m.LoadReservedRoomsById(id);

double sum = Double.parseDouble(rr.getFoodTypyPrice()); 
sum += Double.parseDouble(rr.getRomPrice());

ArrayList<HotelServices> hs = m.LoadHotelServicesByReserverRoom(id);
ArrayList<Client> clients = m.LoadClientByReservedRooms(id);

for(HotelServices i: hs){
	sum+=Double.parseDouble(i.getServicesPrice());
}

%>


<page:leftMenu h2="Информация броне"/>
<div class="row">
	<div class="col-md-4">
		<div class="textinfo">
			<p><span>Номер комнаты:</span><a href="Room?id=<%=rr.getIdRoom()%>"><%=rr.getRoomNumber() %></a></p>
			<p><span>Дата засиления:</span><%=rr.getDateBegin() %></p>
			<p><span>Дата выезда:</span><%=rr.getDateEnd() %></p>
			<p><span>Тип питания:</span><%=rr.getFoodTypeName() %></p>
			<p><span>питание включает:</span><%=rr.getFoodTypeDescription() %></p>
			<p><span>Статус:</span><strong><%=rr.getPassed()%></strong></p>
			<p><span>Итоговая сумма:</span><%=sum %><strong></strong></p>
		</div>
	</div>
	
	
	<div class="col-md-5">
		<div class="form-group row">
		    <label for="dateend" class=" col-sm-3 col-form-label">Дата выезда:</label>
		    <div class="col-sm-9">
		     	<input type="text" class="form-control" id="dateend" value="<%=rr.getDateEnd()%>">
		     </div>
		</div>
	</div>
	
	<div class="col-md-1">
		<input type="hidden" id="id" value="<%=id%>">
		<button id="save" class="btn btn-success">Сохранить изменения</button>
		<br>
		<br>
		<button id="passed" class="btn btn-warning">Оформить выезд и оплатить</button>
	</div>

</div>



<hr>

<div class="row">

	<div class="col-md-6">
		<h4>Проживающие в номере:</h4>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				      <th>ФИО</th>
				      <th>Статус</th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			  int i = 0;
			  	for( Client c : clients) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><a href="Client?id=<%=c.getId()%>"><%=c.getClientName()%></th>
				      <th><%=c.getStatusName()%></th>
			    <%} %>
			  </tbody>
		</table>
	</div>

	<div class="col-md-6">
		<div class="col-md-5">
			<div class="form">
				<h4>Добавить проживающего в номере</h4>
				<hr>
				<div class="form-group row">
				    <label for="client" class="col-sm-2 col-form-label">ФИО</label>
				    <div class="col-sm-10">
					    <select class="form-control" id="client">
					    <% for(Client rt : m.LoadClientNotInReservedRoom(id)){
					    %>
						  <option value="<%=rt.getId()%>"><%=rt.getClientName() %></option>
						  <%
					    }
						  %>
						</select>
					</div>
				</div>
				<br>
				<button id="addclient" class="btn btn-primary btn-block">Добавить</button>
			</div>
		</div>
		
		<div class="col-md-5">
			<div class="form">
				<h4>Удалить проживающего в номере</h4>
				<hr>
				<div class="form-group row">
				    <label for="clientdel" class="col-sm-2 col-form-label">ФИО</label>
				    <div class="col-sm-10">
					    <select class="form-control" id="clientdel">
					    <% for(Client rt : clients){
					    %>
						  <option value="<%=rt.getId()%>"><%=rt.getClientName() %></option>
						  <%
					    }
						  %>
						</select>
					</div>
				</div>
				<br>
				<button id="delclient" class="btn btn-warning btn-block">Удалить</button>
			</div>
		</div>
	
	</div>
	
</div>

<!-- END ROW -->

<div class="row">
	
	<div class="col-md-6">
		<h4>Услуги пердоставленные отелем:</h4>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				      <th>наименование услгуи</th>
				      <th>Стоимость</th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			  i = 0;
			  	for( HotelServices c : hs) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><%=c.getServicesName()%></th>
				      <th><%=c.getServicesPrice()%></th>
			    <%} %>
			  </tbody>
		</table>
	</div>


	<div class="col-md-5">
		<div class="form">
			<h4>Добавить услугу к счету</h4>
			<hr>
			<div class="form-group row">
			    <label for="servese" class="col-sm-2 col-form-label">Наименование</label>
			    <div class="col-sm-10">
				    <select class="form-control" id="servese">
				    <% for(HotelServices rt : m.LoadHotelService()){
				    %>
					  <option value="<%=rt.getIDHotelServices()%>"><%=rt.getServicesName() %></option>
					  <%
				    }
					  %>
					</select>
				</div>
			</div>
			<br>
			<button id="addservese" class="btn btn-primary btn-block">Добавить</button>
		</div>
	</div>
	<hr>
</div>



<page:endFile/>

<script src="js/ReservedRoom.js"></script>
</body>
</html>