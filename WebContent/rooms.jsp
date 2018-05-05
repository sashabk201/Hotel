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
%>
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
			  	for( Room r : m.LoadRooms()) {
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
			    <%} %>
			  </tbody>
		</table>
		
		
	</div>
</div>




<page:endFile/>
</body>
</html>

