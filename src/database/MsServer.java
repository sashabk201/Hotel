package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import wraps.*;

public class MsServer {

	private static String server = "MSI-LAPTOP";
	private static String dbName = "Hotel";
	private static String user = "MSI-LAPTOP";
	private static String Connectionstring =  "jdbc:sqlserver://"+server+";databaseName="+dbName+"; user="+user+"; integratedSecurity=true";
	
	Connection con;
	Statement stmt;
	
	
	public boolean executeQuery(String query) {
		
		try {
			boolean res = false;
	    	DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
	        Connection con = DriverManager.getConnection(Connectionstring);
	        Statement stmt = con.createStatement();
	        res = stmt.execute(query);
	        stmt.close();
	        con.close();
	        return res;
	    } catch (SQLException ex) {
	        Logger.getLogger(MsServer.class.getName()).log(Level.SEVERE, null, ex);
	        return false;
	    }
	}
	
	public ResultSet ExecuteReader(String query) {
		
		try {
	    	
	    	DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
	        con = DriverManager.getConnection(Connectionstring);
	        stmt = con.createStatement();
	        ResultSet executeQuery = stmt.executeQuery(query);
	        return executeQuery;
	    } catch (SQLException ex) {
	        Logger.getLogger(MsServer.class.getName()).log(Level.SEVERE, null, ex);
	    }
		return null;
}
	
	
	
	
	
	
	//LOAD
	
		//ReservedRooms
	
		private String loadReservedRooms = "SELECT rr.ID,rr.IDRoom,r.RoomNumber,r.RoomPrice ,rr.DateBegin,rr.DateEnd,rr.IDFoodType ,f.FoodTypeName, f.FoodTypeDescription ,rr.Passed, f.FoodTypyPrice  FROM ReservedRooms as rr\r\n" + 
			"JOIN Rooms as r ON r.ID = rr.IDRoom\r\n" + 
			"JOIN FoodType as f ON f.ID = rr.IDFoodType";
	
