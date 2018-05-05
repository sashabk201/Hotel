package wraps;

public class ReservedRooms {
	private String id;
	private String idRoom;
	private String RoomNumber;
	private String DateBegin;
	private String DateEnd;
	private String IDFoodType;
	private String FoodTypeName;
	private String FoodTypeDescription;
	private String Passed;
	private String FoodTypyPrice;
	private String RomPrice;
	
	
	public String getRoomNumber() {
		return RoomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		RoomNumber = roomNumber;
	}
	public String getIdRoom() {
		return idRoom;
	}
	public void setIdRoom(String idRoom) {
		this.idRoom = idRoom;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDateBegin() {
		return DateBegin;
	}
	public void setDateBegin(String dateBegin) {
		DateBegin = dateBegin;
	}
	public String getDateEnd() {
		return DateEnd;
	}
	public void setDateEnd(String dateEnd) {
		DateEnd = dateEnd;
	}
	public String getFoodTypeName() {
		return FoodTypeName;
	}
	public void setFoodTypeName(String foodTypeName) {
		FoodTypeName = foodTypeName;
	}
	public String getIDFoodType() {
		return IDFoodType;
	}
	public void setIDFoodType(String iDFoodType) {
		IDFoodType = iDFoodType;
	}
	public String getPassed() {
		return Passed;
	}
	public void setPassed(String passed) {
		Passed = passed;
	}
	public String getFoodTypeDescription() {
		return FoodTypeDescription;
	}
	public void setFoodTypeDescription(String foodTypeDescription) {
		FoodTypeDescription = foodTypeDescription;
	}
	public String getFoodTypyPrice() {
		return FoodTypyPrice;
	}
	public void setFoodTypyPrice(String foodTypyPrice) {
		FoodTypyPrice = foodTypyPrice;
	}
	public String getRomPrice() {
		return RomPrice;
	}
	public void setRomPrice(String romPrice) {
		RomPrice = romPrice;
	}
	

}
