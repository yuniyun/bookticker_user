package org.bs.user.book.web;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bs.common.domain.BookAdditionVO;
import org.bs.common.domain.BookCriteria;
import org.bs.common.domain.BookVO;
import org.bs.common.domain.CardVO;
import org.bs.common.domain.PageMaker;
import org.bs.common.domain.UserCardVO;
import org.bs.user.book.model.IndieBookCriteria;
import org.bs.user.book.model.UserBookCriteria;
import org.bs.user.book.model.UserCardReadCriteria;
import org.bs.user.book.service.UserBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/user/book")
public class UserBookController {
	
	@Autowired
	private UserBookService service;
	
	private String id;
	
	@RequestMapping(value="/registerBookTiker", method=RequestMethod.GET)
	public void registerBookTikerGET(Model model) throws Exception{
	}
	
	@RequestMapping(value="/registerBookTiker", method=RequestMethod.POST)
	public @ResponseBody String registerBookTikerPOST(CardVO card, Model model) throws Exception{
		card.setUserid(id);
		CardVO cardvo = service.readCardFromKey(card.getCardkey());
		if(cardvo != null){
			if(cardvo.getUsingstate().equals("등록")){
				return "이미 사용중인 책입니다.";
			}
			service.registUser(card);
			return "success";
		}
		return "다시 인식 시켜주세요.";
	}
		
	@RequestMapping(value="/shelf", method=RequestMethod.GET)
	public void list(@ModelAttribute("ubcri") UserBookCriteria ubcri, HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("loginInfo");
		ubcri.setUserid(id);
		ubcri.setShelfType("작가");
		ubcri.setPerPageNum(12);
		List<UserCardVO> cardlist = service.listUserCard(ubcri);
		List<UserCardVO> cardlist1 = null, cardlist2 = null, cardlist3 = null;
		
		if(cardlist.size() <= 4){
			cardlist1 = cardlist.subList(0, cardlist.size());
		}else if(cardlist.size()> 4 && cardlist.size() <= 8){	
			cardlist1 = cardlist.subList(0, 4);
			cardlist2 = cardlist.subList(4, cardlist.size());			
		}else if(cardlist.size()> 8 && cardlist.size() <= 12){
			cardlist1 = cardlist.subList(0, 4);
			cardlist2 = cardlist.subList(4, 8);
			cardlist3 = cardlist.subList(8, cardlist.size());			
		}
		model.addAttribute("list1", cardlist1);
		model.addAttribute("list2", cardlist2);
		model.addAttribute("list3", cardlist3);
		int totalCnt = service.totalUserBookCnt(ubcri);
		PageMaker pageMaker = new PageMaker(ubcri, totalCnt);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value="/bookinfo", method=RequestMethod.GET)
	public void bookinfo(int cardno, Model model) throws Exception{
		model.addAttribute("card", service.readUserCard(cardno));
	}
	
	@RequestMapping(value="/devicetest", method=RequestMethod.GET)
	public void devicetest(Model model) throws Exception{
	}
	
	@RequestMapping(value="/read", method=RequestMethod.POST)
	public String readIntersection(HttpServletRequest request, @ModelAttribute("readCri") UserCardReadCriteria readCri, RedirectAttributes redirectAttr) throws Exception {
	    redirectAttr.addFlashAttribute("readCri", readCri);
		if(request.getHeader("User-Agent").indexOf("Mobile") != -1) { //in mobile
	        return "redirect:readInMobile";
	    }
	    return "redirect:readInBrowser";
	}
	
	@RequestMapping(value="/readInBrowser", method=RequestMethod.GET)
	public void readInBrowser(@ModelAttribute("readCri") UserCardReadCriteria readCri, Model model) throws Exception {
		model.addAttribute("list", service.listOneConvertBook(readCri.getBookno()));
		model.addAttribute("book", service.readBook(readCri.getBookno()));
		if(readCri.getCardno()==0){
			return;
		}
		model.addAttribute("card", service.readCard(readCri.getCardno()));
		if(readCri.getIsContinue()!= null && readCri.getIsContinue()) model.addAttribute("isContinue", "true");
	}
   
	@RequestMapping(value="/readInMobile", method=RequestMethod.GET)
	public void readInMobile(@ModelAttribute("readCri") UserCardReadCriteria readCri, Model model) throws Exception{
		model.addAttribute("list", service.listOneConvertBook(readCri.getBookno()));
		model.addAttribute("book", service.readBook(readCri.getBookno()));
		if(readCri.getCardno()==0){
			return;
		}
		model.addAttribute("card", service.readCard(readCri.getCardno()));
		if(readCri.getIsContinue()!= null && readCri.getIsContinue()) model.addAttribute("isContinue", "true");
	}
	
