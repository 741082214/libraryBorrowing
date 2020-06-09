package library.service.impl;

import library.dao.UserDao;
import library.domain.AdminBean;
import library.domain.BorrowBean;
import library.domain.UserInfoBean;
import library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Qualifier("userDao")
    @Autowired
    UserDao userDao;
    @Override
    public int addUser(UserInfoBean user) {
        return userDao.addUser(user);
    }

    @Override
    public int deleteUser(String uid) {
        return userDao.deleteUser(uid);
    }

    @Override
    public int updateUser(String userId, String userName, String userTel) {
        return userDao.updateUser(userId,userName,userTel);
    }

    @Override
    public UserInfoBean findUserById(String userId) {
        return userDao.findUserById(userId);
    }

    @Override
    public UserInfoBean findCheckLogin(String userId, String userPsw) {
        return userDao.findCheckLogin(userId,userPsw);
    }

    @Override
    public int updatePsw(String userId, String userPsw) {
        return userDao.updatePsw(userId,userPsw);
    }

    @Override
    public AdminBean findCheckAdminLogin(String adminId, String adminPsw) {
        return userDao.findCheckAdminLogin(adminId,adminPsw);
    }

    @Override
    public List<UserInfoBean> findAllUsers() {
        return userDao.findAllUsers();
    }

    @Override
    public int addMessage(String userId, String name, String email, String comment) {
        return userDao.addMessage(userId,name,email,comment);
    }

    @Override
    public List<BorrowBean> findAllBorrowUsers(){
        return userDao.findAllBorrowUsers();
    }
}
