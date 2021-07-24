package kr.ac.kopo.account;

public class AccountVO {
	public String accNum;
	public String id;
	public String accPwd;
	public int accBalance;
	public String maxOpt;
	public int maxVal;
	public String openOpt;
	public String nick;
	public String regDate;
		
	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AccountVO(String accNum, String id, String accPwd, int accBalance, String maxOpt, int maxVal, String openOpt,
			String nick, String regDate) {
		super();
		this.accNum = accNum;
		this.id = id;
		this.accPwd = accPwd;
		this.accBalance = accBalance;
		this.maxOpt = maxOpt;
		this.maxVal = maxVal;
		this.openOpt = openOpt;
		this.nick = nick;
		this.regDate = regDate;
	}

	public String getAccNum() {
		return accNum;
	}

	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccPwd() {
		return accPwd;
	}

	public void setAccPwd(String accPwd) {
		this.accPwd = accPwd;
	}

	public int getAccBalance() {
		return accBalance;
	}

	public void setAccBalance(int accBalance) {
		this.accBalance = accBalance;
	}

	public String getMaxOpt() {
		return maxOpt;
	}

	public void setMaxOpt(String maxOpt) {
		this.maxOpt = maxOpt;
	}

	public int getMaxVal() {
		return maxVal;
	}

	public void setMaxVal(int maxVal) {
		this.maxVal = maxVal;
	}

	public String getOpenOpt() {
		return openOpt;
	}

	public void setOpenOpt(String openOpt) {
		this.openOpt = openOpt;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "AccountVO [accNum=" + accNum + ", id=" + id + ", accPwd=" + accPwd + ", accBalance=" + accBalance
				+ ", maxOpt=" + maxOpt + ", maxVal=" + maxVal + ", openOpt=" + openOpt + ", nick=" + nick + ", regDate="
				+ regDate + "]";
	}
	
}
