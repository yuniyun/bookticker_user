package org.bs.user.book.service;

import java.util.List;

import org.bs.common.domain.BookAdditionVO;
import org.bs.common.domain.BookCriteria;
import org.bs.common.domain.BookVO;
import org.bs.common.domain.CardVO;
import org.bs.common.domain.ConvertBookVO;
import org.bs.common.domain.UserCardVO;
import org.bs.user.book.model.UserBookCriteria;

public interface UserBookService {
	
	// Book
	public void createIndieBook(BookVO book) throws Exception;
	
	public BookVO readBook(Integer bookno) throws Exception;

	public void updateStarPoint(Integer cardno, float userStarP) throws Exception;
	
	public void addReportCnt(Integer bookno) throws Exception;
	
	public Integer totalBookCnt(BookCriteria cri) throws Exception;

	public String readIMGPath(Integer bookno, Integer pageno) throws Exception;

	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception;
	
	public List<BookVO> listVersion(String userid, String title) throws Exception;
	
	//card & book & author info
	public UserCardVO readUserCard(Integer cardno) throws Exception;
	
	//Card
	public void indiebookRegisterUser(String userid, Integer bookno) throws Exception;
	
	public CardVO readCard(Integer cardno) throws Exception;
	
	public CardVO readCardFromKey(String cardkey) throws Exception;
	
	public void registUser(CardVO card) throws Exception;
	
	public void updateCardReview(CardVO card) throws Exception;
	// true or false 로 값을 받아 처리
	public void updateCardLikestate(CardVO card) throws Exception;
	
	public void updateCardContinuePage(CardVO card) throws Exception;
	
	public Integer totalUserBookCnt(UserBookCriteria ubcri) throws Exception;
	
	public List<UserCardVO> listUserCard(UserBookCriteria ubcri) throws Exception;
	
	public List<CardVO> listAllCard(Integer bookno) throws Exception;
	
	// BookAddition
	public void createBookAddition(BookAdditionVO bookAddition) throws Exception;

	public BookAdditionVO readBookAddition(Integer additionno) throws Exception;

	public void updateBookAddition(BookAdditionVO bookAddition) throws Exception;

	public void deleteBookAddition(Integer additionno) throws Exception;
	// 한 페이지에서 bookaddition 모두 가져오기
	public List<BookAdditionVO> listOnePageBookAddition(BookAdditionVO bookAddition) throws Exception;
	
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception;
	
	// ConvertBook
	public ConvertBookVO readConvertBook(Integer convertno) throws Exception;
	
	public List<ConvertBookVO> listOneConvertBook(Integer bookno) throws Exception;
	
	public String readMemberName(String userid) throws Exception;
	
}
