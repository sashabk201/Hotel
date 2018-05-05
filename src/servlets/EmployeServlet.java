package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MsServer;


@WebServlet("/Employe")
public class EmployeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
        request.setAttribute("id", request.getParameter("id"));
        response.getWriter().write(request.getParameter("id"));
        request.getRequestDispatcher("/WEB-INF/jsps/EmployePage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String par = request.getParameter("par");
		MsServer m = new MsServer();
		PrintWriter out = response.getWriter();
		
		
		if(par.equals("addEmploye")) {
			String name = request.getParameter("name");
			String pasport = request.getParameter("pasport");
			String phone = request.getParameter("phone");
			String adress = request.getParameter("adress");
			if(name != null && pasport != null && phone != null && adress != null) {
				out.println(!m.InsertEmploye(name, pasport, phone, adress));
			}
			else {out.println("false");}
			
		}
	
		if(par.equals("saveEmploye")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pasport = request.getParameter("pasport");
			String phone = request.getParameter("phone");
			String adress = request.getParameter("adress");
			if(name != null && pasport != null && phone != null && adress != null && id !=null) {
				out.println(!m.UpdateEmploye(id,name, pasport, phone, adress));
			}
			else {out.println("false");}
			
		}
		
		if(par.equals("delEmploye")) {
			String id = request.getParameter("id");
			if(id != null) {
				out.println(!m.DeleteEmploye(id));
			}
			else {out.println("false");}
			
		}
		
		
	}

}
