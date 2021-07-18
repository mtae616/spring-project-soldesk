package co.sp.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import co.sp.beans.*;
import co.sp.service.BoardService;

@Controller
public class ResController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("/")
	public String start() {
		return "redirect:/main";
	}

	@RequestMapping("/main")
	public String start1(@ModelAttribute("joinUserBean") User joinUserBean, HttpSession se, Model m) {
		se.setAttribute("joinUserBean", joinUserBean);

		List<String> offersub = boardService.mainOffersub();
		List<Integer> offerno = boardService.mainOfferno();

		List<String> communitysub = boardService.mainCommunitysub();
		List<Integer> communityno = boardService.mainCommunityno();

		m.addAttribute("offersub", offersub);
		m.addAttribute("offerno", offerno);

		m.addAttribute("communitysub", communitysub);
		m.addAttribute("communityno", communityno);

		return "main";
	}

	@RequestMapping("/painting")
	public String painting() {
		return "painting";
	}

	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		VerifyRecaptcha.setSecretKey("6LcmOt0aAAAAAI_BDbxQ7IJiFib_UMLzY86PD2sG");
		String gRecaptchaResponse = request.getParameter("recaptcha");
		System.out.println(gRecaptchaResponse);
		request.setAttribute("result", gRecaptchaResponse);
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse))
				return 0;
			else
				return 1;
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
	}
}