package kr.ac.kopo.member;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String ssn;
	private String email;
	private String phone;
	private String opt1;
	private String opt2;
	
	
	public MemberVO() {

	}



	public MemberVO(String id, String pwd, String name, String ssn, String email, String phone, String opt1,
			String opt2) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.ssn = ssn;
		this.email = email;
		this.phone = phone;
		this.opt1 = opt1;
		this.opt2 = opt2;
	}



	public String getSsn() {
		return ssn;
	}



	public void setSsn(String ssn) {
		this.ssn = ssn;
	}



	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
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


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getOpt1() {
		return opt1;
	}


	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}


	public String getOpt2() {
		return opt2;
	}


	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}


	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", opt1=" + opt1 + ", opt2=" + opt2 + "]";
	}




	
	
}

