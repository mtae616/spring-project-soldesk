package co.sp.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import co.sp.beans.User;
import co.sp.service.*;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private AuctionService auctionService;
	
	@Resource(name = "loginBean")
	private User loginBean;

	@RequestMapping("/idCheck")
	@ResponseBody
	public String idValidate(@RequestParam(value = "id", required = true) String id) {
		return userService.idValidate(id);
	}

	@RequestMapping("/signup")
	public String signup(@ModelAttribute("joinUserBean") User joinUserBean) {
		return "signup";
	}

	@RequestMapping("/signup_proc")
	public String sigunup_proc(@ModelAttribute("joinUserBean") User joinUserBean, HttpSession se) {
		userService.addUserInfo(joinUserBean);
		return "signup_proc_proc";
	}

	@RequestMapping("/signup_proc_proc")
	public String signup_proc_proc() {
		return "signin";
	}

	@RequestMapping("/idfind")
	public String idfind() {
		return "idfind";
	}

	@RequestMapping("/idfind_proc")
	public String idfind_proc(@RequestParam(value = "name") String name, @RequestParam(value = "tel") String tel,
			HttpServletRequest request) {
		String userid = userService.idFind(name, tel);
		if (userid == null) {
			return "idfind_fail";
		} else {
			String id = userid.substring(0, userid.length() - 2) + "**";
			request.setAttribute("name", name);
			request.setAttribute("userid", id);
			return "idfind_success";
		}
	}

	@RequestMapping("/pwfind")
	public String pwfind() {
		return "pwfind";
	}

	@RequestMapping("/pwfind_proc")
	public String pwfind_proc(@RequestParam(value = "name") String name, @RequestParam(value = "id") String id,
			@RequestParam(value = "tel") String tel, HttpServletRequest request) {
		boolean tr = userService.pwFind(name, id, tel);
		if (tr == true) {
			request.setAttribute("id", id);
			return "pwfind_success";
		} else {
			return "pwfind_fail";
		}
	}

	@RequestMapping("/pw_update")
	public String pwfind_update(@RequestParam(value = "password") String password,
			@RequestParam(value = "id") String id) {
		userService.updatePassword(password, id);
		return "pw_update";
	}

	@RequestMapping("/Logout")
	public String Logout(HttpSession se) {
		se.invalidate();
		return "Logout";
	}

	@RequestMapping("/signin")
	public String signin(@ModelAttribute("loginUserBean") User loginUserBean) {
		return "signin";
	}

	@RequestMapping("/signin_proc")
	public String signin_proc(@ModelAttribute("loginUserBean") User loginUserBean, HttpSession se) {
		userService.loginUserInfo(loginUserBean);

		if (loginBean.isUserlogin() == true) {
			loginUserBean.setU_no(loginBean.getU_no());
			loginUserBean.setU_name(loginBean.getU_name());
			loginUserBean.setU_id(loginBean.getU_id());
			loginUserBean.setU_password(loginBean.getU_password());
			loginUserBean.setU_tel(loginBean.getU_tel());
			se.setAttribute("loginUserBean", loginUserBean);
			return "signin_success";
		} else {
			return "signin_fail";
		}
	}

	@RequestMapping("/MyPage")
	public String MyPage(HttpSession session, Model m) {
		
		User user = (User) session.getAttribute("loginUserBean");
		List<String> imglist = userService.goodsForMypage(user.getU_id());
		m.addAttribute("imglist", imglist);
		return "MyPage";
	}

	@RequestMapping("/MyPage_edit")
	public String MyPage_edit(@ModelAttribute("editUserBean") User editUserBean) {
		return "MyPage_edit";
	}

	@RequestMapping("/MyPage_edit_proc")
	public String MyPage_edit_proc(@ModelAttribute("editUserBean") User editUserBean, HttpSession se) {
		String passcheck = userService.passCheck(editUserBean.getU_id());
		if (passcheck.equals(editUserBean.getU_password())) {
			userService.editUserInfo(editUserBean);
			userService.loginUserInfo(editUserBean);
			editUserBean.setU_no(loginBean.getU_no());
			editUserBean.setU_name(loginBean.getU_name());
			editUserBean.setU_id(loginBean.getU_id());
			editUserBean.setU_password(loginBean.getU_password());
			editUserBean.setU_tel(loginBean.getU_tel());
			se.setAttribute("loginUserBean", editUserBean);
			return "MyPage_edit_proc";
		} else {
			return "MyPage_edit";
		}
	}

	@RequestMapping("/MyPage_delete")
	public String MyPage_delete(@ModelAttribute("deleteUserBean") User deleteUserBean) {
		return "MyPage_delete";
	}

	@RequestMapping("/MyPage_delete_proc")
	public String MyPage_delete_proc(@ModelAttribute("deleteUserBean") User deleteUserBean, HttpSession se) {
		String passcheck = userService.passCheck(deleteUserBean.getU_id());
		if (passcheck.equals(deleteUserBean.getU_password())) {
			boardService.removeAlloreply(deleteUserBean.getU_no());
			boardService.removeAllcreply(deleteUserBean.getU_no());
			boardService.removeAlloffer(deleteUserBean.getU_no());
			boardService.removeAllcommunity(deleteUserBean.getU_no());
			auctionService.removeAuctionReply(deleteUserBean.getU_id());
			auctionService.removeAllGoods(deleteUserBean.getU_no());
			userService.deleteUserInfo(deleteUserBean.getU_no());
			se.invalidate();
			return "main";
		}
		return "MyPage_delete";
	}

	@ExceptionHandler(java.lang.NullPointerException.class)
	public String ex() {
		return "signin_fail";
	}
}