
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
String dateb = request.getParameter("dateb");
String datee = request.getParameter("datee");

String d = "Cвободные номера на : "+dateb+"-"+datee;

ArrayList<Room> rooms = m.LoadFreeRooms(dateb, datee);

%>

<page:leftMenu h2=""/>
<h3><%=d %></h3>

<div class="row">
	<div class="col-md-12">
		<h3>Номера отлея</h3>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				   	  <th>Номер</th>
				      <th>Тип</th>
				      <!--  <th>В себя включает</th>-->
				      <th>Спальных мест</th>
				      <th>Этаж</th>
				      <th>телефон</th>
				      <th>Стоимость</th>
				      <th>Доп. описание</th>
				      <th></th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			  int i = 0;
			  	for( Room r : rooms) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><a href="Room?id=<%=r.getId()%>"><%=r.getRoomNumber()%></a></th>
				      <th><%=r.getRoomTypeName()%></th>
				      <%-- <th><%=r.getRoomTypeDescription() %></th> --%>
				      <th><%=r.getNumberSeats()%></th>
				      <th><%=r.getRoomFloor()%></th>
				      <th><%=r.getRoomPhone()%></th>
				      <th><%=r.getRoomPrice()%></th>
				      <th><%=r.getRoomDescription()%></th>
				      <th></th>
			    <%} %>
			  </tbody>
		</table>
		
		
	</div>
</div>

<div class="row">
	<div class="col-md-3">
		<div class="form-group row">
		    <label for="idr" class="col-sm-5 col-form-label">Номер комнаты</label>
		    <div class="col-sm-7">
			    <select class="form-control" id="idr">
			    <% for(Room rt : rooms){
			    %>
				  <option value="<%=rt.getId()%>"><%=rt.getRoomNumber() %></option>
				  <%
			    }
				  %>
				</select>
			</div>
		</div>
		
		
	</div>
	
	<div class="col-md-3">
		<div class="form-group row">
		    <label for="idtp" class="col-sm-5 col-form-label">Тип питания</label>
		    <div class="col-sm-7">
			    <select class="form-control" id="idtp">
			    <% for(FoodType rt : m.LoadFoodType()){
			    %>
				  <option value="<%=rt.getId()%>"><%=rt.getFoodTypeName()%>+<%=rt.getFoodTypyPrice()%> руб.</option>
				  <%
			    }
				  %>
				</select>
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<input type="hidden" id = "datee" value="<%=datee%>">
		<input type="hidden" id = "dateb" value="<%=dateb%>">
		<button class = "btn btn-block" id="reservedRoom">Забранировать</button>
	</div>
	
</div>


<page:endFile/>

<script src="js/addReserved.js"></script>
</body>
</html>