package org.bs.user.book.model;

import org.bs.common.domain.BookCriteria;

public class IndieBookCriteria extends BookCriteria{
	
	private String boardType;
	private String bookno;
	
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBookno() {
		return bookno;
	}
	public void setBookno(String bookno) {
		this.bookno = bookno;
	}
	
	

}
