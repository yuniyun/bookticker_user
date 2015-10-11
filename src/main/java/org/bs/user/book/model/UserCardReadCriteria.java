package org.bs.user.book.model;

public class UserCardReadCriteria {
	
	private int cardno;
	private int bookno;
	private Boolean isContinue;
	
	public int getCardno() {
		return cardno;
	}
	public void setCardno(int cardno) {
		this.cardno = cardno;
	}
	public int getBookno() {
		return bookno;
	}
	public void setBookno(int bookno) {
		this.bookno = bookno;
	}
	public Boolean getIsContinue() {
		return isContinue;
	}
	public void setIsContinue(Boolean isContinue) {
		this.isContinue = isContinue;
	}
	@Override
	public String toString() {
		return "UserCardReadCriteria [cardno=" + cardno + ", bookno=" + bookno
				+ ", isContinue=" + isContinue + "]";
	}
}
