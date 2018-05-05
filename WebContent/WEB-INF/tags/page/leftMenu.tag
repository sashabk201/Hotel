<%@ tag pageEncoding="UTF-8" %>

<%@ attribute name="h2" type="java.lang.String" %>

<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<div class="left-menu">
					<div class="image"><img src="img/hotel.png" alt=""></div>
	<!-- 				<h4>Главное меню</h4> -->
					<ul>
						<li class="menu-item"><a href="index.jsp"><i class="fas fa-calendar-alt"></i>Брони</a></li>
						<li class="menu-item"><a href="rooms.jsp"><i class="fas fa-hospital-alt"></i>Номера</a></li>
						<li class="menu-item"><a href="employe.jsp"><i class="fas  fa-people-carry"></i>Работники</a></li>
						<li class="menu-item"><a href="Clients.jsp"><i class="fas  fa-users"></i>Клиенты</a></li>
						<!-- 		<li class="menu-item"><a href="addTeacher.jsp"><i class="fas fa-book"></i>Услуги и работы</a></li> -->
					</ul>
				</div>
			</div>
			<div class="col-md-10">
				<h2>${h2}</h2>
				<div class="content">