	@RequestMapping(value="/updateContinue", method=RequestMethod.POST)
	public void updateContinue(CardVO card, Model model) throws Exception{
		System.out.println(card.getCardno() +":"+ card.getContinuepage());
		service.updateCardContinuePage(card);
	}
	
	@RequestMapping(value="/registerBookmark", method=RequestMethod.POST)
	public void registerBookmark(BookAdditionVO bookAddition, Model model) throws Exception{
		bookAddition.setUserid(id);
		service.createBookAddition(bookAddition);
	}
	
	@RequestMapping(value="/listBookmark", method=RequestMethod.GET)
	public void listBookmark(BookAdditionVO bookAddition, Model model) throws Exception{
		model.addAttribute("list", service.listBookAddition(bookAddition));
	}
	
	@RequestMapping(value="/bookmark", method=RequestMethod.POST)
	public String bookmark(int cardno, Boolean bookmark, Model model) throws Exception{
		CardVO card = new CardVO();
		card.setCardno(cardno);
		String likestate = bookmark?"O":"X";
		card.setLikestate(likestate);
		service.updateCardLikestate(card);
		return "#";
	}
	
	@RequestMapping(value="/removeBookmark", method=RequestMethod.POST)
	public String removeBookmark(String additionno, int bookno, Model model) throws Exception{
		String[] addiArr = additionno.split(",");
		for(int i=1; i<addiArr.length; i++){
			System.out.print(Integer.parseInt(addiArr[i])+", ");
			service.deleteBookAddition(Integer.parseInt(addiArr[i]));
		}
		System.out.println(bookno);
		return "redirect:listBookmark?bookno="+bookno+"&addmode=책갈피";
	}
	
	@RequestMapping(value="/review", method=RequestMethod.GET)
	public void review(int bookno, Model model) throws Exception{
		model.addAttribute("list", service.listAllCard(bookno));
	}
	
