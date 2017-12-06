package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.User;

public interface UserDao  {
	List<User> listAllUser();
	
	User getUserById(Integer userId);
	
	void insertUser(User user);
	
	void updateUser(User user);
	
	User getUserInfo(User user);
	
	void updateUserBaseInfo(User user);
	
	void updateUserRights(User user);
	
	int getCountByName(String loginname);
	
	void deleteUser(int userId);
	
	int getCount(User user);
	
	List<User> listPageUser(User user);
	
	User getUserAndRoleById(Integer userId);
	
	void updateLastLogin(User user);
}
