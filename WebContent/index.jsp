
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
<page:leftMenu h2="Мнформация о брони номеров"/>

<%
	MsServer m = new MsServer();
	
	Date dateNow = new Date();
	SimpleDateFormat formatForDateNow = new SimpleDateFormat("yyyy.MM.dd");
	String date = formatForDateNow.format(dateNow).toString();
	
	 GregorianCalendar gcalendar = new GregorianCalendar();
	 
	 String dateE = gcalendar.get(Calendar.YEAR)+"."+gcalendar.get(Calendar.MONTH)+"."+gcalendar.get(Calendar.DATE);
%>

<div class="row">
	
	<div class="col-md-3">
		<div class="form-group row">
		    <label for="dateb" class="col-sm-4 col-form-label">Дата въезда:</label>
		    <div class="col-sm-8">
		     	<input type="text" class="form-control" id="dateb" value="<%=date%>" >
		     </div>
		</div>
	</div>
	
	<div class="col-md-3">
		<div class="form-group row">
		    <label for="datee" class="col-sm-4 col-form-label">Дата выезда:</label>
		    <div class="col-sm-8">
		     	<input type="text" class="form-control" id="datee" value="<%=date%>" >
		     </div>
		</div>
	</div>
	

	<div class="col-md-3">
		<button id="reserved" class = "btn btn-block" >найти номер </button>
	</div>
</div>

<hr>

<div class="row">
	<div class="col-md-12">
		<h3>Номера которые должны освободить сегодня</h3>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				      <th>Номер</th>
				      <th>Дата засиления</th>
				      <th>Дата выезда</th>
				      <th>Тип питания</th>
				      <th>Состояние</th>
				      <th></th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			  int i = 0;
			  	for( ReservedRooms r : m.LoadReservedRoomsByDate(date)) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><a href="Room?id=<%=r.getIdRoom()%>"><%=r.getRoomNumber()%></a></th>
				      <th><%=r.getDateBegin()%></th>
				      <th><%=r.getDateEnd() %></th>
				      <th><%=r.getFoodTypeName()%></th>
				      <th><%=r.getPassed()%></th>
				      <th>
				      <% if(!r.getPassed().equals("Сдан")) { %>
				      	<a href="ReservedRoom?id=<%=r.getId()%>"><button class="btn btn-primary">Оформить выезд</button></a>
				      <%
				      }
				      else {
				      %>
				      	<a href="ReservedRoom?id=<%=r.getId()%>"><button class="btn btn-primary">Просмотреть анкету</button></a>
				      <%
				      }
				      %>
				      </th>
			    <%} %>
			  </tbody>
		</table>
		
		
	</div>
</div>


<div class="row">
	<div class="col-md-12">
		<h3>Номера которые сейчас обслужваются</h3>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				      <th>Номер</th>
				      <th>Дата засиления</th>
				      <th>Дата выезда</th>
				      <th>Тип питания</th>
				      <th>Состояние</th>
				      <th></th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			   	i = 0;
			  	for( ReservedRooms r : m.LoadReservedRoomsInServeses(date)) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><a href="Room?id=<%=r.getIdRoom()%>"><%=r.getRoomNumber()%></a></th>
				      <th><%=r.getDateBegin()%></th>
				      <th><%=r.getDateEnd() %></th>
				      <th><%=r.getFoodTypeName()%></th>
				      <th><%=r.getPassed()%></th>
				      <th>
				      <% if(r.getPassed() != "Сдан"){ %>
				      	<a href="ReservedRoom?id=<%=r.getId()%>"><button class="btn btn-primary">Оформить выезд</button></a>
				      <%
				      }
				      else {
				      %>
				      	<a href="ReservedRoom?id=<%=r.getId()%>"><button class="btn btn-primary">Просмотреть анкету</button></a>
				      <%
				      }
				      %>
				      </th>
			    <%} %>
			  </tbody>
		</table>
		
		
	</div>
</div>




<page:endFile/>

<script src="js/addReserved.js"></script>
</body>
</html>