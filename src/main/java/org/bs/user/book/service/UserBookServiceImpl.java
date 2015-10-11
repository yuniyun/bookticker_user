package org.bs.user.book.service;

import java.util.List;

import org.bs.common.domain.BookAdditionVO;
import org.bs.common.domain.BookCriteria;
import org.bs.common.domain.BookVO;
import org.bs.common.domain.CardVO;
import org.bs.common.domain.ConvertBookVO;
import org.bs.common.domain.UserCardVO;
import org.bs.common.mapper.BookMapper;
import org.bs.user.book.model.UserBookCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserBookServiceImpl implements UserBookService {

	@Autowired
	private BookMapper mapper;
	
	@Override
	public void createIndieBook(BookVO book) throws Exception {
		mapper.createIndieBook(book);

	}

	@Override
	public BookVO readBook(Integer bookno) throws Exception {
		return mapper.readBook(bookno);
	}

	@Transactional
	@Override
	public void updateStarPoint(Integer cardno, float userStarP) throws Exception {
		mapper.updateCardStarpoint(cardno, userStarP);
		
		int bookno = mapper.readCard(cardno).getBookno();
		int spOneBookcnt = mapper.starpointBookCnt(bookno); //현재 평점을 등록한 사람의 수
		float currStarP = mapper.readBook(bookno).getStarpoint(); //현재의 평점
		float newAvgStarP = ((currStarP * spOneBookcnt) + userStarP)/(spOneBookcnt + 1);
		mapper.updateStarPoint(bookno, newAvgStarP);
	}

	@Override
	public void addReportCnt(Integer bookno) throws Exception {
		
	}

	@Override
	public Integer totalBookCnt(BookCriteria cri) throws Exception {
		return mapper.totalBookCnt(cri);
	}

	@Override
	public String readIMGPath(Integer bookno, Integer pageno) throws Exception {
		return mapper.readIMGPath(bookno, pageno);
	}

	@Override
	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception {
		return mapper.listSearchBook(cri);
	}
	
	@Override
	public UserCardVO readUserCard(Integer cardno) throws Exception{
		return mapper.readUserCard(cardno);
	}

	@Override
	public CardVO readCard(Integer cardno) throws Exception {
		return mapper.readCard(cardno);
	}
	
	@Override
	public CardVO readCardFromKey(String cardkey) throws Exception{
		return mapper.readCardFromKey(cardkey);
	}
	
	@Transactional
	@Override
	public void registUser(CardVO card) throws Exception {
		mapper.updateCardUser(card);
		Integer bookno = mapper.readCardFromKey(card.getCardkey()).getBookno();
		mapper.addSellCnt(bookno);
	}

	@Override
	public void updateCardReview(CardVO card) throws Exception {
		mapper.updateCardReview(card);
	}

	@Override
	public void updateCardLikestate(CardVO card) throws Exception {
		mapper.updateCardLikestate(card);
	}

	@Override
	public void updateCardContinuePage(CardVO card) throws Exception {
		mapper.updateCardContinuePage(card);
	}
	@Override
	public Integer totalUserBookCnt(UserBookCriteria ubcri) throws Exception{
		return mapper.totalUserBookCnt(ubcri);
	}
	@Override
	public List<UserCardVO> listUserCard(UserBookCriteria ubcri) throws Exception {
		return mapper.listUserCard(ubcri);
	}

	
	@Override
	public void createBookAddition(BookAdditionVO bookAddition) throws Exception {
		mapper.createBookAddition(bookAddition);
	}

	@Override
	public BookAdditionVO readBookAddition(Integer additionno) throws Exception {
		return mapper.readBookAddition(additionno);
	}

	@Override
	public void updateBookAddition(BookAdditionVO bookAddition) throws Exception {
		mapper.updateBookAddition(bookAddition);
	}

	@Override
	public void deleteBookAddition(Integer additionno) throws Exception {
		mapper.deleteBookAddition(additionno);
	}

	@Override
	public List<BookAdditionVO> listOnePageBookAddition(BookAdditionVO bookAddition) throws Exception {
		return mapper.listOnePageBookAddition(bookAddition);
	}
	
	@Override
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception {
		return mapper.listBookAddition(bookAddition);
	}

	@Override
	public ConvertBookVO readConvertBook(Integer convertno) throws Exception {
		return mapper.readConvertBook(convertno);
	}

	@Override
	public List<ConvertBookVO> listOneConvertBook(Integer bookno) throws Exception {
		return mapper.listOneConvertBook(bookno);
	}

	@Override
	public List<CardVO> listAllCard(Integer bookno) throws Exception {
		return mapper.listAllCard(bookno);
	}

	@Override
	public List<BookVO> listVersion(String userid, String title)throws Exception {
		return mapper.listVersion(userid, title);
	}

	@Transactional
	@Override
	public void indiebookRegisterUser(String userid, Integer bookno) throws Exception {
		mapper.createCardAndregisterUser(userid, bookno);
		mapper.addSellCnt(bookno);
	}
	
	@Override
	public String readMemberName(String userid) throws Exception {
		return mapper.readMemberName(userid);
	}
}