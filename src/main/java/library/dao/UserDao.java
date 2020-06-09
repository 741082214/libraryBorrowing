
package library.dao;

import library.domain.AdminBean;
import library.domain.BorrowBean;
import library.domain.UserInfoBean;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;

/*
 * 开启二级缓存
 * */
//@CacheNamespace(blocking = true)
@Repository("userDao")
public interface UserDao {
	/**
	 * 添加用户
	 */
	@Insert("insert into tb_user(Uname, Uage, UidCard,Utel, UserId,starttime,Upsw)" +
			" values(#{uname},#{uage},#{uidCard},#{utel},#{userId},#{startTime},#{upsw})")
	int addUser(UserInfoBean user);

	/**
	 * 删除用户
	 *	#{id}里面的id可以随意写，写#{idid}也行
	 */
	@Delete("delete from tb_user where userId=#{id}")
	int deleteUser(String uid);

	/**
	 * 更新用户信息
	 * @Param注解用于多参数指定
	 * 单个参数可以不用@Param
	 */
	@Update("update tb_user set uname=#{userName},utel=#{userTel} where userId=#{userId}")
	int updateUser(@Param("userId") String userId,@Param("userName") String userName, @Param("userTel") String userTel);

	/**
	 * 获取用户资料
	 */
	@Select("select * from tb_user where userId=#{userId}")
	UserInfoBean findUserById(String userId);

	/**
	 * 检查用户登陆
	 */
	@Select("select * from tb_user where UserId=#{userId} and Upsw=#{userPsw}")
	UserInfoBean findCheckLogin(@Param("userId") String userId,@Param("userPsw") String userPsw);


	/**
	 * 修改密码
	 */
	@Update("update tb_user set Upsw=#{userPsw} where userId=#{userId}")
	int updatePsw(@Param("userId") String userId,@Param("userPsw") String userPsw);

	/**
	 * 检查管理员登录
	 */
	@Select("select * from tb_admin where Aid=#{adminId} and Apsw=#{adminPsw}")
	AdminBean findCheckAdminLogin(@Param("adminId") String adminId,@Param("adminPsw") String adminPsw);

	/**
	 * 查询所有用户
	 */
	@Select("select * from tb_user")
	List<UserInfoBean> findAllUsers();

	/*
	 * 将留言添加到数据库
	 * */
	@Insert("insert into tb_message(userId,name,email,comment)values(#{userId},#{name},#{email},#{comment})")
	int addMessage(@Param("userId") String userId,@Param("name") String name,@Param("email") String email,@Param("comment") String comment);

	/*
	* 查询未归还图书人员
	* */
	@Select("select * from tb_borrow where isback=0")
	List<BorrowBean> findAllBorrowUsers();
}