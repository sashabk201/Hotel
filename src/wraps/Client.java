package wraps;

public class Client {

	private String id;
	private String ClientName;
	private String IDClientStatus;
	private String StatusName;
	private String ClientPasport;
	private String ClientAdress;
	public String getClientName() {
		return ClientName;
	}
	public void setClientName(String clientName) {
		ClientName = clientName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatusName() {
		return StatusName;
	}
	public void setStatusName(String statusName) {
		StatusName = statusName;
	}
	public String getIDClientStatus() {
		return IDClientStatus;
	}
	public void setIDClientStatus(String iDClientStatus) {
		IDClientStatus = iDClientStatus;
	}
	public String getClientPasport() {
		return ClientPasport;
	}
	public void setClientPasport(String clientPasport) {
		ClientPasport = clientPasport;
	}
	public String getClientAdress() {
		return ClientAdress;
	}
	public void setClientAdress(String clientAdress) {
		ClientAdress = clientAdress;
	}
}
