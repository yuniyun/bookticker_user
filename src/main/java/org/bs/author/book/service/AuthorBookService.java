package org.bs.author.book.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bs.common.domain.BookAdditionVO;
import org.bs.common.domain.BookCriteria;
import org.bs.common.domain.BookVO;
import org.bs.common.domain.CardVO;
import org.bs.common.domain.ConvertBookVO;
import org.bs.common.domain.PermitInfoVO;

public interface AuthorBookService {
	
	public void createBook(BookVO book) throws Exception;
	
	public Integer totalBookCnt(BookCriteria cri) throws Exception;
	
	public List<BookVO> listSearchBook(BookCriteria cri) throws Exception;
	
	public List<BookVO> listVersion(String userid, String title) throws Exception;

	public BookVO readBook(Integer bookno) throws Exception;

	public void updateBook(BookVO book) throws Exception;
	
	// ConvertBook
	public List<ConvertBookVO> listOneConvertBook(@Param("bookno")Integer bookno) throws Exception;
	
	// BookAddition
	public List<BookAdditionVO> listBookAddition(BookAdditionVO bookAddition) throws Exception;
	
	// PermitInfo
	public List<PermitInfoVO> listPermitInfo(Integer bookno) throws Exception;
	
	//Card
	public List<CardVO> listAllCard(Integer bookno) throws Exception;
	
	public String readMemberName(String userid) throws Exception;

}
