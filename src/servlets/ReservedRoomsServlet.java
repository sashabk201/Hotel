package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MsServer;


@WebServlet("/ReservedRoom")
public class ReservedRoomsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
        request.setAttribute("id", request.getParameter("id"));
        response.getWriter().write(request.getParameter("id"));
        request.getRequestDispatcher("/WEB-INF/jsps/ReservedRoomPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String par = request.getParameter("par");
		MsServer m = new MsServer();
		PrintWriter out = response.getWriter();
		
		if(par.equals("save")) {
			String dateend = request.getParameter("dateend");
			
			if(id != null && dateend != null) {
				out.println(!m.UpdateReservedRoom(id,dateend));
			}
			else {out.println("false");}
		}
		
		if(par.equals("passed")) {	
			if(id != null) {
				out.println(!m.ReservedRoom(id));
			}
			else {out.println("false");}
		}
		

		if(par.equals("addclient")) {
			String client = request.getParameter("client");
			
			if(id != null && client != null) {
				out.println(!m.InsertClientInReservedRooms(client,id));
			}
			else {out.println("false");}
		}
		
		if(par.equals("delclient")) {
			String client = request.getParameter("clientdel");
			
			if(id != null && client != null) {
				out.println(!m.DeleteClientInReservedRooms(client,id));
			}
			else {out.println("false");}
		}
		
		if(par.equals("addservese")) {
			String servese = request.getParameter("servese");
			
			if(id != null && servese != null) {
				out.println(!m.InsertServesInReservedRooms(servese,id));
			}
			else {out.println("false");}
		}
		
	}

}
