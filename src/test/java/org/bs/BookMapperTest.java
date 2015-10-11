package org.bs;

import org.bs.common.mapper.BookMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = BookMapper.class)
@WebAppConfiguration
public class BookMapperTest extends BsCanreadApplicationTests {

	@Autowired
	private BookMapper mapper;
	
	@Test
	public void testSelect() throws Exception {
		System.out.println(mapper.readBook(389));
	}

}
