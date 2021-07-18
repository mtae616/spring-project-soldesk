package co.sp.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import co.sp.beans.User;

public interface UserMapper {
   @SelectKey(statement = "select user_seq.nextval from dual", keyProperty = "u_no", before = true, resultType = int.class)

   @Insert("insert into user_table (u_no, u_id, u_name, u_password, u_tel) values(#{u_no}, #{u_id}, #{u_name}, #{u_password}, #{u_tel})")
   void addUserInfo(User joinUserBean);

   @Select("select u_no, u_name, u_id, u_password, u_tel from user_table where u_id=#{u_id} and u_password=#{u_password}")
   User loginUserInfo(User loginUserBean);

   @Select("SELECT u_id FROM user_table WHERE u_id = #{id}")
   String idValidate(String id);

   @Select("select u_password from user_table where u_id=#{u_id}")
   String passCheck(String u_id);

   @Update("update user_table set u_id=#{u_id} , u_name=#{u_name} , u_tel=#{u_tel} where u_id=#{u_id}")
   void editUserInfo(User editUserBean);

   @Delete("delete FROM user_table where u_no=#{u_no}")
   void deleteUserInfo(int u_no);

   @Select("select goods_table.g_img from goods_table natural join tradelist_table where tradelist_table.t_pay = 1 AND g_no = t_subno and t_buyer = #{u_id}")
   List<String> goodsForMypage(String u_id);

   @Update("UPDATE goods_Table SET g_writer = #{u_no} WHERE g_no = #{g_no}")
   void updateGoodsWriter(@Param("u_no") int u_no, @Param("g_no") int g_no);

   @Select("SELECT u_id FROM user_table WHERE u_name = #{u_name} AND u_tel = #{u_tel}")
   String idFind(@Param("u_name") String u_name, @Param("u_tel") String u_tel);

   @Select("SELECT u_name FROM user_table WHERE u_name = #{name} AND u_id = #{id} AND u_tel = #{tel}")
   String pwFind(@Param("name") String name, @Param("id") String id, @Param("tel") String tel);

   @Update("UPDATE user_table SET u_password = #{password} WHERE u_id = #{id}")
   void updatePassword(@Param("password") String password, @Param("id") String id);
}