	/*  author  */
	@RequestMapping(value="/author/booklist", method=RequestMethod.GET)
	public void authorList(@ModelAttribute("cri") BookCriteria cri, Model model) throws Exception{
		cri.setChargeType("작가");
		cri.setConvertType("변환됨");
		model.addAttribute("list", service.listSearchBook(cri));	
		int totalCnt = service.totalBookCnt(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCnt);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/author/bestseller", method=RequestMethod.GET)
	public void authorbestseller(@ModelAttribute("cri") BookCriteria cri, Model model) throws Exception{
		cri.setChargeType("작가");
		cri.setSortType("판매량");
		model.addAttribute("list", service.listSearchBook(cri));
		PageMaker pageMaker = new PageMaker(cri, service.totalBookCnt(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	@RequestMapping(value="/author/bookpreview", method=RequestMethod.GET)
	public void authorbookpreview(int bookno, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
	}
	
	
	/*  self publish  */
	@RequestMapping(value="/indiebook/booklist", method=RequestMethod.GET)
	public void indiebookList(@ModelAttribute("cri") IndieBookCriteria cri, Model model) throws Exception{
		cri.setChargeType("일반");
		//cri.setConvertType("변환됨");///////////////////////////////////////////쓰레기
		System.out.println(cri.getBoardType());
		model.addAttribute("list", service.listSearchBook(cri));	
		int totalCnt = service.totalBookCnt(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCnt);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@RequestMapping(value="/indiebook/registerbook", method=RequestMethod.GET)
	public void registerbookGET(Model model) throws Exception{
		model.addAttribute("name", service.readMemberName(id));
	}
	
	@RequestMapping(value="/indiebook/registerbook", method=RequestMethod.POST)
	public String registerbookPOST(BookVO book, MultipartRequest mRequest, Model model) throws Exception{
		book.setUserid(id);
		book.setSeries(book.getTitle()+" 시리즈");
		book.setBookversion(1);
		
		String path="C:\\UNIORACLE\\3r_card\\PDF\\"+ book.getSeries()
				+"\\"+ book.getTitle() +"\\"+ book.getBookversion() +"\\";
		System.out.println("Upload Path:" + path);
		
		File dir1 = new File("c:\\unioracle\\3r_card\\PDF\\" + book.getSeries());
		if (!dir1.exists()) {
			dir1.mkdir();
		}

		File dir2 = new File("c:\\unioracle\\3r_card\\PDF\\" + book.getSeries()
				+ "\\" + book.getTitle());
		if (!dir2.exists()) {
			dir2.mkdir();
		}

		File dir3 = new File("c:\\unioracle\\3r_card\\PDF\\" + book.getSeries()
				+ "\\" + book.getTitle() + "\\" + book.getBookversion());
		if (!dir3.exists()) {
			dir3.mkdir();
		}
		
		MultipartFile file = mRequest.getFile("upl");
		
		String fileName = book.getTitle()+".pdf";
		
		FileOutputStream fos = new FileOutputStream(new File(path, fileName));
		
		FileCopyUtils.copy(file.getInputStream(), fos);

		model.addAttribute("msg", fileName);
		
		book.setPdfpath(path+fileName);
		
		service.createIndieBook(book);
		return "/user/book/indiebook/success";
	}
	
	@RequestMapping(value="/indiebook/bestseller", method=RequestMethod.GET)
	public void bestseller(@ModelAttribute("cri") BookCriteria cri, Model model) throws Exception{
		cri.setChargeType("일반");
		cri.setSortType("판매량");
		model.addAttribute("list", service.listSearchBook(cri));
		PageMaker pageMaker = new PageMaker(cri, service.totalBookCnt(cri));
		model.addAttribute("pageMaker", pageMaker);
//		model.addAttribute("book", service.readBook(bookno));
	}
	
	@RequestMapping(value="/indiebook/bookinfo", method=RequestMethod.GET)
	public void indiebookinfo(int cardno, Model model) throws Exception{
		UserCardVO cardvo = service.readUserCard(cardno);
		model.addAttribute("card", cardvo);
		model.addAttribute("list", service.listVersion(cardvo.getUserid(), cardvo.getTitle()));
	}
	
	
	@RequestMapping(value="/indiebook/mybookinfo", method=RequestMethod.GET)
	public void indiemybookinfo(int bookno, Model model) throws Exception{
		BookVO bookvo = service.readBook(bookno);
		model.addAttribute("book", bookvo);
		model.addAttribute("list", service.listVersion(bookvo.getUserid(), bookvo.getTitle()));
	}
	
	@RequestMapping(value="/indiebook/bookpreview", method=RequestMethod.GET)
	public void indiebookpreview(int bookno, Model model) throws Exception{
		BookVO bookvo = service.readBook(bookno);
		model.addAttribute("book", bookvo);
		model.addAttribute("list", service.listVersion(bookvo.getUserid(), bookvo.getTitle()));
	}
	@RequestMapping(value="/indiebook/addMybook", method=RequestMethod.POST)
	public String addMybook(int bookno, Model model) throws Exception{
		service.indiebookRegisterUser(id, bookno);
		return "/user/book/indiebook/success";
	}
	
	@RequestMapping(value="/indiebook/mybook", method=RequestMethod.GET)
	public void mybook(@ModelAttribute("cri") BookCriteria cri, Model model) throws Exception{
		cri.setPerPageNum(12);
		cri.setSearchType("작가");
		cri.setKeyword(service.readMemberName(id));
		List<BookVO> booklist = service.listSearchBook(cri);
		List<BookVO> booklist1 = null, booklist2 = null, booklist3 = null;
		
		if(booklist.size() <= 4){
			booklist1 = booklist.subList(0, booklist.size());
		}else if(booklist.size()> 4 && booklist.size() <= 8){	
			booklist1 = booklist.subList(0, 4);
			booklist2 = booklist.subList(4, booklist.size());			
		}else if(booklist.size()> 8 && booklist.size() <= 12){
			booklist1 = booklist.subList(0, 4);
			booklist2 = booklist.subList(4, 8);
			booklist3 = booklist.subList(8, booklist.size());			
		}
		model.addAttribute("list1", booklist1);
		model.addAttribute("list2", booklist2);
		model.addAttribute("list3", booklist3);
		int totalCnt = service.totalBookCnt(cri);
		PageMaker pageMaker = new PageMaker(cri, totalCnt);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/indiebook/bookmark", method=RequestMethod.GET)
	public void bookmark(@ModelAttribute("ubcri") UserBookCriteria ubcri, Model model) throws Exception{
		ubcri.setUserid(id);
		ubcri.setShelfType("일반");
		ubcri.setPerPageNum(12);
		List<UserCardVO> cardlist = service.listUserCard(ubcri);
		List<UserCardVO> cardlist1 = null, cardlist2 = null, cardlist3 = null;
		
		if(cardlist.size() <= 4){
			cardlist1 = cardlist.subList(0, cardlist.size());
		}else if(cardlist.size()> 4 && cardlist.size() <= 8){	
			cardlist1 = cardlist.subList(0, 4);
			cardlist2 = cardlist.subList(4, cardlist.size());			
		}else if(cardlist.size()> 8 && cardlist.size() <= 12){
			cardlist1 = cardlist.subList(0, 4);
			cardlist2 = cardlist.subList(4, 8);
			cardlist3 = cardlist.subList(8, cardlist.size());			
		}
		model.addAttribute("list1", cardlist1);
		model.addAttribute("list2", cardlist2);
		model.addAttribute("list3", cardlist3);
		int totalCnt = service.totalUserBookCnt(ubcri);
		PageMaker pageMaker = new PageMaker(ubcri, totalCnt);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/indiebook/indieqr", method=RequestMethod.GET)
	public void indieqr(@ModelAttribute("bookno") int bookno, Model model) throws Exception{
		model.addAttribute("bookno", bookno);
	}
}