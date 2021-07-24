package kr.ac.kopo.account;

public class TotalAccountVO {
	String bankName;
	String accNum;
	String totalId;
	String regDate;
	@Override
	public String toString() {
		return "TotalAccountVO [bankName=" + bankName + ", accNum=" + accNum + ", totalId=" + totalId + ", regDate="
				+ regDate + "]";
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	public String getTotalId() {
		return totalId;
	}
	public void setTotalId(String totalId) {
		this.totalId = totalId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public TotalAccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
