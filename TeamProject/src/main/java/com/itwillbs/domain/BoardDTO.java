package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int boardNum;
	private String userNicknm;
	private String boardPass;
	private String boardSubject;
	private String boardContent;
	private int boardLikecount;
	private int boardReadcount;
	private int boardRcount;
	private Timestamp boardDate;
	public int getBoardRcount() {
		return boardRcount;
	}
	public void setBoardRcount(int boardRcount) {
		this.boardRcount = boardRcount;
	}
	private String boardFile;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserNicknm() {
		return userNicknm;
	}
	public void setUserNicknm(String userNicknm) {
		this.userNicknm = userNicknm;
	}
	public String getBoardPass() {
		return boardPass;
	}
	public void setBoardPass(String boardPass) {
		this.boardPass = boardPass;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardLikecount() {
		return boardLikecount;
	}
	public void setBoardLikecount(int boardLikecount) {
		this.boardLikecount = boardLikecount;
	}
	public int getBoardReadcount() {
		return boardReadcount;
	}
	public void setBoardReadcount(int boardReadcount) {
		this.boardReadcount = boardReadcount;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	@Override
	public String toString() {
		return "BoardDTO [boardNum=" + boardNum + ", userNicknm=" + userNicknm + ", boardPass=" + boardPass
				+ ", boardSubject=" + boardSubject + ", boardContent=" + boardContent + ", boardLikecount="
				+ boardLikecount + ", boardReadcount=" + boardReadcount + ", boardRcount=" + boardRcount
				+ ", boardDate=" + boardDate + ", boardFile=" + boardFile + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
