package com.itwillbs.domain;

public class SearchDTO {
	
	private String searchType= "";
	private String keyword;
	private String boardSubject;
	
	
	

	
	
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchDTO [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	

}
