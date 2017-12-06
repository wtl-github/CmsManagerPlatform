package com.sgnbs.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgnbs.cms.dao.intf.UserDao;
import com.sgnbs.cms.entity.User;
import com.sgnbs.cms.service.intf.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	public User getUserById(Integer userId) {
		return userDao.getUserById(userId);
	}

	public boolean insertUser(User user) {
		int count = userDao.getCountByName(user.getLoginname());
		if(count>0){
			return false;
		}else{
			userDao.insertUser(user);
			return true;
		}
		
	}

	public List<User> listPageUser(User user){
		return userDao.listPageUser(user);
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	public void updateUserBaseInfo(User user){
		userDao.updateUserBaseInfo(user);
	}
	
	public void updateUserRights(User user){
		userDao.updateUserRights(user);
	}
	
	public User getUserByNameAndPwd(String loginname, String password) {
		User user = new User();
		user.setLoginname(loginname);
		user.setPassword(password);
		return userDao.getUserInfo(user);
	}


	public void deleteUser(int userId){
		userDao.deleteUser(userId);
	}

	public User getUserAndRoleById(Integer userId) {
		return userDao.getUserAndRoleById(userId);
	}

	public void updateLastLogin(User user) {
		userDao.updateLastLogin(user);
	}

	public List<User> listAllUser() {
		return userDao.listAllUser();
	}
	
}
