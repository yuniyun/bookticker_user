package org.bs.author.book.service;

import java.util.List;

import org.bs.common.domain.BookAdditionVO;
import org.bs.common.domain.BookCriteria;
import org.bs.common.domain.BookVO;
import org.bs.common.domain.CardVO;
import org.bs.common.domain.ConvertBookVO;
import org.bs.common.domain.PermitInfoVO;
import org.bs.common.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthorBookServiceImpl implements AuthorBookService {

	@Autowired
	private BookMapper mapper;
	
	@Transactional
	@Override
	public void createBook(BookVO book) throws Exception {
		mapper.createBook(book);
		mapper.updateMyBookCnt(book.getUserid());
	}

	@Override
	public Integer totalBookCnt(BookCriteria cri) throws Exception {
		return mapper.totalBookCnt(cri);
	}

	@Override
	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception {
		return mapper.listSearchBook(cri);
	}

	@Override
	public List<BookVO> listVersion(String userid, String title)throws Exception {
		return mapper.listVersion(userid, title);
	}

	@Override
	public BookVO readBook(Integer bookno) throws Exception {
		return mapper.readBook(bookno);
	}

	@Override
	public void updateBook(BookVO book) throws Exception {
		mapper.updateBook(book);
	}

	@Override
	public List<ConvertBookVO> listOneConvertBook(Integer bookno) throws Exception {
		return mapper.listOneConvertBook(bookno);
	}

	@Override
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception {
		return mapper.listBookAddition(bookAddition);
	}

	@Override
	public List<PermitInfoVO> listPermitInfo(Integer bookno) throws Exception {
		return mapper.listPermitInfo(bookno);
	}

	@Override
	public List<CardVO> listAllCard(Integer bookno) throws Exception {
		return mapper.listAllCard(bookno);
	}
	
	@Override
	public String readMemberName(String userid) throws Exception {
		return mapper.readMemberName(userid);
	}
}
