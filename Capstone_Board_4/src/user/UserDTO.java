package user;

public class UserDTO {
	// 만들어진 TABLE 대로 변경해야 할텐데 일단 킵
	// 여기에 추가로 학번인 ustudentnumber 추가 예정
	// 추가하면 DAO에도 적용해야 함, gender 대신 넣어야 하나?
	private int id;
	private String upwd;
	private String uname;
	private String ustudentnumber;
	private String uemail;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUstudentnumber() {
		return ustudentnumber;
	}
	public void setUstudentnumber(String ustudentnumber) {
		this.ustudentnumber = ustudentnumber;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}	
}
