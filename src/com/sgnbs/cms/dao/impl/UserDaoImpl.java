package com.sgnbs.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.UserDao;
import com.sgnbs.cms.entity.User;

@Repository
public class UserDaoImpl extends BaseDao implements UserDao {

	@Override 
	public List<User> listAllUser() {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.UserDao.listAllUser");
	}

	@Override
	public User getUserById(Integer userId) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.UserDao.getUserById",userId);
	}

	@Override
	public void insertUser(User user) {
		this.getSqlSession().insert("com.sgnbs.cms.dao.intf.UserDao.insertUser",user);
	}

	@Override
	public void updateUser(User user) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.UserDao.updateUser",user);
	}

	@Override
	public User getUserInfo(User user) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.UserDao.getUserInfo",user);
	}

	@Override
	public void updateUserBaseInfo(User user) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.UserDao.updateUserBaseInfo",user);
	}

	@Override
	public void updateUserRights(User user) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.UserDao.updateUserRights",user);
	}

	@Override
	public int getCountByName(String loginname) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.UserDao.getCountByName",loginname);
	}

	@Override
	public void deleteUser(int userId) {
		this.getSqlSession().delete("com.sgnbs.cms.dao.intf.UserDao.deleteUser",userId);
	}

	@Override
	public int getCount(User user) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.UserDao.getCount",user);
	}

	@Override
	public List<User> listPageUser(User user) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.UserDao.listPageUser",user);
	}

	@Override
	public User getUserAndRoleById(Integer userId) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.UserDao.getUserAndRoleById",userId);
	}

	@Override
	public void updateLastLogin(User user) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.UserDao.updateLastLogin",user);
	}

}
