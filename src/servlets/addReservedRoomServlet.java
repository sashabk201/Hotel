package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MsServer;


@WebServlet("/addReservedRoom")
public class addReservedRoomServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
        request.getRequestDispatcher("/WEB-INF/jsps/addReservesPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String par = request.getParameter("par");
		MsServer m = new MsServer();
		PrintWriter out = response.getWriter();
		
		
		if(par.equals("reservedRoom")) {
			String dateb = request.getParameter("dateb");
			String datee = request.getParameter("datee");
			String idr = request.getParameter("idr");
			String idtp = request.getParameter("idtp");
			
			if(dateb != null && datee != null && idr != null && idtp !=null) {
				out.println(!m.InsertReservedRooms(idr, idtp, dateb, datee));
			}
			else {out.println("false");}
			
		}
	}

}
