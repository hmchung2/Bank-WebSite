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
	private String kakaoId;
	private String kakaoEmail;
	private String user_type;
	private String regDate;

	
	public MemberVO() {

	}


	public MemberVO(String id, String pwd, String name, String ssn, String email, String phone, String opt1,
			String opt2, String kakaoId, String kakaoEmail, String user_type, String regDate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.ssn = ssn;
		this.email = email;
		this.phone = phone;
		this.opt1 = opt1;
		this.opt2 = opt2;
		this.kakaoId = kakaoId;
		this.kakaoEmail = kakaoEmail;
		this.user_type = user_type;
		this.regDate = regDate;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getUser_type() {
		return user_type;
	}


	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getKakaoEmail() {
		return kakaoEmail;
	}

	public void setKakaoEmail(String kakaoEmail) {
		this.kakaoEmail = kakaoEmail;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
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
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", ssn=" + ssn + ", email=" + email
				+ ", phone=" + phone + ", opt1=" + opt1 + ", opt2=" + opt2 + ", kakaoId=" + kakaoId + ", kakaoEmail="
				+ kakaoEmail + ", user_type=" + user_type + "]";
	}





	
	
}

