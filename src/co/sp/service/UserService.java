package co.sp.service;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.sp.beans.User;
import co.sp.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public String idValidate(String id) {
		String idyn = userDao.idValidate(id);
		if (idyn == null) {
			return "true";
		} else {
			return "false";
		}
	}

	@Resource(name = "loginBean")
	private User loginBean;

	public void addUserInfo(User joinUserBean) {
		userDao.addUserInfo(joinUserBean);
	}

	public void loginUserInfo(User loginUserBean) {

		User loginUserBean2 = userDao.loginUserInfo(loginUserBean);

		if (loginUserBean2.getU_id() != null) {
			loginBean.setU_no(loginUserBean2.getU_no());
			loginBean.setU_name(loginUserBean2.getU_name());
			loginBean.setU_id(loginUserBean2.getU_id());
			loginBean.setU_password(loginUserBean2.getU_password());
			loginBean.setU_tel(loginUserBean2.getU_tel());
			loginBean.setUserlogin(true);
		}
	}

	public String passCheck(String u_id) {
		return userDao.passCheck(u_id);
	}

	public void editUserInfo(User editUserBean) {
		userDao.editUserInfo(editUserBean);
	}

	public void deleteUserInfo(int u_no) {
		userDao.deleteUserInfo(u_no);
	}

	public List<String> goodsForMypage(String u_id) {
		return userDao.goodsForMypage(u_id);
	}

	public void updateGoodsWriter(int u_no, int g_no) {
		userDao.updateGoodsWriter(u_no, g_no);
	}

	public String idFind(String u_name, String u_tel) {
		return userDao.idFind(u_name, u_tel);
	}

	public boolean pwFind(@Param("name") String name, @Param("id") String id, @Param("tel") String tel) {
		String u_name = userDao.pwFind(name, id, tel);
		if (u_name == null) {
			return false;
		} else {
			return true;
		}
	}

	public void updatePassword(String password, String id) {
		userDao.updatePassword(password, id);
	}
}