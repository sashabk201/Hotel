package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MsServer;

@WebServlet("/Room")
public class RoomServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
        request.setAttribute("id", request.getParameter("id"));
        response.getWriter().write(request.getParameter("id"));
        request.getRequestDispatcher("/WEB-INF/jsps/RoomPage.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		MsServer m = new MsServer();
		PrintWriter out = response.getWriter();
		
		String par = request.getParameter("par");
		
		if(par.equals("save")) {
			String num = request.getParameter("number");
			String rtype = request.getParameter("typeRoom");
			String floor = request.getParameter("floor");
			String phone = request.getParameter("phone");
			String price = request.getParameter("price");
			String desc = request.getParameter("desc");
			
			
			if(num != null && rtype != null && floor != null && phone != null && price != null && desc != null && id != null) {
					out.println(!m.UpdateRoom(id, num, rtype, floor, phone, price, desc));
				}
			else {out.println("false");}
		}
		

		if(par.equals("addEm")) {

			String ide = request.getParameter("ide");
			String idet = request.getParameter("idet");
			String date = request.getParameter("date");
			
			
			if(id != null && ide != null && idet != null && date != null) {
					out.println(!m.InsertEmployeeType(id, ide, idet, date));
				}
			else {out.println("false");}
		}
		
		
	}
		
}