	public ArrayList<ReservedRooms> LoadReservedRoomsByDate(String date) throws SQLException{
		
		 ArrayList<ReservedRooms> list = new ArrayList<ReservedRooms>();
		 ResultSet result = ExecuteReader(loadReservedRooms+" WHERE rr.DateEnd = '"+date+"' ORDER BY rr.Passed");
		 while (result.next()) {
			 ReservedRooms i = new ReservedRooms();
		    i.setId(result.getString("ID"));
		    i.setIDFoodType(result.getString("IDFoodType"));
		    i.setIdRoom(result.getString("IDRoom"));
		    i.setRoomNumber(result.getString("RoomNumber"));
		    i.setDateBegin(result.getString("DateBegin"));
		    i.setDateEnd(result.getString("DateEnd"));
		    i.setFoodTypeName(result.getString("FoodTypeName"));
		    if(result.getString("Passed").equals("1"))
		    	{i.setPassed("Сдан");}
		    else {i.setPassed("Не сдан");}
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
	public ArrayList<ReservedRooms> LoadReservedRoomsInServeses(String date) throws SQLException{
		
		 ArrayList<ReservedRooms> list = new ArrayList<ReservedRooms>();
		 ResultSet result = ExecuteReader(loadReservedRooms+" WHERE rr.DateEnd >= '"+date+"' AND rr.DateBegin <= '"+date+"'  ORDER BY rr.Passed");
		 while (result.next()) {
			 ReservedRooms i = new ReservedRooms();
		    i.setId(result.getString("ID"));
		    i.setIDFoodType(result.getString("IDFoodType"));
		    i.setIdRoom(result.getString("IDRoom"));
		    i.setRoomNumber(result.getString("RoomNumber"));
		    i.setDateBegin(result.getString("DateBegin"));
		    i.setDateEnd(result.getString("DateEnd"));
		    i.setFoodTypeName(result.getString("FoodTypeName"));
		    if(result.getString("Passed").equals("1"))
		    	{i.setPassed("Сдан");}
		    else {i.setPassed("Не сдан");}
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
	
	public ReservedRooms LoadReservedRoomsById(String id) throws SQLException{
		
		 ReservedRooms i = new ReservedRooms();
		 ResultSet result = ExecuteReader(loadReservedRooms+" WHERE rr.ID = "+id);
		 while (result.next()) {
		    i.setId(result.getString("ID"));
		    i.setIDFoodType(result.getString("IDFoodType"));
		    i.setIdRoom(result.getString("IDRoom"));
		    i.setRoomNumber(result.getString("RoomNumber"));
		    i.setDateBegin(result.getString("DateBegin"));
		    i.setDateEnd(result.getString("DateEnd"));
		    i.setFoodTypeName(result.getString("FoodTypeName"));
		    i.setFoodTypeDescription(result.getString("FoodTypeDescription"));
		    i.setFoodTypyPrice(result.getString("FoodTypyPrice"));
		    i.setRomPrice(result.getString("RoomPrice"));
		    if(result.getString("Passed").equals("1"))
		    	{i.setPassed("Сдан");}
		    else {i.setPassed("Не сдан");}
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return i;
	}
	
	
	public ArrayList<Client> LoadClientByReservedRooms(String id) throws SQLException{
		
		 ArrayList<Client> list = new ArrayList<Client>();
		 for(String i: this.LoadFilds("SELECT IDClient FROM ClientsInRoom WHERE IDReservedRooms = "+id, "IDClient")) {
			 list.add(this.LoadClientById(i));
		 }
		 return list;
	}
	
	
	
		//FoodType
	
		String loadFoodType = "SELECT ID,FoodTypeName,FoodTypyPrice,FoodTypeDescription FROM FoodType";
	
	public ArrayList<FoodType> LoadFoodType() throws SQLException{
		
		 ArrayList<FoodType> list = new ArrayList<FoodType>();
		 ResultSet result = ExecuteReader(loadFoodType);
		 while (result.next()) {
			 FoodType i = new FoodType();
			 i.setId(result.getString("ID"));
			 i.setFoodTypeName(result.getString("FoodTypeName"));
			 i.setFoodTypyPrice(result.getString("FoodTypyPrice"));
			 i.setFoodTypeDescription(result.getString("FoodTypeDescription"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
	
		//ROOMS 
		
		private String loadRooms = "SELECT r.ID,r.RoomNumber, r.IDRoomType,rt.RoomTypeDescription,rt.RoomTypeName,rt.NumberSeats,r.RoomFloor,r.RoomPhone,r.RoomPrice,r.RoomDescription FROM Rooms as r\r\n" + 
				"JOIN RoomType as rt ON rt.ID = r.IDRoomType";
	
	public Room LoadRoomById(String id) throws SQLException{

		Room i = new Room();
		 ResultSet result = ExecuteReader(loadRooms+" WHERE r.ID = "+id);
		 while (result.next()) {
		    i.setId(result.getString("ID"));
		    i.setRoomNumber(result.getString("RoomNumber"));
		    i.setiDRoomType(result.getString("IDRoomType"));
		    i.setRoomTypeDescription(result.getString("RoomTypeDescription"));
		    i.setRoomTypeName(result.getString("RoomTypeName"));
		    i.setNumberSeats(result.getString("NumberSeats"));
		    i.setRoomFloor(result.getString("RoomFloor"));
		    i.setRoomPhone(result.getString("RoomPhone"));
		    i.setRoomPrice(result.getString("RoomPrice"));
		    i.setRoomDescription(result.getString("RoomDescription"));
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return i;
	}
	
	
	public ArrayList<Room> LoadRooms() throws SQLException{
		
		 ArrayList<Room> list = new ArrayList<Room>();
		 ResultSet result = ExecuteReader(loadRooms);
		 while (result.next()) {
			 Room i = new Room();
			 i.setId(result.getString("ID"));
			    i.setRoomNumber(result.getString("RoomNumber"));
			    i.setiDRoomType(result.getString("IDRoomType"));
			    i.setRoomTypeDescription(result.getString("RoomTypeDescription"));
			    i.setRoomTypeName(result.getString("RoomTypeName"));
			    i.setNumberSeats(result.getString("NumberSeats"));
			    i.setRoomFloor(result.getString("RoomFloor"));
			    i.setRoomPhone(result.getString("RoomPhone"));
			    i.setRoomPrice(result.getString("RoomPrice"));
			    i.setRoomDescription(result.getString("RoomDescription"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
	public ArrayList<Room> LoadFreeRooms(String dateb, String datee) throws SQLException{
		
		 ArrayList<Room> list = new ArrayList<Room>();
		
		 String sql = "SELECT rr.IDRoom FROM ReservedRooms as rr WHERE (rr.DateEnd BETWEEN '"+dateb+"' AND '"+datee+"')\r\n" + 
		 		" OR (rr.DateBegin BETWEEN '"+dateb+"' AND '"+datee+"')";
		 
		 sql = "SELECT ID FROM Rooms WHERE ID NOT IN ("+sql+")";
		 
		 for(String id : LoadFilds(sql, "ID")) {
			 list.add(LoadRoomById(id));
		 }
		 
		 return list;
	}
	
	
	
		//Employe
	
	private String loadEmploye= "SELECT ID,EmployeeName, EmployePhone,EmployeePasport,EmployesAdress FROM Employes ";
	
	
	public Employe LoadEmployeById(String id) throws SQLException{

		Employe i = new Employe();
		 ResultSet result = ExecuteReader(loadEmploye+" WHERE ID = "+id);
		 while (result.next()) {
		    i.setId(result.getString("ID"));
		    i.setEmployeeName(result.getString("EmployeeName"));
		    i.setEmployePhone(result.getString("EmployePhone"));
		    i.setEmployeePasport(result.getString("EmployeePasport"));
		    i.setEmployesAdress(result.getString("EmployesAdress"));
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return i;
	}
	
	
	
	public ArrayList<Employe> LoadEmployes() throws SQLException{
		
		 ArrayList<Employe> list = new ArrayList<Employe>();
		 ResultSet result = ExecuteReader(loadEmploye);
		 while (result.next()) {
			 Employe i = new Employe();
			 	i.setId(result.getString("ID"));
			 	i.setEmployeeName(result.getString("EmployeeName"));
			    i.setEmployePhone(result.getString("EmployePhone"));
			    i.setEmployeePasport(result.getString("EmployeePasport"));
			    i.setEmployesAdress(result.getString("EmployesAdress"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
		//EmployeeInRoom
		private String loadEmployeeInRoom = "SELECT er.ID, er.IDRoom,r.RoomNumber,er.IDEmployee,e.EmployeeName,er.IDEmployeeType ,et.WorkTypeName, er.EmployeeDate  FROM EmployeeInRoom as er\r\n" + 
				"JOIN Rooms as r ON r.ID = er.IDRoom\r\n" + 
				"JOIN Employes as e ON e.ID = er.IDEmployee\r\n" + 
				"JOIN EmployeeType as et ON et.ID = er.IDEmployeeType\r\n" + 
				"WHERE er.IDRoom = ";
	
	
	public ArrayList<EmployeeInRoom> loadEmployeeInRoom(String id) throws SQLException{
		
		 ArrayList<EmployeeInRoom> list = new ArrayList<EmployeeInRoom>();
		 ResultSet result = ExecuteReader(loadEmployeeInRoom+id+" ORDER BY er.EmployeeDate");
		 while (result.next()) {
			EmployeeInRoom i = new EmployeeInRoom();
		    i.setId(result.getString("ID"));
		    i.setiDEmployee(result.getString("IDEmployee"));
		    i.setEmployeeName(result.getString("EmployeeName"));
		    i.setiDEmployeeType(result.getString("IDEmployeeType"));
		    i.setWorkTypeName(result.getString("WorkTypeName"));
		    i.setEmployeeDate(result.getString("EmployeeDate"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
		//RoomType
	
		private String loadroomType = "SELECT ID,RoomTypeName,NumberSeats,RoomTypeDescription FROM RoomType";
	
	public ArrayList<RoomType> LoadRoomType() throws SQLException{
		
		 ArrayList<RoomType> list = new ArrayList<RoomType>();
		 ResultSet result = ExecuteReader(loadroomType);
		 while (result.next()) {
			RoomType i = new RoomType();
		    i.setId(result.getString("ID"));
		    i.setRoomTypeName(result.getString("RoomTypeName"));
		    i.setNumberSeats(result.getString("NumberSeats"));
		    i.setRoomTypeDescription(result.getString("RoomTypeDescription"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
	
		//CLIENT
	
		private String loadClients = "SELECT c.ID,c.ClientName,c.IDClientStatus,cs.StatusName,c.ClientPasport,c.ClientAdress FROM Clients as c \r\n" + 
				"JOIN ClientStatus as cs ON cs.ID = c.IDClientStatus";
	
	public Client LoadClientById(String id) throws SQLException{

		Client i = new Client();
		 ResultSet result = ExecuteReader(loadClients+" WHERE c.ID = "+id);
		 while (result.next()) {
		    i.setId(result.getString("ID"));
		    i.setClientName(result.getString("ClientName"));
		    i.setIDClientStatus(result.getString("IDClientStatus"));
		    i.setStatusName(result.getString("StatusName"));
		    i.setClientPasport(result.getString("ClientPasport"));
		    i.setClientAdress(result.getString("ClientAdress"));
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return i;
	}
	
	
	public ArrayList<Client> LoadClientNotInReservedRoom(String id) throws SQLException{
		
		ArrayList<Client> list = new ArrayList<Client>();
		
		 ResultSet result = ExecuteReader(loadClients+" WHERE c.ID NOT IN(SELECT IDClient FROM ClientsInRoom WHERE IDReservedRooms = "+id+")");
		 while (result.next()) {
			Client i = new Client();
		    i.setId(result.getString("ID"));
		    i.setClientName(result.getString("ClientName"));
		    i.setIDClientStatus(result.getString("IDClientStatus"));
		    i.setStatusName(result.getString("StatusName"));
		    i.setClientPasport(result.getString("ClientPasport"));
		    i.setClientAdress(result.getString("ClientAdress"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
	public ArrayList<Client> LoadClients() throws SQLException{
		
		ArrayList<Client> list = new ArrayList<Client>();
		
		 ResultSet result = ExecuteReader(loadClients);
		 while (result.next()) {
			Client i = new Client();
		    i.setId(result.getString("ID"));
		    i.setClientName(result.getString("ClientName"));
		    i.setIDClientStatus(result.getString("IDClientStatus"));
		    i.setStatusName(result.getString("StatusName"));
		    i.setClientPasport(result.getString("ClientPasport"));
		    i.setClientAdress(result.getString("ClientAdress"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
		//ClientStatus
	
		private String loadClientStatus = "SELECT ID,StatusName,StatusDescription FROM ClientStatus";
		
		public ArrayList<ClientStatus> LoadClientStatus() throws SQLException{
			
			ArrayList<ClientStatus> list = new ArrayList<ClientStatus>();
			
			 ResultSet result = ExecuteReader(loadClientStatus);
			 while (result.next()) {
				 ClientStatus i = new ClientStatus();
			    i.setId(result.getString("ID"));
			    i.setName(result.getString("StatusName"));
			    i.setStatusDescription(result.getString("StatusDescription"));
			    list.add(i);
			 }
			 result.close();
			 stmt.close();
			 con.close();
			 return list;
		}
		
	
	
	
		//HotelServices
		
		private String loadHotelServicesByReserverRoom = "SELECT sr.IDHotelServices, h.ServicesName,h.ServicesPrice FROM ServicesInRoom as sr\r\n" + 
				"JOIN HotelServices as h ON h.ID = sr.IDHotelServices\r\n" + 
				"";
		
		private String loadHotelServeses = "SELECT ID,ServicesName,ServicesPrice FROM HotelServices";

	public ArrayList<HotelServices> LoadHotelService() throws SQLException{
			
			 ArrayList<HotelServices> list = new ArrayList<HotelServices>();
			 ResultSet result = ExecuteReader(loadHotelServeses);
			 while (result.next()) {
				 HotelServices i = new HotelServices();
			    i.setIDHotelServices(result.getString("ID"));
			    i.setServicesName(result.getString("ServicesName"));
			    i.setServicesPrice(result.getString("ServicesPrice"));
			    list.add(i);
			 }
			 result.close();
			 stmt.close();
			 con.close();
			 return list;
		}
	
		
	public ArrayList<HotelServices> LoadHotelServicesByReserverRoom(String id) throws SQLException{
		
		 ArrayList<HotelServices> list = new ArrayList<HotelServices>();
		 ResultSet result = ExecuteReader(loadHotelServicesByReserverRoom+" WHERE sr.IDReservedRooms = "+id);
		 while (result.next()) {
			 HotelServices i = new HotelServices();
		    i.setIDHotelServices(result.getString("IDHotelServices"));
		    i.setServicesName(result.getString("ServicesName"));
		    i.setServicesPrice(result.getString("ServicesPrice"));
		    list.add(i);
		 }
		 result.close();
		 stmt.close();
		 con.close();
		 return list;
	}
	
	
	
		//EmployeeType
	
		private String loadEmployeeType ="SELECT ID,WorkTypeName FROM EmployeeType";
		
		public ArrayList<EmployeeType> LoadEmployeeType() throws SQLException{
			
			 ArrayList<EmployeeType> list = new ArrayList<EmployeeType>();
			 ResultSet result = ExecuteReader(loadEmployeeType);
			 while (result.next()) {
				 EmployeeType i = new EmployeeType();
			    i.setId(result.getString("ID"));
			    i.setWorkTypeName(result.getString("WorkTypeName"));
			    list.add(i);
			 }
			 result.close();
			 stmt.close();
			 con.close();
			 return list;
		}
		
		
		
		
		
	
	//UPDATE 
		
	
		//Client
	
	public boolean UpdateClient(String id,String name, String pasport,String status,String adress) {
			
		return executeQuery("UPDATE Clients SET ClientName = '"+name+"', IDClientStatus = "+status+" ,ClientPasport = '"+pasport+"', ClientAdress = '"+adress+"' WHERE ID = "+id);
	}
		
	
	
		//Employe
	
	public boolean UpdateEmploye(String id,String name, String pasport,String phone,String adress) {
		
		return executeQuery("UPDATE Employes SET EmployeeName = '"+name+"', EmployePhone = '"+phone+"' ,EmployeePasport = '"+pasport+"', EmployesAdress = '"+adress+"' WHERE ID = "+id);
	}
	
	
		//ROOM
	
	public boolean UpdateRoom(String id,String num, String rtype,String floor,String phone,String price,String desc) {
		
		return executeQuery("UPDATE Rooms SET RoomNumber = '"+num+"', IDRoomType = "+rtype+",RoomFloor = '"+floor+"', RoomPhone = '"+phone+"',RoomPrice = '"+price+"', RoomDescription = '"+desc+"' WHERE ID = "+id);
	}
	
		//ReservedRoom
	
	public boolean UpdateReservedRoom(String id,String dateend) {
		
		return executeQuery("UPDATE ReservedRooms SET DateEnd = '"+dateend+"' WHERE ID = "+id);
	}
		
	public boolean ReservedRoom(String id) {
		
		return executeQuery("UPDATE ReservedRooms SET Passed = 1 WHERE ID = "+id);
	}
		
	//INSERT 
	
	
	
	
		//EmployeeType
	
	public boolean InsertEmployeeType(String idr,String ide,String idet,String date) {
		
		return executeQuery("INSERT INTO EmployeeInRoom VALUES ("+idr+","+ide+","+idet+",'"+date+"')");
	}
	
	
	
	//Client
	public boolean InsertClient(String name,String pasport,String status,String adress) {
		
		return executeQuery("INSERT INTO Clients VALUES ('"+name+"','"+pasport+"',"+status+",'"+adress+"')");
	}
	
	
		//ReservedRooms
	
	public boolean InsertClientInReservedRooms(String idC,String idR) {
		
		return executeQuery("INSERT INTO ClientsInRoom VALUES ("+idR+","+idC+")");
	}

	public boolean InsertReservedRooms(String idr,String idtp, String dateb, String datee) {
		
		return executeQuery("INSERT INTO ReservedRooms VALUES ("+idr+",'"+dateb+"','"+datee+"',"+idtp+",0)");
	}
	
	
		//HotelServices
	public boolean InsertServesInReservedRooms(String idS,String idR) {
		
		return executeQuery("INSERT INTO ServicesInRoom VALUES ("+idR+","+idS+")");
	}
	
	
		//Employe
	
	public boolean InsertEmploye(String name,String pasport,String phone,String adress) {
		
		return executeQuery("INSERT INTO Employes VALUES ('"+name+"','"+pasport+"','"+phone+"','"+adress+"')");
	}
	
	
	
	
	//DELETE
	
	
		//ReservedRooms
	
	public boolean DeleteClientInReservedRooms(String idC,String idR) {
		
		return executeQuery("DELETE FROM ClientsInRoom WHERE IDReservedRooms = "+idR+" AND IDClient = "+idC);
	}
	
	//Employe
	
	public boolean DeleteEmploye(String id) {
		
		return executeQuery("DELETE FROM Employes WHERE ID = "+id);
	}
	
	
	
	//SUpport 
	
		public String LoadFild(String sql,String fild) throws SQLException {
			String res = "";
			ResultSet result = ExecuteReader(sql);
			while (result.next()) {
			    res = result.getString(fild);
			}
			result.close();
			stmt.close();
			con.close();
			return res;
		}
		
		public ArrayList<String> LoadFilds(String sql,String fild) throws SQLException {
			 ArrayList<String> res = new  ArrayList<String>();
			ResultSet result = ExecuteReader(sql);
			while (result.next()) {
			    res.add(result.getString(fild));
			}
			result.close();
			stmt.close();
			con.close();
			return res;
		}
	
	
	
}
