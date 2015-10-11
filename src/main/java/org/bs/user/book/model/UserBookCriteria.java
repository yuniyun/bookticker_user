package org.bs.user.book.model;

import org.bs.common.domain.PageCriteria;

public class UserBookCriteria extends PageCriteria{
	
	private String searchType;
	private String keyword;
	private String userid;
	private Boolean isBookMark;
	private Boolean isContinue;
	private String shelfType; //personal, professional
	
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Boolean getIsBookMark() {
		return isBookMark;
	}
	public void setIsBookMark(Boolean isBookMark) {
		this.isBookMark = isBookMark;
	}
	public Boolean getIsContinue() {
		return isContinue;
	}
	public void setIsContinue(Boolean isContinue) {
		this.isContinue = isContinue;
	}
	public String getShelfType() {
		return shelfType;
	}
	public void setShelfType(String shelfType) {
		this.shelfType = shelfType;
	}
	
	
}
