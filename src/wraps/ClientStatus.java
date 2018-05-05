package wraps;

public class ClientStatus {
	private String id;
	private String name;
	private String StatusDescription;
	public String getStatusDescription() {
		return StatusDescription;
	}
	public void setStatusDescription(String statusDescription) {
		StatusDescription = statusDescription;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
