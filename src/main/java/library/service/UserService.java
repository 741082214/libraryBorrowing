package library.service;

import library.domain.*;

import java.util.List;

public interface UserService {
    /**
     * 添加用户
     */
    int addUser(UserInfoBean user);

    /**
     * 删除用户
     *	#{id}里面的id可以随意写，写#{idid}也行
     */
    int deleteUser(String uid);

    /**
     * 更新用户信息
     * @Param注解用于多参数指定
     * 单个参数可以不用@Param
     */
    int updateUser(String userId,String userName,String userTel);

    /**
     * 获取用户资料
     */
    UserInfoBean findUserById(String userId);

    /**
     * 检查用户登陆
     */
    UserInfoBean findCheckLogin(String userId,String userPsw);


    /**
     * 修改密码
     */
    int updatePsw(String userId,String userPsw);

    /**
     * 检查管理员登录
     */
    AdminBean findCheckAdminLogin(String adminId,String adminPsw);

    /**
     * 查询所有用户
     */
    List<UserInfoBean> findAllUsers();

    /*
     * 将留言添加到数据库
     * */
    int addMessage(String userId,String name,String email,String comment);

    /*
    * 查询未归还图书人员
    * */
    List<BorrowBean> findAllBorrowUsers();
}
