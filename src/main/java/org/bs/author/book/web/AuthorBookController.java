package org.bs.author.book.web;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bs.author.book.service.AuthorBookService;
import org.bs.common.domain.BookCriteria;
import org.bs.common.domain.BookVO;
import org.bs.common.domain.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/author/book")
public class AuthorBookController {
	
	@Autowired
	private AuthorBookService service;
	
	private String id;
		
	@RequestMapping(value="/shelf", method=RequestMethod.GET)
	public void list(@ModelAttribute("cri") BookCriteria cri, HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("loginInfo");
		cri.setSearchType("아이디");
		cri.setKeyword(id);
		cri.setPerPageNum(12);
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

	@RequestMapping(value="/bookinfo", method=RequestMethod.GET)
	public void bookinfo(int bookno, Model model) throws Exception{
		model.addAttribute("book", service.readBook(bookno));
	}
	
	@RequestMapping(value="/read", method=RequestMethod.POST)
	public String readIntersection(HttpServletRequest request, int bookno, RedirectAttributes redirectAttr) throws Exception {
	    redirectAttr.addFlashAttribute("bookno", bookno);
		if(request.getHeader("User-Agent").indexOf("Mobile") != -1) { //in mobile
	        return "redirect:readInMobile";
	    }
	    return "redirect:readInBrowser";
	}
	
	@RequestMapping(value="/readInBrowser", method=RequestMethod.GET)
	public void readInBrowser(@ModelAttribute("bookno") int bookno, Model model) throws Exception {
		model.addAttribute("list", service.listOneConvertBook(bookno));
		model.addAttribute("book", service.readBook(bookno));
	}
   
	@RequestMapping(value="/readInMobile", method=RequestMethod.GET)
	public void readInMobile(@ModelAttribute("bookno") int bookno, Model model) throws Exception{
		model.addAttribute("list", service.listOneConvertBook(bookno));
		model.addAttribute("book", service.readBook(bookno));
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
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerbookGET(Model model) throws Exception{
		model.addAttribute("name", service.readMemberName(id));
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerbookPOST(BookVO book, MultipartRequest mRequest, Model model) throws Exception{
		book.setUserid(id);
		book.setSeries(book.getTitle()+" 시리즈");
		book.setBookversion(1);
		
		String path="C:\\UNIORACLE\\3r_card\\PDF\\"+ book.getSeries()
				+"\\"+ book.getTitle() +"\\"+ book.getBookversion() +"\\";
		System.out.println("Upload Path:" + path);
		
		File dir1 = new File("C:\\unioracle\\3r_card\\PDF\\" + book.getSeries());
		if (!dir1.exists()) {
			dir1.mkdir();
		}

		File dir2 = new File("C:\\unioracle\\3r_card\\PDF\\" + book.getSeries()
				+ "\\" + book.getTitle());
		if (!dir2.exists()) {
			dir2.mkdir();
		}

		File dir3 = new File("C:\\unioracle\\3r_card\\PDF\\" + book.getSeries()
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
		
		service.createBook(book);
		return "/author/book/success";
	}

	@RequestMapping(value="/mybookinfo", method=RequestMethod.GET)
	public void indiemybookinfo(int bookno, Model model) throws Exception{
		BookVO bookvo = service.readBook(bookno);
		model.addAttribute("book", bookvo);
		model.addAttribute("list", service.listVersion(bookvo.getUserid(), bookvo.getTitle()));
	}

}