
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
Room r = m.LoadRoomById(id);


Date dateNow = new Date();
SimpleDateFormat formatForDateNow = new SimpleDateFormat("yyyy.MM.dd");
String date = formatForDateNow.format(dateNow).toString();

%>


<page:leftMenu h2="Информация о номере"/>
<div class="row">
	<div class="col-md-5">
		<div class="textinfo">
			<p><span>Номер:</span><%=r.getRoomNumber()%></p>
			<p><span>Тип:</span><%=r.getRoomTypeName()%></p>
			<p><span>Включает в себя:</span><%=r.getRoomTypeDescription() %></p>
			<p><span>Спальных мест:</span><%=r.getNumberSeats()%></p>
			<p><span>Этаж:</span><%=r.getRoomFloor() %></p>
			<p><span>Телефон:</span><%=r.getRoomPhone() %></p>
			<p><span>Стоимость:</span><%=r.getRoomPrice()%></p>
			<p><span>Доп. описание:</span><%=r.getRoomDescription()%></p>
		</div>
	</div>
	
	<div class="col-md-4">
			<div class="form-group row">
			    <label for="number" class="col-sm-2 col-form-label">Номер:</label>
			    <div class="col-sm-9">
			     	<input type="text" class="form-control" id="number" value="<%=r.getRoomNumber()%>" >
			     </div>
			</div>
			
			<div class="form-group row">
			    <label for="typeRoom" class="col-sm-2 col-form-label">Тип</label>
			    <div class="col-sm-9">
				    <select class="form-control" id="typeRoom">
				    <% for(RoomType rt : m.LoadRoomType()){
				    %>
					  <option value="<%=rt.getId()%>"><%=rt.getRoomTypeName() %></option>
					  <%
				    }
					  %>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
			    <label for="floor" class="col-sm-2 col-form-label">Этаж:</label>
			    <div class="col-sm-9">
			     <input type="text" class="form-control" id="floor" value="<%=r.getRoomFloor() %>">
			     </div>
			</div>
			
			<div class="form-group row">
			    <label for="phone" class="col-sm-2 col-form-label">Телефон:</label>
			    <div class="col-sm-9">
			     <input type="text" class="form-control" id="phone" value="<%=r.getRoomPhone() %>">
			     </div>
			</div>
			
			<div class="form-group row">
			    <label for="price" class="col-sm-2 col-form-label">Стоимость:</label>
			    <div class="col-sm-9">
			     <input type="text" class="form-control" id="price" value="<%=r.getRoomPrice() %>">
			     </div>
			</div>
			
			<div class="form-group row">
			    <label for="desc" class="col-sm-2 col-form-label">Описание:</label>
			    <div class="col-sm-9">
			    <textarea class="form-control" id="desc" rows="3" ><%=r.getRoomDescription()%></textarea>
			    </div>
			</div>
		
	</div>
	
	<div class="col-md-1">
		<input type="hidden" id="id" value="<%=id%>">
		<button id="save" class="btn btn-success">Сохранить изменения</button>
	</div>
	

</div>

<hr>

<div class="row">
	<div class="col-md-6">
		<h3>Работы в номере:</h3>
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th>#</th>
				      <th>ФИО работника</th>
				      <th>Тип работы</th>
				      <th>Дата</th>
				    </tr>
			  </thead>
			  <tbody>
			  <%
			  int i = 0;
			  	for( EmployeeInRoom e : m.loadEmployeeInRoom(id)) {
			  		i++;
			  %>
				    <tr>
				      <th><%=i %></th>
				      <th><%=e.getEmployeeName()%></th>
				      <th><%=e.getWorkTypeName()%></th>
				      <th><%=e.getEmployeeDate()%></th>
			    <%} %>
			  </tbody>
		</table>	
	</div>
	
	<div class="col-md-5">
		<h3>Назначить работу в номере:</h3>
		
		<div class="form-group row">
		    <label for="typeRoom" class="col-sm-2 col-form-label">Работник</label>
		    <div class="col-sm-10">
			    <select class="form-control" id="ide">
			    <% for(Employe rt : m.LoadEmployes()){
			    %>
				  <option value="<%=rt.getId()%>"><%=rt.getEmployeeName() %></option>
				  <%
			    }
				  %>
				</select>
			</div>
		</div>
	
		<div class="form-group row">
		    <label for="typeRoom" class="col-sm-2 col-form-label">Тип рботы</label>
		    <div class="col-sm-10">
			    <select class="form-control" id="idet">
			    <% for(EmployeeType rt : m.LoadEmployeeType()){
			    %>
				  <option value="<%=rt.getId()%>"><%=rt.getWorkTypeName() %></option>
				  <%
			    }
				  %>
				</select>
			</div>
		</div>
	
		<div class="form-group row">
		    <label for="date" class="col-sm-2 col-form-label">Дата:</label>
		    <div class="col-sm-10">
		   <input type="text" class="form-control" id="date" value="<%=date%>">
		    </div>
		</div>
	<br>
	<button id="addEm" class="btn btn-block">Добавить</button>
	</div>
	
</div>



<page:endFile/>

<script src="js/Room.js"></script>
</body>
</html>