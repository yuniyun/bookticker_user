package org.bs.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bs.common.domain.BookAdditionVO;
import org.bs.common.domain.BookCriteria;
import org.bs.common.domain.BookVO;
import org.bs.common.domain.CardVO;
import org.bs.common.domain.ConvertBookVO;
import org.bs.common.domain.PermitInfoVO;
import org.bs.common.domain.UserCardVO;
import org.bs.user.book.model.UserBookCriteria;


public interface BookMapper {
	
	// Book
	
	public void createIndieBook(BookVO book) throws Exception;
	
	public BookVO readBook(Integer bookno) throws Exception; 
	
	public void updateBook(BookVO book) throws Exception;
	
	public void updateStarPoint(@Param("bookno")Integer bookno, @Param("starPoint_avg")float starPoint_avg) throws Exception;
	
	public void addReportCnt(Integer bookno) throws Exception;
	
	public Integer totalBookCnt(BookCriteria cri) throws Exception;
	
	public void addSellCnt(Integer bookno) throws Exception;
	
	public String readIMGPath(@Param("bookno")Integer bookno, @Param("pageno")Integer pageno) throws Exception;
	
	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception;
	
	public List<BookVO> listVersion(@Param("userid")String userid, @Param("title")String title) throws Exception;
	
	public void createBook(BookVO book) throws Exception; /////
	
	//card & book & author info
	public UserCardVO readUserCard(Integer cardno) throws Exception;
	
	// Card
	public void createCard(CardVO card) throws Exception;
	
	public void createCardAndregisterUser(@Param("userid")String userid, @Param("bookno")Integer bookno) throws Exception;

	public CardVO readCard(Integer cardno) throws Exception;
	
	public CardVO readCardFromKey(String cardkey) throws Exception;
	// Usingstate & Userid 수정
	public void updateCardUser(CardVO card) throws Exception;
	
	public void updateCardStarpoint(@Param("cardno")Integer cardno, @Param("starpoint")float starpoint) throws Exception;
	
	public void updateCardReview(CardVO card) throws Exception;
	// true or false 로 값을 받아 처리
	public void updateCardLikestate(CardVO card) throws Exception;
	
	public void updateCardContinuePage(CardVO card) throws Exception;
	
	public void deleteCard(Integer cardno) throws Exception;
	
	public Integer totalUserBookCnt(UserBookCriteria ubcri) throws Exception; //해당 유저의 총 책 수
	
	public Integer starpointBookCnt(Integer bookno) throws Exception; //평점 avg 구할 때 사용
	
	public List<CardVO> listAllCard(@Param("bookno") Integer bookno) throws Exception; //한책의 모든 카드
	
	public List<UserCardVO> listUserCard(UserBookCriteria ubcri) throws Exception;

	// BookAddition

	public void createBookAddition(BookAdditionVO bookAddition) throws Exception;

	public BookAdditionVO readBookAddition(@Param("additionno") Integer additionno) throws Exception;

	public void updateBookAddition(BookAdditionVO bookAddition) throws Exception;

	public void deleteBookAddition(Integer additionno) throws Exception;
	// 한 페이지에의 bookaddition 모두 가져오기
	public List<BookAdditionVO> listOnePageBookAddition(BookAdditionVO bookAddition)
			throws Exception;
	// 한책의 모든 북애디션 보기
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception;
	//한 책의 신고 수
	public Integer bookReportCnt(@Param("bookno")Integer bookno) throws Exception; 
	
	// PermitInfo

	public PermitInfoVO readPermitInfo(Integer permitno) throws Exception;
	   
	public List<PermitInfoVO> listPermitInfo(Integer bookno) throws Exception;

	// ConvertBook

	public ConvertBookVO readConvertBook(Integer convertno) throws Exception;

	public List<ConvertBookVO> listOneConvertBook(@Param("bookno")Integer bookno) throws Exception;
	
	// Member
	public void updateMyBookCnt(@Param("userid")String userid) throws Exception;
	
	public String readMemberName(String userid) throws Exception; 
	
}
