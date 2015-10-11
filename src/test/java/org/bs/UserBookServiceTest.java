package org.bs;

import org.bs.common.domain.CardVO;
import org.bs.user.book.model.UserBookCriteria;
import org.bs.user.book.service.UserBookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class UserBookServiceTest {

	private static final Logger logger = LoggerFactory
			.getLogger(UserBookServiceTest.class);
	
	@Autowired
	private UserBookService ser;
	
	CardVO cvo = new CardVO();
	
	@Test
	public void listUserCardTest() throws Exception {
		
		UserBookCriteria ubcri = new UserBookCriteria();
		ubcri.setUserid("yuniyun3@naver.com");
//		ubcri.setIsBookMark(true);
		ubcri.setShelfType("�۰�");
//		ubcri.setSearchType("����");
//		ubcri.setKeyword("�׽�Ʈ");
		ubcri.setIsContinue(true);
		ser.listUserCard(ubcri);
	}
	
	@Test
	public void updateStarPointTest() throws Exception {
		ser.updateStarPoint(13, 7);
	}
	
	@Test
	public void totalUserBookCntTest() throws Exception {
		UserBookCriteria ubcri = new UserBookCriteria();
		ubcri.setUserid("yuniyun3@naver.com");
		ser.totalUserBookCnt(ubcri);
	}
	@Test
	public void listBookVersionTest() throws Exception {
		ser.listVersion("yuniyun3@naver.com", "�Ű���");
	}

}
