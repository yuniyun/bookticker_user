package org.bs.login.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.bs.login.model.LoginVO;
import org.bs.login.service.LoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
public class LoginController {

	private static final Logger logger = Logger
			.getLogger(LoginController.class);

	@Autowired
	private LoginServiceImpl loginService;

	// Using PathVariable = Controller combine
	// Using Redirect = Using Temp Attributes or flush Temp

	@RequestMapping(value = "/{var}", method = RequestMethod.GET)
	public void loginGET(@PathVariable String var, LoginVO login,
			RedirectAttributes rttr) throws Exception {
		logger.info(login);

	}

	@RequestMapping(value = "/{var}", method = RequestMethod.POST)
	public String loginPOST(@PathVariable String var,
			HttpServletRequest request, HttpServletResponse response,
			LoginVO login, Model model, RedirectAttributes rttr)
			throws Exception {

		String serverMsg;
		HttpSession session = request.getSession();

		if (var.equals("loginCheck")) {
			logger.info(login);
			LoginVO loginInfo = loginService.loginCheck(login);
			if (loginInfo == null) {
				serverMsg = "Your identification is wrong !"
						+ System.getProperty("line.separator")
						+ "please recheck your ID";
				rttr.addFlashAttribute("serverMsg", serverMsg);

			} else if(loginInfo.getLivestate().equals("사용중")) {
				String id = request.getParameter("userid");
				System.out.println("123456789!!!!!"+id);
				session.setAttribute("loginInfo", id);
				//session.setAttribute(session.getId(), loginService.loginCheck(login).getSessionid());
				session.setMaxInactiveInterval(60 * 50);

				login.setSessionid(session.getId());
				login.setSessionlimit(session.getMaxInactiveInterval());
				loginService.sessionUpdate(login);
				Cookie existCk = WebUtils.getCookie(request,
						"SessionMatching");

				if (existCk == null) {
					Cookie cke = new Cookie("SessionMatching", id);
					cke.setMaxAge(60 * 60 * 24);
					cke.setPath("/");

					response.addCookie(cke);


				} else if (existCk != null) {
					if (id.equals(existCk.getValue())) {
						session.setAttribute(session.getId(), loginInfo.getSessionid());
						session.setAttribute("loginInfo", id);
						session.setMaxInactiveInterval(60 * 50);


					} else {
						existCk.setMaxAge(0);
					}

				}
				if (loginInfo.getGrade().equals("작가")) {
					return "redirect:/author/book/shelf";
				}else if(loginInfo.getGrade().equals("일반")){
					return "redirect:/user/book/shelf";
				}else {
					return "redirect:/login";
				}
			}
		}

		if (var.equals("findPW")) {
			logger.info(login);
			String password = loginService.getPW(login);
			if (password == null) {
				password = "not found !" + System.getProperty("line.separator")
						+ "Your identification is wrong !";
			}
			model.addAttribute("password", password);
			logger.info(password);
			return "/returnPW";
		}

		if (var.equals("user_regist")) {
			logger.info(login);
			serverMsg = login.getUserid() + " successful registration !";
			try {
				login.setLivestate("사용중");
				loginService.regist(login);
			} catch (Exception e) {
				e.printStackTrace();
				serverMsg = "Already exist ID !"
						+ System.getProperty("line.separator")
						+ "Please try again with different ID";
			}
			rttr.addFlashAttribute("serverMsg", serverMsg);
			logger.info(serverMsg);
			return "";
		}

		if (var.equals("logout")) {
			session.invalidate();
		}

		return "redirect:/login";

	}
}
