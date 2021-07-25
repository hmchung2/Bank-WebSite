package kr.ac.kopo.account;

public class LogVO {
	String logDate;
	String accNum;
	String action;
	int amount;
	String otherAccNum;
	String otherBankNum;
	int preBalance;
	int postBalance;
		

	
		
	@Override
	public String toString() {
		return "LogVO [logDate=" + logDate + ", accNum=" + accNum + ", action=" + action + ", amount=" + amount
				+ ", otherAccNum=" + otherAccNum + ", otherBankNum=" + otherBankNum + ", preBalance=" + preBalance
				+ ", postBalance=" + postBalance + "]";
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public LogVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getOtherAccNum() {
		return otherAccNum;
	}
	public void setOtherAccNum(String otherAccNum) {
		this.otherAccNum = otherAccNum;
	}
	public String getOtherBankNum() {
		return otherBankNum;
	}
	public void setOtherBankNum(String otherBankNum) {
		this.otherBankNum = otherBankNum;
	}
	public int getPreBalance() {
		return preBalance;
	}
	public void setPreBalance(int preBalance) {
		this.preBalance = preBalance;
	}
	public int getPostBalance() {
		return postBalance;
	}
	public void setPostBalance(int postBalance) {
		this.postBalance = postBalance;
	}
	
	
	
	
}
