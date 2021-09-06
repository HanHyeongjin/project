package vo;

public class UserVo {
	private String id;
	private String name;
	private String email;
	private String level;
	private String sessiontime;
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSessiontime() {
		return sessiontime;
	}
	public void setSessiontime(String sessiontime) {
		this.sessiontime = sessiontime;
	}
	
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", name=" + name + ", email=" + email + ", level=" + level + ", sessiontime="
				+ sessiontime + "]";
	}
	
	
	

}
