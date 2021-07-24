package kr.ac.kopo.member;

public class TotalMemberVO {
	private String totalId;
	private String totalNick;
	private String totalPwd;	
	private String opt1;
	private String opt2;
	private String regDate;
	private String id;
	

	@Override
	public String toString() {
		return "TotalMemberVO [totalId=" + totalId + ", totalNick=" + totalNick + ", totalPwd=" + totalPwd + ", opt1="
				+ opt1 + ", opt2=" + opt2 + ", regDate=" + regDate + ", id=" + id + "]";
	}

	public TotalMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getTotalId() {
		return totalId;
	}
	public void setTotalId(String totalId) {
		this.totalId = totalId;
	}
	public String getTotalNick() {
		return totalNick;
	}
	public void setTotalNick(String totalNick) {
		this.totalNick = totalNick;
	}
	public String getTotalPwd() {
		return totalPwd;
	}
	public void setTotalPwd(String totalPwd) {
		this.totalPwd = totalPwd;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
