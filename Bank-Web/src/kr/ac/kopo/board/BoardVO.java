package kr.ac.kopo.board;

import java.util.List;

public class BoardVO {
	
	private int no;
	private String title;
	private String writer;
	private int viewCnt;
	private String regDate;
	private String visbility;
	private String message;
	private List<BoardReplyVO> replyList;

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", viewCnt=" + viewCnt + ", regDate="
				+ regDate + ", visbility=" + visbility + ", message=" + message + ", replyList=" + replyList + "]";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public BoardVO() {
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
