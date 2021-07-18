package co.sp.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.sp.beans.User;
import co.sp.mapper.UserMapper;

@Repository
public class UserDao {

	@Autowired
	private UserMapper userMapper;

	public void addUserInfo(User joinUserBean) {
		userMapper.addUserInfo(joinUserBean);
	}

	public User loginUserInfo(User loginUserBean) {
		return userMapper.loginUserInfo(loginUserBean);
	}

	public String idValidate(String id) {
		return userMapper.idValidate(id);
	}

	public String passCheck(String u_id) {
		return userMapper.passCheck(u_id);
	}

	public void editUserInfo(User editUserBean) {
		userMapper.editUserInfo(editUserBean);
	}

	public void deleteUserInfo(int u_no) {
		userMapper.deleteUserInfo(u_no);
	}

	public List<String> goodsForMypage(String u_id) {
		return userMapper.goodsForMypage(u_id);
	}

	public void updateGoodsWriter(int u_no, int g_no) {
		userMapper.updateGoodsWriter(u_no, g_no);
	}

	public String idFind(String u_name, String u_tel) {
		return userMapper.idFind(u_name, u_tel);
	}

	public String pwFind(String name, String id, String tel) {
		return userMapper.pwFind(name, id, tel);
	}

	public void updatePassword(String password, String id) {
		userMapper.updatePassword(password, id);
	}
}