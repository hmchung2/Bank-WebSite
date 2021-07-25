package kr.ac.kopo.board;

public class BoardReplyVO {
	
	private int no;
	private int replyno;	
	private String title;
	private String writer;
	private int viewCnt;
	private String regDate;
	private String visbility;
	private String message;


	@Override
	public String toString() {
		return "BoardReplyVO [no=" + no + ", replyno=" + replyno + ", title=" + title + ", writer=" + writer
				+ ", viewCnt=" + viewCnt + ", regDate=" + regDate + ", visbility=" + visbility + ", message=" + message
				+ "]";
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public BoardReplyVO() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getVisbility() {
		return visbility;
	}

	public void setVisbility(String visbility) {
		this.visbility = visbility;
	}

	
	
}
