package wraps;

public class FoodType {
    private	String id;
    private	String FoodTypeName;
    private	String FoodTypyPrice;
    private	String FoodTypeDescription;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getFoodTypeName() {
		return FoodTypeName;
	}
	public void setFoodTypeName(String foodTypeName) {
		FoodTypeName = foodTypeName;
	}

}
